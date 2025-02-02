.text

.globl main

main:

    movq    $5, %rbx
    movq    $1, %rax
    int         $0x80
