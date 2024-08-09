@echo off
set name="fibonacci"
nasm -f win32  %name%.asm || goto :error
echo "--------------------------ASM--------------------------------"

gcc -o %name% %name%.obj driver.c asm_io.obj || goto :error
echo "---------------------------C---------------------------------"

cls
echo "Starting program..."
 .\%name%.exe || goto :error
del %name%.obj
del %name%.exe
exit /b %errorlevel%

:error
del %name%.obj
del %name%.exe

exit /b %errorlevel%
