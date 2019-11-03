




#include  <stdlib.h>

#include  <string.h>



void  *   begin_fst_leaves_lake   ()


{








if  (  that_fst_leaves_lake  ==  0 )

{

  
that_fst_leaves_lake   =   create_fst_things_data  (  1 * sizeof ( void * )  );

  
  
that_fst_leaves_lake  [ 0 ]   =   create_fst_things_data  (  2 * sizeof ( void * )  );
  

  
that_fst_leaves_lake  [ 0 ] [ 0 ]   =   create_fst_things_data (  21 * sizeof ( char )  );
  
that_fst_leaves_lake  [ 0 ] [ 1 ]   =   create_fst_things_data (  1 * sizeof ( int )  );

  


copy_fst_things_data_words  (  that_fst_leaves_lake  [ 0 ] [ 0 ],  "that_fst_leaves_lake"  );
  
*  (  int *  )   that_fst_leaves_lake  [ 0 ] [ 1 ]   =   0;

  

  

/*

printf ( "%s\n",  that_fst_leaves_lake  [ 0 ] [ 0 ]  );

*/



}  







return  that_fst_leaves_lake;

}







