bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data

segment code use32 class=code

    start:
        mov ax,-1
        mov bh,1
        idiv bh
        push dword 0
        call [exit]