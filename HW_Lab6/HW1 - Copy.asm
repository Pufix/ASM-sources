bits 32

extern exit, printf
global start
import exit msvcrt.dll
import printf msvcrt.dll

segment data use32 class=data
;Given an array S of doublewords, build the array of bytes D formed from bytes of doublewords sorted as unsigned numbers in ascending order
    s DD 12345607h, 1A2B3C15h, 172AFCDAh
    len equ $-s
    d resb len
    aux db 1
    format db "%d ,",0
    entr db 10,0
    msg db "after sorting:"
    
segment code use32 class=code
    start:
        mov ecx, len
        mov esi,s
        for4:
            mov eax,0
            lodsb
            push eax
            mov ebx,ecx
            push dword format
            call [printf]
            add esp, 4*2
            mov ecx,ebx
        loop for4
        push dword entr
        call [printf]
        push dword msg
        call [printf]
        push dword entr
        call [printf]
        add esp, 4*3
        
        mov ecx,len-1
        mov esi,s
        mov edi,d
        jecxz fin
        for1:
            mov ebx,esi
            lodsb
            push ecx
            for2:
                cmp al,[esi]
                jbe postswap
                    mov dl,[ebx]
                    mov al,[esi]
                    mov [esi],dl
                    mov [ebx],al
                postswap:
                inc esi
            loop for2
            pop ecx
            stosb
            mov esi,ebx
            inc esi
        loop for1
        movsb 
    fin:
        mov ecx, len
        mov esi,d
        for3:
            lodsb
            cbw
            cwde
            push ecx
            push eax
            push dword format
            call [printf]
            add esp,4*2
            pop ecx
        loop for3
        push dword 0
        call [exit]