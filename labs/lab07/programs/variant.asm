%include 'in_out.asm'

section .data
    msg: db 'Введите No студенческого билета: ',0
    rem: db 'Ваш вариант: ',0

section .bss
    x: resb 80

section .text
    GLOBAL _start

_start:
    mov eax, msg
    call sprintLF
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x ; вызов подпрограммы преобразования
    call atoi ; ASCII кода в число, `eax=x`
    xor edx, edx
    mov ebx, 20
    div ebx
    inc edx

    mov eax, rem
    call sprint
    
    mov eax, edx
    call iprintLF

    call quit