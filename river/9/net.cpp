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

void socket_server::start() {
    while(true) {
    if(this->how == "Wait"){
        struct sockaddr_in address_by;
        socklen_t lenth = sizeof(address_by);

        int connection = accept(this->fd, (struct sockaddr*)&address_by, &lenth);

        if(connection  < 0)  {perror("accept");}
        else{
            this->how = "Connectted";
            this->address_ip = inet_ntoa(address_by.sin_addr);
            cout << "Connectted by " << this->address_ip << endl;}

        char buffer_recv[1024];
        char buffer_send[1024];
        string msg;
        int ptr;

        while(this->how == "Connectted" or this->how == "Seed by"){
            msg = control_msg(this->address_ip, &(this->how), &(this->information), buffer_recv, &(this->command));
            for (ptr = 0; ptr < msg.length(); ptr++) {
                buffer_send[ptr] = msg[ptr];}
            buffer_send[ptr] = '\0';

            try {
                send(connection, buffer_send, sizeof(buffer_send),0);}
            catch (...){
                close(connection);
                cout << this->address_ip << " get out." << endl;
                this->how = "Wait";
                this->address_ip = flag_blank;}
            try {
                recv(connection, buffer_recv, sizeof(buffer_recv),0);}
            catch (...){
                close(connection);
                cout << this->address_ip << " get out." << endl;
                this->how = "Wait";
                this->address_ip = flag_blank;}
            sleep(1);}

        close(connection);}
    sleep(1);}
    close(this->fd);}

//----------------------------------------------------------
void socket_client::start(){
    for (int i = 1; i <= 5; i++){
        if (info_ip[i][1] != "lo" && info_ip[i][1] != "eth0") {
            if (info_ip[i][1] != "" && info_ip[i][1] != "usb0") {
               if (info_ip[i][2] != address_to){
                   }
               else {
                   this->fd = socket(AF_INET, SOCK_STREAM, 0);
                   struct sockaddr_in address;

                   this->address_ip = address_to;
                   this->port = port_to;

                   address.sin_family = AF_INET;
                   address.sin_port = htons(this->port);
                   address.sin_addr.s_addr = inet_addr(this->address_ip);


                   char buffer_recv[1024];
                   char buffer_send[1024];
                   string msg;
                   int ptr;

                   this->how = "Wait";

                   while(this->how == "Wait"){
                       if (connect(this->fd, (struct sockaddr *)&address, sizeof(address)) < 0)  {perror("connect");}
                       else{
                           this->how = "Connectting";
                           cout << "Connectting to " << this->address_ip << endl;}

                       while(this->how == "Connectting" or this->how == "Seed"){
                           try {
                               recv(this->fd, buffer_recv, sizeof(buffer_recv), 0);}
                           catch (...){
                               cout << this->address_ip << " get out." << endl;
                               this->how = "Wait";
                               this->address_ip = flag_blank;}

                           msg = control_msg(this->address_ip, &(this->how), &(this->information), buffer_recv, &(this->command));
                           for (ptr = 0; ptr < msg.length(); ptr++) {
                               buffer_send[ptr] = msg[ptr];}
                           buffer_send[ptr] = '\0';

                           try {
                               send(this->fd, buffer_send, sizeof(buffer_send), 0);}
                           catch (...){
                               cout << this->address_ip << " get out." << endl;
                               this->how = "Wait";
                               this->address_ip = flag_blank;}

                           sleep(1);}}
                   close(this->fd);}}}}}
