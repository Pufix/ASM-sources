;Se citeste de la tastatura un sir de caractere (litere mici si litere mari, cifre, caractere speciale, etc). Sa se formeze un sir nou doar cu literele mici si un sir nou doar cu literele mari. Sa se afiseze cele 2 siruri rezultate pe ecran.
bits 32 

global start
extern exit
import exit msvcrt.dll


segment data use32 class=data
    small times 1000 db 0
    big db 1000 db 0
    index1 dd 0
    index2 dd 0
    chr db 0
    formatchr db "%c",0
    formatstr db "%s",0
segment code use32 class=code

    start:
    for1:
        
    
    
    push dword 0
    call [exit]