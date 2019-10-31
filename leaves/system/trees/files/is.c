



#include  <stdio.h>

#include  <sys/stat.h>



void  *   is_fst_leaves_system_trees_files

(  const void  *   that_words_path  )

{








void  *   note_struct_status;


note_struct_status  =  malloc  (  sizeof ( struct stat )  );






if  (    lstat  ( that_words_path, note_struct_status )  !=  0    )

{

free ( note_struct_status );

return   fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}


    
    

else

{










if  (    S_ISREG  (    (  * ( struct stat * )  note_struct_status  )  . st_mode     )  ==  0    )

{

free ( note_struct_status );

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}

    
    
    
else
    
{

free ( note_struct_status );

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  );

}







}






}






