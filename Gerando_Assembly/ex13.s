.text

.globl main

main:
	movq		$3, %rdi		# 1º argumento
	movq		$6, %rsi		# 2º argumento
	movq		$2, %rdx		# 3º argumento
	call 		teste			# chamada do procedimento
						# ao término do procedimento o retorno estará em %rax

	movq		%rax, %rbx		# copiando o retorno para %rbx
	movq		$1, %rax
	int		$0x80

teste:
	pushq	%rbp				# guardando o endereço base na pilha
	movq	%rsp, %rbp 	 		# atualizando o endereço base de acordo com o topo atual da pilha

	movq		%rdi, %rax
	addq		%rsi, %rax
	addq		%rdx, %rax
	
	movq	%rbp, %rsp		# restaura o topo da pilha (fica como estava antes da chamada da função)
	popq	%rbp			# remove o endereço base da pilha (fica como antes da chamada da função)
	ret
