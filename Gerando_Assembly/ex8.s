.data
msg: .string "Alo Mundo.\n"		# string a ser impressa
Sf:  	.string "%s"    			# string de formato para printf

.text
    .globl main

main:
	pushq	%rbp			# guardando o endereço base na pilha
	movq	%rsp, %rbp    		# atualizando o endereço base de acordo com o topo atual da pilha

# chamada para printf da biblioteca libc
  	movq    $Sf, %rdi    		/* primeiro parametro (ponteiro)*/
 	movq    $msg, %rsi   		/* segundo parametro  (string) */
  	xor        %rax, %rax   		/* limpando rax*/
  	call        printf       		/* chama a funcao da biblioteca */

	movq	%rbp, %rsp		# restaura o topo da pilha (fica como estava antes da chamada da função)
	popq	%rbp				# remove o endereço base da pilha (fica como antes da chamada da função)
	ret					# faz o retorno da função main
