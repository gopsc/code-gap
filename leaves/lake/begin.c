




#include  <stdlib.h>


void  *   begin_leaves_lake   ()


{

that_leaves_lake_that  =  malloc  (  1 * sizeof ( void * )  );

that_leaves_lake_that  =  malloc  (  2 * sizeof ( void * )  );
  
that_leaves_lake_that  [ 0 ] [ 1 ]   =   malloc (  1 * sizeof ( int )  );

*  (  int *  )  that_leaves_lake_that [ 0 ] [ 1 ]  =  0;


return NULL;

}







