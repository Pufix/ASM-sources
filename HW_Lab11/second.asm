bits 32

global subprog
extern exit, printf, scanf
import exit msvcrt.dll
import printf msvcrt.dll
import scanf msvcrt.dll


segment data use32 class=data
    chr dd 0


segment code use32 class=code
    subprog:
        ;puts the good word in edi
        for3:
            mov edx,[esp+4]
            push ecx
            
            
            push chr
            push edx
            call [scanf]
            add esp,8
            pop ecx
            mov al,[chr]
            stosb
            cmp al,' '
            je afterfor3
            cmp al,'.'
            je afterfor3
            cmp al,10
            je afterfor3
        jmp for3
        afterfor3:
        ret
        
        
        
        