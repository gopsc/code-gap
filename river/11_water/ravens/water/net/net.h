class gopi_net { public:

    string     how;
    string    command;
    string    information;

    int fd;
    int       port;
    char*     address_ip;};

class socket_server: public gopi_net{ public:
    bool flag_smile = false;

    void build();
    void start();
    void smile();};
class socket_client: public gopi_net{ public:
    void start();};
//----------------------------------------------------------
socket_server gop_server;
socket_client gop_client;

#include "./ipv4/server.h"
#include "./ipv4/client.h"
//       "../memory/configure.h"

void* gop_server_start(void*) {
    gop_server.start();}
void* gop_server_smile(void*) {
    gop_server.smile();}

void* gop_client_start(void*) {
    gop_client.start();}


