;Se citeste o propozitie de la tastatura. Sa se numere literele din fiecare cuvant si sa se afiseze aceste numere pe ecran.
bits 32

global start

extern exit
import exit msvcrt.dll

extern count

extern scanf
import scanf msvcrt.dll

extern printf
import printf msvcrt.dll

segment data use32 class=data
    string times 1000 db 0
    formatstr db "%s",0
    formatchr db "%c",0
    formatnr db "%d",0
    chr db 0
    done db 0
    numbers times 100 dd 0
    counter dd 0
    
segment code use32 class=code
    start:
    for1:
        mov edi, string
        for2:
            push chr
            push formatchr
            call [scanf]
            add esp,8
            
            mov al,[chr]
            stosb 
            
            cmp [edi-1],byte 10
            jne notend
            mov [done],byte 1
            jmp endfor2
            notend:
            cmp [edi-1],byte ' '
            je endfor2
        jmp for2
        endfor2:
        mov [edi],byte 0
        
        
        push string
        call count
        add esp,4
        mov ebx, [counter]
        mov [numbers+ebx*4],eax
        inc dword [counter]
        
        cmp [done],byte 1
        je finish
    jmp for1
    finish:
    mov ecx,[counter]
    mov esi,numbers
    for3:
        pusha
        push dword[esi]
        push formatnr
        call [printf]
        add esp,8
        popa
        add esi, 4
    loop for3
    push dword 0
    call [exit]
    
    