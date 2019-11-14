





void *  drop_fst_leaves_lake

(  void *  that_words_names  )

{








void  *   note_numbers_counts;


note_numbers_counts   =   create_fst_things_data  (  1  *  sizeof ( int )  );




void  *   note_numbers_switches;

note_numbers_switches   =  create_fst_things_data  (  1  *  sizeof ( int )  );

* ( int * ) note_numbers_switches   =   0;


  
  
void  *   note_numbers_results;

note_numbers_results   =   create_fst_things_data  (  1  *  sizeof ( int )  );


  
  
  
  
for

(

* ( int * ) note_numbers_counts   =   1;

* ( int * ) note_numbers_counts  <=   * ( int * ) that_fst_leaves_lake [ 0 ] [ 1 ];

* ( int * ) note_numbers_counts   =   * ( int * ) note_numbers_counts   +   1

)

{







if  (  * ( int * ) note_numbers_switches   ==   0  )

{



compare_fst_things_data_words  (  that_words_names,  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ],  note_numbers_results  );

  
if  (   note_numbers_results   ==   0   )

{


free_fst_things_data  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 0 ]  );

free_fst_things_data  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ] [ 1 ]  );

free_fst_things_data  (  that_fst_leaves_lake  [ * ( int * ) note_numbers_counts ]  );


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







free_fst_things_data  (  note_numbers_counts  );

free_fst_things_data  (  note_numbers_switches );

return  that_fst_leaves_lake;

}



