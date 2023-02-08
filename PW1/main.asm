bits 32

global start
extern exit, printf, scanf 
import printf msvcrt.dll
import exit msvcrt.dll
import scanf msvcrt.dll

segment data use32 class=data
    numar dd 0 
    afisaj resb 1000
    format db "%x",0
    ;12AC54ED 4311AA99 00A3BC15 FFFFFFFFF
    contor dd 0
    
segment code use32 class=code

    start:
        mov edi,afisaj
        repeta:
            inc dword [contor]
            
            ;citesc numara in hexa
            push numar
            push format
            call [scanf]
            add esp,4*2
            
            ;vad daca ii FFFFFFFFF
            mov eax,[numar]
            cmp eax,-1
            je final
            
            ;aflu byte-u maxim
            mov ecx,3
            mov esi,numar
            lodsb 
            mov bl,al
            repeta2:
                lodsb 
                cmp al,bl
                ja notok
                mov bl,al
                notok:
            loop repeta2
            mov al,bl
            stosb
            ;il stochez in afisaj
            
        jmp repeta
        final:
        mov esi,afisaj
        mov ecx,[contor]
        afisare:
            ;afisez fiecare numar in hexa
            push ecx
            mov eax,0
            lodsb
            push eax
            push format
            call [printf]
            add esp,4*2
            pop ecx
        loop afisare
        finalmare:
        push dword 0
        call [exit]