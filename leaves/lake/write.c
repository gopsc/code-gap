




#include  <stdlib.h>

#include  <string.h>




void *  write_fst_leaves_lake

(

void *  that_words_name,

void *  that_words_content

)

{




void *  note_numbers_count;


note_numbers_count   =   malloc  (  1 * sizeof ( int )  );




for

(

* ( int * ) note_numbers_count   =   1;

* ( int * ) note_numbers_count  <=   * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count   +   1

)

{






if   (   strcmp  (   that_words_name,  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 0 ]   )   ==   0   )

{





if   (   strlen  ( that_words_content )   <=   strlen (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ]   )   )

{

strcpy  (   that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ],   that_words_content   );

that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ]   =   realloc  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ],  ( 1 + strlen ( that_words_content ) )  *  sizeof ( char )  );

}




else if (   strlen  ( that_words_content )   >   strlen (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ]   )   )

{

that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ]   =   realloc  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ],  ( 1 + strlen ( that_words_content ) )  *  sizeof ( char )  );

strcpy  (   that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ],   that_words_content   );

}




free  (  note_numbers_count  );

return  that_fst_leaves_lake;

}





}







that_fst_leaves_lake   =   realloc  (  that_fst_leaves_lake,  ( 1 + 1 + * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ] )  *  sizeof ( void * )  );

that_fst_leaves_lake  [ * ( int * ) note_numbers_count ]   =   malloc  (  2  *  sizeof ( void * )  );



that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 0 ]   =   malloc  (  ( 1 + strlen ( that_words_name ) )  *  sizeof ( char )  );

strcpy  (  that_fst_leaves_lake [ * ( int * ) note_numbers_count ] [ 0 ],  that_words_name  );



that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ]   =   malloc  (  ( 1 + strlen ( that_words_content ) )  *  sizeof ( char )  );

strcpy  (  that_fst_leaves_lake [ * ( int * ) note_numbers_count ] [ 1 ],  that_words_content  );



* ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ]   =   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   +   1;








free  (  note_numbers_count  );


return  that_fst_leaves_lake;

}


