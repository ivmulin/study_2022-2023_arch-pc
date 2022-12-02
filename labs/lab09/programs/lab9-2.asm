%include 'in_out.asm'

section .text
    global _start

_start:
    pop ecx ; Извлекаем из стека в `ecx` количество аргументов
    pop edx ; Извлекаем из стека в `edx` имя программы
    sub ecx, 1 ; Уменьшаем `ecx` на 1 (количество аргументов без названия программы)

next:
    cmp ecx, 0 ; проверяем, есть ли еще аргументы
    jz _end ; если аргументов нет, выходим из цикла

    pop eax
    call sprintLF
    loop next

_end:
    call quit