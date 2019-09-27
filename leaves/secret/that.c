









#include  <stdio.h>






void  *   that_secret (
                               char  *   that_message,
                         const char  *   that_type
                      )

{









if  (
       strcmp   (   that_type,   "drop_blank"   )    ==    0
    )

{


secret_drop_blank ( that_message );

return dream_yes;


}











else

{


return dream_no;


}







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
