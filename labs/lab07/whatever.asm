; f(x)=10*(x+1)-10, 1, 7

%include 'in_out.asm'

section .data
    function: db 'f(x)=10*(x+1)-10', 0
    msg: db 'Введите аргумент, пожалуйста: ', 0
    ans: db 'Ответ: ', 0

section .bss
    x: resb 80

section .text
    global _start

_start:
    mov eax, function
    call sprintLF

    mov eax, msg
    call sprint

    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi ; eax=x

    inc eax
    mov ebx, 10
    mul ebx
    sub eax, 10
    mov edx, eax

    mov eax, ans
    call sprint

    mov eax, edx
    call iprintLF

    call quit
