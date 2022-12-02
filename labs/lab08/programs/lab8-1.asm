%include 'in_out.asm'
section .data
msg1: db 'Сообщение No 1', 0
msg2: db 'Сообщение No 2', 0
msg3: db 'Сообщение No 3', 0

section .text
global _start

_start:
    jmp _label2

_label1:
    mov eax, msg1
    call sprintLF
    jmp _end

_label2:
    mov eax, msg2
    call sprintLF
    jmp _label1

_label3:
    mov eax, msg3
    call sprintLF

_end:
    call quit