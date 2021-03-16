	.file	"SumaVectores.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 8
.LC1:
	.string	"No hay suficiente espacio para los vectores "
	.align 8
.LC3:
	.string	"/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC4:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC5:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%u\n"
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L27
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r13d
	movq	%rax, %rbx
	movl	%eax, %r12d
	salq	$3, %r13
	movq	%r13, %rdi
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, %r14
	call	malloc@PLT
	movq	%rax, %r13
	testq	%rbp, %rbp
	je	.L17
	testq	%r14, %r14
	je	.L17
	cmpl	$8, %ebx
	ja	.L5
	testl	%ebx, %ebx
	je	.L6
	pxor	%xmm1, %xmm1
	movsd	.LC2(%rip), %xmm3
	xorl	%eax, %eax
	cvtsi2sdl	%ebx, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm7
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	movsd	%xmm2, 0(%rbp,%rax,8)
	movsd	%xmm7, (%r14,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r12d
	ja	.L7
.L8:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movsd	0(%rbp,%rax,8), %xmm0
	addsd	(%r14,%rax,8), %xmm0
	movsd	%xmm0, 0(%r13,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r12d
	ja	.L10
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC6(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cmpl	$9, %ebx
	jbe	.L28
	leal	-1(%rbx), %eax
	movsd	0(%r13), %xmm3
	movsd	(%r14), %xmm2
	movl	%ebx, %edx
	movsd	0(%r13,%rax,8), %xmm6
	movq	%rax, %rcx
	movl	%eax, %r9d
	movl	%eax, %r8d
	movsd	(%r14,%rax,8), %xmm5
	movsd	0(%rbp,%rax,8), %xmm4
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movsd	0(%rbp), %xmm1
	movl	$7, %eax
	call	__printf_chk@PLT
.L13:
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L29
	addq	$72, %rsp
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
.L28:
	.cfi_restore_state
	movl	%ebx, %edx
	leaq	.LC5(%rip), %rsi
	xorl	%ebx, %ebx
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC3(%rip), %r15
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L12:
	movsd	0(%rbp,%rbx,8), %xmm0
	movsd	(%r14,%rbx,8), %xmm1
	movl	%ebx, %ecx
	movl	%ebx, %edx
	movl	%ebx, %r8d
	movq	%r15, %rsi
	movl	$1, %edi
	movl	$3, %eax
	movsd	0(%r13,%rbx,8), %xmm2
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, %r12d
	ja	.L12
	jmp	.L13
.L5:
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	leal	-1(%rbx), %eax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L9:
	call	rand@PLT
	movl	%eax, 4(%rsp)
	call	rand@PLT
	movl	4(%rsp), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	cvtsi2sdl	%edx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 0(%rbp,%r15,8)
	call	rand@PLT
	movl	%eax, 4(%rsp)
	call	rand@PLT
	movl	4(%rsp), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	%r15, %rax
	cvtsi2sdl	%edx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%r14,%r15,8)
	addq	$1, %r15
	cmpq	%rax, 8(%rsp)
	jne	.L9
	jmp	.L8
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	xorl	%edx, %edx
	subq	24(%rsp), %rax
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	divsd	.LC6(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	leaq	.LC5(%rip), %rsi
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	jmp	.L13
.L29:
	call	__stack_chk_fail@PLT
.L17:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
	call	exit@PLT
.L27:
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
	.long	2576980378
	.long	1069128089
	.align 8
.LC6:
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
