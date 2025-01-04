# Exercicio 1 e 2
    .section .data
VAR1:   .long 27           # Primeiro valor (dividendo)
VAR2:   .long -3           # Segundo valor (divisor)
    .lcomm RESULT, 4        # Reserva espaço para o resultado

    .section .text
    .globl main
main:
    # Poe VAR1 no registo %eax 
    movl VAR1, %eax 
    # Poe VAR2 no registo %ebx
    movl VAR2, %ebx 

    # Chama a função media
    call media

    # Guarda o valor de %eax na variavel RESULT
    movl %eax, RESULT
    
    # Adicionar breakpoint linha 19
    # (gdb) x/12i $esp - ver stack em ASCCII

    ret

# Função para calcular media
media: 
    addl %ebx, %eax     # Soma os registos %ebx com %eax (VAR1 + VAR2)

    movl $2, %ecx       # Guarda 2 no registo %ecx (divisor, para média)
    cltd                # (Convert Long to DoubleLong), que expande o valor em EAX para uma representação em 8 bytes nos registos EDX:EAX.
    idiv %ecx           # Determina o calculo da media "%eax = (%edx:%eax) / %ebx"

    ret                 # Volta para a função
