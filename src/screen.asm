; Screen size is 80x25 characters

initScreen:
    mov ax, 0x0003 ; Clear screen
    int 0x10

    mov bl, 0x05 ; purple
    mov bh, 0x00
    mov ah, 0x0b ; set BG color
    int 0x10

    mov cx, 0x2607 ; set cursor to be invisible
    mov ah, 0x01
    int 0x10

    ret

writeChar: ; char to print is assumed to be in al
    mov dh, 12 ; Center char
    mov dl, 40
    mov bh, 0
    mov ah, 0x02
    int 0x10
    
    mov bl, 0x0e ; yellow
    mov cx, 0x0001
    mov ah, 0x09
    int 0x10 ; print char

    ret
