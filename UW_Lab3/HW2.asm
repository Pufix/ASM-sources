bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
;c-b-(a+a)-b
    a db 10
    b dw 10
    c dd 100

segment code use32 class=code
    start:
        mov EBx,[c]
        sub EBx,[b]
        mov Al,[a]
        cbw
        add Ax,[a]
        cwde
        sub EBx,EAx
        sub EBx,[b]
        
        push dword 0
        call [exit]