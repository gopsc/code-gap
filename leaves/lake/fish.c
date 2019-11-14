






void  *   fish_fst_leaves_lake

(  void *  that_words_names  )

{
 
 
 
 
 
 
 

void  *   note_places_results;


void  *   note_numbers_counts;

note_numbers_counts   =   create_fst_things_data  (  1 * sizeof ( int )  );


void  *   note_numbers_results;
 
note_numbers_results   =   create_fst_things_data  (  1  *  sizeof ( int )  );
 
 
 
 
 
 
 
for

(

* ( int * ) note_numbers_counts  =  1;

* ( int * ) note_numbers_counts  <=  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ];

* ( int * ) note_numbers_counts  =  * ( int * ) note_numbers_counts   +   1

)

{

 
 
compare_fst_things_data_words  (  that_words_names,  that_fst_leaves_lake  [  * ( int * ) note_numbers_counts  ] [ 0 ],  note_numbers_results  );

if   (   * ( int * ) note_numbers_results   ==   0   )

{


note_places_results   =   that_fst_leaves_lake  [  * ( int * ) note_numbers_counts  ] [ 1 ];

 

free_fst_things_data  (  note_numbers_counts  );

free_fst_things_data  (  note_numbers_results  );

 
return  note_places_results;


}

 
 
 
 
}




free_fst_things_data ( note_numbers_counts );

free_fst_things_data  (  note_numbers_results  );
 
 
return  that_fst_leaves_lake;

}

