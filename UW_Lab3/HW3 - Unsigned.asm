bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    ;x+(2-a*b)/(a*3)-a+c
    a db 1
    b dw 1
    c dd 20
    x dq 200
    ;res= 200+0-1+20=219
segment code use32 class=code
    start:
        mov Al,[a]
        mov Ah,byte 0
        mul word[b]
        push Dx
        push Ax
        pop EAx
        mov EBx,2
        sub EBx,EAx ;EBx = (2-a*b)
        mov Al,[a]
        mov Cl,3
        mul Cl
        mov Cx,Ax
        push EBx
        pop Ax
        pop Dx
        div Cx ; Ax=(2-a*b)/(a*3)  Dx remainder
        mov Cx,Ax
        mov EAx,dword 0
        mov Al,[a]
        mov Dx,Ax
        mov Ax,Cx
        sub Ax,Dx ; Ax=(2-a*b)/(a*3)-a
        add EAx,[c];EAx=(2-a*b)/(a*3)-a+c
        mov EDx,dword 0
        add EAx,[x]   
        adc EDx,[x+4] ;EDx:EAx=x+(2-a*b)/(a*3)-a+c
        ;results are in EDx:EAx
        push dword 0
        call [exit]