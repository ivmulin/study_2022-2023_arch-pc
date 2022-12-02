%include 'in_out.asm'

section .data
    msg db "Результат: ",0

section .text
    global _start

_start:
    pop ecx ; Извлекаем из стека в `ecx` количество аргументов
    pop edx ; Извлекаем из стека в `edx` имя программы
    sub ecx, 1 ; Уменьшаем `ecx` на 1 (количество аргументов без названия программы)
    mov esi, 1 ; используем 'esi' для хранения промежуточных произведений 

next:
    cmp ecx, 0 ; проверяем, есть ли еще аргументы
    jz _end ; если аргументов нет, выходим из цикла

    pop eax
    call atoi
    mul esi ; eax *= eax
    mov esi, eax

    loop next

_end:
    mov eax, msg
    call sprint

    mov eax, esi
    call iprintLF

    call quit