




int  measure_fst_things_data_words

(  void *  that_words_target  )

{

void *  note_numbers_count;

note_numbers_count   =   malloc  (  1  *  sizeof ( int )  );



for

(

* ( int * ) note_numbers_count   =   0;

* ( char * ) ( that_words_target  +  * ( int * ) note_numbers_count )   !=   '\0';

* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count   +   1

)

{

}




return  * ( int * ) note_numbers_count;

}










