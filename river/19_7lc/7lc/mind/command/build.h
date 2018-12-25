string command;

void* gop_command() {

    while ( flag_command ) {

        getline(cin, command, '\n');

//---------------------------------------------------------------------
        if ( command.find("Connect") == 0 ) {
            string that = command.substr(8, command.length());
            cout << "Connect to :" << that << endl;
            gop_connect.address_ip[0] = (char*)(that.c_str());}
//---------------------------------------------------------------------
        else if ( command == " " ) {
            for (int i = 0; i < 100; i++){
                cout << endl;}
            cout << information_get() << endl;
            cout << gop_connect.information[1];
            cout << gop_connect.information[2];
            cout << gop_connect.information[3];
            cout << gop_connect.information[0];}
//---------------------------------------------------------------------
        else if ( command == "Quit" ){
            flag_dog       = false;
            flag_client    = false;
            flag_server    = false;
            flag_sound     = false;
            flag_show      = false;
            flag_command   = false;
            gop_delay(step_connect+0.1);
            flag_mind      = false;}
//---------------------------------------------------------------------
        else if ( command == "Save" ){
            int i = system((char*)cmd_save.c_str());}
//---------------------------------------------------------------------
        else if ( command == "Load" ){
            int i = system((char*)cmd_load.c_str());}
//---------------------------------------------------------------------
        else if ( command == "Test" ){
            cout << "..." << endl;
            int i = system((char*)cmd_test.c_str());
            cout << "OVER.." << endl;}
//---------------------------------------------------------------------
        else if ( command == "Install" ){
            int i = system((char*)cmd_install.c_str());}
//---------------------------------------------------------------------
        else if ( command == "Show" ) {
            if      ( flag_show == false ) {
                 flag_show = true;}
            else if ( flag_show == true ) {
                 flag_show = false;}}
//---------------------------------------------------------------------
        else if ( command == "sound" ) {
            if ( flag_sound == false ) {
                cout << "Sound Start." << endl;
                flag_sound = true;}}
//---------------------------------------------------------------------
        else if ( command == "Sopi" ) {
            for ( int i=0; i<=3; i++) {
                if ( gop_connect.how[i] == "Sop" or gop_connect.how[i] == "Connectting" ) {
                    cout << "ready to send sopi" << endl;
                    gop_connect.command[i] = "Sopi.";}}}
//---------------------------------------------------------------------
        else if ( command == "Update" ) {
            for ( int i=0; i<=3; i++) {
                if ( gop_connect.how[i] == "Connectted" or gop_connect.how[i] == "Sopi" ) {
                    gop_connect.command[i] = "Update.";}}}
//---------------------------------------------------------------------
        else if ( command == "Test dft" ) {
            test_ft("dft");}
//---------------------------------------------------------------------
        else if ( command == "Test fft" ) {
            test_ft("fft");}
//---------------------------------------------------------------------
        else {
            system( (char*)command.c_str() );}}}
