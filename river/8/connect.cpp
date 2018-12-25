class gopi_connect
{
    public:
        string buff;
        string ip_address;

        ~gopi_connect();
        gopi_connect();

        void server();
        void client();
};



gopi_connect::gopi_connect()
{
buff = "off";
}
gopi_connect::~gopi_connect()
{
}

#include <stdlib.h>  
#include <netinet/in.h> 
#include "/media/gop/gop/crows/connect/gop_server.cpp"
#include "/media/gop/gop/crows/connect/gop_client.cpp"
