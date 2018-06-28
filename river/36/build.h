





pthread_t    thread[6];





int main( int argc, char *argv[] ) {

    note_save("command", "test");
    printf("\n");

    pthread_create (&thread[1], NULL, gop_dog,          NULL);
//    pthread_create (&thread[2], NULL, gop_server_start, NULL);
//    pthread_create (&thread[3], NULL, gop_client_start, NULL);
//    pthread_create (&thread[4], NULL, gop_corde ,       NULL);







    char command[129] = "";







    while ( !information_done ) {
        usleep(100000);}







    printf( "\nCommand is gonna start, take 'Help' to get commands list.\n" );
    note_save("command", "Command start");

    while (flag_mind) {





        printf("\n");

        fgets(command,100, stdin);

        command[strlen(command)-1] = '\0';

        printf("\n");





//---------------------------------------------------------------------

        if ( strcmp( command, "Help" ) == 0 )  {

            printf( "\n COMMAND LIST\n\n" );
            printf( "Take blank board to get computer & net information.\n" );
            printf( "Take 'Quit' to exit gop.\n" );
            printf( "Take 'Show' to keep printting computer & net information.\n" );
            printf( "Take 'Command xxx' to run a shell command.\n" );

            printf( "\n SOUND COMMANDS.\n\n" );
            printf( "Take 'Sound' to start sound corde.\n" );
            printf( "Take 'Sound show' to start Sound corde with fft, it goes slowly.\n" );
            printf( "Take 'Test dft' to test dft.\n" );
            printf( "Take 'Test fft' to test fft.\n" );

            printf( "\n NETWORK COMMANDS.\n\n" );
            printf( "Take 'Connect IP-address:port' to Connect another gopi on Internet.\n" );
            printf( "Take 'Sopi' to get control of net connection.\n" );
            printf( "Take 'Update' to update gopi on your device to another.\n" );

            printf( "\n DATE CONFIGURE.\n\n" );
            printf( "Take 'Reload configure' to reload configure.\n" );
            printf( "Take 'Reload listen' to reload listenning date.\n" );

            printf( "\n U-DISK COMMANDS FOR TESK!!!\n\n" );
            printf( "     'Save'\n     'Load'\n     'Test'\n     'Test alsa'\n     'Install'\n     'Remove'\n" );}

///--------------------------------------------------------------------
/*
        else if ( strstr(command, "Connect "), command ) {

            if ( strstr(command, ":") != NULL ) {

printf("Closed\n");

                gop_connect.address_ip[0] = strstr(command, ":") + 1;
                gop_connect.address_ip[0] = address_to;
                gop_connect.port[0]       = atoi(command.substr(command.find(":")+1, command.length()).c_str());


                flag_client               = true;

                printf("CONNECT TO %s:%i\n", gop_connect.address_ip[0], gop_connect.port[0]);}}
*/
//---------------------------------------------------------------------

         else if ( strcmp( command, " " ) == 0 ) {

            char buffer_message[2049];

	    system("clear");

            information_get( buffer_message );

            printf( "%s\n", buffer_message );
//            printf("%s",   gop_connect.information[1]);
//            printf("%s",   gop_connect.information[2]);
//            printf("%s",   gop_connect.information[3]);
//            printf("%s",   gop_connect.information[0]);
}

//---------------------------------------------------------------------

        else if ( strcmp( command, "Quit" ) == 0 ){

//exit
            flag_dog       = false;
            flag_client    = false;
            flag_server    = false;
            flag_sound     = false;
            flag_show      = false;

//Threads need time to exit
            usleep(300000);

//the thread of mind is main thread, when it exit, othes too
            flag_mind      = false;}

//---------------------------------------------------------------------

        else if ( strcmp( command, "Save" ) == 0 ){

            char cmd[100] = "";

            strcat(cmd, "bash ");
            strcat(cmd, path_the);
            strcat(cmd, "/");
            strcat(cmd, name_the);
            strcat(cmd, "/box/Linux/save.sh");

            system(cmd);}

        else if ( strcmp( command, "Load" ) == 0 ){

            char cmd[100] = "";

            strcat(cmd, "bash " );
            strcat(cmd, path_the);
            strcat(cmd, "/"     );
            strcat(cmd, name_the);
            strcat(cmd, "/box/Linux/load.sh");

            system(cmd);}





        else if ( strcmp( command, "Test" ) == 0 ){

            printf("...\n");

            char cmd[100] = "";

            strcat(cmd, "bash ");
            strcat(cmd, path_the);
            strcat(cmd, "/");
            strcat(cmd, name_the);
            strcat(cmd, "/box/Linux/net.sh");

            system(cmd);

            printf("OVER.\n");}





        else if ( strcmp( command, "Test alsa" ) == 0 ) {

            printf("...\n");

            char cmd[100] = "";

            strcat(cmd, "bash ");
            strcat(cmd, path_the);
            strcat(cmd, "/");
            strcat(cmd, name_the);
            strcat(cmd, "/box/Linux/alsa.sh");

            system(cmd);

            printf("OVER.\n");}




        else if ( strcmp( command, "Install" ) == 0 ) {

            char cmd[100] = "";

            strcat(cmd, "bash ");
            strcat(cmd, path_the);
            strcat(cmd, "/");
            strcat(cmd, name_the);
            strcat(cmd, "/box/Linux/install.sh");

            system(cmd);}


        else if ( strcmp( command, "Remove" ) == 0 ){

             printf("...\n");

             char cmd[100] = "";

             strcat(cmd, "bash ");
             strcat(cmd, path_the);
             strcat(cmd, "/");
             strcat(cmd, name_the);
             strcat(cmd, "/box/Linux/remove.sh");

             system(cmd);

             printf("OVER.\n");}

//---------------------------------------------------------------------

        else if ( strcmp( command, "Show" ) == 0 ) {
            if      ( flag_show == false ) {
                 flag_show = true;}
            else if ( flag_show == true ) {
                 flag_show = false;}}

//---------------------------------------------------------------------

        else if ( strcmp( command, "Sound" ) == 0 ) {

            if ( !flag_sound ) {

                printf("Sound Start.");
                flag_sound = true;}

            else if ( flag_sound ) {

                 printf("Sound Stop.");
                 flag_sound      = false;
                 flag_sound_show = false;}}


        else if ( strcmp( command, "Sound show" ) == 0 ) {

            if ( !flag_sound_show ) {

                printf("Sound Start.");

                flag_sound = true;
                flag_sound_show = true;}

            else if ( flag_sound_show ) {

                 flag_sound_show = false;}}
//---------------------------------------------------------------------
/*
        else if ( strcmp( command, "Sopi" == 0) ) {
            for ( int i=0; i<=3; i++) {
                if ( !strcmp(gop_connect.how[i], "Sop") or !strcmp(gop_connect.how[i], "Connectting") ) {
                    printf("ready to send sopi");
                    gop_connect.command[i] = "Sopi.";}}}

        else if ( strcmp( command, "Update" == 0 ) ) {
            for ( int i=0; i<=3; i++) {
                if ( !strcmp(gop_connect.how[i], "Connectted") or !strcat(gop_connect.how[i], "Sopi") ) {
                    gop_connect.command[i] = "Update.";}}}
*/
//---------------------------------------------------------------------
/*
        else if ( command == "Test dft" ) {
            test_ft("dft");}

        else if ( command == "Test fft" ) {
            test_ft("fft");}
*/
//---------------------------------------------------------------------

        else if ( strstr(command, "Command ") != NULL ) {

            system(strstr(command, "Command ") + 8);}

//---------------------------------------------------------------------

        else if ( strcmp( command, "Reload configure") == 0 ) {

//            load_configure();
            printf("DONE\n");}

//---------------------------------------------------------------------

        else if ( strcmp( command, "Reload listen") == 0 ) {

//            load_listen();
            printf("DONE\n");}}







    note_save("command", "Command close");}
