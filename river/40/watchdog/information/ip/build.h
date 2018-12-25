

void information_ip_get() {


    struct ifaddrs * ifAddrStruct=NULL;
        getifaddrs(&ifAddrStruct);

    void*  tmpAddrPtr=NULL;

    int    num_ip = 0;

    while (ifAddrStruct!=NULL) {
        if (ifAddrStruct->ifa_addr->sa_family==AF_INET){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, tmpAddrPtr, addressBuffer, INET_ADDRSTRLEN);

            num_ip++;
            strcpy(information_ip[num_ip][1], ifAddrStruct->ifa_name);
            strcpy(information_ip[num_ip][2], addressBuffer);}
/*
        else if (ifAddrStruct->ifa_addr->sa_family==AF_INET6){

            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET6_ADDRSTRLEN];
            inet_ntop(AF_INET6, tmpAddrPtr, addressBuffer, INET6_ADDRSTRLEN);

            num_ip[2]++;
            information_ip[2][buffer_point_ip[2]][1] = ifAddrStruct->ifa_name;
            information_ip[2][buffer_point_ip[2]][2] = addressBuffer;}
*/
        ifAddrStruct=ifAddrStruct->ifa_next;}

    information_ip_num  = num_ip;

    freeifaddrs(ifAddrStruct);}





// 1 for name, 2 for address


/*
    cmd_get( "ifconfig | grep 'Link encap' | cut -d' ' -f1",                        that_ip[1] );
    cmd_get( "ifconfig | grep 'inet addr'  | tr -s ' ' : | cut -d: -f4",            that_ip[2] );



    if ( strcmp(that_ip[1], "") == 0 ) {
        cmd_get( "ifconfig | grep ': '  | tr -s ' ' : | cut -d: -f1",               that_ip[1] );}

    if ( strcmp(that_ip[2], "") == 0   or   strlen(that_ip[2]) < 7 ) {
        cmd_get( "ifconfig | grep 'inet 地址'  | tr -s ' ' : | cut -d: -f4",   that_ip[2] );}

    if ( strcmp(that_ip[2], "") == 0   or   strlen(that_ip[2]) < 7 ) {
        cmd_get( "ifconfig | grep 'inet '  | tr -s ' ' : | cut -d: -f3",            that_ip[2] );}



    if ( that_ip[1][strlen(that_ip[1])-1] != '\n') {
        strcat(that_ip[1], "\n");}
    if ( that_ip[2][strlen(that_ip[2])-1] != '\n') {
        strcat(that_ip[2], "\n");}



    int   num_ip[3];
    char  buffer_ip[3][255];
    char* point_ip[3];








    for ( int i=1; i<=2; i=i+1 ) {

        num_ip[i] = 0;

// It will goes mass

        strcpy(buffer_ip[i], " ");

        point_ip[i] = buffer_ip[i];

// It will goes mass

        while (  strlen(point_ip[i]) != 0 ) {

            num_ip[i]++;



            strcpy( buffer_ip[i],    that_ip[i]   );

            point_ip[i]    = strstr( buffer_ip[i],    "\n" );



            if ( strcmp( point_ip[i], "\n") != 0 ) {

                 strcpy( that_ip[i], point_ip[i] + 1 );}



           *point_ip[i]    = '\0';

            point_ip[i]++;

            strcpy(information_ip[num_ip[i]][i], buffer_ip[i]);}}




    information_ip_num = num_ip[1];}
*/