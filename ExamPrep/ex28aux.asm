bits 32

global start

extern exit
import exit msvcrt.dll

extern scanf
import scanf msvcrt.dll

extern printf
import printf msvcrt.dll

segment data use32 class=data
    result times 1000 db 0
    n dd 0
    array times 1000 dd 0
    formatdec db "%d",0
    nr dd 0
    sum db 0
segment code use32 class=code
    
    start:
    
    push n
    push formatdec
    call [scanf]
    add esp,8
    
    mov ecx,[n]
    mov edi,array
    for1:
        push ecx
        
        push nr
        push formatdec
        call [scanf]
        add esp,8
        mov eax,[nr]
        stosd
        
        pop ecx
    loop for1
    
    
    mov ecx,[n]
    mov esi,array
    mov edi,result
    mov bx, 10
    for2:
        mov [sum],byte 0
        lodsd
        push eax
        pop ax
        pop dx
        while1:
            mov dx,0
            cmp ax,0
            je afterwhile1
            div bx
            cmp dl, 1
            je odd
            cmp dl, 3
            je odd
            cmp dl, 7
            je odd
            cmp dl, 5
            je odd
            cmp dl, 9
            je odd
            add [sum],dl
            odd:
        jmp while1
        afterwhile1:
        mov al,[sum]
        stosb
    loop for2
    push dword 0
    call [exit]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    