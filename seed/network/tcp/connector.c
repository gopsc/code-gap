





 void * gop_connector ( void * what )

  {






/*

 Standart preparing.






 it will be said

*/

/*

 struct sockaddr_in    note_address;

*/




/*

 could use connection traightly

 maybe for other ways

*/

/*

 int note_return;

*/

 char note_recv [ 10240 ];

 char note_send [ 10240 ];










/*

 Wait the dog start on.

*/

 while (  ! gop_about . flag . start  )


  {

 usleep ( gop_hope . step_connection * 100000 );

  }










/*

 Prepare the information of start.


 dog will load this when dog had started


 and other thing should do this as a lowest time

  so we load it here first time



 maybe we should put them all in one dirent with dog

 ang named load

*/


 strcpy (
          gop_connection . address_ip [ 0 ],
          gop_hope       . address_to
        );


          gop_connection . port [ 0 ]
       =  gop_hope       . port_to;




/*

 prepare the status of network

 maybe i should movethis to ~/network/build.h

*/


/*

 strcpy ( gop_connection.how [ 0 ], "Wait" );

*/

 clean_connection ( 0, "all" );






/*

 this usually is 0 at first, and sop don't clear it, if dog check this, dog can shut it


 then it couldn't be stack


 descriptor for socket

 connection for connection


 let it be -1 is ok

 make it simple

*/

 gop_connection . description [ 0 ] = -1;

 gop_connection . connection [ 0 ] = -1;







/*

 Sometimes when the server close

                the client will be closed.


 then use this

*/

 signal ( SIGPIPE, SIG_IGN );


















/*

 start

*/


 while ( gop_about . flag . main )

  {



/*

 Sleep sometimes when

 the client closed

 & and the main program is running

*/

 if ( ! gop_about . flag . connector )

  {


 usleep ( 100000 );


  }









/*

 start

*/


 else {




/*

 This box is for note saving

*/

 note_save ( "connector", "connector start", "now" );















/*

 go

*/


 while ( gop_about . flag . connector )

  {


/*

 This round for connection

*/








/*

 If there isn't a available ip,
 do       not continue,
 will  be complicated

 connector will be stack here

 and don't move for long time

 :(

*/


 if ( gop_about . network . number <= 1 )


  {

 usleep (  gop_about . hope . step_connection  *  1000000  );

 goto leave;

  }








/*

 Can not connect myself



 check one by one

*/

 int i;

 for (
       i  = 1;
       i <= gop_about . network . number;
       i ++
     )

  {



 if (

      strcmp (

               gop_connection . address_ip [ 0 ],

               gop_about . network . ip [ i ] [ 2 ]

              )
      == 0

/*

 &&   gop_about . flag . sound

*/
    )

  {



 usleep ( gop_about . hope . step_connection  *  1000000 );


 goto leave;

  }


  }













/*


 start



------------------------------------------------------------------------------------
 Prepare the buffer

*/

 struct  sockaddr_in  note_address;


 note_address . sin_family         =  AF_INET;

 note_address . sin_port           =  htons     ( gop_connection . port [ 0 ] );

 note_address . sin_addr . s_addr  =  inet_addr ( gop_connection . address_ip [ 0 ] );






/*

 Creat the socket

 before that we set the description to -1, if we lock there, the dog ckecked this

 just to connection

*/

 gop_connection . descriptor [ 0 ] = socket (
                                              AF_INET,
                                              SOCK_STREAM,
                                              0
                                            );







/*

 If something goes wrong, & it could not creat
  a socket, turn it off,
 we could turn it again from outside

*/

 if (  gop_connection . descriptor [ 0 ]  == -1  )

  {

 gop_about . flag . connector = 0;

 goto leave;

  }








/*

 Connect to the target

*/

 gop_connection . connection [ 0 ]  =  connect (

                                                 gop_connection.descriptor [ 0 ],

                         ( struct sockaddr * ) & note_address,

                                        sizeof ( note_address )

                                               );





/*

 No result wait few secends

*/

 if (  gop_connection . connection [ 0 ]  ==  -1  )

  {

 usleep ( 100000 );




/*

 it doesn't matter if i don't let it goto leave

 but it changes

 we could let it fewer won't let bug come out

*/

 goto leave;

  }








/*

 If got a connection

*/

 else if ( gop_connection . connection   >=  0  )

  {






/*

 fresh the description of connection


 that is it

*/

/*

 gop_connection . connection [ 0 ]  =  number_return;

*/






/*

 Fresh the time pointer

 time pointer is more complicate with connectted

*/

 gop_connection . time [ 0 ]  =  time ( NULL );








/*

 if ths is a new connection, we should set it

*/

 if (

      strcmp ( gop_connection . how [ 0 ], "Wait" )  ==  0

    )

  {





 char note_message [ 128 ];


/*

 New connection, print it


 maybe we could make a type for it then it could display on its little box

*/


 strcpy ( note_message, "connectting to    " );

 strcat ( note_message, gop_connection . address_ip [ 0 ] );


/*

 save note

*/

 note_save ( "connector", note_message, "now" );



/*

 print it out

*/

 strcat ( note_message, "\n" );


 output_print ( "string", note_message );









/*

 prepare the note

 move it on this

*/

/*

 char bufer_note [ 32 ];

*/


/*

 strcpy ( note_message, "connectting to " );

 strcat ( note_message,  gop_connection . address_ip [ 0 ] );

*/



/*

 save the note

 move it upsite

*/

/*

 note_save ( "connector", note_message, "now" );

*/








/*

 set how

*/

 strcpy ( gop_connection . how [ 0 ], "Connectting" );


  }







/*

 it is ( or it is now )

 Old connection, continue talking..



 recive from master first

*/

 recv (

        gop_connection . descriptor [ 0 ],

        note_recv,

        10240,

        0

      );



/*

 The secret code


 when it could

 maybe add to network/message

*/

/*

 secret_decode ( note_recv, "blank" );

*/







/*

 handle this message

*/

 control_message ( 0, note_recv, note_send );








/*

 resolve the secret

*/

/*

 secret_encode ( note_send, "blank" );

*/





/*

 ok send it

*/

 send (
        gop_connection . descriptor [ 0 ],
        note_send,
        10240,
        0
      );



/*

 If clients sleep instead of master,

 It could be balance.

*/
 usleep ( gop_hope . step_connection  *  100000 );







/*

 Close the socket

       and prepare for next

           connection

 and we should clear the description of connection first

  or it could couse a mistake

*/

 gop_connection.connection [ 0 ] = -1;

  }





/*

 this connection has a result

 now close it

*/

 close ( gop_connection . descriptor [ 0 ] );






/*

 If something wrong with the target,

 it's here the program jump to

 over the connectting

*/

 leave:

 sleep ( 0 );


  }










/*

 The round of connection is
 over, it is time to save note

*/

 note_save ( "connector", "Client close", "now" );

  }





/*

 round of main

*/

  }







/*

 if main thing close

 exit it

*/

 pthread_exit ( NULL );


  }
