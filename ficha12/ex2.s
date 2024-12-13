.data
ok: .string "esta a funcionar\n"
.text
.globl main
main:
    pusha
    movl $4, %eax
    movl $1, %ebx
    movl $ok, %ecx
    movl $18, %edx

    int $0x80

    movl $3, %ebx
    movl $1, %eax
    
    int $0x80

    ret