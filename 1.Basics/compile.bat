@echo off
nasm -f win32 calculator.asm
gcc -o calculator calculator.obj driver.c asm_io.obj
echo "--------------------------------------------------------------"
.\calculator.exe
del calculator.obj
del calculator.exe
