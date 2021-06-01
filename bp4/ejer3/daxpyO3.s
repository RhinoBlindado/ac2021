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
.LC9:
	.string	"[%d] = %2.4f "
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"[0] = %2.4f, ..., [%d] = %2.4f"
	.align 8
.LC12:
	.string	"Dimension: %d Tiempo: %11.9f \n"
	.section	.rodata.str1.1
.LC13:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L39
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %r15
	movl	%eax, 24(%rsp)
	movq	%rax, %rbx
	leaq	0(,%r15,8), %r14
	movq	%r14, %rdi
	movq	%r14, 16(%rsp)
	call	malloc@PLT
	movq	%r14, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rbp, %rbp
	je	.L26
	testq	%rax, %rax
	je	.L26
	xorl	%edi, %edi
	leaq	80(%rsp), %r12
	leaq	40(%rsp), %r13
	call	time@PLT
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	srand48_r@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	drand48_r@PLT
	movsd	40(%rsp), %xmm1
	testl	%ebx, %ebx
	jle	.L5
	cmpl	$8, %ebx
	jg	.L40
	leal	-1(%rbx), %eax
	movl	%eax, 28(%rsp)
	cmpl	$2, %eax
	jbe	.L23
	movapd	.LC3(%rip), %xmm0
	movd	%ebx, %xmm5
	movl	%ebx, %eax
	pshufd	$0, %xmm5, %xmm2
	shrl	$2, %eax
	movups	%xmm0, 0(%rbp)
	movapd	.LC4(%rip), %xmm0
	subl	$1, %eax
	movups	%xmm0, 16(%rbp)
	movdqa	.LC5(%rip), %xmm0
	paddd	%xmm2, %xmm0
	cvtdq2pd	%xmm0, %xmm3
	pshufd	$238, %xmm0, %xmm0
	movups	%xmm3, (%r15)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm0, 16(%r15)
	je	.L10
	movapd	.LC6(%rip), %xmm0
	paddd	.LC8(%rip), %xmm2
	movups	%xmm0, 32(%rbp)
	movapd	.LC7(%rip), %xmm0
	movups	%xmm0, 48(%rbp)
	cvtdq2pd	%xmm2, %xmm0
	pshufd	$238, %xmm2, %xmm2
	cvtdq2pd	%xmm2, %xmm2
	movups	%xmm0, 32(%r15)
	movups	%xmm2, 48(%r15)
.L10:
	movl	%ebx, %eax
	andl	$-4, %eax
	leal	(%rax,%rbx), %edx
	cmpl	%eax, %ebx
	je	.L41
.L9:
	leal	1(%rax), %ecx
	pxor	%xmm0, %xmm0
	leal	1(%rdx), %esi
	movslq	%eax, %rdi
	cvtsi2sdl	%ecx, %xmm0
	movsd	%xmm0, 0(%rbp,%rdi,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%esi, %xmm0
	movsd	%xmm0, (%r15,%rdi,8)
	cmpl	%ebx, %ecx
	jge	.L8
	leal	2(%rax), %esi
	pxor	%xmm0, %xmm0
	leal	2(%rdx), %edi
	movslq	%ecx, %rcx
	cvtsi2sdl	%esi, %xmm0
	movsd	%xmm0, 0(%rbp,%rcx,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edi, %xmm0
	movsd	%xmm0, (%r15,%rcx,8)
	cmpl	%esi, %ebx
	jle	.L8
	addl	$3, %eax
	pxor	%xmm0, %xmm0
	movslq	%esi, %rsi
	addl	$3, %edx
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%rbp,%rsi,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, (%r15,%rsi,8)
.L8:
	xorl	%edi, %edi
	leaq	48(%rsp), %rsi
	movsd	%xmm1, (%rsp)
	call	clock_gettime@PLT
	cmpl	$1, %ebx
	movsd	(%rsp), %xmm1
	movl	%ebx, %ecx
	je	.L25
.L21:
	movl	%ecx, %edx
	movapd	%xmm1, %xmm2
	xorl	%eax, %eax
	shrl	%edx
	unpcklpd	%xmm2, %xmm2
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L14:
	movupd	0(%rbp,%rax), %xmm0
	movupd	(%r15,%rax), %xmm4
	mulpd	%xmm2, %xmm0
	addpd	%xmm4, %xmm0
	movups	%xmm0, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L14
	movl	%ecx, %eax
	andl	$-2, %eax
	andl	$1, %ecx
	je	.L13
.L20:
	cltq
	mulsd	0(%rbp,%rax,8), %xmm1
	leaq	(%r15,%rax,8), %rdx
	movsd	(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
.L13:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r13d, %r13d
	call	clock_gettime@PLT
	movq	72(%rsp), %rax
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	subq	56(%rsp), %rax
	pxor	%xmm1, %xmm1
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	divsd	.LC11(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	leaq	.LC9(%rip), %r12
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	cmpl	$8, %ebx
	jg	.L42
	.p2align 4,,10
	.p2align 3
.L16:
	movl	%r13d, %edx
	movq	%r12, %rsi
	movl	$1, %edi
	movl	$1, %eax
	movsd	(%r15,%r13,8), %xmm0
	addq	$1, %r13
	call	__printf_chk@PLT
	cmpl	%r13d, 24(%rsp)
	jg	.L16
.L17:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L43
	addq	$120, %rsp
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
.L42:
	.cfi_restore_state
	movq	16(%rsp), %rax
	movl	28(%rsp), %edx
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movsd	(%r15), %xmm0
	movsd	-8(%r15,%rax), %xmm1
	movl	$2, %eax
	call	__printf_chk@PLT
	jmp	.L17
.L40:
	leal	-1(%rbx), %eax
	xorl	%r14d, %r14d
	movl	%eax, 28(%rsp)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%r13, %rsi
	movq	%r12, %rdi
	movsd	%xmm1, (%rsp)
	call	drand48_r@PLT
	movsd	.LC2(%rip), %xmm0
	movq	%r13, %rsi
	movq	%r12, %rdi
	mulsd	40(%rsp), %xmm0
	movsd	%xmm0, 0(%rbp,%r14,8)
	call	drand48_r@PLT
	movsd	.LC2(%rip), %xmm0
	mulsd	40(%rsp), %xmm0
	movq	%r14, %rax
	movsd	(%rsp), %xmm1
	movsd	%xmm0, (%r15,%r14,8)
	addq	$1, %r14
	cmpq	8(%rsp), %rax
	jne	.L7
	jmp	.L8
.L41:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	movsd	%xmm1, (%rsp)
	call	clock_gettime@PLT
	movsd	(%rsp), %xmm1
	movl	%ebx, %ecx
	jmp	.L21
.L5:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	72(%rsp), %rax
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	subq	56(%rsp), %rax
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	divsd	.LC11(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	leaq	.LC12(%rip), %rsi
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L17
.L25:
	xorl	%eax, %eax
	jmp	.L20
.L23:
	movl	%ebx, %edx
	xorl	%eax, %eax
	jmp	.L9
.L43:
	call	__stack_chk_fail@PLT
.L26:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
	call	exit@PLT
.L39:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	0
	.long	1072693248
	.long	0
	.long	1073741824
	.align 16
.LC4:
	.long	0
	.long	1074266112
	.long	0
	.long	1074790400
	.align 16
.LC5:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC6:
	.long	0
	.long	1075052544
	.long	0
	.long	1075314688
	.align 16
.LC7:
	.long	0
	.long	1075576832
	.long	0
	.long	1075838976
	.align 16
.LC8:
	.long	5
	.long	6
	.long	7
	.long	8
	.section	.rodata.cst8
	.align 8
.LC11:
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
