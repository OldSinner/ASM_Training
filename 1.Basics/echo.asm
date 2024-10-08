%include "asm_io.inc"  ; Include external file for I/O functions

segment .data
    prompt db "Enter a number ", 0 ; Define a string with a null terminator
    outmsg db "You enter ", 0      ; Define another string with a null terminator

segment .bss
    input resd 1
    ; Uninitialized var segment (currently empty)

segment .text
    global _asm_main ; Declare the entry point for the linker

_asm_main:
    enter 0, 0 ; Set up stack frame
    pusha      ; Push all general-purpose registers onto the stack

    mov  eax, prompt  ; Load the address of the prompt string into EAX
    call print_string ; Call the print_string function to print the prompt

    call read_int
    mov  [input], eax

    mov  eax, outmsg
    call print_string

    mov  eax, [input]
    call print_int

    ;; Exit
    popa
    mov eax, 0
    leave
    ret