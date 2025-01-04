.section .data
buffer: .space 100
array: .ascii "Hello\0World\0"

.section .text
.global main
.extern func1
.extern barran
.extern espaco

main:
    movl $3, %eax
    movl $0, %ebx
    movl $buffer, %ecx
    movl $100, %edx
    int $0x80

    pushl $2
    leal array, %ebx
    pushl %ebx
    call func1
    addl $8, %esp
    ret
