




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>




void  *   file_get (
                       const  void  *   that_path,
                              void  *   that_result
                   )

{





FILE  *   note_file   =   NULL;


char   note_buffer   [ 128 ];








strcpy  (  that_result,  ""  );








if   (

         is_file  (  that_path  )  ==  dream_yes

     )

{







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