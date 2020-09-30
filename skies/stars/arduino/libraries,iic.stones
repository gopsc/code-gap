

,,

#include <Wire.h>


( this is an iic communication library that facilitates two-wire class communications, also called "wire library" )

( the pull-up to communication lines is needed )

( on renesas gatget citrus, there is a total of five channels available )

( you cannot use a slave device )


( wire pins on renesas gadget citrus )

Wire :  19 ( scl ),  18 ( sda )  ( software iic )

Wire1 :  1 ( scl ),  0 ( sda )

Wire2 :  6 ( scl ),  5 ( sda )

Wire3 :  8 ( scl ),  7 ( sda )

Wire4 :  11 ( scl ),  12 ( sda )






,, begin


Wire . begin ( address );


address :  ( specified a 7-bit address when operating as a slave, it is not necessary during master operation )


none returns






,, request from

( used by the master to request bytes from a slave device )

( the bytes may then be retrieved with the available() and read() functions )


wire . requestFrom ( address, quantity );

wire . requestFrom ( address, quantity, stop );


address :  ( the 7-bit address of the device from which to request bytes )

quantity :  ( the number of bytes to request )

stop :  ( boolean )

( true will send a stop message after the request, releasing the bus )

( false will continually send a restart after the request, keeping the connection active )


return :  byte ( the number of bytes returned from the slave device )






,, begin transmission

( begin a transmission to the iic slave device with the given address )

( subsequently, queue bytes for transmission with the write() function and transmit them by calling endTransmission() )


Wire . beginTransmission ( address );


address :  ( the 7-bit address of the device which to transmit )


none returns






,, end transmission

( ends a transmission to a slave device that was begun by beginTransmission() and transmits the bytes that were queued by write() )


unsigned char Wire . endTransmission ();


return :  0 ( success ),  1 ( data too long to fit in transmit buffer ),  2 ( received nack on transmit of address ),  3 ( received nack on transmit of data ),  4 ( other error )






,, write

( adds a character string or data to the end of the transmit buffer )


Wire . write ( value );

Wire . write ( string );

Wire . write ( data, length );


value :  ( a value to send as a single byte )

string :  ( a string to send as a series of bytes )

data :  ( an array of data to send as bytes )

length :  ( the number of bytes to transmit )


return :  byte ( return the number of bytes written, though reading that number is optional )






,, available

( returns the number of bytes available for retrieval in the receive buffer )


Wire . available ();


rerturn :  ( the number of bytes available for reading )






,, read

( read one byte of data from the recive bubffer )


Wire . read ();


return :  the next byte received






,

