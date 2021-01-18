@echo off
"C:\Program Files\qemu\qemu-system-x86_64" bin/boot.bin -drive id=disk,format=raw,file=test/drive.img
