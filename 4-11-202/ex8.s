.data
    .lcomm n_negativos, 1       

.text
.globl main
main:
    movb $0, n_negativos        

    # Verificar se %eax é negativo
    testl %eax, %eax            
    js incremento               

    # Verificar se %ebx é negativo
    testl %ebx, %ebx            
    js incremento               

    # Verificar se %ecx é negativo
    testl %ecx, %ecx            
    js incremento               

    # Verificar se %edx é negativo
    testl %edx, %edx            
    js incremento   
                

fim:
    ret                         

# Incrementa n_negativos por 1
incremento:
    incb n_negativos            
    jmp fim                     
