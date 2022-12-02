bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    ;(a+d-c)-(b+b)
    a db 5
    b db 10
    c db 20
    d db 30

segment code use32 class=code
    start:
        mov Al, [a]   ;Al=a
        add Al, [d]   ;Al+=b
        sub Al, [c]   ;Al-=c
        mov Bl, [b] ;Bl=b
        add Bl, [b]   ;Bl+=b
        sub Al,Bl   ;Al-=Bl
    
    push dword 0
    call [exit]