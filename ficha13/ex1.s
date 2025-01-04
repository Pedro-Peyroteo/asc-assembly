.data
    espaco: .ascii " "
    barran: .ascii "\n"

.text
    .global main

main:
    
func1:
    pushl   %ebp
    movl    %esp, %ebp
    movl    8(%ebp), %eax
    movl    12(%ebp), %ebx
    ;addl    $4, %ebx            

ciclo:
    cmpl    $0, %eax
    je      sair
    decl    %eax
    movl    (%ebx), %ecx
    call    prtstr
    addl    $4, %ebx
    jmp     ciclo

sair:
    movl    $4, %eax
    movl    $1, %ebx
    movl    $1, %edx
    movl    $barran, %ecx
    int     $0x80
    popl    %ebp
    ret

prtstr:
    pusha

prtstr2:
    movb    (%ecx), %bl
    test    %bl, %bl
    jz      fim
    movl    $4, %eax
    movl    $1, %ebx
    movl    $1, %edx
    int     $0x80
    incl    %ecx
    jmp     prtstr2

fim:
    movl    $4, %eax
    movl    $1, %ebx
    movl    $1, %edx
    movl    $espaco, %ecx
    int     $0x80
    popa
    ret
