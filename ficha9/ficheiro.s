	.file	"ficheiro.c"
	.text
	.globl	_acumulador
	.bss
	.align 4
_acumulador:
	.space 4
	.globl	_i
	.align 4
_i:
	.space 4
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	call	___main
	movl	$10, _i
	jmp	L2
L3:
	movl	_i, %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	_acumulador, %eax
	addl	%edx, %eax
	movl	%eax, _acumulador
	movl	_i, %eax
	subl	$1, %eax
	movl	%eax, _i
L2:
	movl	_i, %eax
	testl	%eax, %eax
	jns	L3
	nop
	nop
	leave
	ret
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 13.2.0"
