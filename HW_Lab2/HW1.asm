bits 32

global start
extern exit 
import exit msvcrt.dll

segment data use32 class=data
    a dw 5




segment code use32 class=code
    ;-2*5
    start:
        mov Ax, -2  ;Ax = -2
        mul word[a]   ; Ax*=a 
        
        
    push dword 0
    call [exit]