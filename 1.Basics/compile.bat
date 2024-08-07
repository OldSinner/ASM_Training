@echo off
set name="calculator"
nasm -f win32 %name%.asm
gcc -o %name% %name%.obj driver.c asm_io.obj
echo "--------------------------------------------------------------"
echo ""

.\%name%.exe
del %name%.obj
del %name%.exe
