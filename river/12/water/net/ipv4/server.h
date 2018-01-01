void socket_server::start(void) {
    char buffer_recv[10240];
    char buffer_send[10240];
    int  ptr;
    string msg;
//===================================================================
    this->port = port_this;
    struct sockaddr_in address;

    this->fd = socket(AF_INET, SOCK_STREAM, 0);
    address.sin_family = AF_INET;
    address.sin_port = htons(this->port);
    address.sin_addr.s_addr = htonl(INADDR_ANY);

    if(bind(this->fd, (struct sockaddr*)&address, sizeof(address)) == -1)  {
        perror("bind");}
    if(listen(this->fd, num_listen) == -1)  {
        perror("listen");}

    this->how = "Wait";
//===================================================================
    while(true) {
        struct sockaddr_in address_by;
        socklen_t lenth = sizeof(address_by);

        int connection = accept(this->fd, (struct sockaddr*)&address_by, &lenth);
        if(connection  < 0)  {
            this->information = "accept failled";}
        else {
            this->point_time = time(NULL);
            this->address_ip = inet_ntoa(address_by.sin_addr);
                if ( this->how == "Wait" ) {
                    cout << "Connectted by " << this->address_ip << endl;
                    this->how = "Connectted";}
            msg = control_message(&(this->how), &(gop_client.how),
                                  &(this->information), &(gop_client.information),
                                  &(this->command),     &(gop_client.command),
                                  &(this->update),       buffer_recv);
            for ( ptr=0; ptr<msg.length(); ptr++ ) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';
            send(connection, buffer_send, sizeof(buffer_send),0);
            recv(connection, buffer_recv, sizeof(buffer_recv),0);
            close(connection);}
        sleep(1);}}


