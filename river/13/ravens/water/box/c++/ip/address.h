
string  info_ip[3][5][3];
int     point_ip  = 0;
int     point_ip6 = 0;

void info_ip_get () {

    struct ifaddrs * ifAddrStruct=NULL;
        getifaddrs(&ifAddrStruct);
    void * tmpAddrPtr=NULL;

    point_ip  = 0;
    point_ip6 = 0;

    while (ifAddrStruct!=NULL) {
        if (ifAddrStruct->ifa_addr->sa_family==AF_INET){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, tmpAddrPtr, addressBuffer, INET_ADDRSTRLEN);
                if (ifAddrStruct->ifa_name != "lo") {
                    info_ip[1][point_ip][1] = ifAddrStruct->ifa_name;
                    info_ip[1][point_ip][2] = addressBuffer;
                    point_ip++;}}

        else if (ifAddrStruct->ifa_addr->sa_family==AF_INET6){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET6_ADDRSTRLEN];
            inet_ntop(AF_INET6, tmpAddrPtr, addressBuffer, INET6_ADDRSTRLEN);
                if (ifAddrStruct->ifa_name != "lo") {
                    info_ip[2][point_ip6][1] = ifAddrStruct->ifa_name;
                    info_ip[2][point_ip6][2] = addressBuffer;
                    point_ip6++;}}
        ifAddrStruct=ifAddrStruct->ifa_next;}}




