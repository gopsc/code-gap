


void* gop_server_start(void* what) {




// Wait for information getting done.

    while ( !flag_start ) {

        usleep(100000);}


// Note this startting.

    note_save( "server", "Server start", "now" );






// Declare these variable.

    int               number_return;
    char              buffer_recv[4][10240];
    char              buffer_send[10240];
    char              that_buffer[10240];
    char              that_over[9];
    char              that_address[33];




    strcpy( gop_connection.how[1], "Wait" );
    strcpy( gop_connection.how[2], "Wait" );
    strcpy( gop_connection.how[3], "Wait" );


 
    struct sockaddr_in address;
    struct sockaddr_in address_by;
           socklen_t   lenth;









    while( flag_main ) {


        if      ( !flag_server ) {

            usleep(step_connection * 1000000);}





        else if (  flag_server ) {

            gop_connection.port[1]        = port_this;
            gop_connection.descriptor[1]  = socket(
                                                    AF_INET,
                                                    SOCK_STREAM,
                                                    0
                                                  );
//-----------------------------------------------------------------------------------

            address.sin_family         = AF_INET;
            address.sin_port           = htons(gop_connection.port[1]);
            address.sin_addr.s_addr    = htonl(INADDR_ANY);

            lenth                      = sizeof(address_by);


            if ( gop_connection.descriptor[1] == -1 ) {

                perror("Server socket created failled");
                flag_server = 0;}

//-----------------------------------------------------------------------------------

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

                flag_server = 0;}

//-----------------------------------------------------------------------------------
// Set it's mode to non-block

            if (
                   fcntl(
                          gop_connection.descriptor[1],
                          F_SETFL,
                          fcntl(
                                 gop_connection.descriptor[1],
                                 F_GETFL
                               )
                          | O_NONBLOCK
                        )
                   < 0
               ) {


                output_print("Server could not set block node.\n");

                flag_server = 0;

                continue;}

//-----------------------------------------------------------------------------------

            if (
                   bind( 
                                            gop_connection.descriptor[1],
                         (struct sockaddr*)&address,
                                     sizeof(address)
                       )
                   == -1
               ) {

                perror("Server binding failled");
                flag_server = 0;}

//-----------------------------------------------------------------------------------

            if (
                   listen(
                           gop_connection.descriptor[1],
                           3
                         )
                   == -1
               ) {

                perror("Server listen failled");
                flag_server = 0;}

//-----------------------------------------------------------------------------------

// Loop start.

            while(flag_server) {

// Accept connection.

                if (
                       accept(
                                                  gop_connection.descriptor[1],
                               (struct sockaddr*)&address_by,
                                                 &lenth
                             )
                       == -1
                   ) {

                    //perror("Server acceptting failled");

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
//      or a free site.

                int        num_free       = 0;
                int        num_site       = 0;

//-----------------------------------------------------------------------------------

// find free site.

                for     ( int i=1; i<=3; i++ ) {

                    if  ( strcmp(gop_connection.address_ip[i], "") == 0 ) {

                        num_free = i;
                        break;}}

//-----------------------------------------------------------------------------------

// Find it's site.

                for     ( int i=1; i<=3; i++ ) {

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

                    printf(
                            "SMILE TO %s\n",
                            inet_ntoa(address_by.sin_addr)
                          );

                    strcpy(that_buffer, "Smile to ");
                    strcat(that_buffer, inet_ntoa(address_by.sin_addr));

                    note_save("server", that_buffer, "now");

//-----------------------------------------------------------------------------------

// Prepare this smile.

                    strcpy(buffer_send, "This is gop station.");
                    strcat(buffer_send, "\n");
                    strcat(buffer_send, "Smile.");
                    strcat(buffer_send, "\n");

//-----------------------------------------------------------------------------------

// Find the connectting device
//      who can be be connectted

                    int num_smile = -1;

                    srand( time(NULL) );

                    do  {

                        num_smile = 1+4*(rand()/(RAND_MAX+1.0));

                  } while ( strstr(gop_connection.information[num_smile], "Linux") == NULL );

//-----------------------------------------------------------------------------------

// Add it's ip to smile message.

                    strcat( buffer_send, gop_connection.address_ip[num_smile]);
                    secret_en(buffer_send, "blank");

//-----------------------------------------------------------------------------------

// Send it
// and
// Recive the last message.

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
// prepare for translation.

                if ( num_site != 0 ) {


// Update the time pointer,
// and the connecttion ip

                    gop_connection.time[num_site] = time(NULL);

                    strcpy(gop_connection.address_ip[num_site], that_address);

//-----------------------------------------------------------------------------------

// If is's new , 
//   notice and
//   note this connection.

                    if ( strcmp(gop_connection.how[num_site], "Wait") == 0 ) {

                        printf(
                               "Connectted  by %s\n",
                                gop_connection.address_ip[num_site]
                              );

                        strcpy( that_buffer, "Connectted by " );
                        strcat( that_buffer, gop_connection.address_ip[num_site] );

                        note_save("server", that_buffer, "now");


                        strcpy( buffer_recv[num_site], "" );
                        strcpy( gop_connection.how[num_site], "Connectted" );}

//-----------------------------------------------------------------------------------

// Control send message.

                    secret_de(buffer_recv[num_site], "blank");
                    control_message( num_site, buffer_recv[num_site], buffer_send );
                    secret_en(buffer_send,           "blank");


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


                    usleep(step_connection * 1000000);

                    close(number_return);



                    if ( !flag_server ) {

                        close(gop_connection.descriptor[1]);}}}}}

//-----------------------------------------------------------------------------------

    note_save( "server", "Server close", "now" );

    pthread_exit(NULL);}