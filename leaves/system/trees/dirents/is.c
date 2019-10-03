




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   is_dirent   (  const void  *   that_path  )

{














struct   stat   note_status;











if (
      lstat  (  that_path,  & note_status  )  ==  0
   )

{








if  (   S_ISDIR ( note_status . st_mode )  !=  0  )

{

return  dream_yes;

}






else

{

return dream_no;

}







}











else

{


return   dream_no;


}


}








/*

 maybe we could use it in update

*/

 int is_special_dir ( const char * that_path )

  {

    return  strcmp ( that_path, "." ) == 0  ||  strcmp ( that_path, ".." ) == 0;}
