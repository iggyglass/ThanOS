 ; reads an expanded keycode (eg. f5, ctrl, etc) of keypress (blocking)
readExpandedKey:
    mov ah, 0x10 ; Read key
    int 0x16
    ret ; key is in ax
