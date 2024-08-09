%include "asm_io.inc"
segment .data
    prompt     db "Enter a number ", 0
    square_msg db "Square result ", 0
    cubic_msg  db "Cubic result ", 0
    quot_msg   db "Quotient of cubic result/ 100 ", 0
    rst_msg    db "Rest of cubic result/ 100 ", 0

segment .bss
    input resd 1
segment .text
    global _asm_main
    
_asm_main:
    enter 0, 0 ; setup routine
    pusha

    mov  eax, prompt
    call print_string
    call print_nl
    
    call read_int
    mov  [input], eax

    imul eax
    mov  ebx, eax

    mov  eax, square_msg
    call print_string

    mov  eax, ebx
    call print_int
    call print_nl
    
    imul eax, [input]
    mov  ebx, eax
    mov  eax, cubic_msg
    call print_string

    mov  eax, ebx
    call print_int
    call print_nl

    cdq
    mov  ecx, 10000
    idiv ecx

    mov  ecx, eax
    mov  eax, quot_msg
    call print_string
    mov  eax, ecx
    call print_int
    call print_nl

    mov  eax, rst_msg
    call print_string
    mov  eax, edx
    call print_int
    call print_nl
    
    popa
    mov eax, 0
    leave
    ret