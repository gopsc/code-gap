








#include  <stdio.h>

#include  <unistd.h>



void  *   that_wait   (   double  that_time   )


{



usleep ( that_time * 1000000 );


return  NULL;


}