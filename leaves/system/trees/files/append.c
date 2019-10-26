



#include  <stdio.h>

#include  <string.h>

#include  <sys/stat.h>



void  *   append_leaves_system_trees_files

(

const void * that_path,

const void * that_words

)


{







if  (  is_leaves_system_trees_files ( that_path )  ==  that_leaves_lake_existence_no  )

{

return that_leaves_lake_existence_no;

}



else if  (  is_leaves_system_trees_files ( that_path )  ==  that_leaves_lake_existence_yes  )

{

FILE *  note_file  =  fopen ( that_path, "a" );


fprintf  (  note_file,  "%s",  that_words  );


fclose ( note_file );


return that_leaves_lake_existence_yes;

}

}
