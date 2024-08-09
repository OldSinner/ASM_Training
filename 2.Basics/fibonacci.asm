%include "asm_io.inc"
segment .data
    prompt              db "Give fibonnaci seq number", 0
    wrong_number_prompt db "Number cannot be less than 0", 0
segment .bss
    input       resd 1
    response    resd 1
    fibonnaci_1 resd 1
    fibonnaci_2 resd 1
    counter     resd 1
segment .text
    global _asm_main

_asm_main:
    enter 0, 0 ; setup routine
    pusha
    ;; code

    mov  eax, prompt
    call print_string
    call print_nl

    call read_int
    cmp  eax, 0

    jl wrong_number

    cmp eax, 0
    je  is_zero

    cmp eax, 1
    je  is_one
    
    mov [input], eax
    
    mov byte [counter],     2
    mov byte [fibonnaci_1], 0
    mov byte [fibonnaci_2], 1
    jmp fibonnaci

    jmp exit
    
fibonnaci:
    mov eax,           [fibonnaci_2]
    add eax,           [fibonnaci_1]
    mov ebx,           [fibonnaci_2]
    mov [fibonnaci_2], eax
    mov [fibonnaci_1], ebx
    mov [response],    eax
    
    mov ecx,       [input]
    cmp [counter], ecx
    je  print_result

    inc byte [counter]
    jmp fibonnaci

is_one:
    mov byte [response], 1
    jmp print_result
is_zero:
    mov byte [response], 0
    jmp print_result

print_result:
    mov  eax, [response]
    call print_int
    jmp  exit

wrong_number:
    mov  eax, wrong_number_prompt
    call print_string
    jmp  exit


exit:
    ;; end code
    popa
    mov eax, 0 ; return back to C
    leave
    ret 