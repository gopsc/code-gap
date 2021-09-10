

,,

#include <MsTimer2.h>


( this library allows users to call a function periodically )

( three types of timer are prepared )

( MsTimer2, one of types, is compatible with arduino one described in arduino playground )






,, set

( specifies a call back function executed in the specified interval timer interrupt handle )

( the handler is executed by disabled interrupt, in case of executing with use of interrupt, permit an interrupt by interrupt () )


MsTimer2 :: set ( unsigned long ms, void ( * function ) () );


ms :  ( interval, micro second )

function :  ( function name )


returns none






,, start

( start the timer after set )


MsTimer2 :: start ();


none returns






,, stop

( stop the timer )


MsTimer2 :: stop ();


none returns






,

