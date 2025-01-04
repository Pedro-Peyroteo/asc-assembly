	.file	"asm5.c"
	.text
	.globl	origem
	.data
	.align 16
origem:
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.globl	destino
	.bss
	.align 16
destino:
	.space 20
	.text
	.globl	calcula_enuplo
	.def	calcula_enuplo;	.scl	2;	.type	32;	.endef
	.seh_proc	calcula_enuplo
calcula_enuplo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	sall	$11, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	multiplica_vetor
	.def	multiplica_vetor;	.scl	2;	.type	32;	.endef
	.seh_proc	multiplica_vetor
multiplica_vetor:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movl	%r8d, 48(%rbp)
	jmp	.L4
.L5:
	movl	48(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	-4(%rdx), %rcx
	movq	40(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	%eax, %ecx
	call	calcula_enuplo
	movl	%eax, (%rbx)
	subl	$1, 48(%rbp)
.L4:
	cmpl	$0, 48(%rbp)
	jg	.L5
	nop
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%d\12\0"
	.text
	.globl	imprime_vetor
	.def	imprime_vetor;	.scl	2;	.type	32;	.endef
	.seh_proc	imprime_vetor
imprime_vetor:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	jmp	.L7
.L8:
	movl	24(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	subl	$1, 24(%rbp)
.L7:
	cmpl	$0, 24(%rbp)
	jg	.L8
	nop
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	movl	$5, %r8d
	leaq	destino(%rip), %rax
	movq	%rax, %rdx
	leaq	origem(%rip), %rax
	movq	%rax, %rcx
	call	multiplica_vetor
	movl	$5, %edx
	leaq	destino(%rip), %rax
	movq	%rax, %rcx
	call	imprime_vetor
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 13.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
