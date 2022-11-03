section .data ; Начало секции данных
    line: DB 'Мулина Ивана работа',10 ; строка и символ перевода строки
    lineLength: EQU $-line ; Длина строки line

section .text ; Начало секции кода
    global _start

_start: ; Точка входа в программу
    mov eax, 4 ; Системный вызов для записи (sys_write)
    mov ebx, 1 ; Описатель файла '1' - стандартный вывод
    mov ecx, line ; Адрес строки line в ecx
    mov edx, lineLength ; Размер строки line
    int 80h ; Вызов ядра
    mov eax, 1 ; Системный вызов для выхода (sys_exit)
    mov ebx, 0 ; Выход с кодом возврата '0' (без ошибок)
    int 80h ; Вызов ядра