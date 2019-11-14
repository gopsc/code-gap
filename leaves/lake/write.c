




#include  <stdlib.h>

#include  <string.h>




void *  write_fst_leaves_lake

(

void *  that_words_names,

void *  that_words_contents

)

{




void *  note_numbers_counts;


note_numbers_counts   =   create_fst_things_data  (  1 * sizeof ( int )  );












for

(

* ( int * ) note_numbers_counts   =   1;

* ( int * ) note_numbers_counts  <=   * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{






if   (   strcmp  (   that_words_names,  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ]   )   ==   0   )

{





if   (   strlen  ( that_words_contents )   <=   strlen (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   )   )

{

strcpy  (   that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],   that_words_contents   );

that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   =   realloc  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],  ( 1 + strlen ( that_words_contents ) )  *  sizeof ( char )  );

}




else if (   strlen  ( that_words_contents )   >   strlen (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   )   )

{

that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   =   realloc  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],  ( 1 + strlen ( that_words_contents ) )  *  sizeof ( char )  );

strcpy  (   that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],   that_words_contents   );

}




free  (  note_numbers_counts  );

return  that_fst_leaves_lake;

}





}







that_fst_leaves_lake   =   realloc  (  that_fst_leaves_lake,  ( 1 + 1 + * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ] )  *  sizeof ( void * )  );

that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ]   =   malloc  (  2  *  sizeof ( void * )  );



that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ]   =   malloc  (  ( 1 + strlen ( that_words_names ) )  *  sizeof ( char )  );

strcpy  (  that_fst_leaves_lake [ * ( int * ) note_numbers_counts ] [ 0 ],  that_words_names  );



that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   =   malloc  (  ( 1 + strlen ( that_words_contents ) )  *  sizeof ( char )  );

strcpy  (  that_fst_leaves_lake [ * ( int * ) note_numbers_counts ] [ 1 ],  that_words_contents  );



* ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ]   =   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   +   1;







free  (  note_numbers_counts  );


return  that_fst_leaves_lake;



}
