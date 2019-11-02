




void *  copy_fst_things_data_words


(

void *  that_words_target,

void *  that_words_copy

)

{


void *  note_numbers_count;

note_numbers_count   =   malloc  (  1  *  sizeof ( int )  );



for

(

* ( int * ) note_numbers_count   =   0;

* ( char * ) ( that_words_copy + * ( int * ) note_numbers_count )  !=  '\0';

* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count

)

{

* ( char * ) ( that_words_target   +   * ( int * ) note_numbers_count )   =   * ( int * ) ( that_words_copy  +  * ( int * ) note_numbers_count );

}




* ( char * ) ( that_words_target  +  * ( int * ) note_numbers_count  )   =   '\0';


free  (  note_numbers_count  );

return 0;

}







