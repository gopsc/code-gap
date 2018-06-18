
void* gop_server_start(void*) {


    while ( !info_done ) {
        gop_delay(0.1);}

    note_save("server.note", "Server start");








    char              buffer_recv[3][10240];
    char              buffer_send[10240];
    int               ptr;
    string            msg;





    string            that_over = "\n";
                      that_over += "O";
                      that_over += "V";
                      that_over += "E";
                      that_over += "R";
                      that_over += ".";






    gop_connect.port[1] = port_this;
    gop_connect.fd[1]   = socket(AF_INET, SOCK_STREAM, 0);






    struct sockaddr_in address;
                       address.sin_family         = AF_INET;
                       address.sin_port           = htons(gop_connect.port[1]);
                       address.sin_addr.s_addr    = htonl(INADDR_ANY);

    struct sockaddr_in address_by;

           socklen_t   lenth            = sizeof(address_by);










    bind(gop_connect.fd[1], (struct sockaddr*)&address, sizeof(address));

    listen(gop_connect.fd[1], 3);



    gop_connect.how[1] = "Wait";
    gop_connect.how[2] = "Wait";
    gop_connect.how[3] = "Wait";




    while(flag_server) {




        int        connection = accept(gop_connect.fd[1], (struct sockaddr*)&address_by, &lenth);


        string     that       = inet_ntoa(address_by.sin_addr);








        int        free       = 0;
        int        site       = 0;


        for     ( int i=1; i<=3; i++ ) {
            if  ( gop_connect.address_ip[i] == "" ) {

                free = i;
                break;}}


        for     ( int i=1; i<=3; i++ ) {
            if  ( gop_connect.address_ip[i] == that ) {

                site = i;
                break;}}


        if      ( free != 0 and site == 0 ) {

            site = free;}

        else if ( site == 0 and free == 0 ) {


            msg  = "This is gop station.";
            msg += '\n';
            msg += "Smile.";
            msg += '\n';



            int that_smile = -1;

            srand(unsigned(time(0)));

            while ( ( gop_connect.information[that_smile]).find("Linux") == -1 ) {

                that_smile = 1+4*(rand()/(RAND_MAX+1.0));}


            msg += gop_connect.address_ip[that_smile];
//            msg += that_over;
            msg  = encode(msg);

            for ( ptr=0; ptr<msg.length(); ptr++ ) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';


            send(connection, buffer_send, 10240,0);

            gop_delay(step_connect);

            recv(connection, buffer_recv[site], 10240,0);



            cout << "SMILE TO " << inet_ntoa(address_by.sin_addr) << endl;

            string that_note  = "Smile to ";
                   that_note += inet_ntoa(address_by.sin_addr);
            note_save("server.note", that_note);



            continue;}





        if ( site != 0 ) {






            gop_connect.point_time[site]  = time(NULL);
            gop_connect.address_ip[site]  = that;




            if ( gop_connect.how[site] == "Wait" ) {



                cout << "CONNECTTED BY " << gop_connect.address_ip[site] << endl;

                string that_note  = "Connectted by ";
                       that_note += gop_connect.address_ip[site];

                note_save("server.note", that_note);


                buffer_recv[site][0] = '\0';
                gop_connect.how[site] = "Connectted";}




            msg = control_message( site, decode(buffer_recv[site]) );
            msg = encode(msg);


            for ( ptr=0; ptr<msg.length(); ptr++ ) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';


            send(connection, buffer_send, 10240,0);

            gop_delay(step_connect);

            recv(connection, buffer_recv[site], 10240,0);}





        close(connection);}










    close(gop_connect.fd[1]);
    note_save("server.note", "Server close");}
