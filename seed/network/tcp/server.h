


void* gop_server_start(void* what) {


// Declare these variable.

           int         number_return;
           char        buffer_recv[4][10240];
           char        buffer_send[10240];
           char        that_buffer[10240];
           char        that_over[9];
           char        that_address[33];

    struct sockaddr_in address   ;
    struct sockaddr_in address_by;
           socklen_t   lenth     ;


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


        if ( !information_flag.server ) {

// sleep some time evrey range

            usleep(100000);}


        else if (  information_flag.server ) {


// Note this startting.

            note_save( "server", "Server start", "now" );


// This round is for
// preparing.


// Create socket

            gop_connection.port[1]        = port_this;
            gop_connection.descriptor[1]  = socket   (
                                                       AF_INET,
                                                       SOCK_STREAM,
                                                       0
                                                     );

//-----------------------------------------------------------------------------------
// Setting the
// socket attribution

            address.sin_family         = AF_INET;
            address.sin_port           = htons(gop_connection.port[1]);
            address.sin_addr.s_addr    = htonl(INADDR_ANY);

            lenth                      = sizeof(address_by);

// If failled, close it

            if ( gop_connection.descriptor[1] == -1 ) {

                perror("Server socket created failled");

                information_flag.server = 0;}

//-----------------------------------------------------------------------------------
// When a server closed
// something ran &the
// ip address
// will be not avalable for
// minutes
// use this is OK

            int that_num = 1;

            if (
                   setsockopt(
                               gop_connection.descriptor[1],
                               SOL_SOCKET,
                               SO_REUSEADDR,
                               &that_num,
                               sizeof(that_num)
                             )
                   == -1
               ) {

                perror("Server Setting Failled");

                information_flag.server = 0;}

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

                information_flag.server = 0;}

//-----------------------------------------------------------------------------------

            if (
                   listen(
                           gop_connection.descriptor[1],
                           3
                         )
                   == -1
               ) {

                perror("Server listen failled");
                information_flag.server = 0;}

//-----------------------------------------------------------------------------------

// Loop start.

            while (information_flag.server) {

// Accept connection.

                number_return = accept(
                                                           gop_connection.descriptor[1],
                                        (struct sockaddr*)&address_by,
                                                          &lenth
                                      );

                if ( number_return == -1 ) {

// When the mode of no-wait
//   is opening.
//   do not print
// accepting error message

                    perror("Server acceptting failled");

                    usleep(100000);

                    continue;}

//-----------------------------------------------------------------------------------
// Note the ip

                strcpy(
                        that_address,
                        inet_ntoa(address_by.sin_addr)
                      );

//-----------------------------------------------------------------------------------
// Connection message is already here.
// Find the site for this.
// Find is there is's site
//      or a free     site.

                int        num_free       = 0;
                int        num_site       = 0;

//-----------------------------------------------------------------------------------
// find free site.

                int i;

                for     ( i=1; i<=3; i++ ) {

                    if  ( strcmp(gop_connection.address_ip[i], "") == 0 ) {

                        num_free = i;

                        break;}}

//-----------------------------------------------------------------------------------
// Find it's site.

                for     ( i=1; i<=3; i++ ) {

                    if  ( strcmp(gop_connection.address_ip[i], that_address) == 0 ) {

                        num_site = i;

                        break;}}

//-----------------------------------------------------------------------------------
// If it's a new site,
//    set a site for it.
//
// If sites' full,
//    smile to it.

                if      ( num_free != 0   &&   num_site == 0 ) {

                    num_site = num_free;}

                else if ( num_site == 0   &&   num_free == 0 ) {

//-----------------------------------------------------------------------------------
// Note this smile.

                    output_print( "string", "Smile to           "           );
                    output_print( "string",  inet_ntoa(address_by.sin_addr) );
                    output_print( "string", "\n"                            );

                    strcpy(that_buffer, "Smile to ");
                    strcat(that_buffer, inet_ntoa(address_by.sin_addr));

                    note_save("server", that_buffer, "now");

//-----------------------------------------------------------------------------------
// Preparing for this smile.

                    strcpy(buffer_send, "This is gop station.");
                    strcat(buffer_send, "\n");
                    strcat(buffer_send, "Smile.");
                    strcat(buffer_send, "\n");

//-----------------------------------------------------------------------------------
// Find the connectting device
//      who can be be connectted

                    int num_smile = -1;

                    srand( time(NULL) );

                    num_smile = 1+4*(rand()/(RAND_MAX+1.0));

//-----------------------------------------------------------------------------------
// Add it's ip to smile message.

                    strcat( buffer_send, gop_connection.address_ip[num_smile]);
                    secret_encode(buffer_send, "blank");

//-----------------------------------------------------------------------------------
// Send it
// and
// Recive the returned message.

                    secret_encode(buffer_send, "blank");

                    send(
                          number_return,
                          buffer_send,
                          10240,
                          0
                        );

                    recv(
                          number_return,
                          buffer_recv[0],
                          10240,
                          0
                        );

                    usleep(step_connection * 1000000);

                    close(number_return);

                    continue;}

//-----------------------------------------------------------------------------------
// After findind site
//       for this connection,
// preparing  for connection.

                if ( num_site != 0 ) {


// Update the time pointer,
// and the connecttion ip

                    gop_connection.time[num_site] = time(NULL);

                    strcpy(gop_connection.address_ip[num_site], that_address);

//-----------------------------------------------------------------------------------
// If is's new ,
//  notice and
//  note  this connection.

                    if ( strcmp(gop_connection.how[num_site], "Wait") == 0 ) {

                        output_print( "string", "Connectted  by     "               );
                        output_print( "string",  gop_connection.address_ip[num_site]);
                        output_print( "string", "\n"                                );

                        strcpy( that_buffer, "Connectted by " );
                        strcat( that_buffer, gop_connection.address_ip[num_site] );

                        note_save("server", that_buffer, "now");


                        strcpy( buffer_recv[num_site], "" );
                        strcpy( gop_connection.how[num_site], "Connectted" );}

//-----------------------------------------------------------------------------------
// Control send message.

                    secret_decode(buffer_recv[num_site], "blank");
                    control_message( num_site, buffer_recv[num_site], buffer_send );
                    secret_encode(buffer_send,           "blank");


// Execute it.

                    send(
                          number_return,
                          buffer_send,
                          10240,
                          0
                        );

                    recv(
                          number_return,
                          buffer_recv[num_site],
                          10240,
                          0
                        );

// Do note wait,
// or get client connectting
// no banance
//                    usleep(step_connection * 1000000);

                    close(number_return);}}


           note_save( "server", "Server close", "now");

           close(gop_connection.descriptor[1]);}}

//-----------------------------------------------------------------------------------


    pthread_exit(NULL);}
