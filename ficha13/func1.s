.section .data
.global barran
barran: .ascii "\n"

.section .text
.global func1

func1:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx

ciclo:
    cmpl $0, %eax
    je sair
    decl %eax
    movl (%ebx), %ecx
    call prtstr
    addl $4, %ebx
    jmp ciclo

sair:
    movl $4, %eax
    movl $1, %ebx
    movl $1, %edx
    movl $barran, %ecx
    int $0x80
    popl %ebp
    ret
