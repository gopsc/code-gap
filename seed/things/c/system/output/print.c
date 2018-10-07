


 int output_print (

                    const char * that_type,

                    const char * that_words

                  )

  {



/*


 maybe we could output to note and display them


*/



 if  (  ! gop_about . flag . deamon  )


  {


 if  (  strcmp ( that_type, "string" )  ==  0  )


  {



 printf ( "%s", that_words );



  }




 if  (  strcmp ( that_type, "int" )  ==  0  )


  {


 printf  (  "%d",  * ( int * ) that_words );


  }





 if  (  strcmp ( that_type, "long" )  ==  0  )

  {

 printf  (  "%ld",  * ( long * ) that_words );

  }




 if  (  strcmp ( that_type, "float" )  ==  0  )


  {

 int buffer_number;

 printf  (  "%f",  * ( float * ) that_words );

  }




 if  (  strcmp ( that_type, "double" )  ==  0  )


  {

 printf  (  "%lf",  * ( double * ) that_words  );


  }


  }









/*

 save to note 

 if we run background

*/


 else if  (  gop_about . flag . deamon  )


  {



 FILE *  buffer_file  =  fopen ( "/opt/TxL_deamon.note", "a" );




 if  (  strcmp ( that_type, "string" )  ==  0  )

  {

 fprintf  (  buffer_file,  "%s",  that_words );

  }




 if  (  strcmp ( that_type, "int" )  ==  0  )

  {

 fprintf  (  buffer_file,  "%d",  * ( int * ) that_words  );

  }



 if  (  strcmp ( that_type, "long" )  ==  0  )


  {

 fprintf  (  buffer_file,  "%ld",  * ( long * ) that_words  );

  }



 if  (  strcmp ( that_type, "float" )  ==  0  )

  {

  fprintf  (  buffer_file,  "%f",  * ( float * ) that_words  );

  }


 if  (  strcmp ( that_type, "double" )  ==  0  )

  {

 fprintf  (  buffer_file,  "%f",  * ( double * ) that_words  );

  }




 fclose( buffer_file );


  }





  }
