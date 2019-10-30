




#include  <stdlib.h>

#include  <string.h>




void *  write_fst_leaves_lake

(

void *  that_words_name,

void *  that_words_content

)

{




void *  note_number_count;


note_number_count   =   malloc  (  1 * sizeof ( int )  );




for

(

* ( int * ) note_number_count   =   1;

* ( int * ) note_number_count  <=   * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_number_count   =   * ( int * ) note_number_count   +   1

)

{






if   (   strcmp  (   that_words_name,  that_fst_leaves_lake  [ * ( int * ) note_number_count ] [ 0 ]   )   ==   0   )

{





if   (   strlen  ( that_words_content )   <=   strlen (  that_fst_leaves_lake  [ * ( int * ) note_number_count ] [ 1 ]   )   )

{

strcpy  (   that_fst_leaves_lake  [ * ( int * ) note_number_count ] [ 1 ],   that_words_content   );

that_fst_leaves_lake  [ * ( int * ) note_number_count ] [ 1 ]   =   realloc  (  that_fst_leaves_lake  [ * ( int * ) note_number_count ] [ 1 ],  ( 1 + strlen ( that_words_content ) )  *  sizeof ( char )  );

}


return  that_fst_leaves_lake;

}





}







return  that_fst_leaves_lake;

}


