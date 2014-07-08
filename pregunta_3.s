	.file	"tarea4arqui.c"
	.text
	.p2align 4,,15
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB18:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L7
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%eax, %esi
.L7:
	subl	$1, %edi
	leal	(%rsi,%rdx), %eax
	movl	%esi, %edx
	jne	.L12
.L3:
	cltq
	ret
.L13:
	movl	%esi, %eax
	jmp	.L3
	.cfi_endproc
.LFE18:
	.size	fibonacci, .-fibonacci
	.p2align 4,,15
	.globl	fibonacci_serie
	.type	fibonacci_serie, @function
fibonacci_serie:
.LFB19:
	.cfi_startproc
	testl	%edi, %edi
	je	.L22
	movss	.LC0(%rip), %xmm2
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%edi, %eax
	movl	$1, %ecx
	xorl	%edx, %edx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L27:
	movl	%esi, %edx
.L19:
	subl	$1, %eax
	leal	(%rdx,%rcx), %esi
	movl	%edx, %ecx
	jne	.L27
	cvtsi2ss	%esi, %xmm1
	subl	$1, %edi
	movaps	%xmm2, %xmm3
	divss	%xmm1, %xmm3
	addss	%xmm3, %xmm0
	jne	.L17
	rep
	ret
.L22:
	rep
	ret
	.cfi_endproc
.LFE19:
	.size	fibonacci_serie, .-fibonacci_serie
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Ingresar cantidad: "
.LC3:
	.string	"%d"
.LC4:
	.string	"Fibon\303\272mero: %d\n"
.LC5:
	.string	"Fiboserie: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	leaq	12(%rsp), %rsi
	xorl	%eax, %eax
	movl	$.LC3, %edi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	xorl	%edx, %edx
	movl	$1, %ecx
	testl	%eax, %eax
	jne	.L42
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L48:
	movl	%esi, %edx
.L42:
	subl	$1, %eax
	leal	(%rdx,%rcx), %esi
	movl	%edx, %ecx
	jne	.L48
.L32:
	movl	$.LC4, %edi
	xorl	%eax, %eax
	movslq	%esi, %rsi
	call	printf
	movl	12(%rsp), %edi
	xorps	%xmm0, %xmm0
	testl	%edi, %edi
	je	.L30
	movss	.LC0(%rip), %xmm2
	.p2align 4,,10
	.p2align 3
.L33:
	movl	%edi, %eax
	movl	$1, %ecx
	xorl	%edx, %edx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L49:
	movl	%esi, %edx
.L35:
	subl	$1, %eax
	leal	(%rdx,%rcx), %esi
	movl	%edx, %ecx
	jne	.L49
	cvtsi2ss	%esi, %xmm1
	subl	$1, %edi
	movaps	%xmm2, %xmm3
	divss	%xmm1, %xmm3
	addss	%xmm3, %xmm0
	jne	.L33
.L30:
	unpcklps	%xmm0, %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	call	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L50:
	.cfi_restore_state
	xorl	%esi, %esi
	jmp	.L32
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
