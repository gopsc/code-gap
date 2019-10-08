




#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   is_leaves_system_trees_dirents

(  const void  *   that_path  )

{













/*

struct   stat   note_status;

*/

void  *   note_status;


note_status  =  malloc  (  sizeof ( struct stat )  );










if

(



lstat (  that_path,  note_status  )  ==  0



)

{








if




(
   




S_ISDIR

(


( * ( struct stat * ) note_status )  . st_mode


)

!=  0




)






{

free ( note_status );

return  that_leaves_dream_existence_yes;

}










else

{

free ( note_status );

return that_leaves_dream_existence_no;

}





}











else

{


free ( note_status );

return   that_leaves_dream_existence_no;


}




}





