





#include  <stdlib.h>

#include  <sys/stat.h>




void *  is_fst_things_trees_files 

(

void *  that_words_names,

void *  that_numbers_results

)



{




void  *   note_structures_status;


note_structures_status  =  malloc  (  sizeof ( struct stat )  );






if  (    lstat  ( that_words_names, note_structures_status )  ==  0    )

{





if  (    S_ISREG  (    (  * ( struct stat * )  note_structures_status  )  . st_mode     )  !=  0    )

{


* ( int * ) that_numbers_results   =   0;


free ( note_structures_status);

return  0;

}



}




* ( int * ) that_numbers_results   =   1;


free  ( note_structures_status );
    
return 0;

}







