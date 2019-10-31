




#include  <stdlib.h>

#include  <sys/stat.h>


void *  save_fst_things_trees_files

(

void *  that_words_name,

void *  that_words_content

)

{

void  *   note_files_save  =  fopen  (  that_words_name,  "w"  );


fprintf  (  note_files_save,  "%s",  that_words_content  );


fclose  (  note_files_save  );



return  0;

}






