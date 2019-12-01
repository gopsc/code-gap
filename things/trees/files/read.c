


#include  <stdlib.h>

#include  <string.h>

#include  <sys/stat.h>




void *  read_fst_things_trees_files

(  

void *  that_words_names,

void *  that_words_results

)



{


* ( char * ) that_words_results  =  '\0';









void  *   note_files_got;






void  *   note_words_read;


note_words_read  =  malloc  (  2  *  sizeof ( char )  );







void *  note_numbers_counts;


note_numbers_counts  =  malloc  (  1  *  sizeof ( int )  );













note_files_got   =   fopen  (  that_words_names,  "r"  );





while  (    fgets  (   note_words_read,   2,   ( FILE * ) note_files_got   )   !=   NULL    )

{



for

(

* ( int * ) note_numbers_counts   =   0;

* ( char * ) (  that_words_results  +  * ( int * ) note_numbers_counts  )   !=   '\0';

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{

}


that_words_results  =  realloc (  that_words_results,   ( 1  +  1  +  strlen ( that_words_results ) )  *  sizeof ( char )  );


*  ( char * )  (   that_words_results   +   * ( int * ) note_numbers_counts   )   =   * ( char * ) note_words_read;

*  ( char * )  (   that_words_results   +   * ( int * ) note_numbers_counts   +   1   )   =   '\0';



}







fclose  (  note_files_got  );

free  (  note_words_read  );

free  (  note_numbers_counts  );


return 0;

}
