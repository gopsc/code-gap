//g++ ./seed.cpp -lpthread -lasound -std=c++0x -o gopi
#include <iostream>
#include <fstream>
#include <sstream>
#include <dirent.h>

#include <pthread.h>
#include <time.h>
#include <sys/socket.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/stat.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

#include <math.h>

using namespace std;
//--------------------------------mind---------------------------------
#include "./water/water.h"
#include "./suface/suface.h"
//-------------------------BODY----------------------------------------
pthread_t    thread[5];
string       command;
int main(int argc, char *argv[]){

    cout << "information START." << endl;
    pthread_create (&thread[0], NULL, gop_information , NULL);   while (flag_info             != true) {sleep(0.1);}

    cout << "server      START." << endl;
    pthread_create (&thread[1], NULL, gop_server_start, NULL);   while (gop_server.how        == "")   {sleep(0.1);}

    cout << "smile       START"  << endl;
    pthread_create (&thread[2], NULL, gop_server_smile, NULL);   while (gop_server.flag_smile == true) {sleep(0.1);}

    //cout << "client      START"  << endl;
    //pthread_create (&thread[3], NULL, gop_client_start, NULL);   while (gop_client.how        == "")   {sleep(0.1);}

    //cout << "sound       START"  << endl;
    //pthread_create (&thread[4], NULL, gop_sound , NULL);           while (flag_sound == true)            {sleep(0.1);}

    //pthread_create (&thread[5], NULL, gop_window, NULL);        // while (gop_client.how == "") {sleep(1);}

    while(true) {
        getline(cin, command, '\n');
//---------------------------------------------------------------------
        if ( command == " " ) {
            if ( gop_server.how == "Connectted" ) {
                cout << endl << '<' << gop_server.how << '>' << endl;
                cout << gop_server.information << endl;}
            if ( gop_client.how == "Sop") {
                cout << endl << '<' << gop_client.how << '>' << endl;
                cout << gop_client.information << endl;}}
//---------------------------------------------------------------------
        if ( command == "Sopi" ) {
            if ( gop_server.how == "Sopi" ) {
                gop_server.command = "Sopi.";}
            if ( gop_client.how == "Connectting") {
                gop_client.command = "Sopi.";}}
//---------------------------------------------------------------------
        if ( command == "Update" ) {
            if ( gop_server.how == "Connectted" ) {
                gop_server.command = "Update.";}
            if ( gop_client.how == "Sop") {
                gop_client.command = "Update.";}}
//---------------------------------------------------------------------
    if ( command == "sound" ) {
        if ( flag_sound == false ) {
            cout << "sound       START"  << endl;
            pthread_create (&thread[4], NULL, gop_sound , NULL);
            while (flag_sound == true)  {
                sleep(0.1);}}
        else {
            cout << "sound       IS WORKING"  << endl;}}}}


