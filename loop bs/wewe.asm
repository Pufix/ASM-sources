bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    x db 1,2,3,4,5,6,7
    len equ $-x
    z times len dw 0
segment code use32 class=code
    start:
        mov ECx, len
        mov Bl,0
        mov esi,0
        jecxz finish
        repet:
            mov Al,[x+esi]
            cbw
            add Ax,7
            mov [z+esi*2],Ax
            inc esi
        loop repet
        finish:
        push dword 0
        call [exit]
        
        
        
        
        
        