    .section .data
acumulador:
    .long 0         # Variável global para armazenar a soma dos números ímpares

    .section .text
    .globl main
main:
    movl $0, %eax               # Inicializar acumulador em %eax com 0
    movl $0, %ecx               # Iniciar variável de controle do ciclo em %ecx (i)

loop:
    movl %ecx, %ebx             # Carregar o valor de i em %ebx
    shll $1, %ebx               # Multiplicar i por 2 usando SHL e armazenar em %ebx
    addl $1, %ebx               # Somar 1 ao resultado parcial

    addl %ebx, %eax             # Adicionar o resultado parcial ao acumulador em %eax

    incl %ecx                   # Incrementar variável de controle do ciclo
    cmpl $10, %ecx              # Comparar i com 10
    jl loop                     # Se i < 10, voltar ao início do loop

    movl %eax, acumulador       # Armazenar o valor de %eax em acumulador

pause:
    jmp pause                   # Loop infinito para pausar a execução
