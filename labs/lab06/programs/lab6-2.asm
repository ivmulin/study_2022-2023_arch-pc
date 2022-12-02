%include 'in_out.asm'

section .data
    message: db 'Введите строку', 10
    length: equ $-message

section .bss
    buf1: resb 80

section .text
global _start
_start:
    ; write
    mov eax, message
    call sprintLF

    ; read
    mov ecx, buf1
    mov edx, 80
    call sread

    ; exit
    call quit