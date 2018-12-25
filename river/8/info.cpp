char info_system[1000];
string info_ip[10][2];
#include "/media/gop/gop/crows/info/system.cpp"
#include "/media/gop/gop/crows/info/ip.cpp"



void* info()
{
    memset(info_system, '\0', sizeof(info_system));
    memset(info_ip, '\0', sizeof(info_ip));

    while(true)
    {
        info_system_get();
        info_ip_get();
        sleep(1);
    }
}
