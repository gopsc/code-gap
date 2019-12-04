
// something wrong with this





#include  <stdlib.h>


void *  find_fst_things_data_words

(

void *  that_words_targets,

void *  that_words_found,

void *  that_words_results

)

{


void *  note_numbers_lengths_targets;

note_numbers_lengths_targets   =   malloc  (  1  *  sizeof ( int )  );


for

(

* ( int * ) note_numbers_lengths_targets   =   0;

* ( char * ) (  that_words_targets  +  * ( int * ) note_numbers_lengths_targets  )   !=   '\0';

* ( int * ) note_numbers_lengths_targets   =   * ( int * ) note_numbers_lengths_targets   +   1

)

{


}







void *  note_numbers_lengths_found;

note_numbers_lengths_found   =   malloc  (  1  *  sizeof ( int )  );


for

(

* ( int * ) note_numbers_lengths_found   =   0;

* ( char * ) (  that_words_found  +  * ( int * ) note_numbers_lengths_found  )   !=   '\0';

* ( int * ) note_numbers_lengths_found   =   * ( int * ) note_numbers_lengths_found   +   1

)

{


}







void *  note_numbers_counts_targets;

note_numbers_counts_targets   =   malloc  (  1  *  sizeof ( int )  );


void *  note_numbers_counts_found;

note_numbers_counts_found   =   malloc  (  1  *  sizeof ( int )  );



void *  note_numbers_switches;

note_numbers_switches   =   malloc  (  1  *  sizeof ( int )  );






for

(

* ( int * ) note_numbers_counts_targets   =   0;

* ( int * ) note_numbers_counts_targets   <   * ( int * ) note_numbers_lengths_targets;

* ( int * ) note_numbers_counts_targets   =   * ( int * ) note_numbers_counts_targets   +   1

)

{



* ( int * ) note_numbers_switches   =   1;


for

(

* ( int * ) note_numbers_counts_found   =   0;

* ( int * ) note_numbers_counts_found   <   * ( int * ) note_numbers_lengths_found;

* ( int * ) note_numbers_counts_found   =   * ( int * ) note_numbers_counts_found   +   1

)

{




if  (   * ( char * ) (  that_words_targets  +  * ( int * ) note_numbers_counts_targets  +  * ( int * ) note_numbers_counts_found  )   !=   * ( char * ) (  that_words_found   +  * ( int * ) note_numbers_counts_found  )   )

{

* ( int * ) note_numbers_switches   =   1;

break;

}


else if  (   * ( char * ) (  that_words_targets  +  * ( int * ) note_numbers_counts_targets  +  * ( int * ) note_numbers_counts_found  )   ==   * ( char * ) (  that_words_found  +  * ( int * ) note_numbers_counts_found  )   )

{

* ( int * ) note_numbers_switches   =   0;

}




}






if  (  * ( int * ) note_numbers_switches   ==   0  )

{


that_words_results   =   that_words_targets   +   * ( int * ) note_numbers_counts_targets;


free  (  note_numbers_lengths_targets  );

free  (  note_numbers_lengths_found  );


free  (  note_numbers_counts_targets  );

free  (  note_numbers_counts_found  );


free  (  note_numbers_switches  );



return   0;


}





}











that_words_results   =   0;


free  (  note_numbers_lengths_targets  );

free  (  note_numbers_lengths_found );


free  (  note_numbers_counts_targets  );

free  (  note_numbers_counts_found  );


free  (  note_numbers_switches  );



return  0;

}










