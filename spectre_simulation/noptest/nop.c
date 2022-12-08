#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <x86intrin.h>
#include <stdint.h>


// size_t mysecret = 10;

int main(){
  asm __volatile__(" mfence \n nop \n nop \n nop \n nop \n nop \n ");
  printf("hello world\n");
  return 0;
}