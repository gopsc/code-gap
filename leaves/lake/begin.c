




#include  <stdlib.h>


void  *   begin_leaves_lake   ()


{

that_leaves_lake_that  =  malloc  (  1 * sizeof ( void * )  );

that_leaves_lake_that  [ 0 ]   =   malloc (  1 * sizeof ( int )  );

*  (  int *  )  that_leaves_lake_that [ 0 ]  =  0;
  
printf (  "%d\n",  * ( int * ) that_leaves_lake_that  );
  
return NULL;

}







