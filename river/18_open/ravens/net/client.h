void connect_socket::client_start(){

    note_save("client.note", "Client start");

    this->address_ip[0] = address_to;
    this->port[0]       = port_to;

    struct sockaddr_in address;

    char buffer_recv[2048];
    char buffer_send[2048];
    int ptr;

   string msg;

    this->how[0] = "Wait";

    while ( point_ip[1]==0 ) {
        gop_delay(0.1);}

    for ( int o = 1; o <= 2; o++ ) {
        for ( int i = 1; i <= point_ip[1]; i++ ) {
            if ( this->address_ip[0] == info_ip[1][i][2] ) {
                flag_client = false;}}}

    while (flag_client) {

        struct sockaddr_in address;

        address.sin_family = AF_INET;
        address.sin_port = htons(this->port[0]);
        address.sin_addr.s_addr = inet_addr((char*)this->address_ip[0].c_str());

        this->fd[0] = socket(AF_INET, SOCK_STREAM, 0);
        if (connect(this->fd[0], (struct sockaddr *)&address, sizeof(address)) < 0) {}
        else {
            this->point_time[0] = time(NULL);
            if ( this->how[0] == "Wait" ) {

                cout << "Connectting to " << this->address_ip[0] << endl;
                string that_note  = "Connectting to ";
                       that_note += this->address_ip[0];
                note_save("client.note", that_note);
                this->how[0] = "Connectting";}

            recv(this->fd[0], buffer_recv, sizeof(buffer_recv), 0);
            msg = control_message( 0, decode(buffer_recv) );
            msg = encode(msg);

            if (this->how[0] == "Turn") {
                for ( ptr=0; ptr<msg.length(); ptr++ ) {
                    this->address_ip[0][ptr] = msg[ptr];}
                this->address_ip[0][ptr] = '\0';
                this->how[0] = "Wait";}

            else {
                for ( ptr=0; ptr<msg.length(); ptr++ ) {
                    buffer_send[ptr] = msg[ptr];}
                buffer_send[ptr] = '\0';

                send(this->fd[0], buffer_send, sizeof(buffer_send), 0);}}

        close(this->fd[0]);
        gop_delay(step_connect);}
    string that_note  = "Client close with ";
           that_note += this->address_ip[0];
    note_save("client.note", that_note);}
