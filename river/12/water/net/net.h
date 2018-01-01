class gopi_net { public:

    string    how          = "BLANK";
    time_t    point_time   = time(NULL);
    string    command      = "";
    string    information  = "";
    string    update       = "";

    int       fd;
    int       port;
    char*     address_ip;};

class socket_server: public gopi_net{ public:
    void start();};
class socket_client: public gopi_net{ public:
    void start();};
//----------------------------------------------------------
socket_server gop_server;
socket_client gop_client;

#include "./ipv4/server.h"
#include "./ipv4/client.h"
//#include    "../configure/configure.h"
//#include "../../suface/watchdog/check/net.h"

void* gop_server_start(void*) {
    gop_server.start();}
void* gop_client_start(void*) {
    gop_client.start();}


