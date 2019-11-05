






#include  <stdlib.h>


void *  find_fst_things_data_words

(

void *  that_words_target,

void *  that_words_find,

void *  that_numbers_result

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







void *  note_numbers_count_target;

note_numbers_count_target   =   malloc  (  1  *  sizeof ( int )  );


void *  note_numbers_count_find;

note_numbers_count_find   =   malloc  (  1  *  sizeof ( int )  );



void *  note_switch;

note_switch   =   malloc  (  1  *  sizeof ( int )  );






for

(

* ( int * ) note_numbers_count_target   =   0;

* ( int * ) note_numbers_count_target   <   * ( int * ) note_numbers_length_target;

* ( int * ) note_numbers_count_target   =   * ( int * ) note_numbers_count_target   +   1

)

{



* ( int * ) note_switch   =   0;


for

(

* ( int * ) note_numbers_count_find   =   0;

* ( int * ) note_numbers_count_find   <   * ( int * ) note_numbers_length_find;

* ( int * ) note_numbers_count_find   =   * ( int * ) note_numbers_count_find   +   1

)

{




if  (   * ( char * ) (  that_words_target  +  * ( int * ) note_numbers_count_target  +  * ( int * ) note_numbers_count_find  )   !=   * ( char * ) (  that_words_find   +  * ( int * ) note_numbers_count_find  )   )

{

* ( int * ) note_switch   =   0;

break;

}


else if  (   * ( char * ) (  that_words_target  +  * ( int * ) note_numbers_count_target  +  * ( int * ) note_numbers_count_find  )   ==   * ( char * ) (  that_words_find  +  * ( int * ) note_numbers_count_find  )   )

{

* ( int * ) note_switch   =   1;

}




}






if  (  * ( int * ) note_switch   ==   1  )

{


that_numbers_result   =   that_words_target   +   * ( int * ) note_numbers_count_target;



free  (  note_numbers_length_target  );

free  (  note_numbers_length_find  );


free  (  note_numbers_count_target  );

free  (  note_numbers_count_find  );


free  (  note_switch  );



return   0;


}





}












free  (  note_numbers_length_target  );

free  (  note_numbers_length_find );


free  (  note_numbers_count_target  );

free  (  note_numbers_count_find  );


free  (  note_switch  );



return  0;

}










