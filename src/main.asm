[org 0x7c00] ; TODO: error handling (read error + write error + ext. not supported error)

    mov bp, 0x9000
    mov sp, bp ; set stack to start at address 9000

    call initScreen ; init stuff
    call initChars

    mov al, 'A' ; write loading thing to screen
    call writeChar

    call read ; read drive data into memory

    o32 xor eax, eax ; zero the a register

loop: ; Fill up hdd with data
    o32 mov [lbaData], eax ; endianness??? could be error

    call write
    jc loopEnd ; Stop when a drive error occurs

    o32 mov eax, [lbaData]
    o32 inc eax
    o32 cmp eax, 0xffffffff ; Keep going until error or max LBA address
    jne loop
    loopEnd:

    mov al, 'B'
    call writeChar

    jmp $ ; halt program

    %include "screen.asm"
    %include "hdd.asm"
    %include "chars.asm"
    
times 510-($-$$) db 0 ; boot sector padding
    dw 0xaa55 ; Magic boot number

driveData:
times 256 db 0xff ; Drive data, which is perfectly balanced
times 256 db 0x00
