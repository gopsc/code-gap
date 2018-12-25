
pthread_t    thread[6];





int main(int argc, char *argv[]){






    pthread_create (&thread[1], NULL, gop_dog,          NULL);

    gop_delay(1.1);

    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
    pthread_create (&thread[4], NULL, gop_corde ,       NULL);







    string command;



    while(flag_mind) {


        getline(cin, command, '\n');







//---------------------------------------------------------------------

        if ( command.find("Connect") == 0 ) {
            string that = command.substr(8, command.length());
            cout << "Connect to :" << that << endl;
            gop_connect.address_ip[0] = (char*)(that.c_str());}

//---------------------------------------------------------------------

         else if ( command == " " ) {
            for (int i = 0; i < 50; i++){
                cout << endl;}
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
            gop_delay(1);

//the thread of mind is main thread, when it exit, othes too
            flag_mind      = false;}

//---------------------------------------------------------------------

        else if ( command == "Save" ){
            int i = system((char*)cmd_save.c_str());}

        else if ( command == "Load" ){
            int i = system((char*)cmd_load.c_str());}

        else if ( command == "Test" ){
            cout << "..." << endl;
            int i = system((char*)cmd_test.c_str());
            cout << "OVER.." << endl;}

        else if ( command == "Test alsa" ) {
            cout << "..." << endl;
            int i = system((char*)cmd_test_alsa.c_str());
            cout << "OVER." << endl;}
        else if ( command == "Install" ){
            int i = system((char*)cmd_install.c_str());}

//---------------------------------------------------------------------

        else if ( command == "Show" ) {
            if      ( flag_show == false ) {
                 flag_show = true;}
            else if ( flag_show == true ) {
                 flag_show = false;}}

//---------------------------------------------------------------------

        else if ( command == "Sound" ) {
            if ( flag_sound == false ) {
                cout << "Sound Start." << endl;
                flag_sound = true;}
            else if ( flag_sound == true ) {
                cout << "Sound Stop." << endl;
                 flag_sound = false;}}

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

        else if ( command.find("cmd ") == 0 ){

            command = command.substr(4,command.length());
            system( (char*)command.c_str() );}}}
