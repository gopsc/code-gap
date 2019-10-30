




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>




void  *   get_fst_leaves_system_trees_files

(

const  void  *   that_path,

       void  *   that_result

)

{





void  *   note_file;


void  *   note_words;













if

(

is_fst_leaves_system_trees_files  (  that_path  )  ==  that_fst_leaves_lake_existence_no

)

{

return  that_fst_leaves_lake_existence_no;

}






else if

(

is_fst_leaves_system_trees_files  (  that_path  )  ==  that_fst_leaves_lake_existence_yes

)

{





that_result  =  malloc  (  1  *  sizeof ( char )  );

* ( char * ) that_result  =  '\0';




note_words  =  malloc  (  2  *  sizeof ( char )  );




note_file   =   fopen  (  that_path,  "r"  );








while  (    fgets  (   note_words,   2,   ( FILE * ) note_file   )   !=   NULL    )

{

that_result  =  realloc (  that_result,   1  +  1  +  strlen ( that_result )  );

strcat ( that_result, note_words );

}






free ( note_words );

fclose ( note_file);


return that_fst_leaves_lake_existence_yes;



}





return that_fst_leaves_lake_existence_no;

}
