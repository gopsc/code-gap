


#include  <stdio.h>

#include  <string.h>



 void  *   secret_drop_blank  (
                                 char * that_message
                              )

  {










void  *   note_message   =   strstr  (  that_message,  "\n\n"  );









while   (   note_message  !=  NULL   )



{


strcpy  (  note_message,  note_message + 1  );





note_message   =   strstr  (  that_message,  "\n\n"  );


}













if
    (
      that_message  [  strlen ( that_message )  ]   ==   '\n'
    )



{

that_message   [  strlen ( that_message )  ]   =   '\0';

}















 return  NULL;


  }
