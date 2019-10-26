



#include  <stdio.h>

#include  <sys/stat.h>



void  *   is_leaves_system_trees_files  (  const void  *   that_path  )

{








void  *   note_status;


note_status  =  malloc  (  sizeof ( struct stat )  );






if  (    lstat  ( that_path, note_status )  !=  0    )

{

free ( note_status );

return that_leaves_lake_existence_no;

}


    
    

else

{










if  (    S_ISREG  (    (  * ( struct stat * )  note_status  )  . st_mode     )  ==  0    )

{

free ( note_status );

return that_leaves_lake_existence_no;

}

    
    
    
else
    
{

free ( note_status );

return  that_leaves_lake_existence_yes;

}







}

}






