

void info_ip_get () {

    struct ifaddrs * ifAddrStruct=NULL;
        getifaddrs(&ifAddrStruct);
    void*  tmpAddrPtr=NULL;

    int    buffer_point_ip[2];
    buffer_point_ip[1] = 0;
    buffer_point_ip[2] = 0;
    while (ifAddrStruct!=NULL) {
        if (ifAddrStruct->ifa_addr->sa_family==AF_INET){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, tmpAddrPtr, addressBuffer, INET_ADDRSTRLEN);

            buffer_point_ip[1]++;
            info_ip[1][buffer_point_ip[1]][1] = ifAddrStruct->ifa_name;
            info_ip[1][buffer_point_ip[1]][2] = addressBuffer;}

        else if (ifAddrStruct->ifa_addr->sa_family==AF_INET6){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET6_ADDRSTRLEN];
            inet_ntop(AF_INET6, tmpAddrPtr, addressBuffer, INET6_ADDRSTRLEN);

            buffer_point_ip[2]++;
            info_ip[2][buffer_point_ip[2]][1] = ifAddrStruct->ifa_name;
            info_ip[2][buffer_point_ip[2]][2] = addressBuffer;}
        ifAddrStruct=ifAddrStruct->ifa_next;}

    point_ip[1]  = buffer_point_ip[1];
    point_ip[2]  = buffer_point_ip[2];

    freeifaddrs(ifAddrStruct);}









