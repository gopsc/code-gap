#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <pthread.h>
#include <unistd.h>

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
//--------------------------------info---------------------------------
char info_system[100];
string info_ip[10][2];
string info_ip6[10][2];
int point_ip, point_ip6;

#include "./info.c"

void* gop_info(void*){
    while(true){
        try{
            info_system_get();}
        catch(...){
            memset(info_ip,'\0',sizeof(info_ip));}
        try{
            info_ip_get();}
        catch(...){
            memset(info_ip,'\0',sizeof(info_ip));}
        sleep(1);}}
//-------------------------------connect---------------------------------
#include "./net.c"

gopi_connect gopi_server;
gopi_connect gopi_client;

void* gop_server(void*) {
    try{
        gopi_server.server();}
    catch(...){
        }}
//------------------------------
void* gop_client(void*) {
    try{
        gopi_client.client();}
    catch(...){
        }}
//----------------------sound------------------------------
char    *pdevice = "hw:0,0";
char    *cdevice = "hw:1,0";
int      rate = 44100;
int      channels = 1;
char*    buffer_sound;
int      buffer_dft[10][3000],point_dft;

#define PATH "./alsa-sound.c"
#include PATH

void* gop_sound(void*){
    try{
        alsa_sound();}
    catch(...){
        }}
//-------------------------BODY----------------------------
int main (){
    pthread_t thread[3];
    pthread_create (&thread[0], NULL, gop_info , NULL);
    pthread_create (&thread[1], NULL, gop_sound , NULL);
    pthread_create (&thread[2], NULL, gop_server, NULL);
    pthread_create (&thread[3], NULL, gop_client, NULL);
    while(true) {
        sleep(0.1);}}
