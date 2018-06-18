
string       command;
void gop_command() {
        getline(cin, command, '\n');
//---------------------------------------------------------------------
        if ( command == " " ) {
            for (int i = 0; i < 100; i++){
                cout << endl;}
            cout << gop_server.information << endl;
            cout << gop_client.information << endl;}
        else if ( command == "Quit" ){
            flag_dog    = false;
            flag_client = false;
            flag_server = false;
            flag_sound  = false;
            sleep(0.5);
            flag_mind   = false;}
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
/*
        else if ( command == "sound" ) {
            if ( flag_sound == false ) {
                cout << "sound       START"  << endl;
                pthread_create (&thread[5], NULL, gop_corde , NULL);
                while (flag_sound == true)  {
                    sleep(0.1);}}
            else {
                cout << "sound       IS WORKING"  << endl;}}
*/
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
                gop_client.command = "Update.";}}}

