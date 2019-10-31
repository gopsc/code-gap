



#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   append_fst_leaves_system_trees_files

(

const void * that_words_name,

const void * that_words_content

)


{







if  (  is_fst_leaves_system_trees_files ( that_words_name )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  )  )

{

return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_no"  );

}



else if  (  is_fst_leaves_system_trees_files ( that_words_name )  ==  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  )  )

{


FILE *  note_files_append  =  fopen ( that_words_name, "a" );


fprintf  (  note_files_append,  "%s",  that_words_content  );


fclose ( note_files_append );


return  fish_fst_leaves_lake  (  "that_fst_leaves_lake_existence_yes"  );

}






return  (  "that_fst_leaves_lake_existence_no"  );

}
