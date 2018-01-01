
void* gop_client_start(void* what) {


// Standart preparing.

    struct sockaddr_in    address;

           int            number_return;
           char           buffer_recv[10240];
           char           buffer_send[10240];
           char           that_buffer[10240];











// Wait the dog start on.

    while ( !information_flag.start ) {

        usleep(step_connection * 100000);}






// Prepare the information of start.

    strcpy(gop_connection.address_ip[0], address_to);
           gop_connection.port[0]      = port_to;

    strcpy(gop_connection.how[0],        "Wait");




// Sometimes when the server close
//                the client will be closed.

    signal(SIGPIPE, SIG_IGN);







    while (information_flag.main) {

// Sleep sometimes when
// the client closed
// & and the main program is running

        if      ( !information_flag.client ) {

            usleep(100000);}


        else if (  information_flag.client ) {

// This box is for note saving

            note_save("client", "Client start", "now");


            while ( information_flag.client ) {

// This round for connection

//-----------------------------------------------------------------------------------
// If there isn't a available ip,
// do       not continue,
// will  be complicated

                if ( information_network.number <= 1 ) {

                    usleep(step_connection * 1000000);

                    goto leave;}

// Can not connect myself

                int i;

                for ( i=1; i<=information_network.number; i++ ) {

                    if ( strcmp(
                                gop_connection.address_ip[0],
                                information_network.ip[i][2]
                               )
                          == 0
                       ) {

                        usleep(step_connection * 1000000);

                        goto leave;}}

//------------------------------------------------------------------------------------
// Prepare the buffer

                struct sockaddr_in address;

                address.sin_family      = AF_INET;
                address.sin_port        = htons(gop_connection.port[0]);
                address.sin_addr.s_addr = inet_addr(gop_connection.address_ip[0]);

//-----------------------------------------------------------------------------------
// Creat the socket

                gop_connection.descriptor[0] = socket(
                                                       AF_INET,
                                                       SOCK_STREAM,
                                                       0
                                                     );

// If something goes wrong, & it could not creat
//  a socket, turn it off,
// we could turn it on outside

                if ( gop_connection.descriptor[0] == -1 ) {

                    information_flag.client = 0;}

//-----------------------------------------------------------------------------------
// Connect to the target

                number_return = connect(
                                         gop_connection.descriptor[0],
                     (struct sockaddr *)&address,
                                         sizeof(address)
                                       );

// No result wait few secends

                if ( number_return == -1 ) {

                    usleep(100000);}

//-----------------------------------------------------------------------------------
// If got a connection

                else if ( number_return >= 0 ) {

// Fresh the time pointer

                    gop_connection.time[0] = time(NULL);

                    if ( strcmp(gop_connection.how[0], "Wait") == 0 ) {

// New connection, print it

                        output_print("string", "Connectting to     "         );
                        output_print("string",  gop_connection.address_ip[0] );
                        output_print("string", "\n"                          );

                        strcpy(that_buffer, "Connectting to ");
                        strcat(that_buffer,    gop_connection.address_ip[0]);

                        note_save("client", that_buffer, "now");

                        strcpy(gop_connection.how[0], "Connectting");}

//-----------------------------------------------------------------------------------
// Old connection, continue talking..

                    recv(
                          gop_connection.descriptor[0],
                          buffer_recv, 10240,
                          0
                        );

// The secret code

                    secret_decode(buffer_recv, "blank");
                    control_message( 0, buffer_recv, buffer_send);
                    secret_encode(buffer_send, "blank");

                    send(
                          gop_connection.descriptor[0],
                          buffer_send,
                          10240,
                          0
                        );

// If clients sleep instead of server,
// It could be balance.

                    usleep( step_connection * 100000);}

//-----------------------------------------------------------------------------------
// Close the socket
//       and prepare for next
//           connection

                close(gop_connection.descriptor[0]);

// If something wrong with the target,
// it's here the program jump to.

                leave:
                sleep(0);}


// The round of connection is
// over, it is time to save note

            note_save("client", "Client close", "now");}}




    pthread_exit(NULL);}
