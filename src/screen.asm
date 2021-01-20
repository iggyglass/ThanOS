; Screen size is 80x25 characters

; Initialize the screen
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

; Converts al to two ascii chars corresponding to the hexadecimal
asciiByte:
    push ax ; get the low nybble
    and al, 0x0f
    call asciiNybble

    mov bl, al ; get the high nybble
    pop ax
    and al, 0xf0
    shr al, 4
    call asciiNybble

    mov ah, al ; move nybble chars into ax
    mov al, bl

    ret

; Converts the lower nybble in al to an ascii character in hex
asciiNybble:
    and al, 0x0f
    cmp al, 0x09
    jle lowNybble
    add al, ('A' - 0x0a) ; Nybble is between a and f
    ret
lowNybble: ; Nybble is between 0 and 9
    add al, '0'
    ret

; Write the byte in al to screen
writeHex:
    call asciiByte

    push ax ; print high nybble
    mov al, ah
    call writeCenterChar

    mov dl, 41 ; move cursor to the right and print low nybble
    pop ax
    call writeChar

    ret

; Write a character to the center of the screen
writeCenterChar:
    mov dh, 12 ; Center char
    mov dl, 40
    call writeChar
    ret

; Write a character at y=dh and x=dl
writeChar: ; char to print is assumed to be in al
    mov bh, 0
    mov ah, 0x02
    int 0x10
    
    mov bl, 0x0e ; yellow
    mov cx, 0x0001
    mov ah, 0x09
    int 0x10 ; print char

    ret
