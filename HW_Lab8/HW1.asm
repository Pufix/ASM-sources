bits 32 

global start 
extern exit, printf, scanf
import exit msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll

segment data use32 class=data
    a resd 1
    b resd 1
    format db "%x", 0
    formatdeca db "%d", 0

segment code use32 class=code
    start:
        push a
        push format
        call [scanf] 
        add esp ,8
        
        push b
        push format
        call [scanf]
        add esp ,8
        
        mov eax, [a]
        add eax,[b]
        
        push eax
        push formatdeca
        call [printf]
        add esp, 8
        push dword 0
        call [exit]
