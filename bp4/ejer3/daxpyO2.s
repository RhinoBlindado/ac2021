	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Uso: ./daxpy N"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Error en la reserva de espacio"
	.section	.rodata.str1.1
.LC3:
	.string	"[%d] = %2.4f "
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[0] = %2.4f, ..., [%d] = %2.4f"
	.align 8
.LC6:
	.string	"Dimension: %d Tiempo: %11.9f \n"
	.section	.rodata.str1.1
.LC7:
	.string	"Resultado: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L30
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 24(%rsp)
	movl	%eax, %r12d
	cltq
	leaq	0(,%rax,8), %rbx
	movq	%rbx, %rdi
	movq	%rbx, 64(%rsp)
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%rax, %r13
	testq	%rbp, %rbp
	je	.L18
	testq	%rax, %rax
	je	.L18
	xorl	%edi, %edi
	leaq	128(%rsp), %r14
	leaq	88(%rsp), %r15
	call	time@PLT
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	srand48_r@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	drand48_r@PLT
	movq	24(%rsp), %rax
	movsd	88(%rsp), %xmm1
	testl	%eax, %eax
	jle	.L5
	leal	-1(%rax), %r10d
	xorl	%ecx, %ecx
	movq	%rbp, 32(%rsp)
	movq	%rbp, %rbx
	leaq	8(%rbp,%r10,8), %r11
	movq	%r13, 40(%rsp)
	movq	%r13, %rdx
	movl	%r12d, %r8d
	movl	%r10d, 76(%rsp)
	movq	%r11, %rbp
	movl	%eax, %r13d
	movl	%ecx, %r12d
	movq	%r10, 56(%rsp)
	movsd	%xmm1, 48(%rsp)
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L32:
	addl	$1, %r12d
	pxor	%xmm0, %xmm0
	addl	$1, %r13d
	addq	$8, %rbx
	cvtsi2sdl	%r12d, %xmm0
	addq	$8, %rdx
	movsd	%xmm0, -8(%rbx)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%r13d, %xmm0
	movsd	%xmm0, -8(%rdx)
	cmpq	%rbx, %rbp
	je	.L31
.L8:
	cmpl	$8, %r8d
	jle	.L32
	movq	%r15, %rsi
	movq	%r14, %rdi
	movl	%r8d, 16(%rsp)
	addq	$8, %rbx
	movq	%rdx, 8(%rsp)
	call	drand48_r@PLT
	movsd	.LC2(%rip), %xmm0
	movq	%r15, %rsi
	movq	%r14, %rdi
	mulsd	88(%rsp), %xmm0
	movsd	%xmm0, -8(%rbx)
	call	drand48_r@PLT
	movq	8(%rsp), %rdx
	movl	16(%rsp), %r8d
	movsd	.LC2(%rip), %xmm0
	mulsd	88(%rsp), %xmm0
	addq	$8, %rdx
	movsd	%xmm0, -8(%rdx)
	cmpq	%rbx, %rbp
	jne	.L8
.L31:
	movsd	48(%rsp), %xmm1
	movq	56(%rsp), %r10
	xorl	%edi, %edi
	movl	%r8d, %r12d
	leaq	96(%rsp), %rsi
	movq	32(%rsp), %rbp
	movq	40(%rsp), %r13
	movq	%r10, 16(%rsp)
	movsd	%xmm1, 8(%rsp)
	call	clock_gettime@PLT
	movq	16(%rsp), %r10
	movsd	8(%rsp), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movsd	0(%rbp,%rax,8), %xmm0
	movq	%rax, %rdx
	mulsd	%xmm1, %xmm0
	addsd	0(%r13,%rax,8), %xmm0
	movsd	%xmm0, 0(%r13,%rax,8)
	addq	$1, %rax
	cmpq	%r10, %rdx
	jne	.L10
	leaq	112(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r14d, %r14d
	call	clock_gettime@PLT
	movq	120(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	104(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	112(%rsp), %rax
	subq	96(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	24(%rsp), %r15
	divsd	.LC5(%rip), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC3(%rip), %rbx
	movl	%r15d, %edx
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	cmpl	$8, %r15d
	jg	.L33
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%r14d, %edx
	movq	%rbx, %rsi
	movl	$1, %edi
	movl	$1, %eax
	movsd	0(%r13,%r14,8), %xmm0
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpl	%r14d, %r12d
	jg	.L12
.L13:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L34
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L33:
	.cfi_restore_state
	movq	64(%rsp), %rax
	movl	76(%rsp), %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movsd	0(%r13), %xmm0
	movsd	-8(%r13,%rax), %xmm1
	movl	$2, %eax
	call	__printf_chk@PLT
	jmp	.L13
.L5:
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	112(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	120(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	104(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	112(%rsp), %rax
	subq	96(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	24(%rsp), %edx
	divsd	.LC5(%rip), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L34:
	call	__stack_chk_fail@PLT
.L18:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
	call	exit@PLT
.L30:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1076101120
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
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
