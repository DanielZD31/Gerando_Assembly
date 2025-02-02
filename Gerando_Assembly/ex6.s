.text
.globl main

main:
	pushq	$5				# guardando o valor 5 na pilha
	pushq	$7				# guardando o valor 7 na pilha

	popq	%rax			# Obtendo o valor 7 da pilha
	popq	%rbx			# Obtendo o valor 5 da pilha
	addq	%rax, %rbx		# Fazendo a soma e guardando em rbx
							# local onde a interrupção exit usa como valor de retorno

	movq	$1, %rax		# Código da interrupção de retorno
	int	       $0x80
