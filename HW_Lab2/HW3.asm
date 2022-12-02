bits 32

global start
extern exit 
import exit msvcrt.dll

segment data use32 class=data
    ;(c+d)+(a-b)+a
    a dw 10
    b dw 20
    c dw 40
    d dw 80
segment code use32 class=code
    start:
        mov AX, [c] ;AX=c
        add AX,[d] ;AX+=d
        mov BX, AX ;BX=AX
        mov AX, [a] 
        sub AX,[b] ;AX-=b
        add AX,BX ;AX+=BX
        add AX,[a]
        push dword 0
        call [exit]