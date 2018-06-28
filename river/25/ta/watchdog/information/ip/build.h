
void info_ip_get() {

    string that1  = cmd_get("info_ip", "ifconfig | grep 'Link encap' | cut -d' ' -f1");
           that1 += "\n";
    string that2  = cmd_get("info_ip", "ifconfig | grep 'inet addr'  | tr -s ' ' : | cut -d: -f4");
           that2 += "\n";



    if (that2 == ""  or  that2.length() < 7) {
        that2 = cmd_get("info_ip", "ifconfig | grep 'inet 地址'  | tr -s ' ' : | cut -d: -f4");}
    if (that2 == ""  or  that2.length() < 7) {
        that2 = cmd_get("info_ip", "ifconfig | grep 'inet '  | tr -s ' ' : | cut -d: -f3");}



    if (that1.substr(that1.length(), 1) != "\n") {
        that1 += '\n';}
    if (that2.substr(that2.length(), 1) != "\n") {
        that2 += '\n';}




    int    num_ip = 0;

    int    num1   = that1.find("\n");
    int    num2   = that2.find("\n");

    while( num1 != -1 and num2 != -1 ) {


        num_ip++;

        info_ip[1][num_ip][1] = that1.substr(0, num1);
        info_ip[1][num_ip][2] = that2.substr(0, num2);


        that1                 = that1.substr(num1+1, that1.length());
        that2                 = that2.substr(num2+1, that2.length());

        num1                  = that1.find("\n");
        num2                  = that2.find("\n");

        if (num1 == -1 and that1.length() >= 2) {

            that1 += '\n';
            that2 += '\n';

            num1 = that1.find("\n");
            num2 = that2.find("\n");}}




    point_ip[1] = num_ip;}



/*
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
            info_ip[2][buffer_point_ip[2]][2] = addressBuffer;
            cout<<ifAddrStruct->ifa_name<<endl;}
        ifAddrStruct=ifAddrStruct->ifa_next;}

    point_ip[1]  = buffer_point_ip[1];
    point_ip[2]  = buffer_point_ip[2];

    freeifaddrs(ifAddrStruct);
*/
