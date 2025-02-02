.section .text
.globl _start

_start:
    movq    $3, %rax         # Armazena 3 no registrador %rax
    movq    $20, %rbx        # Armazena 20 no registrador %rbx

    subq    %rax, %rbx       # Calcula 20 - 3 e armazena no registrador %rbx
    movq    %rbx, %rdi       # Move o resultado para %rdi (código de saída)

    movq    $60, %rax        # Syscall para exit (60 no Linux x86-64)
    syscall                  # Realiza a syscall
