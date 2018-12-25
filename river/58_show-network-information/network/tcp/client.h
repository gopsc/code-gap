
void* gop_client_start(void* what) {




   while ( !flag_start ) {

       usleep(step_connection * 100000);}



    note_save("client", "Client start", "now");









    struct sockaddr_in    address;

           int            number_return;
           char           buffer_recv[10240];
           char           buffer_send[10240];
           char           that_buffer[10240];





    strcpy(gop_connection.address_ip[0], address_to);
           gop_connection.port[0]      = port_to;

    strcpy(gop_connection.how[0],        "Wait");














    while ( information_network.number == 0 ) {

        usleep(step_connection * 1000000);}





    while (flag_main) {

        while (flag_client) {



//-----------------------------------------------------------------------------------

// Can not connect myself

            for ( int i=1; i<=information_network.number; i++ ) {

                if ( strcmp(
                            gop_connection.address_ip[0],
                            information_network.ip[i][2]
                           )
                      == 0
                   ) {

                    usleep(step_connection * 1000000);
                    goto leave;}}

//------------------------------------------------------------------------------------

            struct sockaddr_in address;

            address.sin_family      = AF_INET;
            address.sin_port        = htons(gop_connection.port[0]);
            address.sin_addr.s_addr = inet_addr(gop_connection.address_ip[0]);

//-----------------------------------------------------------------------------------

            gop_connection.descriptor[0] = socket(
                                                   AF_INET,
                                                   SOCK_STREAM,
                                                   0
                                                 );

            if ( gop_connection.descriptor[0] == -1 ) {

                flag_client = 0;}

//-----------------------------------------------------------------------------------

        

            number_return = connect(
                                     gop_connection.descriptor[0],
                 (struct sockaddr *)&address,
                                     sizeof(address)
                                   );

            if ( number_return == -1 ) {

                usleep(100000);}

//-----------------------------------------------------------------------------------


            else if ( number_return >= 0 ) {


                gop_connection.time[0] = time(NULL);

                if ( strcmp(gop_connection.how[0], "Wait") == 0 ) {

                    printf( "Connectting to %s\n", gop_connection.address_ip[0] );

                    strcpy(that_buffer, "Connectting to ");
                    strcat(that_buffer,    gop_connection.address_ip[0]);

                    note_save("client", that_buffer, "now");

                    strcpy(gop_connection.how[0], "Connectting");}

//-----------------------------------------------------------------------------------

                recv(
                      gop_connection.descriptor[0],
                      buffer_recv, 10240,
                      0
                    );

                secret_de(buffer_recv, "blank");
                control_message( 0, buffer_recv, buffer_send);
                secret_en(buffer_send, "blank");

                send(
                      gop_connection.descriptor[0],
                      buffer_send,
                      10240,
                      0
                    );



                usleep(/*step_connection*/ 0 * 100000);}

//-----------------------------------------------------------------------------------

            close(gop_connection.descriptor[0]);

            leave:
            sleep(0);}}

//===================================================================================


    strcpy(that_buffer, "Client close with ");
    strcat(that_buffer, gop_connection.address_ip[0]);

    note_save("client", that_buffer, "now");

    pthread_exit(NULL);}
