

rx-elf-gcc -Wall -I"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/include" -I. -I"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/lib/gcc/rx-elf/4.8-GNURX_v14.03/include" -I"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/include/c++/4.8-GNURX_v14.03/" -I"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/include/c++/4.8-GNURX_v14.03/rx-elf/64-bit-double/" -ffunction-sections -fno-function-cse -fsigned-char -fdata-sections -mno-balign -DTESTING=1 -DGRCITRUS -DARDUINO=100 -DCPPAPP -D__RX_LITTLE_ENDIAN__=1 -D__T4__ -O2 -flto -mlittle-endian-data -mcpu=rx600 -m64bit-doubles -I./gr_build -I./gr_common -I./gr_common/core -I./gr_common/core/avr -I./gr_common/lib -I./gr_common/lib/DSP -I./gr_common/lib/DSP/utility -I./gr_common/lib/EEPROM -I./gr_common/lib/EEPROM/utility -I./gr_common/lib/Firmata -I./gr_common/lib/LiquidCrystal -I./gr_common/lib/MsTimer2 -I./gr_common/lib/RTC -I./gr_common/lib/RTC/utility -I./gr_common/lib/SD -I./gr_common/lib/SD/utility -I./gr_common/lib/Servo -I./gr_com

mon/lib/SoftwareSerial -I./gr_common/lib/SPI -I./gr_common/lib/Stepper -I./gr_common/lib/Wire -I./gr_common/lib/Wire/utility -I./gr_common/rx63n -I./USB_Driver -c -x c++ gr_sketch.cpp -o gr_sketch.o

rx-elf-ld -Map ./gr_build/citrus_sketch.map -e_PowerON_Reset -T"./gr_common/linker_arduino.gsi" -no-keep-memory -S ./gr_sketch.o ./gr_build/interrupt_handlers.o ./gr_build/vector_table.o ./gr_common/gr_common.a ./gr_common/lib/DSP/utility/libGNU_RX_DSP_Little.a -L"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double" -L"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/lib/gcc/rx-elf/4.8-GNURX_v14.03/64-bit-double" -L"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double" -L"C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/lib/gcc/rx-elf/4.8-GNURX_v14.03/64-bit-double" --no-flag-mismatch-warnings --start-group -lstdc++ -lnosys -lsim -lm -lc -lgcc --end-group -o ./gr_build/citrus_sketch.x



C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-closer.o): In function `_close_r':
closer.c:(.text._close_r+0x10): warning: _close is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-fstatr.o): In function `_fstat_r':
fstatr.c:(.text._fstat_r+0x12): warning: _fstat is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-signalr.o): In function `_getpid_r':
signalr.c:(.text._getpid_r+0x1): warning: _getpid is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-isattyr.o): In function `_isatty_r':
isattyr.c:(.text._isatty_r+0x10): warning: _isatty is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-signalr.o): In function `_kill_r':
signalr.c:(.text._kill_r+0x12): warning: _kill is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-lseekr.o): In function `_lseek_r':
lseekr.c:(.text._lseek_r+0x14): warning: _lseek is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-readr.o): In function `_read_r':
readr.c:(.text._read_r+0x14): warning: _read is not implemented and will always fail

C:/Renesas/e2studio/GNURXv14.03-ELF/rx-elf/rx-elf/rx-elf/lib/64-bit-double/libc.a(lib_a-writer.o): In function `_write_r':
writer.c:(.text._write_r+0x14): warning: _write is not implemented and will always fail



rx-elf-objcopy -O binary ./gr_build/citrus_sketch.x citrus_sketch.bin

rm -f ./gr_sketch.o

rx-elf-objcopy -O binary ./gr_build/citrus_sketch.x citrus_sketch.bin

rx-elf-size ./gr_build/citrus_sketch.x



text data bss dec hex filename

34975 2352 13628 50955 c70b ./gr_build/citrus_sketch.x

Make process completed

