




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>




void  *   get_fst_leaves_system_trees_files

(

const  void  *   that_words_name,

       void  *   that_words_result

)

{





void  *   note_files_get;


void  *   note_words_read;













if  (  is_fst_leaves_system_trees_files  (  that_words_name  )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  )  )

{

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}






else if  (  is_fst_leaves_system_trees_files  (  that_words_name  )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  )  )

{





that_words_result  =  malloc  (  1  *  sizeof ( char )  );

* ( char * ) that_words_result  =  '\0';




note_words_read  =  malloc  (  2  *  sizeof ( char )  );




note_files_get   =   fopen  (  that_words_name,  "r"  );








while  (    fgets  (   note_words_read,   2,   ( FILE * ) note_files_get   )   !=   NULL    )

{

that_words_result  =  realloc (  that_words_result,   ( 1  +  1  +  strlen ( that_words_result ) )  *  sizeof ( char )  );

strcat ( that_words_result, note_words_read );

}






free ( note_words_read );

fclose ( note_files_get );


return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  );



}








return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}
