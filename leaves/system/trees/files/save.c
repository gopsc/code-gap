


#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   save_leaves_system_trees_files

(

const void  *   that_path,
   
const void  *   that_words

)
                     
{







void  *   note_count;

note_count  =  malloc  (    sizeof ( int )    );

* ( int * ) note_count  =  1;



void  *   note_path;

note_path  =  malloc  (    strlen ( that_path )  *  sizeof ( char )    );



void  *   note_pointer;








/*

that_path     /.../.../...

note_count     1   2  ...

note_path     /...

*/







while  (    * ( int * ) note_count  !=  0    )

{









strcpy  (  note_path,  that_path  );
    
note_pointer  =  note_path;


    

int i;
    
for  (  i = 0;  i < * ( int * ) note_count;  i++  )

{

  

note_pointer   =   strstr ( note_pointer + 1,  "/"  );




if  ( note_pointer == NULL )

{

* ( int * ) note_count = 0;

}



}







if ( * ( int * ) note_count != 0 )

{


   
( * ( int * ) note_count ) ++;



* ( char * ) note_pointer  =  '\0';



if  (  is_leaves_system_trees_dirents ( note_path )  ==  that_leaves_lake_existence_no  )

{

mkdir  (  note_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH   );
   
}





}








}



free ( note_path );

free ( note_count );












if  (  is_leaves_system_trees_dirents ( that_path )  ==  that_leaves_lake_existence_yes  )

{

return  that_leaves_lake_existence_no;

}





else if  (  is_leaves_system_trees_dirents ( that_path )  ==  that_leaves_lake_existence_no  )

{




void  *   note_file;


note_file  =  fopen  (  that_path,  "w"  );


fprintf  (  note_file,  "%s",  that_words  );


fclose  (  note_file  );




return that_leaves_lake_existence_yes;


}



return that_leaves_lake_existence_yes;

}

