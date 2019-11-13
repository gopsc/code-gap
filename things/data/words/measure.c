




void *  measure_fst_things_data_words

(

void *  that_words_targets,

void *  that_numbers_results

)

{





void *  note_numbers_counts;

note_numbers_counts   =   malloc  (  1  *  sizeof ( int )  );



for

(

* ( int * ) note_numbers_counts   =   0;

* ( char * ) ( that_words_targets  +  * ( int * ) note_numbers_counts )   !=   '\0';

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{

}




* ( int * ) that_numbers_results   =   * ( int * ) note_numbers_counts;


free  (  note_numbers_counts  );


return  0;

}










