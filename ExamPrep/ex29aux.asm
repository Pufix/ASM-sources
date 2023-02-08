bits 32

global count
segment data use32 class=data

segment code use32 class=code
    count:
    mov esi, [esp+4]
    mov ebx,0
    for1:
        lodsb
        cmp al, 0
        je end
        cmp al, 10
        je end
        cmp al, 20h
        je end
        inc ebx
    jmp for1
    end:
    mov eax,ebx
    ret