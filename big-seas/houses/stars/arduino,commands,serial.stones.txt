

,, channels

( serial channels on gr-citrus )

serial :  usb communication

serial1 :  1 ( rx ),  0 ( tx )

serial2 :  6 ( rx ),  5 ( tx )

serial3 :  8 ( rx ),  7 ( tx )

serial4 :  11 ( rx ),  12 ( tx )






,, begin

( sets the data rate in bits per second, baud for serial data transmission )

( an optional second argument configures the data, parity and stop bits )

Serial . begin ( unsigned long speed, config );


speed :  ( in bits per second, baud approx. ) 1200 to 3000000 hertz

config ( optional ) :  ( sets data, parity and stop bits ) SERIAL_5N1,  SERIAL_6N1,  SERIAl_7N1,  SERIAL_8N1 ( default ),  SERIAL_5N2,  SERIAL_6N2,  SERIAL_7N2,  SERIAL_8N2,  SERIAL_5E1,  SERIAL_6E1,  SERIAL_7E1,  SERIAL_8E1,  SERIAL_5E2,  SERIAL_6E2,  SERIAL_7E2,  SERIAL_8E2,  SERIAL_5O1,  SERIAL_6O1,  SERIAL_7O1,  SERIAL_8O1,  SERIAL_5O2,  SERIAL_6O2,  SERIAL_7O2,  SERIAL_8O2


none returns


notes its margin of error depends on seetting baud rate

( about general baud rates, 4800, 9600, 19200, 38400, 57600, 115200, 230400 bits per second,  the serial communication may not  occur, error  within a byte )

( but in the case of setting a baud rate larger than what is listed above, it is better to set the following baud rate,  500000, 1000000, 1500000, 3000000 bits per second )






,, end

( disables the serial communication port )

Serial . end ();


none returns






,, clean buffer

Serial . flush ();


none returns






,, buffer scan

( gets the number of bytes, characters available for reading from the serial port )

int Serial . available ()


it returns the number of bytes available in the serial buffer, return 0 when there is no data






,, serial event

Serial . serialEvent { //statements }






,, write string

Serial . print ( variable );

Serial . print ( variable, format );


format :  ( specified the number base for values ) BIN ( binary or base two ), OCT ( octal or base eight ), DEC ( decimal or base ten ), HEX ( hexadecimal or base sixteen )


returns the number of bytes printed






,, write string with a carriage return

Serial . println ( variable );

Serial . println ( variable, format );


format :  ( specified the number base for values ) BIN ( binary or base two ), OCT ( octal or base eight ), DEC ( decimal or base ten ), HEX ( hexadecimal or base sixteen )


returns the number of bytes printed






,, write data

Serial . write ( variable );

Serial . write ( const char * string );

Serial . write ( const unsigned char * buffer, int length );


returns ( the number of bytes of output, written data )






,, read

Serial . read ();

( return a byte )

( return -1 if blank )






,, read but no clearing

( returns the next byte, character of incoming serial data in the serial communications port without removing it from the receive buffer )

( crlf conversion is not carry out )

Serial . peek ();


returns ( the first byte of incoming serial data available

returns -1  ( if nodata is available )






,,

Serial . readBytes ( variable, length );

( variable is a array )


( return number of read )

( return 0 if blank )






,,

Serial . readBytesUntil ( character, variable, length );

( variable is a array )


( return number of read )

( return 0 if blank )






,,

Serial . readString();

( return a string )






,,

Serial . readStringUntil ( character );

( return a string ),,






,,

Serial . find ( variable );

( return a boolean )






,,

Serial . findUntil ( variable, character );

( return a boolean )






,,

Serial . parseFloat ();

( return a available float )






,,

Serial . parseInt ();

( return a available integer )


Serial . parseInt ( charskipChar );

( ? )






,

