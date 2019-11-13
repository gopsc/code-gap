





#include  <stdlib.h>


void *  copy_fst_things_data_words


(

void *  that_words_targets,

void *  that_words_copied

)

{


void *  note_numbers_counts;

note_numbers_counts   =   malloc  (  1  *  sizeof ( int )  );



for

(

* ( int * ) note_numbers_counts   =   0;

* ( char * ) ( that_words_copied + * ( int * ) note_numbers_counts )  !=  '\0';

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{

* ( char * ) ( that_words_targets   +   * ( int * ) note_numbers_counts )   =   * ( char * ) (  that_words_copied  +  * ( int * ) note_numbers_counts  );

}




* ( char * ) ( that_words_targets  +  * ( int * ) note_numbers_counts  )   =   '\0';


free  (  note_numbers_counts  );

return 0;

}







