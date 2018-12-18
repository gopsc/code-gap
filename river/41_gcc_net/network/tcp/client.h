
void* gop_client_start(void*) {




   while ( !information_done ) {

       usleep(step_connection * 100000);}



    note_save("client", "Client start", "now");









    struct sockaddr_in    address;

           int            num_return;
           char           buffer_recv[10240];
           char           buffer_send[10240];
           char           that_buffer[10240];





    strcpy(gop_connection.address_ip[0], address_to);
           gop_connection.port[0]      = port_to;

    strcpy(gop_connection.how[0],        "Wait");














    while ( information_ip_num == 0 ) {

        usleep(step_connection * 1000000);}






    while (flag_client) {



//-----------------------------------------------------------------------------------

// CAN NOT CONNECT MYSELF
/*
        for ( int i=1; i<=information_ip_num; i++ ) {

            if ( strcmp(
                        gop_connection.address_ip[0],
                        information_ip[i][2]
                       )
                  == 0
               ) {

                usleep(step_connection * 1000000);
                goto leave;}}
*/
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

            flag_client = false;}

//-----------------------------------------------------------------------------------

        

        num_return = connect(
                                                  gop_connection.descriptor[0],
                              (struct sockaddr *)&address,
                                                  sizeof(address)
                             );

        if ( num_return == -1 ) {

            usleep(100000);}

//-----------------------------------------------------------------------------------


        else if ( num_return >= 0 ) {


            gop_connection.time[0] = time(NULL);

            if ( strcmp(gop_connection.how[0], "Wait") == 0 ) {

                printf( "CONNECTTING TO  %s\n", gop_connection.address_ip[0] );

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

            decode(buffer_recv, "blank");
            control_message( 0, buffer_recv, buffer_send);
            encode(buffer_send, "blank");

            send(
                 gop_connection.descriptor[0],
                 buffer_send,
                 10240,
                 0
                );



            usleep(step_connection * 100000);}

//-----------------------------------------------------------------------------------

        close(gop_connection.descriptor[0]);

        leave:
        sleep(0);}

//===================================================================================


    strcpy(that_buffer, "Client close with ");
    strcat(that_buffer, gop_connection.address_ip[0]);

    note_save("client", that_buffer, "now");

    pthread_exit(NULL);}
