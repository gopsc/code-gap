






 int secret_drop_note (
                        char * that_message,
                      )

  {






/*

 drop note in message

 use to read note



 warnning :

 this could just drop note in a string words

 so we just drop things just like ~/seed/seed.note

 but we have ways to finish this problem



 the main things

*/




 char * note_message;

 char * note_pointer;

 int    note_number;


 char note_flag [2] [1] [4];

 strcpy ( note_flag [0] [0], "//" );
 strcpy ( note_flag [0] [1], "\n" );

 strcpy ( note_flag [1] [0], "#"  );
 strcpy ( note_flag [1] [1], "\n" );

 strcpy ( note_flag [2] [0], "/*" );
 strcpy ( note_flag [2] [1], "*/" );



 int i = 0;

 for (  i = 0; i < 3; i++  )

  {


 do

  {




 note_message  =  strstr ( that_message, note_flag [i] [0] );


/*

 found it

 go to judge and drop

*/

 if (
      note_message != NULL
    )

  {




/*

 it could be a note we found

 so find " before it judge by number of it

*/

 * note_message = '\n';




 do

  {

 note_pointer  =  strstr ( that_message, "\"" );

 if ( note_pointer != NULL )

  {

 note_number ++;

  }

  }  while  ( note_pointer != NULL )




 * note_message = note_flag [i] [0] [0];

  }




  }  while  (  note_message != NULL  )






/*

 loop for word "for"

*/

  }







 return 0;

  }


