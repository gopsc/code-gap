




pthread_t    thread[6];





int main(int argc, char *argv[]){

    printf("\n");

    pthread_create (&thread[1], NULL, gop_dog,          NULL);
    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
    pthread_create (&thread[4], NULL, gop_corde ,       NULL);







    string command;








    while (!info_done) {
        gop_delay(0.1);}




    printf( "\nCommand is gonna start, take 'Help' to get commands list.\n" );


    while (flag_mind) {






        printf("\n");
        getline(cin, command, '\n');
        printf("\n");





//---------------------------------------------------------------------

        if ( command == "Help" ) {

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

            printf( "\n U-DISK COMMANDS FOR TESK!!!\n\n" );
            printf( "     'Save'\n     'Load'\n     'Test'\n     'Test alsa'\n     'Install'\n" );}

///--------------------------------------------------------------------

        else if ( command.find("Connect ") == 0 ) {





            if ( command.find(":") != -1 ) {

                int i;
                for ( i=8; i<=command.find(":"); i=i+1 ) {
                    address_to[i-8] = command[i];}
                address_to[i-7] = '\0';


                gop_connect.address_ip[0] = address_to;
                gop_connect.port[0]       = atoi(command.substr(command.find(":")+1, command.length()).c_str());


                flag_client               = true;

                cout << "CONNECT TO " << gop_connect.address_ip[0] << ":" << gop_connect.port[0] << endl;}}

//---------------------------------------------------------------------

         else if ( command == " " ) {

            system("clear");

            cout << information_get() << endl;
            cout << gop_connect.information[1];
            cout << gop_connect.information[2];
            cout << gop_connect.information[3];
            cout << gop_connect.information[0];}

//---------------------------------------------------------------------

        else if ( command == "Quit" ){

//exit
            flag_dog       = false;
            flag_client    = false;
            flag_server    = false;
            flag_sound     = false;
            flag_show      = false;

//Threads need time to exit
            gop_delay(0.3);

//the thread of mind is main thread, when it exit, othes too
            flag_mind      = false;}

//---------------------------------------------------------------------

        else if ( command == "Save" ){

            string cmd  = "bash ";
                   cmd += path_the;
                   cmd += "/";
                   cmd += name_the;
                   cmd += "/box/Linux/save.sh";
            system(cmd.c_str());}




        else if ( command == "Load" ){

            string cmd  = "bash ";
                   cmd += path_the;
                   cmd += "/";
                   cmd += name_the;
                   cmd += "/box/Linux/load.sh";
            system(cmd.c_str());}





        else if ( command == "Test" ){
            printf("...\n");

            string cmd  = "bash ";
                   cmd += path_the;
                   cmd += "/";
                   cmd += name_the;
                   cmd += "/box/Linux/net.sh";
            system(cmd.c_str());

            printf("OVER.\n");}





        else if ( command == "Test alsa" ) {
            printf("...\n");

            string cmd  = "bash ";
                   cmd += path_the;
                   cmd += "/";
                   cmd += name_the;
                   cmd += "/box/Linux/alsa.sh";
            system(cmd.c_str());

            printf("OVER.\n");}




        else if ( command == "Install" ){

            string cmd  = "bash ";
                   cmd += path_the;
                   cmd += "/";
                   cmd += name_the;
                   cmd += "/box/Linux/install.sh";
            system(cmd.c_str());}


        else if ( command == "Download" ) {

             printf("...\n");
             string cmd  = "bash ";
                    cmd += path_the;
                    cmd += "/";
                    cmd += name_the;
                    cmd += "/box/Linux/download.sh";
             system(cmd.c_str());
             printf("OVER.\n");}
//---------------------------------------------------------------------

        else if ( command == "Show" ) {
            if      ( flag_show == false ) {
                 flag_show = true;}
            else if ( flag_show == true ) {
                 flag_show = false;}}

//---------------------------------------------------------------------

        else if ( command == "Sound" ) {

            if ( !flag_sound ) {

                cout << "Sound Start." << endl;
                flag_sound = true;}

            else if ( flag_sound ) {

                 cout << "Sound Stop." << endl;
                 flag_sound      = false;
                 flag_sound_show = false;}}


        else if ( command == "Sound show" ) {

            if ( !flag_sound_show ) {
                cout << "Sound Start." << endl;

                flag_sound = true;
                flag_sound_show = true;}

            else if ( flag_sound_show ) {

                 flag_sound_show = false;}}
//---------------------------------------------------------------------

        else if ( command == "Sopi" ) {
            for ( int i=0; i<=3; i++) {
                if ( gop_connect.how[i] == "Sop" or gop_connect.how[i] == "Connectting" ) {
                    cout << "ready to send sopi" << endl;
                    gop_connect.command[i] = "Sopi.";}}}

        else if ( command == "Update" ) {
            for ( int i=0; i<=3; i++) {
                if ( gop_connect.how[i] == "Connectted" or gop_connect.how[i] == "Sopi" ) {
                    gop_connect.command[i] = "Update.";}}}

//---------------------------------------------------------------------

        else if ( command == "Test dft" ) {
            test_ft("dft");}

        else if ( command == "Test fft" ) {
            test_ft("fft");}

//---------------------------------------------------------------------

        else if ( command.find("Command ") == 0 ) {

            command = command.substr(8,command.length());
            system( (char*)command.c_str() );}

//---------------------------------------------------------------------

        else if ( command == "Reload configure" ) {

            load_configure();
            printf("DONE\n");}

//---------------------------------------------------------------------

        else if ( command == "Reload listen" ) {

            load_listen();
            printf("DONE\n");}}}
