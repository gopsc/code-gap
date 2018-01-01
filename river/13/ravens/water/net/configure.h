
class gopi_net { public:

    string    how          = "BLANK";
    time_t    point_time   = time(NULL);
    string    command      = "";
    string    information  = "";
    string    update       = "";
    int       step_update  = 0;

    int       fd;
    int       port;
    char*     address_ip  = box_blank;

    bool      flag_smile = false;};

class socket_server: public gopi_net{ public:
    void start();};
class socket_client: public gopi_net{ public:
    void start();};

socket_server gop_server;
socket_client gop_client;


void* gop_server_start(void*) {
    gop_server.start();}

void* gop_client_start(void*) {
    gop_client.start();}




