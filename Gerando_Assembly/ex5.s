.text
.globl main

main:
	movq	$3,	%rax		#armazenando 3 no registrador %rax
	movq	$20,	%rbx 		#armazenando 20 no registrador %rbx

	cmpq	%rax,	%rbx	# comparando 20 com 3
	jge	L1					# Pule para o label L1 se rbx(20) >= rax(3)

	movq	%rax, %rbx		# copia rax para rbx

L1:
	movq     $1, %rax			# retornando o resultado armazenado em rbx
	int          $0x80
