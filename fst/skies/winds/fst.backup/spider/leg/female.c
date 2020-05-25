







 void * gop_connectted ( void * what )


  {







/*

 Declare these variable.





 maybe we shouldn't take it because we have two note buffer named connection and descriptor

*/

/*

 int number_return;

*/


 char note_buffer [ 10240 ];

 char note_address [ 32 ];



 char note_recive [ 4 ] [ 10240 ]

 char note_send [ 10240 ]









/*

 this is for note things of connector


 this for bind

*/


 struct sockaddr_in note_address_in;





/*

 this for accept

*/

 struct sockaddr_in note_address_by;

        socklen_t   note_lenth;
















/*

 clear it ( maybe i should use a single one function to do this )


 and yes

*/

/*

 strcpy ( gop_connection . how [ 1 ], "Wait" );

 strcpy ( gop_connection . how [ 2 ], "Wait" );

 strcpy ( gop_connection . how [ 3 ], "Wait" );


*/


/*

 after this, clean by dog

*/

 clean_network ( 1, "all" );

 clean_network ( 2, "all" );

 clean_network ( 3, "all" );












/*

 Wait for the information getting done.

*/

 while (  ! gop_about . flag . start )

  {

 gop_wait ( 0.1 );

  }













/*

 This line is for the wrong
 when a connection is closed
 &
 it could be useful in networking
 somewhere

*/

 signal ( SIGPIPE, SIG_IGN );

















/*

 Parpering finished,
  then the round could start.

*/

 while (  gop_about . flag . main  )

  {









/*

 this round is for wait it go

*/


 if (  ! gop_about . flag . connectted  )

  {


/*

 sleep some time evrey range

*/

 gop_wait ( 0.1 );


  }











/*

 this round is for get noted when it go

 and get prepare

*/

 else if (  gop_about . flag . connectted  )

  {











/*

 Note this startting.

*/


 note_save ( "connectted", "server start", "now" );











/*

 start



 This round is for
 preparing.







 Create socket

 we do this every time connectted start

 then we don't need dog to load this

 and could restart every time


 but sometimes the socket won't close

*/

 gop_connection . port[1]  =  port_this;

 gop_connection . descriptor[1]  =  socket (
                                             AF_INET,
                                             SOCK_STREAM,
                                             0
                                           );
/*

 if socket creat failled ?

*/






/*

 Setting the
 socket attribution

*/

 note_address_in . sin_family         =  AF_INET;

 note_address_in . sin_port           =  htons ( gop_connection . port [ 1 ] );


/*

 this is for bindind any address for connect in

*/

 note_address_in . sin_addr . s_addr  =  htonl ( INADDR_ANY );


 note_lenth = sizeof ( note_address_by );






/*

 If failled, close it

*/

 if ( gop_connection.descriptor[1] == -1 )

  {






 output_print ( "string", "got wrong to create at connectted\n" );




/*

 socket create failed don't need to close it

*/


 gop_about . flag . connectted = 0;



/*

 turn out

 socket create failed doesn't neet to close it

*/

 continue;



  }









/*

 When a server closed
 something ran &the
 ip address
 will be not avalable for
 minutes
 use this is OK

*/

 int note_set = 1;

 if (

      setsockopt (
                   gop_connection . descriptor [ 1 ],
                   SOL_SOCKET,
                   SO_REUSEADDR,
                 & note_set,
          sizeof ( note_set )

                )
      == -1
    )

  {




/*

 maybe the socket should be closed

*/

 close ( gop_connection . descriptor [ 1 ] );


 output_print ( "string", "got wrong to set at connectted\n" );


 gop_about . flag . connectted = 0;


 continue;



  }










/*

 P.S.
     the networking is
        another program &
     when this is shutting down
          that would be still running.

-----------------------------------------------------------------------------------
 Starting this program binding.

*/


 if (

      bind (

                                     gop_connection . descriptor [ 1 ],

             ( struct sockaddr * ) & note_address_in,

                            sizeof ( note_address_in )

           )

      == -1

    )

  {


 output_print ( "string", "got wrong to bind at connectted\n" );


 close ( gop_connection . descriptor [ 1 ] );


 gop_about . flag . connectted = 0;


 continue;

  }




/*

-----------------------------------------------------------------------------------

*/


 if (

      listen (

               gop_connection . descriptor [ 1 ],

               3

             )
      == -1

    )

  {

 output_print ( "string" "got wrong to listen at connectted\n" );


 close ( gop_connection . descriptor [ 1 ] );


 gop_about . flag . connectted = 0;


 continue;

  }












/*

 prepare is finished












 prepare finish

 then we just accept and connect ?






 Loop start.

*/

 while (  gop_about . flag . connectted  )

  {














/*

 Accept connection.

*/

 gop_connection . connection [ 4 ] = accept (

                                              gop_connection . descriptor [ 1 ],

                      ( struct sockaddr * ) & note_address_by,

                                            & note_lenth

                                            );





/*

 start value is 0

 if it is 0 or -1

 it means connection have not start

*/

 if ( gop_connection . connection [ 4 ] == -1 )

  {


/*

 When the mode of no-wait
   is opening.
   do not print
 accepting error message

 maybe any problom

*/

/*

 perror ("");

*/



 output_print ( "string", "got wrong to accept at connectted\n" );


 gop_wait ( 0.1 );


 continue;


  }






/*

 successed


 fresh the time [ 4 ] first

 it's used to note the all of the connection latest time

 smile connection need this

 smile connection is where number 4

*/

 gop_connection . time [ 4 ] = time ( NULL );











/*

 fresh the description of connection

 u could be stack when smiled

 because we havn't give it a site  we use 5

 cause the connector's connection descriptor is network descriptor

 and set another next time

*/

/*

 gop_connection.connection [ 4 ] = number_return;

*/






/*

 Note the ip

*/

 strcpy (

          note_address,

          inet_ntoa ( address_by . sin_addr )

        );






/*

 Connection message is already here.
 Find the site for this.
 Find is there it's site
      or a free     site.

*/

 int note_free = 0;
 int note_site = 0;





/*

 find free site.

*/

 int i;

 for     (  i = 1; i <= 3; i ++  )

  {


 if (

      strcmp ( gop_connection . address_ip [ i ], "" ) == 0

    )

  {

 note_free = i;

 break;

  }


  }






/*

 Find it's site.

*/

 for (  i = 1;  i <= 3;  i ++ )

  {


 if  (

       strcmp ( gop_connection . address_ip [ i ], note_address ) == 0

     )

  {

 note_site = i;

 break;

  }


  }






/*

 If it's a new site.
    set a site for it.

 If sites' full,
    smile to it.


 else if it is already have a site connect to it

*/

 if (  note_free != 0   &&   note_site == 0  )

  {

 note_site = note_free;

  }











 else if (  note_site == 0   &&   note_free == 0  )

  {



/*

 Note this smile.


 copy it for once

*/

/*

 output_print ( "string", "Smile to           "              );
 output_print ( "string",  inet_ntoa ( address_by.sin_addr ) );
 output_print ( "string", "\n"                               );

*/

 strcpy ( note_buffer, "Smile to " );

 strcat ( note_buffer, inet_ntoa ( note_address_by . sin_addr ) );


 note_save ( "connectted", note_buffer, "now" );



 strcat ( note_buffer, "\n" );


 output_print ( "string", note_buffer );


 strcpy ( note_buffer, "" );







/*

 Preparing for this smile.

*/

 strcpy ( note_send, "This is gop station." );

 strcat ( note_send, "\n"     );

 strcat ( note_send, "Smile." );

 strcat ( note_send, "\n"     );




/*

 Find the connectting device
      who can be connectted

*/

 int note_smile = -1;

 srand ( time ( NULL ) );

 note_smile =  1 + 4 * (  rand()  /  ( RAND_MAX + 1.0 )  );



/*

 maybe we should find the connectors who is not Arduino or stm32 couldn't be connnector




 Add it's ip to smile message.

*/

 strcat (
          note_send,
          gop_connection . address_ip [ note_smile ]
        );







/*

 Send it
 and
 Recive the returned message.


 make a secret

*/


/*

 secret_encode ( buffer_send, "blank" );

*/


 send (
        gop_connection . connection [ 4 ],
        note_send,
        10240,
        0
      );

 recv (
        gop_connection . connection [ 4 ],
        note_recive [ 0 ],
        10240,
        0
      );


 gop_wait ( step_connection );












/*

 close this one

*/

 close ( gop_connection . connection [ 4 ] )






/*

 clean the description of connection

*/

 gop_connection . connection [ 4 ] = 0;





/*

 next listen

*/
 continue;


  }








/*

 After findind site
       for this connection,
 preparing  for connection.



 if it not smile

 the value won't be 0

*/

 if ( number_site != 0 )


  {











/*

 we have a site

 we could fresh the connection descriptor


 even if it is a old site

 it has been close last time

*/

 gop_connection . connection [ number_site ]  =  gop_connection . connection [ 4 ];


 gop_connection . connection [ 4 ]  =  0;








/*

 Update the time pointer,
 and the connecttion ip

*/

 gop_connection . time [ number_site ]  =  time ( NULL );



/*

 ip address

*/

 strcpy ( gop_connection . address_ip [ number_site ], note_address );














/*

 If is's new ,
  notice and
  note  this connection.

*/

 if (

      strcmp ( gop_connection . how [ number_site ], "Wait" ) == 0

    )

  {




/*

 print and note for once

*/


/*

 output_print ( "string", "connectted  by    "  );
 output_print ( "string",  gop_connection . address_ip [ number_site ] );
 output_print ( "string", "\n" );

*/


 strcpy ( note_buffer, "connectted by "  );

 strcat ( note_buffer, gop_connection . address_ip [ number_site ] );


 note_save ( "connectted", note_buffer, "now" );



 strcat ( note_buffer, "\n" );


 putput_print ( "string", note_buffer );







 strcpy ( note_recv [ number_site ], "" );

 strcpy ( gop_connection . how [ number_site ], "Connectted" );


  }







/*

 make the secret maybe


 for last conversation

*/

/*

 secret_decode   ( note_recv [ number_site ], "blank" );

*/




/*

 control the secret

*/

 control_message ( note_site, note_recv [ note_site ], note__send );







/*

 resolve this secret

*/

/*

 secret_encode ( note_send, "blank" );

*/






/*

 Execute it.

*/

 send (
        gop_network . connection [ number_site ],
        note_send,
        10240,
        0
      );


 recv (
        gop_network . connection [ number_site ],
        note_recv [ number_site ],
        10240,
        0
      );







/*

 Do note wait,
 or get clients connectting
 no banance


*/

/*

 gop_wait ( step_connection );

*/









/*

 close it

*/

 close ( gop_connection . connection [ number_site ] );




/*

 clear the connection description

*/

 gop_connection . connection [ number_site ] = 0;




/*

 close it

*/

/*

 close ( number_return );

*/







/*

 this is for accept and if we have a site

*/

  }





/*

 this is for round of accept

*/

  }








/*

 if the connectted closed

 save this note

*/

 note_save ( "connectted", "server close", "now" );





/*

 close the network

*/

 close ( gop_connection . descriptor [ 1 ] );










/*

 this is for if flag of it is open

*/

  }



/*

 this is for if main flag is open

*/

  }








 pthread_exit ( NULL );


  }
