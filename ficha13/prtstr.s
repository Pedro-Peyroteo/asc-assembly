.section .data
.global espaco
espaco: .ascii " "

.section .text
.global prtstr

prtstr:
    pusha

prtstr2:
    movb (%ecx), %bl
    test %bl, %bl
    jz fim
    movl $4, %eax
    movl $1, %ebx
    movl $1, %edx
    int $0x80
    incl %ecx
    jmp prtstr2

fim:
    movl $4, %eax
    movl $1, %ebx
    movl $1, %edx
    movl $espaco, %ecx
    int $0x80
    popa
    ret
