

,,

#include <spi.h>


( this library provides spi communications, enabling communications with two or more microcontrollers, with the gr-citrus board as the master device )






,, spi settings

( each spi device can be configured once as an SPISettings object )


SPISettings mySetting ( speed, dataorder, datamode );


speed :  ( the speed of the communication )

dataorder :  MSBFIRST or LSBFIRST

datamode :  SPI_MODE0, SPI_MODE1, SPI_MODE2 or SPI_MODE3


none returns






,, begin

( initializes the spi bus by setting sck, mosi and ss to output, pulling sck and mosi low, and ss high )


SPI . begin ();


none returns






,, end

( disbles the spi bus, and returns the pin to a general i/o port )


SPI . end ();


none returns






,, begin transaction

( initializes the spi bus using the define SPISettings )


SPI . beginTransaction ( mySettings );


mySettings :  ( the chosen settings according to SPISettings )


none returns






,, end transaction

( stop using the spi bus )

( normally, this is called after de-asserting the chip select, to allow other library to use the spi bus )


SPI . endTransaction ();


none returns






,, set bit order

( set the order of the bits shift out of and into the spi bus )


SPI . setBitOrder ( bitOrder );


bitOrder :  LSBFIRST or MSBFIRST ( default is MSBFIRST )


none returns






,, set clock divider

( set the spi clock divider relative to the system clock )


SPI . setClockDivider ( divider );


divider :  SPI_CLOCK_DIV2 ( twenty-four million hertz ), SPI_CLOCK_DIV4 ( twelve million hertz ), SPI_CLOCK_DIV8 ( six million hertz ), SPI_CLOCK_DIV16 ( three million hertz, default ), SPI_CLOCK_DIV32 ( one point five million hertz ), SPI_CLOCK_DIV64 ( seven hundreds and fifty thousands hertz ), SPI_CLOCK_DIV128 ( three hundreds and seventy-five thousands hertz )


none returns






,, set data mode

( sets the spi data mode : the clock polarity and phase )


SPI . setDataMode ( mode );


mode :  SPI_MODE0 ( clock is low during idling, samples data at rising edge, default ), SPI_MODE1 ( clock is low during idling, samples data at falling edge ), SPI_MODE2 ( clock is high during idling, samples data at rising edge ), SPI_MODE3 ( clock is high during idling, samples data at falling edge )


none returns






,, transfer

( transfers one byte over the spi bus, both sending and receiving )


SPI . transfer ( value );


value :  ( a byte of data )


returns the byte read from the bus






,

