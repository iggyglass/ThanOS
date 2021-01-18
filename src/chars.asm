initChars:
    push ds
    pop es ; set es to ds
    mov bp, font

    mov cx, 2 ; only changing 2 chars
    mov dx, 'A' ; starting at A

    mov bh, 14 ; 14 bytes per char
    xor bl, bl ; set bl to 0
    
    mov ax, 0x1100 ; change font
    int 0x10 ; issue interrupt

    ret

font:
    %include "images/asm/A.asm"
    %include "images/asm/B.asm"