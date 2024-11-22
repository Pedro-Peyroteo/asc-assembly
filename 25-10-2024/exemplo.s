.data
message: .ascii "Hello, World!\n"  # Define a mensagem com uma quebra de linha
msg_len: .long 14                  # Comprimento da mensagem (14 caracteres)

.text
.globl main
main:
    # sys_write
    movl $4, %eax                  # Código de sistema para sys_write (4)
    movl $1, %ebx                  # File descriptor 1 (stdout)
    movl $message, %ecx            # Endereço da mensagem
    movl msg_len, %edx             # Comprimento da mensagem
    int $0x80                      # Chamada ao kernel

    # sys_exit
    movl $1, %eax                  # Código de sistema para sys_exit (1)
    xorl %ebx, %ebx                # Código de saída 0
    int $0x80                      # Chamada ao kernel para sair
