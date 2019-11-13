




#include  <stdlib.h>

#include  <sys/stat.h>


void *  append_fst_things_trees_files

(

void *  that_words_names,

void *  that_words_contents

)

{


FILE *  note_files_appended  =  fopen ( that_words_names, "a" );


fprintf  (  note_files_appended,  "%s",  that_words_contents  );


fclose ( note_files_appended );



return  0;

}






