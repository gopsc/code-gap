

cd ../c/stm32/system

type system_init.h  >  ../../../../../flower.c

echo.  >>  ../../../../../flower.c





cd ../head

type variables.h        >>  ../../../../../flower.c
type Kylin_mini_v1.2.h  >>  ../../../../../flower.c

echo.  >>  ../../../../../flower.c






cd ../system

type time.h  >>  ../../../../../flower.c
type gpio.h  >>  ../../../../../flower.c

echo.   >>  ../../../../../flower.c







cd ../resouce



if      "%~1"=="vga"     type vga.c  >>  ../../../../../flower.c



echo.  >>  ../../../../../flower.c

