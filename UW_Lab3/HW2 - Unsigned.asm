bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    ;c-b-(a+a)-b
    a db 10
    b dw 10
    c dd 100
    ;100 - 10=90 - 20=70 -10=60
segment code use32 class=code
    start:
        mov EAx,dword 0
        mov EBx,[c]
        sub EBx,[b]
        mov Al,[a]
        add Al,[a]
        sub EBx,EAx
        sub EBx,[b]
        ;answer in EBx
        push dword 0
        call [exit]