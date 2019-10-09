


#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   save_leaves_system_trees_files

(

   const void  *   that_path,
   
   const void  *   that_words

)
                     
{





FILE  *   note_file;


int   note_count  =  1;


char  note_path  [ 64 ];


char  *   note_pointer;











while  (  note_count  !=  0  )
    
{










strcpy  (  note_path,  that_path  );
    
note_pointer  =  note_path;


    

int i;
    
for  (  i = 0;  i < note_count;  i++  )
    
{

  

note_pointer   =   strstr ( note_pointer + 1,  "/"  );


if ( note_pointer == NULL )

{

note_count = 0;

/*

count end, to save

*/

}



}







if ( note_count != 0 )

{

/*

next dirent

*/

note_count ++;

*  note_pointer  =  '\0';



if (  is_leaves_system_trees_dirents ( note_path )  ==  that_leaves_dream_existence_no  )

{
 
mkdir   (  note_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH   );

}


}








}













note_file  =  fopen  (  that_path,  "w"  );


fprintf  (  note_file,  "%s",  that_words  );


fclose  (  note_file  );







return that_leaves_dream_existence_yes;

}

