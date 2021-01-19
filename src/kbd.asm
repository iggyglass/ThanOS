readExpandedKey:
    mov ah, 0x10 ; Read key
    int 0x16
    mov al, ah
    ret ; key is in al