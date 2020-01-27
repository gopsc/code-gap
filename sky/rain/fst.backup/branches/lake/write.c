




#include  <stdlib.h>

#include  <string.h>




void *  write_fst_leaves_lake

(

void *  that_words_names,

void *  that_words_contents

)

{




void  *   note_numbers_counts;

note_numbers_counts   =   create_fst_things_data  (  1  *  sizeof ( int )  );




void  *   note_numbers_results;

note_numbers_results   =   create_fst_things_data  (  1  *  sizeof ( int )  );



void  *   note_numbers_lengths_wrote;

note_numbers_lengths_wrote   =   create_fst_things_data  (  1  *  sizeof ( int )  );



void  *  note_numbers_lengths_targets;

note_numbers_lengths_targets   =   create_fst_things_data  (  1  *  sizeof ( int )  );








for

(

* ( int * ) note_numbers_counts   =   1;

* ( int * ) note_numbers_counts  <=   * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{





compare_fst_things_data_words  (  that_words_names,  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ],  note_numbers_results  );

if   (   * ( int * ) note_numbers_results   ==   0   )

{




measure_fst_things_data_words  (  that_words_contents,  note_numbers_lengths_wrote  );

measure_fst_things_data_words  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],  note_numbers_lengths_wrote  );



if (   * ( int * ) note_numbers_lengths_wrote   <=   * ( int * ) note_numbers_lengths_targets   )

{

copy_fst_things_data_words  (   that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],   that_words_contents   );

that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   =   resize_fst_things_data  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],  ( 1 + strlen ( that_words_contents ) )  *  sizeof ( char )  );

}




else if (   * ( int * ) note_numbers_lengths_wrote   >   * ( int * ) note_numbers_lengths_targets   )

{

that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   =   resize_fst_things_data  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],  ( 1 + strlen ( that_words_contents ) )  *  sizeof ( char )  );

copy_fst_things_data_words  (   that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ],   that_words_contents   );

}





free_fst_things_data  (  note_numbers_lengths_wrote  );

free_fst_things_data  (  note_numbers_lengths_targets  );

free_fst_things_data  (  note_numbers_counts  );

free_fst_things_data  (  note_numbers_results  );


return  that_fst_leaves_lake;

}





}







that_fst_leaves_lake   =   resize_fst_things_data  (  that_fst_leaves_lake,  ( 1 + 1 + * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ] )  *  sizeof ( void * )  );

that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ]   =   create_fst_things_data  (  2  *  sizeof ( void * )  );



that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ]   =   create_fst_things_data  (  ( 1 + strlen ( that_words_names ) )  *  sizeof ( char )  );

copy_fst_things_data_words  (  that_fst_leaves_lake [ * ( int * ) note_numbers_counts ] [ 0 ],  that_words_names  );



that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]   =   create_fst_things_data  (  ( 1 + strlen ( that_words_contents ) )  *  sizeof ( char )  );

copy_fst_things_data_words  (  that_fst_leaves_lake [ * ( int * ) note_numbers_counts ] [ 1 ],  that_words_contents  );



* ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ]   =   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   +   1;







free_fst_things_data  (  note_numbers_lengths_wrote  );

free_fst_things_data  (  note_numbers_lengths_targets  );

free_fst_things_data  (  note_numbers_counts  );

free_fst_things_data  (  note_numbers_results  );


return  that_fst_leaves_lake;



}
