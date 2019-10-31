





void *  append_fst_things_trees_files

(

void *  that_words_name,

void *  that_words_content

)

{


FILE *  note_files_append  =  fopen ( that_words_name, "a" );


fprintf  (  note_files_append,  "%s",  that_words_content  );


fclose ( note_files_append );



return  0;

}






