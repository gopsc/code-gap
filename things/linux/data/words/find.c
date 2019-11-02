





void *  find_fst_things_data_words

(

void *  that_words_target,

void *  that_words_find

)

{


void *  note_numbers_length_target;

note_numbers_length_target   =   malloc  (  1  *  sizeof ( int )  );


for

(

* ( int * ) note_numbers_length_target   =   0;

* ( char * ) (  that_words_target  +  * ( int * ) note_numbers_length_target  )   !=   '\0';

* ( int * ) note_numbers_length_target   =   * ( int * ) note_numbers_length_target

)

{


}







void *  note_numbers_length_find;

note_numbers_length_find   =   malloc  (  1  *  sizeof ( int )  );


for

(

* ( int * ) note_numbers_length_find   =   0;

* ( char * ) (  that_words_find  +  * ( int * ) note_numbers_length_find  )   !=   '\0';

* ( int * ) note_numbers_length_find   =   * ( int * ) note_numbers_length_find   +   1

)

{


}









free  (  note_numbers_length_target  );

free  (  note_numbers_length_find );


return  0;

}










