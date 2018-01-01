
string       command;
void gop_command() {
        getline(cin, command, '\n');

        if ( command.find("connect") == 0 ) {
            string that = command.substr(8, command.length());
            cout << "Connect to :" << that << endl;
            gop_client.address_ip = (char*)(that.c_str());}
//---------------------------------------------------------------------
        else if ( command == " " ) {
            for (int i = 0; i < 100; i++){
                cout << endl;}
            cout << gop_server.information << endl;
            cout << gop_client.information << endl;}
        else if ( command == "Quit" ){
            flag_dog    = false;
            flag_client = false;
            flag_server = false;
            flag_sound  = false;
            sleep(1);
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
        else if ( command == "sound" ) {
            flag_sound = true;}
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






