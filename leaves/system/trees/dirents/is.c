




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

return  that_leaves_dream_existence_yes;

}






else

{

return that_leaves_dream_existence_no;

}







}











else

{


return   that_leaves_dream_existence_no;


}


}





