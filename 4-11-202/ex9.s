.data
    valor_inicial: .word 14    
    .lcomm soma_pares, 4       

.text
.globl main
main:
    movl $0, soma_pares

    movw valor_inicial, %ax
    movzbl %al, %eax        # Zero extend %ax into %eax (clear higher bytes of %eax)

ciclo:
    # Verificar se %eax é maior que 0
    cmpl $0, %eax
    jle fim                 # Se %eax <= 0, sair do loop

    # Verificar se %eax é par ou ímpar (se o bit menos significativo de %eax for 0, é par)
    testl $1, %eax         # Faz comparação "AND" entre %eax e 1, pondo a flag de acordo com o resultado
    jnz proximo            # Se for ímpar, salta para o próximo valor

    addl %eax, soma_pares

proximo:
    # Decrementar %eax (passa para o próximo número)
    subl $1, %eax

    jmp ciclo

fim:
    ret
