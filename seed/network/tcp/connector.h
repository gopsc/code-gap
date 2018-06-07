
void * gop_connector ( void * what ) {


// Standart preparing.

    struct sockaddr_in    address;

           int            number_return;
           char           buffer_recv [ 10240 ];
           char           buffer_send [ 10240 ];
           char           that_buffer [ 10240 ];











// Wait the dog start on.

    while (  ! gop_about.flag.start  ) {

        usleep ( gop_about.configurations.step_connection * 100000 );}






// Prepare the information of start.
//
// dog will load this when it had started
//
// and other thing should do this as a lowest time
//
//  so we load it here first time

    strcpy ( gop_connection.address_ip [ 0 ],  gop_about.configurations.address_to );

             gop_connection.port       [ 0 ] = gop_about.configurations.   port_to;





// prepare the status of network
//
// maybe i should movethis to ~/network/build.h

    strcpy ( gop_connection.how [ 0 ], "Wait" );



// this usually is 0 at first, and sop don't clear it, if dog check this, dog can shut it

             gop_connection.connection [ 0 ] = 0;




// Sometimes when the server close
//                the client will be closed.

    signal ( SIGPIPE, SIG_IGN );







    while ( gop_about.flag.main ) {




// Sleep sometimes when
// the client closed
// & and the main program is running

        if      ( ! gop_about.flag.connector ) {

            usleep ( 100000 );}





        else {

// This box is for note saving

            note_save ( "connector", "Connector start", "now" );


            while ( gop_about.flag.connector ) {

// This round for connection











// If there isn't a available ip,
// do       not continue,
// will  be complicated
//
// connector will be stack here
//
// and don't move for long time
//
// :(

                if ( gop_about.network.number <= 1 ) {

                    usleep ( gop_about.configurations.step_connection * 1000000 );

                    goto leave;}









// Can not connect myself

                int i;

                for ( i = 1; i <= gop_about.network.number; i ++ ) {

                    if (

                          strcmp (

                                   gop_connection.address_ip [ 0 ],

                                   gop_about.network.ip [ i ] [ 2 ]

                                  )
                          == 0

                    &&    gop_about.flag.sound

                       ) {

                        usleep ( gop_about.configurations.step_connection * 1000000 );


                        goto leave;}}

//------------------------------------------------------------------------------------
// Prepare the buffer

                struct sockaddr_in address;

                address.sin_family      = AF_INET;
                address.sin_port        = htons     ( gop_connection.port [ 0 ]       );
                address.sin_addr.s_addr = inet_addr ( gop_connection.address_ip [ 0 ] );






// Creat the socket
//
// before that we set the description to -1, if we lock there, the dog ckecked this
//
// just to connection

                gop_connection.descriptor [ 0 ] = socket (
                                                           AF_INET,
                                                           SOCK_STREAM,
                                                           0
                                                         );

// If something goes wrong, & it could not creat
//  a socket, turn it off,
// we could turn it again from outside

                if (  gop_connection.descriptor [ 0 ]  == -1  ) {

                    gop_about.flag.connector = 0;}









// Connect to the target

                number_return = connect (

                                              gop_connection.descriptor [ 0 ],

                      ( struct sockaddr * ) & address,

                                              sizeof ( address )

                                        );

// No result wait few secends

                if (  number_return == -1  ) {

                    usleep ( 100000 );}









// If got a connection

                else if (  number_return >= 0  ) {



// fresh the description of connection

                    gop_connection.connection [ 0 ] = number_return;



// Fresh the time pointer

                    gop_connection.time [ 0 ] = time ( NULL );







// if ths is a new connection, we should set it

                    if (  strcmp ( gop_connection.how [ 0 ], "Wait" )  == 0  ) {

// New connection, print it

                        output_print ( "string", "Connectting to    "             );
                        output_print ( "string",  gop_connection.address_ip [ 0 ] );
                        output_print ( "string", "\n"                             );

// prepare the note

                        strcpy ( that_buffer, "Connectting to "                );
                        strcat ( that_buffer,  gop_connection.address_ip [ 0 ] );

// save the note

                        note_save ( "connector", that_buffer, "now" );


// set how

                        strcpy ( gop_connection.how [ 0 ], "Connectting" );}








// it is ( or it is now )
//
// Old connection, continue talking..



// recive from master first

                    recv (
                           gop_connection.descriptor [ 0 ],
                           buffer_recv, 10240,
                           0
                         );

// The secret code

                    secret_decode ( buffer_recv, "blank" );


// handle this message

                    control_message ( 0, buffer_recv, buffer_send );


// resolve the secret

                    secret_encode ( buffer_send, "blank" );


// ok send it

                    send(
                          gop_connection.descriptor [ 0 ],
                          buffer_send,
                          10240,
                          0
                        );


// If clients sleep instead of master,
//
// It could be balance.

                    usleep ( gop_about.configurations.step_connection * 100000 );}




// Close the socket
//
//       and prepare for next
//
//           connection
//
// and we should clear the description of connection first
//
//  or it could couse a mistake

                gop_connection.connection [ 0 ] = 0;


// now close it

                close ( gop_connection.descriptor [ 0 ] );






// If something wrong with the target,
//
// it's here the program jump to
//
// over the connectting

                leave:
                sleep ( 0 );}


// The round of connection is
// over, it is time to save note

            note_save ( "connector", "Client close", "now" );}}




    pthread_exit ( NULL );}
