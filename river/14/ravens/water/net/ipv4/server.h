void socket_server::start(void) {
    file_append("/opt/gop/note/server.note", info_time);
    file_append("/opt/gop/note/server.note", "Server start");
    file_append("/opt/gop/note/server.note", "\n");

    char buffer_recv[2048];
    char buffer_send[2048];
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
    while(flag_server) {
        struct sockaddr_in address_by;
        socklen_t lenth = sizeof(address_by);

        int connection = accept(this->fd, (struct sockaddr*)&address_by, &lenth);

        if(connection  < 0)  {

            this->information = "accept failled";}

        else {
            if (     this->address_ip != box_blank 
                 and this->address_ip != inet_ntoa(address_by.sin_addr) ) {
                msg = "Smile";
                msg = control_message( &msg, &msg, &msg, &msg, &msg, &msg, &msg, 0,
                                       gop_client.address_ip );
                
                for (ptr = 0; ptr < msg.length(); ptr++) {
                    buffer_send[ptr] = msg[ptr];}
                buffer_send[ptr] = '\0';
                send(connection, buffer_send, sizeof(buffer_send),0);
                cout << "Smile to " << inet_ntoa(address_by.sin_addr) << endl;
                file_append("/opt/gop/note/server.note", info_time);
                file_append("/opt/gop/note/server.note", "Smile to ");
                file_append("/opt/gop/note/server.note", inet_ntoa(address_by.sin_addr));
                file_append("/opt/gop/note/server.note", "\n");}

            else {
                this->point_time = time(NULL);
                this->address_ip = inet_ntoa(address_by.sin_addr);
                this->information = "";
                if ( this->how == "Wait" ) {
                    cout << "Connectted by " << this->address_ip << endl;
                    file_append("/opt/gop/note/server.note", info_time);
                    file_append("/opt/gop/note/server.note", "Connectted by ");
                    file_append("/opt/gop/note/server.note", this->address_ip);
                    file_append("/opt/gop/note/server.note", "\n");
                    this->how = "Connectted";}
                msg = control_message(&(this->how),         &(gop_client.how),
                                      &(this->information), &(gop_client.information),
                                      &(this->command),     &(gop_client.command),
                                      &(this->update),      &(this->step_update),
                                        buffer_recv);
                for ( ptr=0; ptr<msg.length(); ptr++ ) {
                    buffer_send[ptr] = msg[ptr];}
                buffer_send[ptr] = '\0';
                send(connection, buffer_send, sizeof(buffer_send),0);
                recv(connection, buffer_recv, sizeof(buffer_recv),0);}
            close(connection);}}
    file_append("/opt/gop/note/server.note", info_time);
    file_append("/opt/gop/note/server.note", "Server close");
    file_append("/opt/gop/note/server.note", "\n");}







