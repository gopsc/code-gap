




#include <stdlib.h>



void *  compare_fst_things_data_words


(

void *  that_words_one,

void *  that_words_two,

void *  that_numbers_result

)

{



void *  note_numbers_lengths_one;

note_numbers_lengths_one   =   malloc  (  sizeof ( int )  );


for

(

* ( int * ) note_numbers_lengths_one   =   0;

* ( char * )  (  that_words_one  +  * ( int * ) note_numbers_lengths_one  )   !=   '\0';

* ( int * ) note_numbers_lengths_one   =   * ( int * ) note_numbers_lengths_one   +   1

)

{

}





void *  note_numbers_lengths_two;

note_numbers_lengths_two   =   malloc  (  sizeof ( int )  );



for

(

* ( int * ) note_numbers_lengths_two   =   0;

* ( char * ) (  that_words_two  +  * ( int * ) note_numbers_lengths_two  )   !=   '\0';

* ( int * ) note_numbers_lengths_two   =   * ( int * ) note_numbers_lengths_two   +   1

)

{

}










if  (  * ( int * ) note_numbers_lengths_one   !=   * ( int * ) note_numbers_lengths_two  )

{


free  (  note_numbers_lengths_one  );

free  (  note_numbers_lengths_two  );


* ( int * ) that_numbers_result   =   1;


return  0;

}







void *  note_numbers_count;

note_numbers_count   =   malloc  (  sizeof ( int )  );



for

(

* ( int * ) note_numbers_count   =   0;

* ( int * ) note_numbers_count   <   * ( int * ) note_numbers_lengths_one;

* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count   +   1

)

{



if  (  * ( char * ) (  that_words_one  +  * ( int * ) note_numbers_count  )   !=   * ( char * ) (  that_words_two  +  * ( int * ) note_numbers_count  )  )

{

free  (  note_numbers_lengths_one  );

free  (  note_numbers_lengths_two  );

free  (  note_numbers_count  );


* ( int * ) that_numbers_result   =   1;


return  0;


}




}









free  (  note_numbers_lengths_one  );

free  (  note_numbers_lengths_two  );

free  (  note_numbers_count  );


* ( int * ) that_numbers_result   =   0;


return  0;

}








