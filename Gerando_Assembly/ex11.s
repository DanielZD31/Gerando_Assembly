.data
f:	.string "%d"
s:	.string "%d\n"
x:	.long 0
y:	.long 0

.text
.globl main

main:
	pushq    %rbp			# guardando o endereço base na pilha
	movq    %rsp, %rbp  		# atualizando o endereço base de acordo com o topo atual da pilha

# chamada: scanf
	movq    $0, %rax		# limpando rax
	movq    $f, %rdi			# 1º parametro
	movq    $x, %rsi		# 2º parametro (endereço de memória do topo da pilha)
	call        scanf

# chamada: scanf
	movq    $0, %rax		# limpando rax
	movq    $f, %rdi			# 1º parametro
	movq    $y, %rsi			# 2º parametro (endereço de memória do topo da pilha)
	call        scanf
# chamada: printf
	movq    $s, %rdi	# 1º parametro para printf
	movq    (x), %rsi	# 2º parametro conteúdo do endereço indicado no topo da pilha
	movq    $0, %rax	# limpando rax
	call	printf			# chamada da função printf

# chamada: printf
	movq    $s, %rdi	# 1º parametro para printf
	movq    (y), %rsi	# 2º parametro conteúdo do endereço indicado no topo da pilha
	movq    $0, %rax	# limpando rax
	call	    printf		# chamada da função printf

	movq    %rbp, %rsp	# restaura o topo da pilha (fica como estava antes da chamada da função)
	popq	    %rbp		# remove o endereço base da pilha (fica como antes da chamada da função)
	ret
