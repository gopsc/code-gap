






 int secret_drop_note (
                        char * that_message,
                      )

  {






/*

 drop note in message 

 use to read note 



 the main things

*/




 char * note_message;

 char note_flag [2] [1] [4];

 strcpy ( note_flag [0] [0], "//" );
 strcpy ( note_flag [0] [1], "\n" );

 strcpy ( note_flag [1] [0], "#"  );
 strcpy ( note_flag [1] [1], "\n" );

 strcpy ( note_flag [2] [0], "/*"   );
 strcpy ( note_flag [2] [1], "*/\n" );



 int i = 0;

 for (  i = 0; i < 3; i++  )

  {


 do

  {


 note_message  =  strstr ( that_message, note_flag [i] [0] );

 if (
      note_message != NULL
    )

  {

 

  }


  }  while  (  note_message != NULL  )


  }







 return 0;

  }


