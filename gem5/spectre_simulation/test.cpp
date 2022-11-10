#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h> // why need pthread?
#include <errno.h>
#include <x86intrin.h>
#include "/root/Project/gem5/include/gem5/m5ops.h"
#include "m5_mmap.h"

#define GEM5

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
  int  arr1[] = {1,2,3,4,5,6,7,8};
  int * arr2 = (int*)malloc(48*sizeof(int));

  int x = 300;


  // printf("size is %ld\n", sizeof(arr1));

  _mm_clflush(arr2);
  _mm_clflush((arr2+32));

  __sync_synchronize();

   // magic, check branch pre state, next instruction, 
// #ifdef GEM5
//     // m5op_addr = 0xFFFF0000;
//     // map_m5_mem();
//     m5_work_begin_addr(0,0);
// #endif
  //char c = getc(stdin);
    printf("size is %ld\n", sizeof(arr1));
  if (x < sizeof(arr1)){
    Load(arr2 + 32); // won't execute it
    // m5
    printf("hello\n");
  } 
// #ifdef GEM5
//     m5_work_end_addr(0,0);
// #endif

  int time=LoadAndMeasure(arr2 + 32 );
  fprintf(stderr, "The hit time is %d\n", time);

  time=LoadAndMeasure(arr2 );
  fprintf(stderr, "The miss time is %d\n", time);



  return 0;

}