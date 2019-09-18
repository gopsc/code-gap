














void  *   clean_spider   (

                             void  *   that_spider

                             void  *   that_site,

                             void  *   that_type

                         )


{






if   (
         strcmp   (     ( char * )  that_type,     "all"     )    ==    0
     )

{


strcpy   (    ( char * ) that_spider . how       [  * ( int * ) that_site  ],      "wait"      );

strcpy   (    ( char * ) that_spider . command   [  * ( int * ) that_site  ],      ""          );



clean_spider ( that_site, "update" );







/*

 not clean the address for connector

  these will keep to save the address we go to

*/

 if (  that_site != 0  )

  {


 strcpy ( gop_connection . address_ip [ that_site ],  ""    );

          gop_connection . port       [ that_site ] = 0      ;


  }






/*

 now return it

*/



 return 0;






/*

 it is for if

*/

  }


















 else if (  strcmp ( that_type, "sopi" ) == 0  ) {


/*

 the clean for sopi changing

*/

 strcpy ( gop_connection . command [ that_site ],  "" );




/*

 it is coming,,

*/

/*

 strcpy ( gop_connection . audio [ that_site ],  "" );
 strcpy ( gop_connection . video [ that_site ],  "" );

*/



/*

 the update end

*/

 clean_connection ( that_site, "update" );

/*

 strcpy ( gop_connection . update      [ that_site ],  "" );
          gop_connection . step_update [ that_site ] = 0   ;
          gop_connection . flag_update [ that_site ] = 0   ;
*/





/*

 get sopi

 fresh that

*/

 if      (
           strcmp (  gop_connection . how [ that_site ],  "Connectted" )  ==  0
         )

  {

 strcpy ( gop_connection . how [ that_site ], "Sop" );

 return 0;

  }




 else if  (
            strcmp  (  gop_connection . how [ that_site ],  "Sop"  )  ==  0
          )

  {

 strcpy ( gop_connection . how [ that_site ], "Connectted" );

 return 0;

  }




 else if (
           strcmp  (  gop_connection . how [ that_site ],  "Connectting"  )  ==  0
         )

  {

 strcpy ( gop_connection . how [ that_site ], "Sopi" );

 return 0;

  }



 else if (
           strcmp (  gop_connection . how [ that_site ],  "Sopi"  )  ==  0

         )

  {

 strcpy ( gop_connection . how [ that_site ], "Connectting" );

  return 0;

  }




/*

 here

*/



 }














/*

 it's in plan should, sometimes

 somethong went to this and return a zero


 it could be last of it

*/


/*

 return -1;


 }

*/
















 else if  (
            strcmp ( that_type, "update" ) == 0
          )

  {

/*

 we just don't wanna update this time

 just clean all the update things

*/

 strcpy ( gop_connection.update      [ that_site ],  "" );

          gop_connection.step_update [ that_site ] = 0;

          gop_connection.flag_update [ that_site ] = 0;

 return 0;

  }










/*

 let them quit

*/

 else if  (
            strcmp ( that_type, "quit"  )  ==  0
          )

  {





/*

 it could be accepting or sending

 for connectted

 it is two number point it

 and it's complicate


 let the connection quit

*/

 if  (
       gop_connection . connection [ that_site ]  !=  -1
     )

  {

 shutdown ( gop_connection . connection [ that_site ], SHUT_RDWR );

  }




/*

 let the socket quit

*/


 if  (  that_site == 0  )

  {

 shutdown ( gop_connectio n .descriptor [ 0 ], SHUT_RDWR );

  }



 else if ( that_site < 4 )

  {

 shutdown ( gop_connection . descriptor [ 1 ], SHUT_RDWR );

  }




 return 0;

  }









/*

 something get in

*/

 return -1;

  }



,











