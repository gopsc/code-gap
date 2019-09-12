






#include  <stdio.h>

#include  <string.h>











int secret_sum
               (

                 char * that_message

               )

  {





 
/*

 prepare it

*/

 
 int number_length  =  strlen ( that_message );

 int number_sum     = 0;













/*

 sum them 

*/


 int i;

 for (
       i  = 0;
       i <= number_length;
       i ++ 
     )

  {



 number_sum  +=  ( int ) that_message [ i ];


  }











 snprintf (

            that_message,



/*

            sizeof ( that_message )  /  sizeof ( char )  -  1,

*/


/*

 got a path so can't get how bit the words are 

*/


            128,
            "%d", 
            number_sum

          );






 return 0;


  }
