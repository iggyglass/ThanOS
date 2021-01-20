; Check if actual drive error, or end of drive
errorCheck:
    cmp ah, 0x01 ; 0x01 means we have hit the end of the drive
    jne error
    ret

; Issue an error message from the error code in ah
error:
    mov al, ah
    call writeHex
    jmp pgrmEnd ; go to end after reporting error
