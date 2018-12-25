class gopi_connect {

    public:

/*
        string   how;
        time_t   point_time;

        string   command;
        string   information;

        string   update;
        int      step_update;

        int      fd;
        int      port;
        char*    address_ip;
*/
        virtual void     server_start() = 0;
        virtual void     client_start() = 0;};

class connect_socket: public gopi_connect {

    public:

        string    how[4];
        time_t    point_time[4];

        string    command[4];
        string    information[4];

        string    update[4];
        int       step_update[4];

        string    address_ip[4];
        int       port[2];
        int       fd[2];

        connect_socket() {
            point_time[0] = time(NULL);
            point_time[1] = time(NULL);
            point_time[2] = time(NULL);
            point_time[3] = time(NULL);

            step_update[0] = 0;
            step_update[1] = 0;
            step_update[1] = 0;
            step_update[3] = 0;

            address_ip[0] = box_blank;
            address_ip[1] = box_blank;
            address_ip[2] = box_blank;
            address_ip[3] = box_blank;}
        void server_start();
        void client_start();};

connect_socket gop_connect;

void* gop_server_start(void*) {
    gop_connect.server_start();}

void* gop_client_start(void*) {
    gop_connect.client_start();}












