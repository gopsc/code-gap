




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>




void  *   get_leaves_system_trees_files

(

const  void  *   that_path,

       void  *   that_result

)

{





FILE  *   note_file   =   NULL;


char   note_buffer   [ 128 ];
















if   (

         is_leaves_system_trees_files  (  that_path  )  ==  that_leaves_dream_existence_yes

     )

{





strcpy  (  that_result,  ""  );


note_file   =   fopen  (  that_path,  "r"  );








while (

        fgets  (   note_buffer,   128,   ( FILE * ) note_file   )   !=   NULL

      )

{


strcat ( that_result, note_buffer );


}










fclose ( note_file);


}








}