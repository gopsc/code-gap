#include <iostream>
#include <stdlib.h>
#include <stdio.h>

#include <string.h>
#include <sstream>

#include <pthread.h>
#include <unistd.h>

#include <dirent.h>

#include <cstdio>
#include <cstring>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#include <limits.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <sys/shm.h>

using namespace std;
//---------------------for main---------------------
char          flag_blank[1] = "";

bool          flag_info  = false;
bool          flag_sound = false;

pthread_t     thread[3];
//---------------------for info---------------------
struct OCCUPY_CPU{
             char name[20];
    unsigned int  user;
    unsigned int  nice;
    unsigned int  system;
    unsigned int  idle;

             int  f;
             int  temperature;
    unsigned int  rate;};

struct OCCUPY_MEMORY{
    unsigned char name1[20];
    unsigned char name2[20];
    unsigned char name3[20];
    unsigned char name4[20];

    unsigned int  total;
    unsigned int  free;

    unsigned int  buffers;
    unsigned int  cached;};

struct OCCUPY_MEMORY info_memory;
struct OCCUPY_CPU    info_cpu;
string info_name;
string info_system;
string info_ip[10][2];  int point_ip;
string info_ip6[10][2]; int point_ip6;
string info_sound[3][6];
int point_capture=0, point_playback=0;
//---------------------for sound--------------------
char     device_playback[7]    = "hw:0,0";
char     device_capture[7]     = "hw:0,0";
int      rate                  = 44100;
int      channels              = 1;
int      buffer_dft[10][3000];                 int point_dft;
//---------------------for net----------------------
char     address_to[15]        = "10.10.10.103";
int      port_to               = 5200;
int      port_this             = 5200;
int      num_listen            = 2;

class gopi_net { public:
    string    how;
    char*     address_ip;
    int       port;

    string command;
    string information;

    int fd;};

class socket_server: public gopi_net{ public:
    void build();
    void start();};
class socket_client: public gopi_net{ public:
    void start();};

socket_server gopi_server;
socket_client gopi_client;
//--------------------------------------------------
