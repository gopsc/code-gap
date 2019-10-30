



#include <stdlib.h>



void *  fish_fst_leaves_lake

(  void *  that_words_name  )

{
 

void *  note_places_result;


void *  note_numbers_count;

note_numbers_count   =   malloc  (  1 * sizeof ( int )  );


for

(

* ( int * ) note_numbers_count  =  1;

* ( int * ) note_numbers_count  <=  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_numbers_count  =  * ( int * ) note_numbers_count   +   1

)

{


if   (   strcmp  (  that_words_name,  that_fst_leaves_lake  [  * ( int * ) note_numbers_count  ] [ 0 ]  )   ==  0   )

{


note_places_result   =   that_fst_leaves_lake  [  * ( int * ) note_numbers_count  ] [ 1 ];

free  (  note_numbers_count  );


return  note_places_result;


}

}




free ( note_numbers_count );

return  that_fst_leaves_lake;

}

