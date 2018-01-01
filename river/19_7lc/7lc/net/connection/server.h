
void connect_socket::server_start() {

    note_save("server.note", "Server start");


    char              buffer_recv[3][10240];
    char              buffer_send[10240];
    int               ptr;
    string            msg;



    this->             port[1]                    = port_this;
    this->             fd[1]                      = socket(AF_INET, SOCK_STREAM, 0);


    struct sockaddr_in address;
                       address.sin_family         = AF_INET;
                       address.sin_port           = htons(this->port[1]);
                       address.sin_addr.s_addr    = htonl(INADDR_ANY);

    struct sockaddr_in address_by;

           socklen_t   lenth            = sizeof(address_by);





    bind(this->fd[1], (struct sockaddr*)&address, sizeof(address));
    listen(this->fd[1], 3);



    this->how[1] = "Wait";
    this->how[2] = "Wait";
    this->how[3] = "Wait";




    while(flag_server) {




        int        connection = accept(this->fd[1], (struct sockaddr*)&address_by, &lenth);



        string     that       = inet_ntoa(address_by.sin_addr);



        int        free       = 0;
        int        site       = 0;


        for     ( int i=1; i<=3; i++ ) {
            if  ( this->address_ip[i] == box_blank ) {
                free = i;
                break;}}


        for     ( int i=1; i<=3; i++ ) {
            if  ( this->address_ip[i] == that ) {
                site = i;
                break;}}


        if      ( free != 0 and site == 0 ) {
            site = free;}






        else if ( free == 0 and site == 0 ) {


            msg  = "This is gop station.";
            msg += '\n';
            msg += "Smile.";
            msg += '\n';

            int that_smile = -1;
            srand(unsigned(time(0)));
            while ( ( gop_connect.information[that_smile]).find("Linux") == -1 ) {
                that_smile = 1+(4-1)*rand()/(RAND_MAX+1.0);}

            msg += gop_connect.address_ip[that_smile];
            msg  = encode(msg);

            for ( ptr=0; ptr<msg.length(); ptr++ ) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';



            send(connection, buffer_send, sizeof(buffer_send),0);
            recv(connection, buffer_recv[site], sizeof(buffer_recv[site]),0);



            cout << "Smile to " << inet_ntoa(address_by.sin_addr) << endl;

            string that_note  = "Smile to ";
                   that_note += inet_ntoa(address_by.sin_addr);
            note_save("server.note", that_note);



            continue;}





        if ( site != 0 ) {






            this->point_time[site]  = time(NULL);
            this->address_ip[site]  = that;




            if ( this->how[site] == "Wait" ) {



                cout << "Connectted by " << this->address_ip[site] << endl;

                string that_note  = "Connectted by ";
                       that_note += this->address_ip[site];

                note_save("server.note", that_note);



                buffer_recv[site][0] = '\0';
                this->how[site] = "Connectted";}





            msg = control_message( site, decode(buffer_recv[site]) );
            msg = encode(msg);


            for ( ptr=0; ptr<msg.length(); ptr++ ) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';


            send(connection, buffer_send, sizeof(buffer_send),0);
            recv(connection, buffer_recv[site], sizeof(buffer_recv[site]),0);}





        close(connection);
        gop_delay(step_connect);}










    close(this->fd[1]);
    note_save("server.note", "Server close");}
