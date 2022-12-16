%include 'in_out.asm'


section .data
    filename db 'readme.txt', 0h
    msg db 'Введите строку для записи в файл: ', 0h

section .bss
    contents resb 255 ; переменная для вводимой строки

section .text
    global _start

_start:
    mov eax,msg
    call sprint
    
    mov ecx, contents
    mov edx, 255
    call sread

    ; --- Открытие существующего файла (`sys_open`)
    mov ecx, 2 ; открываем для записи (2)
    mov ebx, filename
    mov eax, 5
    int 80h
    mov esi, eax
    
    mov eax, contents
    call slen

    ; --- Записываем в файл `contents` (`sys_write`)
    mov edx, eax
    mov ecx, contents
    mov ebx, esi
    mov eax, 4
    int 80h

    ; --- Закрываем файл (`sys_close`)
    mov ebx, esi
    mov eax, 6
    int 80h
    call quit