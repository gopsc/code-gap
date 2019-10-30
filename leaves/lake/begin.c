




#include  <stdlib.h>


void  *   begin_fst_leaves_lake   ()


{

  
that_fst_leaves_lake                =  malloc  (  1 * sizeof ( void * )  );

  
  
that_fst_leaves_lake  [ 0 ]         =  malloc  (  2 * sizeof ( void * )  );
  

  
that_fst_leaves_lake  [ 0 ] [ 0 ]   =   malloc (  1 * sizeof ( char )  );
  
that_fst_leaves_lake  [ 0 ] [ 1 ]   =   malloc (  1 * sizeof ( int )  );

  

*  (  char *  )  that_fst_leaves_lake  [ 0 ] [ 0 ]  =  '\0';
  
*  (  int *  )   that_fst_leaves_lake  [ 0 ] [ 1 ]  =  0;

  

  
/*

printf ( "%d\n",  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ] );

*/
  
return  NULL;

}







