




#include  <stdlib.h>



void *  end_fst_leaves_lake ()

{


void *  note_numbers_count;

note_numbers_count   =   malloc  (  1 * sizeof ( int )  );




for

(

* ( int * ) note_numbers_count  =  1;

* ( int * ) note_numbers_count  <=  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_numbers_count  =  * ( int * ) note_numbers_count   +   1

)

{

free   (  that_fst_leaves_lake  [  * ( int * ) note_numbers_count  ] [ 1 ]  );

free   (  that_fst_leaves_lake  [  * ( int * ) note_numbers_count  ] [ 0 ]  );

free   (  that_fst_leaves_lake  [  * ( int * ) note_numbers_count  ]  );

}

free  (  note_numbers_count );





free  (  that_fst_leaves_lake  [ 0 ] [ 1 ]  );

free  (  that_fst_leaves_lake  [ 0 ] [ 0 ]  );

free  (  that_fst_leaves_lake  [ 0 ]  );

free  (  that_fst_leaves_lake  );



that_fst_leaves_lake  =  0;






return  that_fst_leaves_lake;

}
