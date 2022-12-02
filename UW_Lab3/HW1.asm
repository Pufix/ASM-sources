bits 32 
global start   
extern exit               
import exit msvcrt.dll    
segment data use32 class=data
    ;(a+d)-(c-b)+c
    a db 5
    b dw 10
    c dd 20
    d dq 50
segment code use32 class=code
    start:
        mov Al,[a]
        cbw
        cwde
        mov EDx,0h
        add EAx,[d]
        adc EDx,[d+4]
        ; EDx:EAx = (a+d)
        mov ECx,EDx
        mov EBx,EAx
        
        mov EAx,[c]
        sub EAx,[b]
        sub EBx,EAx
        add EBx,[c]
        adc ECx,0
        
        
        push dword 0
        call [exit]
