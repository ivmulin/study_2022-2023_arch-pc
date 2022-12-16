%include 'in_out.asm'

section .data
    div: db 'Результат: ',0

SECTION .text
global _start

_start:
    ; ---- Вычисление выражения (3+2)*4+5
    mov ebx, 3
    mov eax, 2
    add eax, ebx
    mov ecx, 4
    mul ecx
    add eax, 5
    mov edi, eax
    ; ---- Вывод результата на экран
    mov eax, div
    call sprint

    mov eax,edi
    call iprintLF

    call quit