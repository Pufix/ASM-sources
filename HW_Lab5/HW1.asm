bits 32

global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    s db 1,5,3,8,2,9
    l equ $-s
    d1 resb l
    d2 resb l
    cont1 dd 0
    cont2 dd 0
segment code use32 class=code
    start:
        mov ECx,l
        mov esi,0
        mov Bl,0
        mov Bh,0
        jecxz finnish
        while:
            mov Al,[s+esi]
            cbw
            mov Bl,2
            idiv Bl
            cmp Ah,byte 1
            mov Al,[s+esi]
            jl even
            jae odd
            even:
                push esi
                mov esi,[cont1]
                mov [d1+esi],Al
                inc esi
                mov [cont1],esi
                pop esi
                jmp afterop
            odd:
                push esi
                mov esi,[cont2]
                mov [d2+esi],Al
                inc esi
                mov [cont2],esi
                pop esi
            afterop:
            inc esi
        loop while
    finnish:
        push dword 0
        call [exit]
    