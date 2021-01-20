; Reads data from drive into memory
read:
    mov si, drivePacket
    mov ah, 0x42 ; read command (in BIOS ext.)    
    mov dl, 0x80 ; Set drive letter (C:)
    int 0x13 ; do the thing
    ret

; Writes data to drive
write:
    mov si, drivePacket
    mov ah, 0x43 ; write command (in BIOS ext.)
    mov dl, 0x81 ; Set drive letter (D:)
    int 0x13 ; do the thing
    ret

; Checks if the bios extension methods are supported
extSupported:
    mov ah, 0x14
    mov bx, 0x55aa
    mov dl, 0x80
    int 0x13
    mov ah, 0x15 ; Ext. not supported error code
    ret

; A structure in which a LBA packet is stored
drivePacket:
    db 0x10 ; Size of packet
    db 0 ; always 0
blkCount:
    dw 1 ; number of sectors to transfer
transBuff:
    dw driveData ; memory buffer address
    dw 0 ; memory page
lbaData:
    dd 1 ; The actual lba address
    dd 0
