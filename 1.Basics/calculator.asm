%include "asm_io.inc"  ; Include external file for I/O functions

segment .data
    prompt1 db "Enter first number ", 0  ; 
    prompt2 db "Enter second number ", 0 ; 

    outmsg db "Sum is ", 0 ; 

segment .bss
    input1 resd 1
    input2 resd 1

    ; Uninitialized var segment (currently empty)

segment .text
    global _asm_main ; Declare the entry point for the linker

_asm_main:
    enter 0, 0 ; Set up stack frame
    pusha      ; Push all general-purpose registers onto the stack

    mov  eax, prompt1 ; Load the address of the prompt string into EAX
    call print_string ; Call the print_string function to print the prompt

    call read_int
    mov  [input1], eax

    mov  eax, prompt2 ; Load the address of the prompt string into EAX
    call print_string ; Call the print_string function to print the prompt

    call read_int
    mov  [input2], eax

    mov  eax, outmsg  ; Load the address of the prompt string into EAX
    call print_string ; Call the print_string function to print the prompt

    mov  eax, [input1]
    add  eax, [input2]
    call print_int
    ;; Exit
    popa
    mov  eax, 0
    leave
    ret