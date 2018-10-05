






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


 first we found a nearest word

 then found word before it

 then found " to be clearif that is a note

 if not we drop it





 the main things

*/






/*

 this is for big search

*/


 char * note_message;

/*

 int    number_word;

*/




/*

 this is for search to find if it is a note

*/



 char * note_pointer;

/*

 int    note_number;

*/










/*

 this is to save word

*/

 char note_flag [ 1 ] [ 1 ] [ 4 ];


 strcpy ( note_flag [ 0 ] [ 0 ], "/" );
 strcat ( note_flag [ 0 ] [ 0 ], "/" );

 strcpy ( note_flag [ 0 ] [ 1 ], "\n" );

/*

 strcpy ( note_flag [ 1 ] [ 0 ], "#"  );
 strcpy ( note_flag [ 1 ] [ 1 ], "\n" );

*/

 strcpy ( note_flag [ 1 ] [ 0 ], "/" );
 strcat ( note_flag [ 1 ] [ 0 ], "*" );

 strcpy ( note_flag [ 1 ] [ 1 ], "*" );
 strcat ( note_flag [ 1 ] [ 1 ], "/" )
















 int i = 0;

 for (  i = 0;  i < 2;  i ++  )

  {








/*

 this is for clear a word at once

*/




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

 found a word could be note

*/


/*

 if (

      strstr ( that_message, note_flag [ i ] [ 0 ] ) != NULL

    )

  {

*/





/*

 this is to find if it had srearch before

*/


/*

 if ( * note_message == '\n' )

  {

 * note_message = note_flag [ number_word ] [ 0 ] [ 0 ];

  }

*/



/*

 change flag

*/

/*

 number_word = i;

 note_message = strstr ( that_message, note_flag [ i ] [ 0 ] );

*/




/*

 it could be a note we found

 so find " before it judge by number of it

*/


/*

 * note_message = '\n';

*/




/*

 this is to find if it is in note

*/


/*

 do

  {

 note_pointer  =  strstr ( that_message, "\"" );

 if ( note_pointer != NULL )

  {

 note_number ++;

  }

  }  while  ( note_pointer != NULL )

*/







/*

 this is to drop

*/

 if (

      NULL == strstr ( note_message, note_flag [ i ] [ 1 ] )

    )


  {

 strcpy (
          note_message,
          note_message + strlen ( note_flag [ i ] [ 0 ] )
        );

  }




 else

  {

 strcpy (

          note_message,

          strstr ( note_message, note_flag [ i ] [ 1 ] ) + strlen ( note_flag [ i ] [ 1 ] )

        )

  }









/*

 this is for return

*/


/*

 * note_message = note_flag [i] [0] [0];

*/



  }





  }  while  (  note_message != NULL  )






/*

 loop for word "for"

*/

  }







 return 0;

  }


