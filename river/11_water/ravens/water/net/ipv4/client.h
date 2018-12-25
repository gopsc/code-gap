void socket_client::start(){
    this->fd = socket(AF_INET, SOCK_STREAM, 0);
    this->address_ip = address_to;
    this->port = port_to;

    struct sockaddr_in address;

    char buffer_recv[10240];
    char buffer_send[10240];
    string msg;
    int ptr;


    while (1) {
        if (true) {
            address.sin_family = AF_INET;
            address.sin_port = htons(this->port);
            address.sin_addr.s_addr = inet_addr(this->address_ip);
            this->how = "Wait";}
//===================================================================
        while(this->how == "Wait"){
//-------------------------------------------------------------------
            if (connect(this->fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
                perror("connect");}
            else{
                this->how = "Connectting";
                cout << "Connectting to " << this->address_ip << endl;}
//===================================================================
            while(this->how == "Connectting" or this->how == "Sop"){
//-------------------------------------------------------------------
                try {
                    recv(this->fd, buffer_recv, sizeof(buffer_recv), 0);}
                catch (...){
                    cout << this->address_ip << " get out." << endl;
                    this->how = "Wait";
                    this->address_ip = box_blank;}
//===================================================================
                msg = control_message(&(this->how),         &(gop_server.how),
                                      &(this->information), &(gop_server.information),
                                      &(this->command),     &(gop_server.command),
                                      buffer_recv);
//===================================================================
                if (this->how == "Turn") {
//-------------------------------------------------------------------
                    for (ptr = 0; ptr < msg.length(); ptr++) {
                        this->address_ip[ptr] = msg[ptr];}
                    this->address_ip[ptr] = '\0';
//-------------------------------------------------------------------
                    close(this->fd);
                    this->fd = socket(AF_INET, SOCK_STREAM, 0);
                    address.sin_addr.s_addr = inet_addr(this->address_ip);
//-------------------------------------------------------------------
                    this->how = "Wait";}
//===================================================================
                else {
//-------------------------------------------------------------------
                    for (ptr = 0; ptr < msg.length(); ptr++) {
                        buffer_send[ptr] = msg[ptr];}
                    buffer_send[ptr] = '\0';
//-------------------------------------------------------------------
                    try {
                        send(this->fd, buffer_send, sizeof(buffer_send), 0);}
                    catch (...){
                        cout << this->address_ip << " get out." << endl;
                        this->how = "Wait";
                        this->address_ip = box_blank;}}
//===================================================================
                sleep(1);}
            sleep(1);}}
    close(this->fd);}


