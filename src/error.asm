errorCheck:
    cmp ah, 0x01 ; 0x01 means we have hit the end of the drive
    jne error
    ret

error:
    mov al, ah
    call writeHex
    jmp pgrmEnd ; go to end after reporting error
