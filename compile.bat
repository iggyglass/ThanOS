@echo off
cls
cd src\
"C:\Program Files\NASM\nasm" main.asm -f bin -o ..\bin\boot.bin
cd images\
python compile.py
cd ..\..\test\
python imgGen.py
cd ..
