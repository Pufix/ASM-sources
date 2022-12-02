bits 32

extern exit,printf
global start
import exit msvcrt.dll
import printf msvcrt.dll

segment data use32 class=data
    nbrdigit equ 9
    list times 100 db -1
    format db "%d",0
    entr db 10,0
segment code use32 class=code

    start:
        mov ecx,1
        mov esi,list
        mov [list],byte 0
        jecxz finnish
        for1:
            mov al,[esi]
            inc al
            mov [esi],al
            cmp al,10
            jae left
                cmp ecx,nbrdigit
                jne neq
                    push ecx
                    mov ecx, nbrdigit
                    push esi
                    mov esi,list
                    afis:
                        mov eax,0
                        lodsb
                        push ecx
                        push eax
                        push format
                        call [printf]
                        add esp,8
                        pop ecx
                    loop afis
                    push entr
                    call [printf]
                    add esp,4
                    pop esi
                    pop ecx
                    jmp afterleft
                neq:
                    inc ecx
                    lodsb
                    
                    jmp afterleft
            left:
                mov [esi],byte -1
                dec esi
                dec ecx
            afterleft:
            cmp ecx,dword 0
            inc ecx
        loopne for1
    finnish:
        push dword 0 
        call [exit]