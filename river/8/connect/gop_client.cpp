#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
#include <iostream>
void gopi_connect::client(){
    struct sockaddr_in s_in;
    char buf[100];
    int s_fd;
    int port = 5200;
    char *str = "socket net program";
    char *sip = "127.0.0.1";
    memset((void *)&s_in,0,sizeof(s_in));

    s_in.sin_family = AF_INET;
    s_in.sin_port = htons(port);
    inet_pton(AF_INET,sip,(void *)&s_in.sin_addr);

    s_fd = socket(AF_INET,SOCK_STREAM,0);

    /*
    面向连接的客户程序使用connect函数来配置socket并与远端服务器建立一个TCP连接
    int connect(int sockfd, struct sockaddr *serv_addr,int addrlen)
    sockfd是socket函数返回的socket描述符；serv_addr是包含远端主机IP地址和端口号的指针；
    addrlen是远端地址结构的长度
    */
    connect(s_fd,(struct sockaddr *)&s_in,sizeof(s_in));

    cout<<"this: "<<str<<endl;
    write(s_fd,str,strlen(str)+1);
    read(s_fd,buf,100);
    cout<<"that: "<<buf<<endl;

    close(s_fd);
}
