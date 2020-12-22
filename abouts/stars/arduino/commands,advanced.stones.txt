

,, generate square wave

tone

(

int pin,

int frequency,

int duration

);


frequency :  ( hertz )


duration :  the duration of the tone in milliseconds ( continues to buzz when abbreviated or set to 0 )


none retuens






,, stop generation of square wave

noTone ( int pin );


none returns






,, shift out a byte

( each bit is written in turn to a data pin, after which a clock pin is pulsed to indicate that bit is available )

( pulse :  taken high, then low )


shiftOut ( int dataPin, int clockPin, bitOrder, unsigned char value );


bitOrder :  MSBFIRST ( most significant bit first ) or LSBFIRST ( least significant bit first )


none returns






,, shift in a byte

( for each bit, the clock pin is pulled high, the next bit is read from the data line, and then the clock pin is taken low )


unsigned char shiftIn ( unsigned char dataPin, unsigned char clockPin, bitOrder );


bitOrder :  MSBFIRST or LSBFIRST


returns a 8-bit data read






,, read a pulse

unsigned long pulseIn ( int pin, int val, unsigned long timeout = 1000000 );


val :  ( type of pulse to read ) HIGH or LOW


timeout :  ( default is one second )


returns ( the length of the pulse in microseconds or zero if no pulse started before the timeout ) unsigned long






,

