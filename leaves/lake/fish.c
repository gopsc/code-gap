



#include <stdlib.h>



void *  fish_fst_leaves_lake

(  void *  that_words_name  )

{
 

void *  note_number_count;

note_number_count   =   malloc  (  1 * sizeof ( int )  );


for

(

* ( int * ) note_number_count  =  1;

* ( int * ) note_number_count  <=  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_number_count  =  * ( int * ) note_number_count   +   1

)

{


if   (   strcmp  (  that_words_name,  that_fst_leaves_lake  [  * ( int * ) note_number_count  ] [ 0 ]  )   ==  0   )

{


free  ( note_number_count );


return   that_fst_leaves_lake  [  * ( int * ) note_number_count  ] [ 1 ];

}

}




free ( note_number_count );

return  that_fst_leaves_lake;

}

