bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    ;x+(2-a*b)/(a*3)-a+c
    a db 20
    b dw 20
    c dd 20
    x dq 200
    ;res= 193
segment code use32 class=code
    start:
        mov Al,[a]
        cbw
        imul word[b]
        push Dx
        push Ax
        pop EAx
        mov EBx,2
        sub EBx,EAx ;EBx = (2-a*b)
        mov Al,[a]
        mov Cl,3
        imul Cl
        mov Cx,Ax
        push EBx
        pop Ax
        pop Dx
        idiv Cx ; Ax=(2-a*b)/(a*3)  Dx remainder
        mov Cx,Ax
        mov Al,[a]
        cbw
        mov Dx,Ax
        mov Ax,Cx
        sub Ax,Dx ; Ax=(2-a*b)/(a*3)-a
        cwde
        add EAx,[c];EAx=(2-a*b)/(a*3)-a+c
        
        
        
        
        cdq  ;EDx:EAx=(2-a*b)/(a*3)-a+c
        add EAx,[x]   
        adc EDx,[x+4] ;EDx:EAx=x+(2-a*b)/(a*3)-a+c
        ;results are in EDx:EAx
        push dword 0
        call [exit]