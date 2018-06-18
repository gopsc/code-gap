
//g++ ./seed.cpp -lpthread -lasound -std=c++0x -o gopi

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <fstream>
//#include <sstream>
//#include <dirent.h>

#include <pthread.h>
//#include <time.h>
//#include <sys/socket.h>
#include <unistd.h>

//#include <sys/types.h>
//#include <sys/stat.h>

//#include <ifaddrs.h>
//#include <arpa/inet.h>


//#include <math.h>







char   path_the[100]  = "/opt";
char   name_the[100]  = "ta";


//------------------------mind---------------------------
bool     flag_mind = true;

bool     flag_dog = true;
bool     flag_show;

bool     flag_client;
bool     flag_server;

bool     flag_sound;
bool     flag_sound_show;
bool     flag_sound_save;
//-------------------------net---------------------------
char     address_to[16];
int      port_to;
int      port_this;

float    step_connect;
int      size_update;
int      count_update = 0;
int      count_update_max;

//-------------------------sound-------------------------
int      rate;
int      channels;
int      N;
