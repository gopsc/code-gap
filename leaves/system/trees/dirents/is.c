




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



int   is_dirent   (  const char  *   that_path  )

{



struct   stat   note_status;





if (
      lstat  (  that_path,  & note_status  )  ==  0
   )

{


return   S_ISDIR ( note_status . st_mode )  !=  0;


}






else

{


return 1;


}


}








/*

 maybe we could use it in update

*/

 int is_special_dir ( const char * that_path )

  {

    return  strcmp ( that_path, "." ) == 0  ||  strcmp ( that_path, ".." ) == 0;}
