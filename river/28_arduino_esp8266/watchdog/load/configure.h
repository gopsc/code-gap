string whats_this;
void load_configure() {




    printf("LOAD CONFIGURE...\n");







    string that_configure;






    if ( is_file("/opt/ta/configure") ) {

        that_configure = file_get("/opt/ta/configure");}






    if ( that_configure == "" ) {

        flag_mind = false;}

    else {

        string target_configure[19];
        string result_configure[19];


        target_configure[1]  = "path ";
        target_configure[2]  = "name ";
        target_configure[3]  = "mind ";
        target_configure[4]  = "show ";
        target_configure[5]  = "client ";
        target_configure[6]  = "server ";
        target_configure[7]  = "sound ";
        target_configure[8]  = "sound show ";
        target_configure[9] = "sound save ";
        target_configure[10] = "address to ";
        target_configure[11] = "port to ";
        target_configure[12] = "port this ";
        target_configure[13] = "connect step ";
        target_configure[14] = "update size ";
        target_configure[15] = "update step ";
        target_configure[16] = "sound rate";
        target_configure[17] = "sound channels ";
        target_configure[18] = "ft N ";




        int num1;
        int num2;

        for ( int i=1; i<19; i++ ) {

            num1 = that_configure.find( target_configure[i] );




            if ( num1 != -1 ) {

                num2 = that_configure.find( "\n", num1 );

                result_configure[i] = that_configure.substr( num1, num2-num1 );
                result_configure[i] = result_configure[i].substr( result_configure[i].rfind(" ")+1, result_configure[i].length() );}}


        path_the         = result_configure[1];
        name_the         = result_configure[2];
        if (result_configure[3]  == "on") {flag_mind       = true;}
        if (result_configure[4]  == "on") {flag_show       = true;}
        if (result_configure[5]  == "on") {flag_client     = true;}
        if (result_configure[6]  == "on") {flag_server     = true;}
        if (result_configure[7]  == "on") {flag_sound      = true;}
        if (result_configure[8]  == "on") {flag_sound_show = true;}
        if (result_configure[9]  == "on") {flag_sound_save = true;}
        strcpy(address_to, result_configure[10].c_str());
        port_to          = atof(result_configure[11].c_str());
        port_this        = atof(result_configure[12].c_str());
        step_connect     = atof(result_configure[13].c_str());
        size_update      = atof(result_configure[14].c_str());
        count_update_max = atof(result_configure[15].c_str());
        rate             = atof(result_configure[16].c_str());
        channels         = atof(result_configure[17].c_str());
        N                = atof(result_configure[18].c_str());}}
