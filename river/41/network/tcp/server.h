


void* gop_server_start(void*) {




// Wait for information getting.

    while ( !information_done ) {

        usleep(100000);}


// Note this startting.

    note_save( "server", "Server start", "now" );






// Declare these variable.

    char              buffer_recv[4][10240];
    char              buffer_send[10240];
    char              that_buffer[10240];
    char              that_over[9];
    char              that_address[33];



// Prepare.

    strcpy( that_over, "\n" );
    strcat( that_over, "O"  );
    strcat( that_over, "V"  );
    strcat( that_over, "E"  );
    strcat( that_over, "R"  );
    strcat( that_over, "."  );


    strcpy( gop_connect.how[1], "Wait" );
    strcpy( gop_connect.how[2], "Wait" );
    strcpy( gop_connect.how[3], "Wait" );


    struct sockaddr_in address;
                       address.sin_family         = AF_INET;
                       address.sin_port           = htons(gop_connect.port[1]);
                       address.sin_addr.s_addr    = htonl(INADDR_ANY);

    struct sockaddr_in address_by;

           socklen_t   lenth      = sizeof(address_by);


    gop_connect.port[1] = port_this;
    gop_connect.fd[1]   = socket(
                                  AF_INET,
                                  SOCK_STREAM,
                                  0
                                 );


    bind( 
                             gop_connect.fd[1],
          (struct sockaddr*)&address,
                             sizeof(address)
         );


    listen(
            gop_connect.fd[1],
            3
          );





// Circulate start.

    while(flag_server) {



// Accept connection.

        int    connection = accept(
                                     gop_connect.fd[1],
                  (struct sockaddr*)&address_by,
                                    &lenth
                                   );

// Note the ip

        strcpy(
                that_address,
                inet_ntoa(address_by.sin_addr)
              );





// Connection message is already here.
// Find the site for this.
// Find is there is's site
//      or a free site.

        int        num_free       = 0;
        int        num_site       = 0;


// find free site.

        for     ( int i=1; i<=3; i++ ) {

            if  ( strcmp(gop_connect.address_ip[i], "") == 0 ) {

                num_free = i;
                break;}}

// Find it's site.

        for     ( int i=1; i<=3; i++ ) {

            if  ( strcmp(gop_connect.address_ip[i], that_address) == 0 ) {

                num_site = i;
                break;}}


// If it's a new site,
//    set a site for it.
//
// If sites' full,
//    smile to it.

        if      ( num_free != 0   and   num_site == 0 ) {

            num_site = num_free;}

        else if ( num_site == 0   and   num_free == 0 ) {


// Note this smile.

            printf(
                    "SMILE TO %s\n",
                    inet_ntoa(address_by.sin_addr)
                  );

            strcpy(that_buffer, "Smile to ");
            strcat(that_buffer, inet_ntoa(address_by.sin_addr));

            note_save("server", that_buffer, "now");


// Prepare this smile.

            strcpy(buffer_send, "This is gop station.");
            strcat(buffer_send, "\n");
            strcat(buffer_send, "Smile.");
            strcat(buffer_send, "\n");


// Find the connectting device
//      who can be be connectted

            int num_smile = -1;

            srand( unsigned(time(0)) );

            do  {

                num_smile = 1+4*(rand()/(RAND_MAX+1.0));

          } while ( strstr(gop_connect.information[num_smile], "Linux") == NULL );


// Add it's ip to smile message.

            strcat( buffer_send, gop_connect.address_ip[num_smile]);
//            strcat(msg, that_over);
            encode(buffer_send, "blank");


// Send it
// and
// Recive the last message.

            send(
                  connection,
                  buffer_send,
                  10240,
                  0
                );

            recv(
                 connection,
                 buffer_recv[0],
                 10240,
                 0
                );



            usleep(step_connection * 1000000);

            continue;}






// After findind site
//       for this connection,
// prepare for translation.

        if ( num_site != 0 ) {


// Update the time pointer,
// and the connecttion ip

                   gop_connect.time[num_site]       = time(NULL);

            strcpy(gop_connect.address_ip[num_site], that_address);


// If is's new , 
//   notice and
//   note this connection.

            if ( strcmp(gop_connect.how[num_site], "Wait") == 0 ) {

                printf(
                       "CONNECTTED BY %s\n",
                       gop_connect.address_ip[num_site]
                      );

                strcpy( that_buffer, "Connectted by " );
                strcat( that_buffer, gop_connect.address_ip[num_site] );

                note_save("server", that_buffer, "now");


                strcpy( buffer_recv[num_site], "" );
                strcpy( gop_connect.how[num_site], "Connectted" );}


// Control send message.

            decode(buffer_recv[num_site], "blank");
            control_message( num_site, buffer_recv[num_site], buffer_send );
            encode(buffer_send,           "blank");


// Execute it.

            send(
                 connection,
                 buffer_send,
                 10240,
                 0
                );

            recv(
                 connection,
                 buffer_recv[num_site],
                 10240,
                 0
                );


            usleep(step_connection * 1000000);}



        close(connection);}






    close(gop_connect.fd[1]);

    note_save( "server", "Server close", "now" );}
