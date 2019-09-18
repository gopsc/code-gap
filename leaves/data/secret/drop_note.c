






void  *   secret_drop_note  (
                               char  *   that_message
                            )

{







char  *   note_message;







char  *   note_pointer;








char note_flag [ 2 ] [ 1 ] [ 4 ];



strcpy ( note_flag [ 0 ] [ 0 ], "/" );
strcat ( note_flag [ 0 ] [ 0 ], "/" );

strcpy ( note_flag [ 0 ] [ 1 ], "\n" );



strcpy ( note_flag [ 1 ] [ 0 ], "#"  );
strcpy ( note_flag [ 1 ] [ 1 ], "\n" );



strcpy ( note_flag [ 2 ] [ 0 ], "/" );
strcat ( note_flag [ 2 ] [ 0 ], "*" );

strcpy ( note_flag [ 2 ] [ 1 ], "*" );
strcat ( note_flag [ 2 ] [ 1 ], "/" )
















 int i = 0;

 for (  i = 0;  i < 3;  i ++  )

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


 this could be done at first

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





}   while   (   note_message   !=   NULL   )







}







return 0;

}


