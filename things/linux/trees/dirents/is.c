

#include  <stdlib.h>

#include  <sys/stat.h>




int   is_fst_things_trees_dirents


(  void *  that_words_name  )



{








void  *   note_struct_status;


note_struct_status  =  malloc  (  sizeof ( struct stat )  );










if  (    lstat (  that_words_name,  note_struct_status  )  ==  0    )

{


   
   
if  (    S_ISDIR  (        ( * ( struct stat * ) note_struct_status )  . st_mode       )  !=  0    )



{

free ( note_struct_status );

return  0;

}




}




return 1;

}
