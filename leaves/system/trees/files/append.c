



#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   file_append (

                     const void * that_path,

                     const void * that_words

                  )


{









int  note_count  =  1;


char   note_path [ 64 ];


char * pointer_path;













while  (  note_count  !=  0  )

{







strcpy ( note_path, note_path );


pointer_path   =   note_path;




int i;

for  (  i = 0;  i < note_count;  i ++  )

{




pointer_path  =  strstr ( pointer_path + 1, "/" );



if  (  pointer_path  ==  NULL  )


{






note_count = 0;







}




}








if ( note_count != 0 )

{



note_count ++;



* pointer_path = '\0';




if  (  is_dirent ( note_path )  ==  that_leaves_dream_existence_no  )


{


mkdir  (  note_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH  );


}





}





}


















FILE *  note_file  =  fopen ( that_path, "a" );


fprintf  (  note_file,  "%s",  that_words  );


fclose ( note_file );



return that_leaves_dream_existence_yes;

}
