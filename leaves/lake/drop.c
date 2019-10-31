


#include  <stdlib.h>

#include  <string.h>




void *  drop_fst_leaves_lake

(  void *  that_words_name  )

{








void *  note_numbers_count;


note_numbers_count   =   malloc  (  1  *  sizeof ( int )  );




void *  note_numbers_switch;

note_numbers_switch   =   malloc  (  1  *  sizeof ( int )  );

* ( int * ) note_numbers_switch   =   0;






for

(

* ( int * ) note_numbers_count   =   1;

* ( int * ) note_numbers_count  <=   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ];

* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count   +   1

)

{







if  (  * ( int * ) note_numbers_switch   ==   0  )

{




if  (   strcmp  (  that_words_name,  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 0 ]  )   ==   0   )

{


free  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 0 ]  );

free  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ] [ 1 ]  );

free  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_count ]  );


* ( int * ) note_numbers_switch  =  1;


}

}





else if  (  * ( int * ) note_numbers_switch  ==  1  )

{

that_fst_leaves_lake [ * ( int * ) note_numbers_count  -  1 ]   =   that_fst_leaves_lake  [ * ( int * ) note_numbers_count ];

}


}



if  (  * ( int * ) note_numbers_switch   ==   1  )

{

* ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   =   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   -   1;

that_fst_leaves_lake   =   realloc  (  that_fst_leaves_lake,  ( 1  +  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ] )  *  sizeof ( void * )  );
}







free  (  note_numbers_count  );

free  (  note_numbers_switch );

return  that_fst_leaves_lake;

}



