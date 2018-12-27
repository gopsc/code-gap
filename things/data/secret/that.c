

 int secret (
                    char *  that_message,
              const char *  that_type
            )

  {





/*

 doesn't need it

 let it go

*/


/*

 if  (  strcmp ( that_type, "blank" )  ==  0  )

  {

 return 0;

  }

*/

 if  (
       strcmp ( that_type, "sum" ) == 0
     )

  {

 secret_sum ( that_message );

 return 0;

  }



 else if (
           strcmp ( that_type, "drop_note" ) == 0
         )

  {

 secret_drop_note ( that_message );

 return 0;

  }



 else if (
           strcmp ( that_type, "drop_blank" ) == 0
         )

  {

 secret_drop_blank ( that_message );

 return 0;

  }




/*

 doesn't match anyone of it

*/


 return -1;

  }








/*

 they're one thing

*/


/*

 int secret_encode (
                             char * that_message,
                       const char * that_type
                   )

  {






 else if ( strcmp(that_type, "blank") == 0 )

  {

 return 0;

  }



 return -1;

  }

*/
