



// doing with message



 int secret_drop_blank (
                         char * that_message,
                       )

  {




// clean words







 char *  note_message  =   strstr ( that_message, "\n\n" );





 while ( note_message != NULL )

  {

 strcpy ( note_message, note_message + 1 );

 note_message = strstr ( that_message, "\n\n" );

  }











// clean blank type at last




 if (
      * that_message [ strlen ( that_message ) ] == '\n'
    )



  {

 * that_message [ strlen ( that_message ) ] = '\0';

  }













// here



 return 0;


  }
