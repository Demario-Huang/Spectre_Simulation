#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <random>
#include <pthread.h> // why need pthread?
#include <errno.h>
#include <x86intrin.h>

int *transmitterArray;
int *bits;
volatile int temp; // what is this?

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

//The receiver
inline void *receiver() {
     int time=LoadAndMeasure(transmitterArray);
     if (time < 150){ bits[0] = 1; }
     else { bits[0] = 0; }

     fprintf(stderr, "The hit time is %d\n", time);

     time=LoadAndMeasure(transmitterArray+16);
     if (time < 150){ bits[1] = 1; }
     else { bits[1] = 0;}

     time=LoadAndMeasure(transmitterArray+32);
     if (time < 150){ bits[2] = 1; }
     else { bits[2] = 0;}

     fprintf(stderr, "The miss time is %d\n", time);

     fprintf(stderr, "The bit 0 is %d\n", bits[0]);
     fprintf(stderr, "The bit 1 is %d\n", bits[1]);
     fprintf(stderr, "The bit 2 is %d\n", bits[2]);
}

//The transmitter
inline void* transmitter() {
      _mm_clflush(transmitterArray);
      _mm_clflush((transmitterArray+16));
      _mm_clflush((transmitterArray+32));
      __sync_synchronize();
      Load(transmitterArray); //sends a one for bit 0
      Load(transmitterArray+16); // sends a one for bit 1
      __sync_synchronize();
}

//The transmitter and receiver for the covert channel
int main() {
    int s;
    transmitterArray = (int *)malloc(48*sizeof(int));
    bits = (int *)malloc(3*sizeof(int));
    transmitter();
    receiver();
    return 0;
}
