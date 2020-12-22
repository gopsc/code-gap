

,,

#include <servo.h>

Servo servo0;


( this library allows you to control rc servo motors )

( up to twelve channels can be assigned )


( servos have integrated gears and a shaft that can be precisely controlled )

( standard servos allow the shaft to be positioned at various angles, usually between zero and one hundred and eighty degrees )

( continuous rotation servos allow the rotation of the shaft to be set to various speeds )


( you will need to create servo myservo or a similar instance )






,, attach

( initializes and attaches the servo output to a pin )


servo . attach ( int pin );

servo . attach ( int pin, int min, int max );


min :  ( the pulse width, in microseconds, corresponding to the minimum, zero degree, angle on the servo, default to five hundred and forty-four )

max :  ( the pulse width, in microseconds, corresponding to the maximun, one hundred and eighty degrees, angle on the servo, defaults two thousands and four hundred )


none returns






,, write

( write a value to the servo to set the shaft angle, controlling the shaft accordingly )

( the pulse for moving the shaft to that orientation is output from the pin specified in attach )


servo . write ( int angle );


angle :  zero to one hundred and eighty


none returns






,, write microseconds

( write a value in microseconds to the servo, controlling the shaft accodingly )

( one standard servo, this will set the angle of the shaft )

( on standard servos a parameter of one thousand is fully counter-clockwise, two thousands is fully clockwise, and one thousand and five hundred is in the middle )


servo . writeMicroseconds ( int us );


us :  ( the value of the pulse width in microseconds )


none returns






,, read

( read the current angle of the servo )


int servo . read ();


returns pulse width, us






,, attached

( check whether the servo variable is attached to a pin )


bool servo . attached ();


returns true if the servo is attached to pin; false otherwise






,, detach

( detach the servo variable from its pin )

( this stops the pulse width output from the specified pin )


servo . detach ();


none returns






,

