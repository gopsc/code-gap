


#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   save_fst_leaves_system_trees_files

(

const void  *   that_words_path,
   
const void  *   that_words_content

)
                     
{







void  *   note_numbers_count;

note_numbers_count  =  malloc  (    sizeof ( int )    );

* ( int * ) note_numbers_count  =  1;



void  *   note_words_path;

note_words_path  =  malloc  (    strlen ( that_words_path )  *  sizeof ( char )    );



void  *   note_place_path;








/*

that_words_path       /.../.../...

note_numbers_count     1   2  ...

note_words_path       /...

*/







while  (    * ( int * ) note_numbers_count  !=  0    )

{









strcpy  (  note_words_path,  that_words_path  );
    
note_place_path  =  note_words_path;







    

void *  note_numbers_count_two;

note_numbers_count_two  =  malloc  (  1  *  sizeof ( int )  );    



for

(

* ( int * ) note_numbers_count_two   =   0;

* ( int * ) note_numbers_count_two   <   * ( int * ) note_numbers_count;

* ( int * ) note_numbers_count_two   =   * ( int * ) note_numbers_count_two   +   1  )

{

  

note_place_path   =   strstr ( note_place_path + 1,  "/"  );




if  ( note_place_path == NULL )

{

* ( int * ) note_numbers_count = 0;

}



}

free (  note_numbers_count_two  );










if ( * ( int * ) note_numbers_count != 0 )

{


   
( * ( int * ) note_numbers_count ) ++;



* ( char * ) note_place_path  =  '\0';



if  (  is_fst_leaves_system_trees_dirents ( note_words_path )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  )  )

{

mkdir  (  note_words_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH   );

}





}








}



free ( note_words_path );

free ( note_numbers_count );












if  (  is_fst_leaves_system_trees_dirents ( that_words_path )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  )  )

{

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}





else if  (  is_fst_leaves_system_trees_dirents ( that_words_path )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  )  )

{




void  *   note_files_save;


note_files_save  =  fopen  (  that_words_path,  "w"  );


fprintf  (  note_files_save,  "%s",  that_words_content  );


fclose  (  note_files_save  );




return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  );


}



return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}

