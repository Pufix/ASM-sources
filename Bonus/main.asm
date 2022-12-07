bits 32

global start
extern exit, fread, printf, fopen, fclose
import exit msvcrt.dll
import fread msvcrt.dll
import printf msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll

segment data use32 class=data
    filename db "file.txt",0
    format db "%o",0
    formatread db "r",0
    len db 0
    array resb 500
    temp db 0
    space db " ",0
    result resb 100
    len2 db 0
    
segment code use32 class=code
    start:
        push formatread
        push filename
        call [fopen]
        add esp,8
        mov ebx,eax
        
        push ebx
        push dword 1
        push dword 1
        push len
        call [fread]
        add esp, 16
        
        
        push ebx
        push dword [len]
        push dword 1
        push array
        call [fread]
        add esp, 16
        
        mov esi, array+1
        mov edi, result
        mov ecx,0
        mov cl,[len]
        sub ecx,48
        jecxz end
        mov bl,0
        loop1:
            lodsb
            cmp al,32
            je spacee
            sub al,48
            mov dl,bl
            times 9 add bl,dl
            add bl,al
            jmp notspace
            spacee:
            mov al,bl
            stosb 
            dec ecx
            mov bl,0
            notspace:
            inc ecx
        loop loop1
        mov esi, result
        mov ecx,0
        mov cl,[len]
        sub cl,48
        loop2:
            lodsb
            cbw
            cwde
            push ecx
            push eax
            push format
            call [printf]
            push space
            call [printf]
            add esp,12
            pop ecx
        loop loop2
    end:
        push dword 0
        call [exit]

        
        
        
        
        
        
        
        
        
        
