.data
msg:     .string "Digite uma mensagem (máximo 10 caracteres):\n"	# string a ser impressa
len = . - msg 					# tamanho da string.
msg_out: .string "          \n"		# string a ser impressa

.text
    .globl main

main:

# chamada: ssize_t write(int fd, const void *buf, size_t count);
    movl    $len, %edx  			#3º argumento count
    movl    $msg, %ecx 			#2º argumento "*buf"
    movl    $1, %ebx				#1º argumento "fd" --> stdout (código: 1), stdin (0), stderr (2)
    movl    $4, %eax				#4 é o código da syscall write (parâmetros - veja acima)
    int        $0x80				#chamada de sistema
# chamada: ssize_t read(int fd, void *buf, size_t count);
    movl	$3, %eax			#3 é o código da syscall write (parâmetros - veja acima)
    movl	$0, %ebx			#1º argumento "fd" --> stdout (código: 1), stdin (0), stderr (2)
    movl	$msg_out, %ecx	#2º argumento "*buf"
    movl	$10, %edx		#3º argumento count
    int		$0x80

# chamada: ssize_t write(int fd, const void *buf, size_t count);
    movl    $11, %edx  		#3º argumento count
    movl    $msg_out, %ecx 	#2º argumento "*buf"
    movl    $1, %ebx			#1º argumento "fd" --> stdout (código: 1), stdin (0), stderr (2)
    movl    $4, %eax			#4 é o código da syscall write (parâmetros - veja acima)
    int        $0x80			#chamada de sistema

# chamada: void _exit(int status)
    movl    $0, %ebx			#1º argumento
    movl    $1, %eax			#1 é o código da syscall exit (parâmetros - veja acima)
    int        $0x80			#chamada de sistema
