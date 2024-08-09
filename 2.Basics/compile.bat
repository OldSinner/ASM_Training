@echo off
set name="calculator"
nasm -f win32 %name%.asm
echo "--------------------------ASM--------------------------------"

gcc -o %name% %name%.obj driver.c asm_io.obj
echo "---------------------------C---------------------------------"
echo ""

 .\%name%.exe
del %name%.obj
del %name%.exe
