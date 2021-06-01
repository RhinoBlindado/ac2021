	.file	"daxpy.c"
	.text
	.section	.rodata
.LC0:
	.string	"Uso: ./daxpy N"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio"
	.align 8
.LC4:
	.string	"Dimension: %d Tiempo: %11.9f \n"
.LC5:
	.string	"Resultado: "
.LC6:
	.string	"[%d] = %2.4f "
	.align 8
.LC7:
	.string	"[0] = %2.4f, ..., [%d] = %2.4f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -132(%rbp)
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -96(%rbp)
	movl	-108(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -96(%rbp)
	je	.L3
	cmpq	$0, -88(%rbp)
	jne	.L4
.L3:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
	call	exit@PLT
.L4:
	movl	$0, -128(%rbp)
	movl	-108(%rbp), %eax
	movl	%eax, -124(%rbp)
	movl	$0, %edi
	call	time@PLT
	movq	%rax, %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	srand48_r@PLT
	leaq	-104(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	drand48_r@PLT
	movsd	-104(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	movl	$0, -116(%rbp)
	jmp	.L5
.L8:
	cmpl	$8, -108(%rbp)
	jg	.L6
	addl	$1, -128(%rbp)
	movl	-116(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2sdl	-128(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -124(%rbp)
	movl	-116(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2sdl	-124(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	jmp	.L7
.L6:
	leaq	-104(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	drand48_r@PLT
	movsd	-104(%rbp), %xmm1
	movl	-116(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	leaq	-104(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	drand48_r@PLT
	movsd	-104(%rbp), %xmm1
	movl	-116(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
.L7:
	addl	$1, -116(%rbp)
.L5:
	movl	-116(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L8
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -120(%rbp)
	jmp	.L9
.L10:
	movl	-120(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	-80(%rbp), %xmm1
	movl	-120(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-120(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -120(%rbp)
.L9:
	movl	-120(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L10
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-72(%rbp), %rdx
	movl	-108(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	cmpl	$8, -108(%rbp)
	jg	.L11
	movl	$0, -112(%rbp)
	jmp	.L12
.L13:
	movl	-112(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-112(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -112(%rbp)
.L12:
	movl	-112(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L13
	jmp	.L14
.L11:
	movl	-108(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-108(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movapd	%xmm0, %xmm1
	movl	%edx, %esi
	movq	%rax, %xmm0
	leaq	.LC7(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
.L14:
	movl	$10, %edi
	call	putchar@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
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
