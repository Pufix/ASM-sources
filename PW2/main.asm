bits 32

global start
extern exit, fopen, scanf, fclose, fprintf
import exit msvcrt.dll
import scanf msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import fprintf msvcrt.dll

segment data use32 class=data
    n db 0
    format db "%d",0
    valoare dd 0
    caracter db 0
    formatchr db "%c",0
    extra db 0
    negativ db 1
    numar resb 100
    fisier dd 0
    numefisier db "numere2.txt",0
    modfisier db "w",0
    formatstring db "%s",0
    
segment code use32 class=code

    start:
        
        push modfisier
        push numefisier
        call [fopen]
        add esp, 4*2
        mov [fisier],eax
        
        
        push n
        push formatchr
        call [scanf]
        add esp, 4*2
        
        push caracter
        push formatchr
        call [scanf]
        add esp, 4*2
        
        repeta:
            push caracter
            push formatchr
            call [scanf]
            add esp, 4*2
            
            mov al, [caracter]
            
            cmp al, '$'
            je nunumar
            
            mov edi, numar
            
            cmp al, '-'
            mov [negativ], byte -1
            je pozitiv
            stosb
            
            push caracter
            push formatchr
            call [scanf]
            add esp, 4*2
            mov al,[caracter]
            
            pozitiv:
            mov [negativ], byte 1
            postpozitiv:
            
            
            stosb
            
            repeta2:
            
                push caracter
                push formatchr
                call [scanf]
                add esp, 4*2
                mov al,[caracter]
                
                
                cmp al,' '
                je gatanr
                
                stosb
                
            
            jmp repeta2
            gatanr:
            mov al, ' '
            stosb
            mov al, 0
            stosb
            
            mov al,[edi-3]
            
            cmp al,'1'
            je notok
            cmp al,'3'
            je notok
            cmp al,'5'
            je notok
            cmp al,'7'
            je notok
            cmp al,'9'
            je notok
            
            mov al, [edi-4]
            
            cmp al,[n]
            jne notok
            
            push numar
            push formatstring
            push dword [fisier]
            call [fprintf]
            add esp,4*3
            
            notok:
        jmp repeta
        nunumar:
        
        push dword [fisier]
        call [fclose]
        add esp,4
        push dword 0
        call [exit]