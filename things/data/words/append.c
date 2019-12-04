


#include <stdlib.h>


void  *   append_fst_things_data_words


(

void  *   that_words_targets,

void  *   that_words_appended

)

{

void  *   note_numbers_counts_targets;

note_numbers_counts_targets   =   malloc  (  1  *  sizeof ( int )  );

* ( int * ) note_numbers_counts_targets   =   0;


while  (  * ( char * ) (  that_words_targets  +  * ( int * ) note_numbers_counts_targets  )   !=   '\0'  )

{

* ( int * ) note_numbers_counts_targets   =   * ( int * ) note_numbers_counts_targets   +   1;

}





void  *   note_numbers_counts_appended;

note_numbers_counts_appended   =   malloc  (  1  *  sizeof ( int )  );



for

(

* ( int * ) note_numbers_counts_appended   =   0;

* ( char * ) (  that_words_appended  +  * ( int * ) note_numbers_counts_appended  )   !=   '\0';

* ( int * ) note_numbers_counts_appended   =   * ( int * ) note_numbers_counts_appended   +   1

)

{

* ( char * ) (  that_words_targets  +  * ( int * ) note_numbers_counts_targets  +  * ( int * ) note_numbers_counts_appended  )   =   * ( char * ) (  that_words_appended  +  * ( int * ) note_numbers_counts_appended  );

}



* ( char * ) (  that_words_targets  +  * ( int * ) note_numbers_counts_targets  +  * ( int * ) note_numbers_counts_appended  )   =   '\0';





return  0;

}











