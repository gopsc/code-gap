void* gop_client_start(void*) {

   while ( !info_done ) {
        gop_delay(0.1);}

    note_save("client.note", "Client start");







    gop_connect.address_ip[0] = address_to;
    gop_connect.port[0]       = port_to;




    struct sockaddr_in address;




    char   buffer_recv[10240];
    char   buffer_send[10240];




    int    ptr;
    string msg;




    gop_connect.how[0]        = "Wait";





    while ( point_ip[1]==0 ) {
        gop_delay(0.1);}




    while (flag_client) {

//-----------------------------------------------------------------------------------

// CAN NOT CONNECT MYSELF

        for ( int i=1; i<=point_ip[1]; i++ ) {

            if ( gop_connect.address_ip[0] == info_ip[1][i][2]) {

                gop_delay(0.1);
                goto leave;}}

//------------------------------------------------------------------------------------

        struct sockaddr_in address;

        address.sin_family = AF_INET;
        address.sin_port = htons(gop_connect.port[0]);
        address.sin_addr.s_addr = inet_addr((char*)gop_connect.address_ip[0].c_str());

//-----------------------------------------------------------------------------------

        gop_connect.fd[0] = socket(AF_INET, SOCK_STREAM, 0);

//-----------------------------------------------------------------------------------

        if (connect(gop_connect.fd[0], (struct sockaddr *)&address, sizeof(address)) >= 0) {

//-----------------------------------------------------------------------------------

            gop_connect.point_time[0] = time(NULL);

            if ( gop_connect.how[0] == "Wait" ) {
                cout << "CONNECTTING TO  " << gop_connect.address_ip[0] << endl;

                string that_note  = "Connectting to ";
                       that_note += gop_connect.address_ip[0];
                note_save("client.note", that_note);
                gop_connect.how[0] = "Connectting";}

//-----------------------------------------------------------------------------------

            gop_delay(step_connect);
            recv(gop_connect.fd[0], buffer_recv, 10240, 0);

            msg = control_message( 0, decode(buffer_recv) );
            msg = encode(msg);

            for ( ptr=0; ptr<msg.length(); ptr++ ) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';

//-----------------------------------------------------------------------------------

            send(gop_connect.fd[0], buffer_send, 10240, 0);}

//-----------------------------------------------------------------------------------

        close(gop_connect.fd[0]);

        leave:
        sleep(0);}

//===================================================================================


    string that_note  = "Client close with ";
           that_note += gop_connect.address_ip[0];
    note_save("client.note", that_note);}
