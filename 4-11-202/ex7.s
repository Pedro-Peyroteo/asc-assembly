.data
    valor: .long 12           
    .lcomm resultado, 4      

.text
.globl main
main:
    movl valor, %ecx          
    movl $0, %eax            

ciclo:
    addl %ecx, %eax           # Soma ecx com eax
    decl %ecx                 # Decrementa %ecx por 1
    cmpl $0, %ecx             # Compara %ecx com 0
    jne ciclo                 # If %ecx != 0, repete loop

    movl %eax, resultado  #  Move resultado para registo eax      
    # call imprime_eax          # Função não compativel com o sistema. Programa funciona normalmente, adicionar breakpoint linha 17 e ver info sobre %eax
    ret                       
