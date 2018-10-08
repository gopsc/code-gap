







 void * gop_connectted ( void * what )


  {







/*

 Declare these variable.





 maybe we shouldn't take it because we have two note buffer connection and descriptor

*/

/*

 int number_return;

*/

 char buffer_recv [ 4 ] [ 10240 ];

 char buffer_send [ 10240 ];

 char that_buffer [ 10240 ];

 char that_address [ 32 ];







// this is for note things of connector

    struct sockaddr_in address   ;
    struct sockaddr_in address_by;
           socklen_t   lenth     ;






// clear it ( maybe i should use a single one function to do this )

    strcpy( gop_connection.how[1], "Wait" );
    strcpy( gop_connection.how[2], "Wait" );
    strcpy( gop_connection.how[3], "Wait" );















// Wait for the information getting done.

    while ( !information_flag.start ) {

        usleep(100000);}













// This line is for the wrong
// when a connection is closed
// &
// it could be useful in networking
// somewhere

    signal(SIGPIPE, SIG_IGN);






// Parpering finished,
//  then the round could start.

    while ( information_flag.main ) {


        if ( !information_flag.connectted ) {

// sleep some time evrey range

            usleep(100000);}




        else if (  information_flag.connectted ) {


// Note this startting.

            note_save( "connectted", "Server start", "now" );









// This round is for
// preparing.




// Create socket
//
// we do this every time connectted start
//
// then we don't need dog to load this
//
// and could restart every time

            gop_connection.port[1]        = port_this;

            gop_connection.descriptor[1]  = socket   (
                                                       AF_INET,
                                                       SOCK_STREAM,
                                                       0
                                                     );






// Setting the
// socket attribution

            address.sin_family         = AF_INET;
            address.sin_port           = htons(gop_connection.port[1]);
            address.sin_addr.s_addr    = htonl(INADDR_ANY);

            lenth                      = sizeof(address_by);





// If failled, close it

            if ( gop_connection.descriptor[1] == -1 ) {


                perror("Server socket created failled");

                information_flag.connectted = 0;}








// When a server closed
// something ran &the
// ip address
// will be not avalable for
// minutes
// use this is OK

            int number_set = 1;

            if (

                   setsockopt(

                               gop_connection.descriptor[1],
                               SOL_SOCKET,
                               SO_REUSEADDR,
                             & number_set,
                      sizeof ( number_set )

                             )

                   == -1
               ) {

                perror("Server Setting Failled");

                information_flag.connectted = 0;}

// P.S.
//     the networking is
//        another program &
//     when this is shutting down
//          that would be still running.

//-----------------------------------------------------------------------------------
// Starting this program binding.

            if (
                   bind(
                                            gop_connection.descriptor[1],
                         (struct sockaddr*)&address,
                                     sizeof(address)
                       )
                   == -1
               ) {


                perror("Server binding failled");

                information_flag.connectted = 0;}

//-----------------------------------------------------------------------------------

            if (
                   listen(
                           gop_connection.descriptor[1],
                           3
                         )
                   == -1
               ) {

                perror("Server listen failled");

                information_flag.connectted = 0;}

// prepare is filished











// Loop start.

            while ( information_flag.connectted ) {

// Accept connection.

                number_return = accept(
                                                               gop_connection.descriptor[1],
                                       ( struct sockaddr * ) & address_by,
                                                             & lenth
                                      );





                if ( number_return == -1 ) {

// When the mode of no-wait
//   is opening.
//   do not print
// accepting error message
//
// maybe any problom

                    //perror ("");

                    output_print ( "string", "connectted acceptting wrong" );

                    usleep ( 100000 );

                    continue;}






// successed
//
// fresh the time [ 4 ] first
//
// it's used to note the all of the connection latest time
//
// smile connection need this

                gop_connection.time [ 4 ] = time ( NULL );


//
// fresh the description of connection
//
// u could be stack when smiled
//
// because we havn't give it a site
//
// we use 5
//
// cause the connector's connection descriptor is network descriptor
//
// and set another next time

                gop_connection.connection [ 4 ] = number_return;







// Note the ip

                strcpy(
                        that_address,
                        inet_ntoa ( address_by.sin_addr )
                      );






// Connection message is already here.
// Find the site for this.
// Find is there it's site
//      or a free     site.

                int        number_free       = 0;
                int        number_site       = 0;





// find free site.

                int i;

                for     (  i = 1; i <= 3; i ++  ) {

                    if  (  strcmp ( gop_connection.address_ip[i], "" ) == 0  ) {

                        number_free = i;

                        break;}}



// Find it's site.

                for     ( i=1; i<=3; i++ ) {

                    if  (  strcmp ( gop_connection.address_ip[i], that_address ) == 0  ) {

                        number_site = i;

                        break;}}





// If it's a new site.
//    set a site for it.
//
// If sites' full,
//    smile to it.

                if      (  number_free != 0   &&   number_site == 0  ) {

                    number_site = number_free;}




                else if (  number_site == 0   &&   number_free == 0  ) {



// Note this smile.

                    output_print ( "string", "Smile to           "              );
                    output_print ( "string",  inet_ntoa ( address_by.sin_addr ) );
                    output_print ( "string", "\n"                               );

                    strcpy ( that_buffer, "Smile to " );
                    strcat ( that_buffer, inet_ntoa ( address_by.sin_addr ) );

                    note_save ( "connectted", that_buffer, "now" );




// Preparing for this smile.

                    strcpy ( buffer_send, "This is gop station." );
                    strcat ( buffer_send, "\n"     );
                    strcat ( buffer_send, "Smile." );
                    strcat ( buffer_send, "\n"     );




// Find the connectting device
//      who can be be connectted

                    int number_smile = -1;

                    srand ( time ( NULL ) );

                    number_smile =  1 + 4 * (  rand()  /  ( RAND_MAX + 1.0 )  );




// Add it's ip to smile message.

                    strcat ( buffer_send, gop_connection.address_ip [ number_smile ] );






// Send it
// and
// Recive the returned message.


// make a secret

                    secret_encode ( buffer_send, "blank" );


                    send(
                          number_return,
                          buffer_send,
                          10240,
                          0
                        );

                    recv(
                          number_return,
                          buffer_recv [ 0 ],
                          10240,
                          0
                        );


                    usleep ( step_connection * 1000000 );




// clean the description of connection

                    gop_connection.connection [ 4 ] = 0;




// cloes this one

                    close ( number_return );


// next listen

                    continue;}








// After findind site
//       for this connection,
// preparing  for connection.

                if ( number_site != 0 ) {

// we have a site
//
// we could fresh the connection descriptor

                    gop_connection.connection [ 4 ] = 0;

                    gop_connection.connection [ number_site ] = number_return;



// Update the time pointer,
// and the connecttion ip

                    gop_connection.time [ number_site ] = time ( NULL );

                    strcpy ( gop_connection.address_ip [ number_site ], that_address );






// If is's new ,
//  notice and
//  note  this connection.

                    if (  strcmp ( gop_connection.how [ number_site ], "Wait" ) == 0  ) {



                        output_print ( "string", "Connectted  by    "                       );
                        output_print ( "string",  gop_connection.address_ip [ number_site ] );
                        output_print ( "string", "\n"                                       );

                        strcpy ( that_buffer, "Connectted by "                       );
                        strcat ( that_buffer, gop_connection.address_ip [ number_site ] );

                        note_save ( "connectted", that_buffer, "now" );


                        strcpy ( buffer_recv [ number_site ] ,       ""           );
                        strcpy ( gop_connection.how [ number_site ], "Connectted" );}





// make the secret maybe

                    secret_decode   ( buffer_recv [ number_site ], "blank" );


// control the secret

                    control_message ( number_site, buffer_recv [ number_site ], buffer_send );


// resolve this secret

                    secret_encode   ( buffer_send,                 "blank" );


// Execute it.

                    send(
                          number_return,
                          buffer_send,
                          10240,
                          0
                        );

                    recv(
                          number_return,
                          buffer_recv [ number_site ],
                          10240,
                          0
                        );




// Do note wait,
// or get client connectting
// no banance
//
//                    usleep(step_connection * 1000000);





// clear the connection description

                    gop_connection.connection [ number_site ] = 0;


// close it

                    close ( number_return );}}




// if the connectted closed
//
// save this note

           note_save( "connectted", "Server close", "now");



// close the network

           close(gop_connection.descriptor[1]);}}





    pthread_exit(NULL);}
