.section .text
.global _start              # Define _start as the entry point

_start:
    # Exemplo: Inicializa %eax e %ebx com valores sem sinal
    movl $3, %eax          # Coloca o valor 3 em %eax
    movl $2, %ebx          # Coloca o valor 2 em %ebx

    # Compara %ebx com %eax
    cmp %ebx, %eax         # Compara %eax com %ebx, sem sinal
    ja ROT                # Salta para ROT se %ebx <= %eax (sem sinal)

    # Código que será executado se a condição for falsa (se %ebx > %eax)
    movl $1, %edi          # Coloca 1 em %edi para indicar que a condição não foi satisfeita
    jmp END                # Salta para o fim

ROT:
    # Código executado se a condição %ebx <= %eax for verdadeira
    movl $0, %edi          # Coloca 0 em %edi para indicar que o salto ocorreu

END:
    # Saída segura
    movl $60, %eax         # Código de saída do sistema (sys_exit) no Linux
    xor %edi, %edi         # Status de saída (0 para sucesso)
    syscall                # Executa a chamada de saída
