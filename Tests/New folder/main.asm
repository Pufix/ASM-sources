bits 32

global start

extern exit
import exit msvcrt.dll

extern scanf
import scanf msvcrt.dll

extern fopen
import fopen msvcrt.dll

extern fprintf
import fprintf msvcrt.dll

extern fclose
import fclose msvcrt.dll

extern fscanf
import fscanf msvcrt.dll

segment data use32 class=data
    specialchr dd 0
    
    n dd 0
    filename db "input.txt",0
    filenameout resb 100
    text resb 1000
    openmoderead db "r",0
    openmodewrite db "w",0
    formatchr db "%c",0
    formatdec db "%d",0
    formatstring db "%s",0
    filepointer dd 0
    filepointerout dd 0
    char db 0
segment code use32 class=code

    start:
        ;read the specialchar
        push specialchr
        push formatchr
        call [scanf]
        add esp,8
        
        ;clear the enter
        push n
        push formatchr
        call [scanf]
        add esp,8
        
        ;read the number of times
        push n
        push formatdec
        call [scanf]
        add esp,8
        
        ;open the in file
        push openmoderead
        push filename
        call [fopen]
        add esp,8
        mov [filepointer],eax
        
        mov edi,text
        mov ebx,0
        for1:
        
            ;read the content of in up to '.'
            push char
            push formatchr
            push dword [filepointer]
            call [fscanf]
            add esp,12
            
            mov al,[char]
            stosb
            cmp al,'.'
            je exitfor1
            
        jmp for1
        exitfor1:
        
        
        ;close input
        push dword [filepointer]
        call [fclose]
        add esp,4
        
        ;clear the enter in the console
        push filenameout
        push formatchr
        call [scanf]
        add esp,8
        
        ;reads the file name
        push filenameout
        push formatstring
        call [scanf]
        add esp,8
        
        ;opens the out file
        push openmodewrite
        push filenameout
        call [fopen]
        add esp,8
        mov [filepointerout],eax
        
        mov esi,text
        for2:
            mov eax,0
            lodsb
            ;goes trought the text one char at a time
            cmp al,'.'
            je exitfor2
            ;exits when it finds the dot
            
            
            cmp al,[specialchr]
            ;if it find a specialchar it prints it multiple times
            jne notspecial
                mov ecx,[n]
                dec ecx
                
                
                for3:
                    push ecx
                    push eax
                    
                    push formatchr
                    push dword [filepointerout]
                    call [fprintf]
                    add esp,8
                    
                    pop eax
                    pop ecx
                loop for3
                
            notspecial:
                ;it goes on printing the rest
                push eax
                    
                push formatchr
                push dword [filepointerout]
                call [fprintf]
                add esp,8
                
                pop eax
                
                
        
        jmp for2
        exitfor2:
        push eax
        
        ;puts the dot at the end
        push formatchr
        push dword [filepointerout]
        call [fprintf]
        add esp,8
        
        pop eax
        
        ;closes the file
        push dword [filepointerout]
        call [fclose]
        add esp,4
        
        
        push dword 0
        call [exit]
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        