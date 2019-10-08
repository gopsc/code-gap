


#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   save_leaves_system_trees_files

(

   const void  *   that_path,
   
   const void  *   that_words

)
                     
{





FILE  *   buffer_file;


int   buffer_count  =  1;


char  buffer_path  [ 64 ];


char  *   pointer_path;











while  (  buffer_count  !=  0  )
    
{










strcpy  (  buffer_path,  that_path  );
    
pointer_path  =  buffer_path;


    

int i;
    
for  (  i = 0;  i < buffer_count;  i++  )
    
{

  

pointer_path   =   strstr ( pointer_path + 1,  "/"  );


if ( pointer_path == NULL )

{

buffer_count = 0;

/*

count end, to save

*/

}



}







if ( buffer_count != 0 )

{

/*

next dirent

*/

buffer_count ++;

*  pointer_path  =  '\0';



if (  is_leaves_system_trees_dirents ( buffer_path )  ==  that_leaves_dream_existence_no  )

{
 
mkdir   (  buffer_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH   );

}


}








}













buffer_file  =  fopen  (  that_path,  "w"  );


fprintf  (  buffer_file,  "%s",  that_words  );


fclose  (  buffer_file  );







return that_leaves_dream_existence_yes;

}

