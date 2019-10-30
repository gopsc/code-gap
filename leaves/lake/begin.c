




#include  <stdlib.h>

#include  <string.h>



void  *   begin_fst_leaves_lake   ()


{








if  (  that_fst_leaves_lake  ==  0 )

{

  
that_fst_leaves_lake   =   malloc  (  1 * sizeof ( void * )  );

  
  
that_fst_leaves_lake  [ 0 ]   =   malloc  (  2 * sizeof ( void * )  );
  

  
that_fst_leaves_lake  [ 0 ] [ 0 ]   =   malloc (  21 * sizeof ( char )  );
  
that_fst_leaves_lake  [ 0 ] [ 1 ]   =   malloc (  1 * sizeof ( int )  );

  


strcpy  (  that_fst_leaves_lake  [ 0 ] [ 0 ],  "that_fst_leaves_lake"  );
  
*  (  int *  )   that_fst_leaves_lake  [ 0 ] [ 1 ]   =   0;

  

  

/*

printf ( "%s\n",  that_fst_leaves_lake  [ 0 ] [ 0 ]  );

*/



}  







return  that_fst_leaves_lake [ 0 ];

}







