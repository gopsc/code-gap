void socket_server::build() {
    this->port = port_this;
    struct sockaddr_in address;

    this->fd = socket(AF_INET, SOCK_STREAM, 0);
    address.sin_family = AF_INET;
    address.sin_port = htons(this->port);
    address.sin_addr.s_addr = htonl(INADDR_ANY);

    if(bind(this->fd, (struct sockaddr*)&address, sizeof(address)) == -1)  {perror("bind");}
    if(listen(this->fd, num_listen) == -1)  {perror("listen");}

    this->how = "Wait";}
//===================================================================
void socket_server::smile(void) {
//-------------------------------------------------------------------
    struct sockaddr_in address_by;
    socklen_t           lenth = sizeof(address_by);
//-------------------------------------------------------------------
    int                connection;
    char               buffer_recv[10240];
    char               buffer_send[10240];
    string              msg = "Smile";
    int                ptr;
//-------------------------------------------------------------------
    this->flag_smile = true;
//===================================================================
    while(true) {
//===================================================================
        if(this->how == "Connectted" or this->how == "Sopi"){
            connection = accept(this->fd, (struct sockaddr*)&address_by, &lenth);
//-------------------------------------------------------------------
            if(connection  < 0) {
                perror("smile accept");}
            else {
                msg = control_message( &msg, &msg, &msg, &msg,&msg, &msg,
                                       gop_client.address_ip);
//-------------------------------------------------------------------
                    for (ptr = 0; ptr < msg.length(); ptr++) {
                        buffer_send[ptr] = msg[ptr];}
                    buffer_send[ptr] = '\0';
//-------------------------------------------------------------------
                try {
                    send(connection, buffer_send, sizeof(buffer_send),0);
                    cout << "Smile to " << inet_ntoa(address_by.sin_addr) << endl;}
                catch (...){
                    cout << "Smile to " << inet_ntoa(address_by.sin_addr) << "failled" << endl;}
//-------------------------------------------------------------------
                msg = "Smile";}}
//-------------------------------------------------------------------
        sleep(1);}}
//===================================================================
void socket_server::start(void) {
//===================================================================
    while(true) {
//===================================================================
        if(this->how != "Wait"){
            this->build();}
//-------------------------------------------------------------------
        else {
            struct sockaddr_in address_by;
            socklen_t lenth = sizeof(address_by);
//-------------------------------------------------------------------
            int connection = accept(this->fd, (struct sockaddr*)&address_by, &lenth);
            if(connection  < 0)  {
                perror("accept");}
            else{
                this->how = "Connectted";
                this->address_ip = inet_ntoa(address_by.sin_addr);
                cout << "Connectted by " << this->address_ip << endl;}
//-------------------------------------------------------------------
            char buffer_recv[10240];
            char buffer_send[10240];
            string msg;
            int ptr;
//===================================================================
            while(this->how == "Connectted" or this->how == "Sopi"){
//===================================================================
                msg = control_message(&(this->how), &(gop_client.how),
                                      &(this->information), &(gop_client.information),
                                      &(this->command),     &(gop_client.command),
                                      buffer_recv);
                for (ptr = 0; ptr < msg.length(); ptr++) {
                    buffer_send[ptr] = msg[ptr];}
                buffer_send[ptr] = '\0';
//-------------------------------------------------------------------
                try {
                    send(connection, buffer_send, sizeof(buffer_send),0);}
                catch (...){
                    close(connection);
                    cout << this->address_ip << " get out." << endl;
                    this->how = "Wait";
                    this->address_ip = box_blank;}
//-------------------------------------------------------------------
                try {
                    recv(connection, buffer_recv, sizeof(buffer_recv),0);
                    cout << buffer_recv << endl;}
                catch (...){
                    close(connection);
                    cout << this->address_ip << " get out." << endl;
                    this->how = "Wait";
                    this->address_ip = box_blank;}
//-------------------------------------------------------------------
                sleep(1);}
//-------------------------------------------------------------------
            close(connection);}
        sleep(1);}
    close(this->fd);}


