





#include  <stdlib.h>

#include  <sys/stat.h>




void *  is_fst_things_trees_files 

(

void *  that_words_name,

void *  that_numbers_result

)



{




void  *   note_struct_status;


note_struct_status  =  malloc  (  sizeof ( struct stat )  );






if  (    lstat  ( that_words_name, note_struct_status )  ==  0    )

{





if  (    S_ISREG  (    (  * ( struct stat * )  note_struct_status  )  . st_mode     )  !=  0    )

{


* ( int * ) that_numbers_result   =   0;


free ( note_struct_status);

return  0;

}



}




* ( int * ) that_numbers_result   =   1;


free  ( note_struct_status );
    
return 0;

}







