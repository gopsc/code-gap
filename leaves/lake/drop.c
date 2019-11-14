


#include  <stdlib.h>

#include  <string.h>




void *  drop_fst_leaves_lake

(  void *  that_words_names  )

{








void *  note_numbers_counts;


note_numbers_counts   =   create_fst_things_data  (  1  *  sizeof ( int )  );




void *  note_numbers_switches;

note_numbers_switches   =  create_fst_things_data  (  1  *  sizeof ( int )  );

* ( int * ) note_numbers_switches   =   0;






for

(

* ( int * ) note_numbers_counts   =   1;

* ( int * ) note_numbers_counts  <=   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ];

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{







if  (  * ( int * ) note_numbers_switches   ==   0  )

{




if  (   strcmp  (  that_words_names,  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ]  )   ==   0   )

{


free  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ]  );

free  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]  );

free  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ]  );


* ( int * ) note_numbers_switches  =  1;


}

}





else if  (  * ( int * ) note_numbers_switches  ==  1  )

{

that_fst_leaves_lake [ * ( int * ) note_numbers_counts  -  1 ]   =   that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ];

}


}


  
  
  
  
  
  

if  (  * ( int * ) note_numbers_switches   ==   1  )

{

* ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   =   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ]   -   1;

that_fst_leaves_lake   =   realloc  (  that_fst_leaves_lake,  ( 1  +  * ( int * ) that_fst_leaves_lake  [ 0 ] [ 1 ] )  *  sizeof ( void * )  );


}







free  (  note_numbers_counts  );

free  (  note_numbers_switches );

return  that_fst_leaves_lake;

}



