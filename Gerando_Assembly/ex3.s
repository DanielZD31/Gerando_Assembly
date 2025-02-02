.text

.globl main

main:

	movq	$10, %rbx		#armazenando 5 no registrador %rbx

	addq	$5, %rbx		# calculando 10 + 5 e armazenando no registrador %rbx

	movq    $1, %rax			# retornando o resultado armazenado em rbx
	int         $0x80
