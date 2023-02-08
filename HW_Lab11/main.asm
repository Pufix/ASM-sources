bits 32

global start
extern exit, printf
extern subprog
extern scanf 
import printf msvcrt.dll
import exit msvcrt.dll
import scanf msvcrt.dll

;%include "second.asm"

segment data use32 class=data
    n dd 0
    format1 db "%d",0
    format2 db "%c",0
    char resb 1
    res resb 300
segment code use32 class=code

    start:
        ;get n
        push n
        push format1
        call [scanf]
        push char
        push format2
        call [scanf]
        add esp, 16
        mov edi,res
        mov ecx, [n]
        
        for1:
            mov ebx, [n]
            sub ebx,ecx
            push ecx
            mov ecx,ebx
            ;reads and overwrites the words before the good space
            for2:
                jecxz afterfor2
                
                push ecx
                push char
                push format2
                call [scanf]
                add esp,8
                pop ecx
                mov bl,[char]
                cmp bl, ' '
                jne notspace
                    dec ecx
                notspace:
            jmp for2
            afterfor2:
            
            ;save the good words
            ;edi must already be set to the destination before calling the function, along side the direction flag
            push format2 ;1 parameter of type string
            call subprog
            add esp,4 ;the parameter is cleaned in main
            
            ;dumps the rest of the words
            for4:
                push ecx
                push char
                push format2
                call [scanf]
                add esp,8
                pop ecx
                mov al,[char]
                cmp al,10
                
                je afterfor4
                
            jmp for4
            afterfor4:
            pop ecx
            
            
        loop for1
        
        ;printing the fully formed array
        mov al,0
        stosb
        push res
        call [printf]
        add esp,4
    end:
        push dword 0
        call [exit]