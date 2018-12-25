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
pthread_t    thread[6];
string       command;
int main(int argc, char *argv[]){

    cout << "watchdog    START." << endl;
    pthread_create (&thread[1], NULL, gop_dog , NULL);           while (flag_dog              != true) {sleep(0.1);}

    //cout << "server      START." << endl;
    //pthread_create (&thread[2], NULL, gop_server_start, NULL);   while (gop_server.how        == "")   {sleep(0.1);}

    //cout << "client      START"  << endl;
    //pthread_create (&thread[3], NULL, gop_client_start, NULL);   while (gop_client.how        == "")   {sleep(0.1);}

    cout << "sound       START"  << endl;
    pthread_create (&thread[4], NULL, gop_sound , NULL);           while (flag_sound == true)            {sleep(0.1);}

    //pthread_create (&thread[5], NULL, gop_window, NULL);        // while (gop_client.how == "") {sleep(1);}


        while(true) {
        getline(cin, command, '\n');
//---------------------------------------------------------------------
        if ( command == " " ) {
            for (int i = 0; i < 100; i++){
                cout << endl;}
            cout << gop_server.information << endl;
            cout << gop_client.information << endl;}
//---------------------------------------------------------------------
        else if ( command == "clean" ) {
            for (int i = 0; i < 100; i++){
                cout << endl;}}
//---------------------------------------------------------------------
        else if ( command == "show" ) {
            if      ( flag_show == false ) {
                 flag_show = true;}
            else if ( flag_show == true ) {
                 flag_show = false;}}
//---------------------------------------------------------------------
        else if ( command == "sound" ) {
            if ( flag_sound == false ) {
                cout << "sound       START"  << endl;
                pthread_create (&thread[4], NULL, gop_sound , NULL);
                while (flag_sound == true)  {
                    sleep(0.1);}}
            else {
                cout << "sound       IS WORKING"  << endl;}}
//---------------------------------------------------------------------
        else if ( command == "Sopi" ) {
            if ( gop_server.how == "Sopi" ) {
                gop_server.command = "Sopi.";}
            if ( gop_client.how == "Connectting") {
                gop_client.command = "Sopi.";}}
//---------------------------------------------------------------------
        else if ( command == "Update" ) {
            if ( gop_server.how == "Connectted" ) {
                gop_server.command = "Update.";}
            if ( gop_client.how == "Sop") {
                gop_client.command = "Update.";}}}}

