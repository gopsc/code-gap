





void  *   save_fst_leaves_system_trees_files

(

void  *   that_words_names,
   
void  *   that_words_contents

)
                     
{







void  *   note_numbers_counts;

note_numbers_counts  =  create_fst_things_data  (  1  *  sizeof ( int )    );

* ( int * ) note_numbers_counts  =  1;



void *  note_numbers_counts_two;

note_numbers_counts_two  =  create_fst_things_data  (  1  *  sizeof ( int )  );   
   
   
   
   

void  *   note_words_names;

note_words_names  =  create_fst_things_data  (    strlen ( that_words_names )  *  sizeof ( char )    );



void  *   note_place_names;



void  *   note_numbers_results;
   
note_numbers_results   =   create_fst_things_data  (  1 * sizeof ( int )  );




/*

that_words_name       /.../.../...

note_numbers_count     1   2  ...

note_words_name       /...

*/







while  (    * ( int * ) note_numbers_counts  !=  0    )

{









copy_fst_things_data_words  (  note_words_names,  that_words_names  );
    
note_place_names  =  note_words_names;







     



for

(

* ( int * ) note_numbers_counts_two   =   0;

* ( int * ) note_numbers_counts_two   <   * ( int * ) note_numbers_counts;

* ( int * ) note_numbers_counts_two   =   * ( int * ) note_numbers_counts_two   +   1  )

{

  

find_fst_things_data_words
   
(

note_places_names + 1,
   
"/",
   
note_places_names

);




if  (  note_places_names   ==   NULL  )

{

* ( int * ) note_numbers_counts   =   0;

}



}









if (  * ( int * ) note_numbers_counts   !=   0  )

{


   
* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1;



* ( char * ) note_places_names  =  '\0';




   
is_fst_things_trees_dirents  (  note_words_names,  note_numbers_results  );
   
   
if  (  * ( int * ) note_numbers_results   ==   1  )

{

create_fst_things_trees_dirents  (  note_words_names  );

}





}








}



free_fst_things_data  (  note_words_names  );

free_fst_things_data  (  note_numbers_counts  );

free_fst_things_data  (  note_numbers_counts_two  );










is_fst_things_trees_dirents  (  that_words_names,  note_numbers_results  );


if  (  * ( int * ) note_numbers_results   ==   1  )

{


write_fst_things_trees_files  (  that_words_names,  that_words_contents  );


   
free_fst_things_data  (  note_numbers_results  );

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  );


}

   
   

free_fst_things_data  (  note_numbers_results  );

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}

