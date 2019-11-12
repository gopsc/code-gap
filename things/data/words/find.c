






#include  <stdlib.h>


void *  find_fst_things_data_words

(

void *  that_words_target,

void *  that_words_find,

void *  that_words_result

)

{


void *  note_numbers_lengths_target;

note_numbers_lengths_target   =   malloc  (  1  *  sizeof ( int )  );


for

(

* ( int * ) note_numbers_lengths_target   =   0;

* ( char * ) (  that_words_target  +  * ( int * ) note_numbers_lengths_target  )   !=   '\0';

* ( int * ) note_numbers_lengths_target   =   * ( int * ) note_numbers_lengths_target

)

{


}







void *  note_numbers_lengths_find;

note_numbers_lengths_find   =   malloc  (  1  *  sizeof ( int )  );


for

(

* ( int * ) note_numbers_lengths_find   =   0;

* ( char * ) (  that_words_find  +  * ( int * ) note_numbers_lengths_find  )   !=   '\0';

* ( int * ) note_numbers_lengths_find   =   * ( int * ) note_numbers_lengths_find   +   1

)

{


}







void *  note_numbers_counts_target;

note_numbers_counts_target   =   malloc  (  1  *  sizeof ( int )  );


void *  note_numbers_counts_find;

note_numbers_counts_find   =   malloc  (  1  *  sizeof ( int )  );



void *  note_numbers_switch;

note_numbers_switch   =   malloc  (  1  *  sizeof ( int )  );






for

(

* ( int * ) note_numbers_counts_target   =   0;

* ( int * ) note_numbers_counts_target   <   * ( int * ) note_numbers_lengths_target;

* ( int * ) note_numbers_counts_target   =   * ( int * ) note_numbers_counts_target   +   1

)

{



* ( int * ) note_numbers_switch   =   1;


for

(

* ( int * ) note_numbers_counts_find   =   0;

* ( int * ) note_numbers_counts_find   <   * ( int * ) note_numbers_lengths_find;

* ( int * ) note_numbers_counts_find   =   * ( int * ) note_numbers_counts_find   +   1

)

{




if  (   * ( char * ) (  that_words_target  +  * ( int * ) note_numbers_counts_target  +  * ( int * ) note_numbers_counts_find  )   !=   * ( char * ) (  that_words_find   +  * ( int * ) note_numbers_counts_find  )   )

{

* ( int * ) note_numbers_switch   =   1;

break;

}


else if  (   * ( char * ) (  that_words_target  +  * ( int * ) note_numbers_counts_target  +  * ( int * ) note_numbers_counts_find  )   ==   * ( char * ) (  that_words_find  +  * ( int * ) note_numbers_counts_find  )   )

{

* ( int * ) note_numbers_switch   =   0;

}




}






if  (  * ( int * ) note_numbers_switch   ==   0  )

{


that_words_result   =   that_words_target   +   * ( int * ) note_numbers_counts_target;



free  (  note_numbers_lengths_target  );

free  (  note_numbers_lengths_find  );


free  (  note_numbers_counts_target  );

free  (  note_numbers_counts_find  );


free  (  note_numbers_switch  );



return   0;


}





}











that_words_result   =   0;


free  (  note_numbers_lengths_target  );

free  (  note_numbers_lengths_find );


free  (  note_numbers_counts_target  );

free  (  note_numbers_counts_find  );


free  (  note_numbers_switch  );



return  0;

}










