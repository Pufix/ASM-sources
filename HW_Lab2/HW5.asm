bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    ;a*d*e/(f-5)
    a db 3
    d db 5
    e dw 5
    f dw 7
    ;3*5 = 15 *5 = 75 / 2 = 37
segment code use32 class=code
    start:
        mov Al,[a] ;Al=a=3
        mul byte[d] ;Ax= Al*d = a*d = 3*5 =15
        mul word[e] ;Dx:Ax = Ax*e  =15*5=75
        mov Bx,[f] ;Bx=f=7
        sub Bx,5 ; Bx=f-5=2
        div Bx 
    push dword 0
    call [exit]