bits 32 

global start
extern exit 
import exit msvcrt.dll

segment data use32 class=data
    a1 dw '2','5','6'
    a2 dw 256,256h
    ;a3 dw $+a2
    a9 dd $-a9-1
    a9 db "ceapa"
    
segment code use32 class=code
start:
    mov ah, 128|2
    mov bh, 90h >> 3
    sub ah,bh

    push dword 0
    call [exit]