%include 'in_out.asm'

; f(x) = 15x + 2

section .data
    msg db "Результат: ", 0
    fun db "f(x) = 15 * x + 2", 10

section .bss
    result resb 10

section .text
    global _start

_start:
    mov eax, fun
    call sprint

    pop ecx ; Извлекаем из стека в `ecx` количество аргументов
    pop edx ; Извлекаем из стека в `edx` имя программы
    sub ecx, 1 ; Уменьшаем `ecx` на 1 (количество аргументов без названия программы)
    mov esi, 0 ; используем 'esi' для хранения промежуточных сумм

    mov eax, 0
    mov [result], eax

extractArguments:
    cmp ecx, 0 ; проверяем, есть ли еще аргументы
    jz _end ; если аргументов нет, выходим из цикла

    pop eax
    call atoi

    mov ebx, 15
    mul ebx
    add eax, 2
    add [result], eax

    loop extractArguments

_end:
    mov eax, msg
    call sprint

    mov eax, [result]
    call iprintLF

    call quit