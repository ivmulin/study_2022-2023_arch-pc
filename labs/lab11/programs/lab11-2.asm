%include 'in_out.asm'

section .data
    nameRequest: db "Как вас зовут? - ", 0
    filename: db "maybeyes.txt", 0
    iam: db "Меня зовут "
    iamLength: equ $-iam

section .bss
    name: resb 255

section .text
    global _start

_start:
    mov eax, nameRequest
    call sprint

    mov ecx, name
    mov edx,255
    call sread
    
    mov ecx, 0777o ; Создание файла.
    mov ebx, filename ; в случае успешного создания файла,
    mov eax, 8 ; в регистр eax запишется дескриптор файла
    int 80h

    call _openfile

    mov edx, iamLength ; количество байтов для записи
    mov ecx, iam ; адрес строки для записи в файл
    mov ebx, eax ; дескриптор файла
    mov eax, 4 ; номер системного вызова `sys_write`
    int 80h

    call _closefile
    
    call _openfile

    mov edx, 2 ; значение смещения -- здесь
    mov ecx, 0 ; смещение на 0 байт
    mov ebx, eax ; дескриптор файла
    mov eax, 19 ; номер системного вызова `sys_lseek`
    int 80h

    mov esi, eax
    mov eax, name
    call slen
    mov edi, eax
    mov eax, esi

    mov edx, edi ; Запись куда надо
    mov ecx, name ; строки из переменной `msg`
    mov eax, 4
    int 80h

    call _closefile

_end:
    call quit

_openfile:
    mov ecx, 2 ; режим доступа (0 - только чтение)
    mov ebx, filename ; имя открываемого файла
    mov eax, 5 ; номер системного вызова `sys_open`
    int 80h
    ret

_closefile:
    mov ebx, eax ; дескриптор файла
    mov eax, 6 ; номер системного вызова `sys_close`
    int 80h ; вызов ядра
    ret