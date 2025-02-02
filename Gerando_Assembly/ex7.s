.data
msg:
   .string "Alo Mundo.\n"	# string a ser impressa
len = . - msg 			# tamanho da string.

.text
    .globl main

main:

# chamada: ssize_t write(int fd, const void *buf, size_t count);
    movl    $len, %edx  		#3º argumento count
    movl    $msg, %ecx 	#2º argumento "*buf"
    movl    $1, %ebx		#1º argumento "fd" --> stdout (código: 1), stdin (0), stderr (2)
    movl    $4, %eax		#4 é o código da syscall write (parâmetros - veja acima)
    int        $0x80			#chamada de sistema

# chamada: void _exit(int status)
    movl    $0, %ebx		#1º argumento
    movl    $1, %eax		#1 é o código da syscall exit (parâmetros - veja acima)
    int        $0x80			#chamada de sistema
