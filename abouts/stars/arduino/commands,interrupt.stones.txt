

,, interrupt

( allows users to trigger a process interrupt function or enable/disable an interrupt function when the input to a pin changes value )






,, begin a interrupt

( specified a function to execute, call when an external interrupt occurs, signal on external pin )

attachInterrupt ( pin, void ( * ) ( void ) func, mode );


pin :  ( the number of pin used for the interrupt, part of IntX in pin map )

func :  ( the function to call when the interrupt occurs )

mode :  LOW ( to trigger the interrupt whenever the pin is low ),  CHANGE ( to trigger the interrupt whenever the pin changes value ),  FALLLING ( to trigger when the pin goes from high to low ),  RISING ( to trigger when the pin goes from low to high )


none returns






,, end a interrupt

( turns off the interrupt specified in attachInterrupt )

detatachInterrupt ( pin );


none returns






,, disables an interrupt process

( use this when you need to protect the timing of a apecific process )

( this can even be used to disable an important task run in the background )

noInterrupts ();


none returns






,, enable an interrupt process

( re-enable the interrupt disabled in noInterrupts )

interrupts ();


none returns






,

