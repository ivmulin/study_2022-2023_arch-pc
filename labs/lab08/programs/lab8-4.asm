%include 'in_out.asm'

section .data
    msgX db 'x = ',0h
    msgA db "a = ",0h

section .bss
    x resb 10
    a resb 10
    f resb 10

section .text
global _start

_start:
    ; ---------- Ввод 'B'
    mov eax, msgX
    call sprint
    mov ecx, x
    mov edx,10
    call sread

    ; ---------- Ввод 'x'
    mov eax, msgA
    call sprint
    mov ecx, a
    mov edx,10
    call sread

    ; ---------- Преобразование 'x' из символа в число
    mov eax, x
    call atoi
    mov [x], eax

    ; ---------- Преобразование 'a' из символа в число
    mov eax, a
    call atoi
    mov [a], eax

    mov ecx, [x]
    cmp ecx, 0

    je vadim

    mov eax, [a]
    mov ebx, 4
    mul ebx
    add eax, [x]
    jmp fin

vadim:
    mov eax, [a]
    mov ebx, 4
    mul ebx

fin:
    call iprintLF ; Вывод 'max(A,B,C)'
    call quit ; Выход