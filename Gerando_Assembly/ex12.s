.data
f:	.string "%d"
s:	.string "%d\n"

.text
.globl main

main:
	pushq	%rbp			# guardando o endereço base na pilha
	movq	%rsp, %rbp    		# atualizando o endereço base de acordo com o topo atual da pilha

	subq $16, %rsp			# reservando 16 bytes da pilha para variável local

# chamada: scanf
	movq $0, %rax			# limpando rax
	movq $f, %rdi			# 1º parametro
	leaq -8(%rbp), %rsi		# 2º parametro (endereço de memória do topo da pilha)
	callq scanf

# chamada: scanf
	movq $0, %rax			# limpando rax
	movq $f, %rdi			# 1º parametro
	leaq -16(%rbp), %rsi		# 2º parametro (endereço de memória do topo da pilha)
	callq scanf    
    
# chamada: printf
	movq    $s, %rdi			# 1º parametro para printf
	movq    -8(%rbp), %rsi		# 2º parametro conteúdo do endereço indicado no topo da pilha
	movq    $0, %rax			# limpando rax
	call	    printf     			# chamada da função printf

# chamada: printf
	movq    $s, %rdi			# 1º parametro para printf
	movq    -16(%rbp), %rsi	# 2º parametro conteúdo do endereço indicado no topo da pilha
	movq    $0, %rax			# limpando rax
	call	    printf			# chamada da função printf

	addq    $16, %rsp		# removendo (devolvendo) os 16 bytes das variáveis locais
	
	movq    %rbp, %rsp		# restaura o topo da pilha (fica como estava antes da chamada da função)
	popq	%rbp				# remove o endereço base da pilha (fica como antes da chamada da função)
	ret
