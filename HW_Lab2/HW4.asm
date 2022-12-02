bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    ;(d-b*c+b*2)/a
    a db 3
    b db 5
    c db 7
    d dw 11
    ;res=-4
segment code use32 class=code
    start:
        mov Bx,[d]
        mov Ax,word[b]
        imul byte[c] ;Ax=b*c
        sub Bx,Ax ;Bx=d-b*c
        mov Al,[b] 
        cbw
        mov Cl, 2
        imul Cl ;Ax =b*2
        add Bx,Ax ;Ax=(d-b*c+b*2)
        mov Ax,Bx ;Bx=(d-b*c+b*2)
        cwd
        mov Bl,[a] 
        mov Bh,0h ;Bx=a
        idiv Bx ;Ax=(d-b*c+b*2)/a
        cwde ;prettier result
        push dword 0
        call[exit]
        
        
        
        
        
        
        
        
        