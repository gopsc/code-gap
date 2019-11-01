


#include  <stdlib.h>

#include  <sys/stat.h>




void *  read_fst_things_trees_files

(  

void *  that_words_name,

void *  that_words_result

)



{


* ( char * ) that_words_result  =  '\0';









void  *   note_files_get;






void  *   note_words_read;


note_words_read  =  malloc  (  2  *  sizeof ( char )  );







void *  note_numbers_count;


note_numbers_count  =  malloc  (  1  *  sizeof ( int )  );














note_files_get   =   fopen  (  that_words_name,  "r"  );





while  (    fgets  (   note_words_read,   2,   ( FILE * ) note_files_get   )   !=   NULL    )

{



for

(

* ( int * ) note_numbers_count   =   0;

* ( char * ) (  that_words_result  +  * ( int * ) note_numbers_count  )   !=   '\0';

* ( int * ) note_numbers_count   =   * ( int * ) note_numbers_count   +   1

)

{

}



that_words_result  =  realloc (  that_words_result,   ( 1  +  1  +  strlen ( that_words_result ) )  *  sizeof ( char )  );


*  ( char * )  (   that_words_result   +   * ( int * ) note_numbers_count   )   =   * ( char * ) note_words_read;

*  ( char * )  (   that_words_result   +   * ( int * ) note_numbers_count   +   1   )   =   '\0';



}







fclose  (  note_files_get  );

free  (  note_words_read  );

free  (  note_numbers_count  );


return 0;

}
