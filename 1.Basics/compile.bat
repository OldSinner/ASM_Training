nasm -f coff calculator.asm

gcc -o calculator calculator.o driver.c asm_io.o
del *.o