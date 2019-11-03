


#include  <stdlib.h>




void  *   save_fst_leaves_system_trees_files

(

void  *   that_words_name,
   
void  *   that_words_content

)
                     
{







void  *   note_numbers_count;

note_numbers_count  =  create_fst_things_data  (    sizeof ( int )    );

* ( int * ) note_numbers_count  =  1;



void *  note_numbers_count_two;

note_numbers_count_two  =  crate_fst_things_data  (  1  *  sizeof ( int )  );   
   
   
   
   

void  *   note_words_name;

note_words_name  =  create_fst_things_data  (    strlen ( that_words_name )  *  sizeof ( char )    );



void  *   note_place_name;








/*

that_words_name       /.../.../...

note_numbers_count     1   2  ...

note_words_name       /...

*/







while  (    * ( int * ) note_numbers_count  !=  0    )

{









copy_fst_things_data_words  (  note_words_name,  that_words_name  );
    
note_place_name  =  note_words_name;







     



for

(

* ( int * ) note_numbers_count_two   =   0;

* ( int * ) note_numbers_count_two   <   * ( int * ) note_numbers_count;

* ( int * ) note_numbers_count_two   =   * ( int * ) note_numbers_count_two   +   1  )

{

  

find_fst_things_data_words
   
(

note_place_name + 1,
   
"/",
   
note_place_name

);




if  ( note_place_name == NULL )

{

* ( int * ) note_numbers_count = 0;

}



}









if ( * ( int * ) note_numbers_count != 0 )

{


   
* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count   +   1;



* ( char * ) note_place_name  =  '\0';



   
   
   
   
if  (  is_fst_leaves_system_trees_dirents ( note_words_name )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  )  )

{

create_fst_things_trees_dirents  (  note_words_name  );

}





}








}



free ( note_words_name );

free ( note_numbers_count );

free (  note_numbers_count_two  );













if  (  is_fst_leaves_system_trees_dirents ( that_words_name )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  )  )

{

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}





else if  (  is_fst_leaves_system_trees_dirents ( that_words_name )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  )  )

{


write_fst_things_trees_files  (  that_words_name,  that_words_content  );


return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  );


}



return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}

