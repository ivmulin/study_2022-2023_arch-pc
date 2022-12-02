%include 'in_out.asm'

section .bss
    buf1: resb 80

section .text
    global _start

_start:
    mov eax, 6
    mov ebx, 4

    add eax, ebx
    mov [buf1], eax
    mov eax, buf1
    call sprintLF

    call quit