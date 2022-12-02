bits 32

global start
extern exit, fopen, fclose, fprintf
import exit msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import fprintf msvcrt.dll

segment data use32 class=data
    text db "(DEFINED in THE data SEGMENT) 2012",0
    len equ $-text
    filename db "ceapa.txt",0
    accesmode db "w",0
    
segment code use32 class=code

    start:
        mov ecx, len
        mov esi, text
        mov edi, text
        jecxz end
        while1:
            lodsb
            cmp al, 'A'
            jb notbigletter
            cmp al, 'Z'
            ja notbigletter
            add al, 'a'-'A'
            notbigletter:
            stosb
        loop while1
        push accesmode
        push filename
        call [fopen]
        add esp, 8
        mov ebx,eax
        cmp eax, 0
        je end
        push text
        push ebx
        call [fprintf]
        add esp,4
        push ebx
        call [fclose]
        add esp,4
    end:
        push dword 0
        call [exit]
        
        
        
        
        
        
        
        