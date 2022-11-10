	.file	"test.cpp"
# GNU C++14 (Ubuntu 9.3.0-10ubuntu2) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE
# spectre_simulation/test.cpp -mtune=generic -march=x86-64 -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexceptions -ffp-int-builtin-inexact
# -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique -fident
# -finline-atomics -fipa-stack-alignment -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
# -fplt -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fssa-backprop -fstack-clash-protection
# -fstack-protector-strong -fstdarg-opt -fstrict-volatile-bitfields
# -fsync-libcalls -ftrapping-math -ftree-cselim -ftree-forwprop
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.type	_ZL4LoadPi, @function
_ZL4LoadPi:
.LFB4248:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# addr, addr
# spectre_simulation/test.cpp:14: 		   : );
	movq	-24(%rbp), %rax	# addr, tmp85
	movq	%rax, %rcx	# tmp85, tmp85
#APP
# 14 "spectre_simulation/test.cpp" 1
	 movl (%rcx), %eax 	# tmp85

# 0 "" 2
#NO_APP
	movl	%eax, -4(%rbp)	# tmp84, val
# spectre_simulation/test.cpp:16:     return (val);
	movl	-4(%rbp), %eax	# val, _4
# spectre_simulation/test.cpp:17: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4248:
	.size	_ZL4LoadPi, .-_ZL4LoadPi
	.type	_ZL14LoadAndMeasurePi, @function
_ZL14LoadAndMeasurePi:
.LFB4249:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# addr, addr
# spectre_simulation/test.cpp:33: 		   : "%edx","%esi");
	movq	-24(%rbp), %rax	# addr, tmp85
	movq	%rax, %rcx	# tmp85, tmp85
#APP
# 33 "spectre_simulation/test.cpp" 1
	 mfence 
 rdtsc 
 lfence 
 movl %eax, %esi 
 movl (%rcx), %eax 	# tmp85
 lfence 
 rdtsc 
 subl %esi, %eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%rbp)	# tmp84, val
# spectre_simulation/test.cpp:35:     return (val);
	movl	-4(%rbp), %eax	# val, _4
# spectre_simulation/test.cpp:37: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4249:
	.size	_ZL14LoadAndMeasurePi, .-_ZL14LoadAndMeasurePi
	.section	.rodata
.LC0:
	.string	"size is %ld\n"
.LC1:
	.string	"hello"
.LC2:
	.string	"The hit time is %d\n"
.LC3:
	.string	"The miss time is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4250:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
	movl	%edi, -84(%rbp)	# argc, argc
	movq	%rsi, -96(%rbp)	# argv, argv
# spectre_simulation/test.cpp:41: int main(int argc, char ** argv){
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp104
	movq	%rax, -8(%rbp)	# tmp104, D.27548
	xorl	%eax, %eax	# tmp104
# spectre_simulation/test.cpp:42:   int  arr1[] = {1,2,3,4,5,6,7,8};
	movl	$1, -48(%rbp)	#, arr1
	movl	$2, -44(%rbp)	#, arr1
	movl	$3, -40(%rbp)	#, arr1
	movl	$4, -36(%rbp)	#, arr1
	movl	$5, -32(%rbp)	#, arr1
	movl	$6, -28(%rbp)	#, arr1
	movl	$7, -24(%rbp)	#, arr1
	movl	$8, -20(%rbp)	#, arr1
# spectre_simulation/test.cpp:43:   int * arr2 = (int*)malloc(48*sizeof(int));
	movl	$192, %edi	#,
	call	malloc@PLT	#
	movq	%rax, -72(%rbp)	# tmp92, arr2
# spectre_simulation/test.cpp:45:   int x = 300;
	movl	$300, -80(%rbp)	#, x
# spectre_simulation/test.cpp:48:   printf("size is %ld\n", sizeof(arr1));
	movl	$32, %esi	#,
	leaq	.LC0(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
	movq	-72(%rbp), %rax	# arr2, tmp93
	movq	%rax, -64(%rbp)	# tmp93, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-64(%rbp), %rax	# __A, tmp94
	clflush	(%rax)	# tmp94
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# spectre_simulation/test.cpp:51:   _mm_clflush((arr2+32));
	movq	-72(%rbp), %rax	# arr2, tmp95
	subq	$-128, %rax	#, _1
	movq	%rax, -56(%rbp)	# _1, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-56(%rbp), %rax	# __A, tmp96
	clflush	(%rax)	# tmp96
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# spectre_simulation/test.cpp:53:   __sync_synchronize();
	mfence	
# spectre_simulation/test.cpp:56:   if (x < sizeof(arr1)){
	movl	-80(%rbp), %eax	# x, tmp97
	cltq
# spectre_simulation/test.cpp:56:   if (x < sizeof(arr1)){
	cmpq	$31, %rax	#, _2
	ja	.L6	#,
# spectre_simulation/test.cpp:57:     Load(arr2 + 32); // won't execute it
	movq	-72(%rbp), %rax	# arr2, tmp98
	subq	$-128, %rax	#, _3
	movq	%rax, %rdi	# _3,
	call	_ZL4LoadPi	#
# spectre_simulation/test.cpp:59:     printf("hello\n");
	leaq	.LC1(%rip), %rdi	#,
	call	puts@PLT	#
.L6:
# spectre_simulation/test.cpp:62:   int time=LoadAndMeasure(arr2 + 32 );
	movq	-72(%rbp), %rax	# arr2, tmp99
	subq	$-128, %rax	#, _4
	movq	%rax, %rdi	# _4,
	call	_ZL14LoadAndMeasurePi	#
# spectre_simulation/test.cpp:62:   int time=LoadAndMeasure(arr2 + 32 );
	movl	%eax, -76(%rbp)	# _5, time
# spectre_simulation/test.cpp:63:   fprintf(stderr, "The hit time is %d\n", time);
	movq	stderr(%rip), %rax	# stderr, stderr.0_6
	movl	-76(%rbp), %edx	# time, tmp100
	leaq	.LC2(%rip), %rsi	#,
	movq	%rax, %rdi	# stderr.0_6,
	movl	$0, %eax	#,
	call	fprintf@PLT	#
# spectre_simulation/test.cpp:65:   time=LoadAndMeasure(arr2 );
	movq	-72(%rbp), %rax	# arr2, tmp101
	movq	%rax, %rdi	# tmp101,
	call	_ZL14LoadAndMeasurePi	#
# spectre_simulation/test.cpp:65:   time=LoadAndMeasure(arr2 );
	movl	%eax, -76(%rbp)	# _7, time
# spectre_simulation/test.cpp:66:   fprintf(stderr, "The miss time is %d\n", time);
	movq	stderr(%rip), %rax	# stderr, stderr.1_8
	movl	-76(%rbp), %edx	# time, tmp102
	leaq	.LC3(%rip), %rsi	#,
	movq	%rax, %rdi	# stderr.1_8,
	movl	$0, %eax	#,
	call	fprintf@PLT	#
# spectre_simulation/test.cpp:70:   return 0;
	movl	$0, %eax	#, _33
# spectre_simulation/test.cpp:72: }
	movq	-8(%rbp), %rcx	# D.27548, tmp105
	xorq	%fs:40, %rcx	# MEM[(<address-space-1> long unsigned int *)40B], tmp105
	je	.L8	#,
	call	__stack_chk_fail@PLT	#
.L8:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4250:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
