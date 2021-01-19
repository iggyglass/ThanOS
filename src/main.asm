[org 0x7c00] ; TODO: ext. not supported error

    mov bp, 0x9000
    mov sp, bp ; set stack to start at address 9000

    call initScreen ; init stuff
    call initChars

    call read ; read drive data into memory
    jc error

    mov al, 'a' ; write loading thing to screen
    call writeCenterChar

    o32 xor eax, eax ; zero the a register

loop: ; Fill up hdd with data
    o32 mov [lbaData], eax

    call write
    jnc continue ; Stop when a drive error occurs
    call errorCheck ; check if out of space or drive error
    jmp loopEnd

    continue:
    o32 mov eax, [lbaData]
    o32 inc eax
    o32 cmp eax, 0xffffffff ; Keep going until drive full or max LBA address
    jne loop
    loopEnd:

    mov al, 'b' ; write finished character to screen
    call writeCenterChar

pgrmEnd: 
    call readExpandedKey
    cmp ax, 0x3f00 ; F5 is 0x3f00 -- check if it was pressed
    je reboot ; if so, reboot

    jmp pgrmEnd

reboot: ; stackoverflow magic (https://stackoverflow.com/questions/32682152/how-to-reboot-in-x86-assembly-from-16-bit-real-mode)
    db 0xea
    dw 0x0000
    dw 0xffff

    %include "kbd.asm"
    %include "error.asm"
    %include "screen.asm"
    %include "hdd.asm"
    %include "chars.asm"
    
times 510-($-$$) db 0 ; boot sector padding
    dw 0xaa55 ; Magic boot number

driveData:
times 256 db 0xff ; Drive data, which is perfectly balanced
times 256 db 0x00
