




#include  <stdlib.h>

#include  <sys/stat.h>


void *  write_fst_things_trees_files

(

void *  that_words_names,

void *  that_words_contents

)

{

void  *   note_files_saved  =  fopen  (  that_words_names,  "w"  );


fprintf  (  note_files_saved,  "%s",  that_words_contents  );


fclose  (  note_files_saved  );



return  0;

}






