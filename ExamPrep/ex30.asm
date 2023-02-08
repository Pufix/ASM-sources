;Se citeste o propozitie de la tastatura. Sa se inverseze fiecare cuvant si sa se afiseze pe ecran.
bits 32

global start
extern exit, scanf, printf
import exit msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll
extern reverse


segment data use32 class=data
    propozitie times 1000 db 0
    formatstr db "%s",0
    
    
    
    
    
    
    
segment code use32 class=code
    start:
    push propozitie
    push formatstr
    call [scanf]
    add esp,8
    
    push propozitie
    call reverse
    add esp,4
    
    push propozitie
    push formatstr
    call [printf]
    add esp,8
    
    
    push dword 0
    call [exit]