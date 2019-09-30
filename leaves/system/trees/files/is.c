



#include  <stdio.h>

#include  <sys/stat.h>



void  *   is_file ( const char * that_path )


{








struct stat note_status;










if (

       lstat ( that_path, & note_status ) == 0

   )

{

return dream_yes;

}









else

{

return dream_no;

}





}






