#include <ifaddrs.h>
#include <arpa/inet.h>

int info_ip_get () {

    int num = 1;
    struct ifaddrs * ifAddrStruct=NULL;
    void * tmpAddrPtr=NULL;
    getifaddrs(&ifAddrStruct);

    while (ifAddrStruct!=NULL) {

        if (ifAddrStruct->ifa_addr->sa_family==AF_INET)
            { 
                tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
                char addressBuffer[INET_ADDRSTRLEN];
                inet_ntop(AF_INET, tmpAddrPtr, addressBuffer, INET_ADDRSTRLEN);
                info_ip[num][1] = ifAddrStruct->ifa_name;
                info_ip[num][2] = addressBuffer; 
                num++; 
            }

        else if (ifAddrStruct->ifa_addr->sa_family==AF_INET6)
            { 
                tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
                char addressBuffer[INET6_ADDRSTRLEN];
                inet_ntop(AF_INET6, tmpAddrPtr, addressBuffer, INET6_ADDRSTRLEN);
                info_ip[num][1] = ifAddrStruct->ifa_name;
                info_ip[num][2] = addressBuffer; 
                num++; 
            } 

        ifAddrStruct=ifAddrStruct->ifa_next;
    }
    return 0;
}

