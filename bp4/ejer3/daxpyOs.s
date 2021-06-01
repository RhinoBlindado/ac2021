	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Uso: ./daxpy N"
.LC1:
	.string	"Error en la reserva de espacio"
.LC4:
	.string	"Dimension: %d Tiempo: %11.9f \n"
.LC5:
	.string	"Resultado: "
.LC6:
	.string	"[%d] = %2.4f "
.LC7:
	.string	"[0] = %2.4f, ..., [%d] = %2.4f"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB24:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	decl	%edi
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	jmp	.L21
.L2:
	movq	8(%rsi), %rdi
	call	atoi@PLT
	movslq	%eax, %r13
	leaq	0(,%r13,8), %rax
	movq	%r13, %rbx
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movq	8(%rsp), %rdi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%r12, %r12
	je	.L17
	testq	%rax, %rax
	jne	.L3
.L17:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
.L21:
	call	exit@PLT
.L3:
	xorl	%edi, %edi
	leaq	80(%rsp), %r14
	leaq	40(%rsp), %r15
	call	time@PLT
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	srand48_r@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	drand48_r@PLT
	movsd	40(%rsp), %xmm2
	movl	%r13d, %r8d
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
	movsd	%xmm2, 16(%rsp)
.L5:
	cmpl	%r13d, %ebx
	jle	.L23
	cmpl	$8, %ebx
	jg	.L6
	incl	%ecx
	incl	%r8d
	cvtsi2sdl	%ecx, %xmm0
	movsd	%xmm0, (%r12,%r13,8)
	cvtsi2sdl	%r8d, %xmm0
	movsd	%xmm0, 0(%rbp,%r13,8)
	jmp	.L7
.L6:
	movq	%r15, %rsi
	movq	%r14, %rdi
	movl	%r8d, 28(%rsp)
	movl	%ecx, 24(%rsp)
	call	drand48_r@PLT
	movsd	.LC2(%rip), %xmm0
	movq	%r15, %rsi
	movq	%r14, %rdi
	mulsd	40(%rsp), %xmm0
	movsd	%xmm0, (%r12,%r13,8)
	call	drand48_r@PLT
	movl	28(%rsp), %r8d
	movl	24(%rsp), %ecx
	movsd	.LC2(%rip), %xmm0
	mulsd	40(%rsp), %xmm0
	movsd	%xmm0, 0(%rbp,%r13,8)
.L7:
	incq	%r13
	jmp	.L5
.L23:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
.L9:
	cmpl	%eax, %ebx
	jle	.L24
	movsd	16(%rsp), %xmm0
	mulsd	(%r12,%rax,8), %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
	incq	%rax
	jmp	.L9
.L24:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r14d, %r14d
	call	clock_gettime@PLT
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	movl	%ebx, %edx
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	divsd	.LC3(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	leaq	.LC4(%rip), %rsi
	movb	$1, %al
	movl	$1, %edi
	leaq	.LC6(%rip), %r15
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	cmpl	$8, %ebx
	jg	.L25
.L11:
	cmpl	%r14d, %ebx
	jle	.L14
	movsd	0(%rbp,%r14,8), %xmm0
	movl	%r14d, %edx
	movq	%r15, %rsi
	movb	$1, %al
	movl	$1, %edi
	incq	%r14
	call	__printf_chk@PLT
	jmp	.L11
.L25:
	movq	8(%rsp), %rax
	movsd	0(%rbp), %xmm0
	leal	-1(%rbx), %edx
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movsd	-8(%rbp,%rax), %xmm1
	movb	$2, %al
	call	__printf_chk@PLT
.L14:
	movl	$10, %edi
	call	putchar@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	addq	$120, %rsp
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
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1076101120
	.align 8
.LC3:
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
