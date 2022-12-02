section .data
    message: db 'Введите строку', 10
    length: equ $-message

section .bss
    buf1: resb 80

section .text
global _start
_start:
    ; write
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, length
    int 80h ; вызов ядра

    ; read
    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 80 ; длина вводимой строки
    int 80h

    ; exit
    mov eax, 1
    mov ebx, 0
    int 80h