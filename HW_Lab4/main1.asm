bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    res1 db 0
    b resd 1 
    a dd 0011_1001_0000_1100_0000_1101_1111_0101b
    c resb 1
segment code use32 class=code
;Given the doubleword A, obtain the integer number n represented on the bits 14-17 of A. Then obtain the doubleword B by rotating A n positions to the left. Finally, obtain the byte C as follows:
;the btis 0-5 of C are the same as the bits 1-6 of B
;the bits 6-7 of C are the same as the bits 17-18 of B
    start:
        mov EAx,[a]
        ror EAx,14
        mov Cl,Al
        and Cl,00001111b
        mov [res1],Cl
        mov EAx,[a]
        rol EAx,Cl
        mov [b],EAx
        ror EAx,1
        mov Dl,0011_1111b
        and Dl,Al
        ror EAx,10
        and Al,1100_0000b
        or  Dl,Al
        mov [c],Dl
        
        
        push dword 0
        call [exit]
        
        
        
        
        
        