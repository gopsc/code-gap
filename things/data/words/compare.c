




#include <stdlib.h>



void *  compare_fst_things_data_words


(

void *  that_words_one,

void *  that_words_two,

void *  that_numbers_results

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


* ( int * ) that_numbers_results   =   1;


return  0;

}







void *  note_numbers_counts;

note_numbers_counts   =   malloc  (  sizeof ( int )  );



for

(

* ( int * ) note_numbers_counts   =   0;

* ( int * ) note_numbers_counts   <   * ( int * ) note_numbers_lengths_one;

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{



if  (  * ( char * ) (  that_words_one  +  * ( int * ) note_numbers_counts  )   !=   * ( char * ) (  that_words_two  +  * ( int * ) note_numbers_counts  )  )

{

free  (  note_numbers_lengths_one  );

free  (  note_numbers_lengths_two  );

free  (  note_numbers_counts  );


* ( int * ) that_numbers_results   =   1;


return  0;


}




}









free  (  note_numbers_lengths_one  );

free  (  note_numbers_lengths_two  );

free  (  note_numbers_counts  );


* ( int * ) that_numbers_results   =   0;


return  0;

}








