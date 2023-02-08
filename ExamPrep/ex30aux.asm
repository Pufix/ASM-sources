bits 32

global reverse
segment data use32 class=data
    string times 1000 db 0
segment code use32 class=code
    reverse:
    mov esi, [esp+4]
    mov edi, string
    cld
    mov al,0
    for1:
        movsb
        cmp [edi-1],al
        je outfor1
    jmp for1
    outfor1:
    mov esi,edi
    dec esi
    dec esi
    mov edi,[esp+4]
    for2:
        std
        lodsb
        cld
        stosb
        cmp esi,string-1
        je outfor2
    jmp for2
    outfor2:
    ret 
        
        