
string control_message(int site, string buffer_recv){

//========================================================
    string that;
    if (gop_connect.how[site] == "Connectting") {
	        that =  "This is gop station.";
        that += '\n';}
    else if (gop_connect.how[site] == "Sop"){
        that = "This is gop station.";
        that += '\n';}
//========================================================
    if (gop_connect.how[site] == "Connectting" or
        gop_connect.how[site] == "Sop") {


// SHOW HIMSELF
        if (buffer_recv.find("This is ") != 0 or
            buffer_recv.find('\n') == -1) {
            that += "Who is that now?";
            return that;}
        else {
            string that1 = buffer_recv.substr(0, buffer_recv.find('\n'));
// WHO HE IS
            if (that1 == "This is a smile.") {
                gop_connect.how[site] = "Turn";
                string that_turn = buffer_recv.substr(buffer_recv.find('\n')+1,
                                                      buffer_recv.length());
                return that_turn;}

            else if (that1 != "This is gop station." ) {
                that += "Who is that now?";
                return that;}
            else {
// INFORMATION GET READY
                that += information_get();

                for ( int i = 0; i <= 3; i++ ) {
                    if (gop_connect.information[i] != "") {
                        that += gop_connect.information[i]; }}
// GET MESSAGE
                int     that_num1 = buffer_recv.find('\n')+1;
                int     that_num2 = buffer_recv.find('\n', that_num1);
                string  that2;
                string  that3;
                string  that4;

                if ( that_num2 != -1 ) {
                    that2 = buffer_recv.substr( that_num1, that_num2-that_num1 );}
                else {
                    that2 = buffer_recv.substr( that_num1, buffer_recv.length() );}
                int     that_num3 = buffer_recv.find('\n', that_num1)+1;
                if ( that_num3 > 0 ) {
                    that3 = buffer_recv.substr( that_num3, buffer_recv.length());}
// GOP MESSAGE
//---------------------------------------------------------
                if (that2 == "Sopi.") {
                    gop_connect.information[site] = "";
                    gop_connect.update[site]      = "";
                    gop_connect.step_update[site] = 0;
                    gop_connect.command[site]     = "";

                    if (gop_connect.how[site] == "Connectting") {
                        gop_connect.how[site] = "Sopi";
                        that += "Who is that now?";
                        return that;}
                    else if (gop_connect.how[site] == "Sop") {
                        gop_connect.how[site] = "Connectted";
                        that += "Who is that now?";
                        return that;}}
//---------------------------------------------------------
                else if ( that2 == "Who is that?" or
                          that2 == "Who is that now?" ) {

                    if ( gop_connect.command[site] != "" ) {
                        that += gop_connect.command[site];
                        gop_connect.command[site] = "";}
                    else {
                        that += "Here.";}}
//---------------------------------------------------------
                else if ( that2 == "Update." ) {


                    if ( that3 == "Done." ) {
                        cout << "Done." << endl;
                        gop_connect.update[site] = "";

//                        dir_delete((char*)path_update_start.c_str());
//                        rename((char*)path_update_download_ravens.c_str(),
//                               (char*)path_update_start.c_str());

                        cmd_get(cmd_update_rm);
                        cmd_get(cmd_update_mv);

                        cout << "UPDATE MIX START." << endl;

                        while ( control_update(&(gop_connect.update[site]))
                             != "Done." ) {

                            if ( gop_connect.update[site].find(".")
                              != gop_connect.update[site].rfind(".") ) {

                                if ( gop_connect.update[site].find(".")
                                  != gop_connect.update[site].rfind("/")+1 ) {

                                    string that_update      = gop_connect.update[site].substr(0, gop_connect.update[site].rfind("."));
                                    string that_update_mix  = path_update_download_ravens;
                                           that_update_mix += that_update.substr(that_update.find(update_name)+update_name.length(), that_update.length());
                                    if ( !is_file((char*)that_update_mix.c_str()) ) {

                                        int    num_update_file   = 0;
                                        string that_update_file  = that_update;
                                               that_update_file += ".0";

                                        while ( is_file((char*)that_update_file.c_str()) ) {

                                            if ( num_update_file == 0 ) {
                                                file_save(that_update_mix, file_get(that_update_file));}
                                            else {
                                                file_append(that_update_mix, file_get(that_update_file));}

                                            num_update_file++;
                                            that_update_file  = that_update;
                                            that_update_file += ".";
                                            that_update_file += to_string(num_update_file);}

                                        cout << that_update_mix << endl;}}}}

                        cmd_get(cmd_update_rm);
                        cmd_get(cmd_update_mv);

                        gop_connect.update[site] = "";

                        //cmd_get(cmd_install);
                        //flag_reboot = 60;

                        for ( int i=0; i<=3; i++ ) {
                            if ( gop_connect.how[i] == "Sopi" or gop_connect.how[i] == "Connectted") {
                                gop_connect.command[i] = "Update.";}}}
                    else {

                        int    num_file_name    = that3.find(',');
                        int    num_file_site    = that3.find(',', num_file_name+1);
                        int    num_file_length  = that3.find('\n')-1;
                        string that_file_site   = that3.substr(num_file_name+1, num_file_site - num_file_name-1);
                        string that_file_name   = path_update_download;
                               that_file_name  += "/";
                               that_file_name  += that3.substr(0, num_file_name);
                               that_file_name  += '.';
                               that_file_name  += that_file_site;
                        string that_file_length = that3.substr(num_file_site+1, num_file_length-num_file_site-1);
                        string that_file_words  = that3.substr(num_file_length+2, that3.length());

                        if ( atoi(that_file_length.c_str()) == that_file_words.length() ) {
                            cout << that_file_name << endl;
                            file_save(that_file_name, that_file_words);
                            that +=  "Recive.";}
                        else {
                            cout << "file lost." << endl;
                            cout << "Send: " << atoi(that_file_length.c_str()) << endl;
                            cout << "Got : " << that_file_words.length()       << endl;
                            that += "Lost.";}}}
//---------------------------------------------------------
                else {
                    that =  "WHAT?";
                    cout << endl << that  << endl;
                    cout << endl << buffer_recv  << endl;
                    return that;}}}}
//========================================================

    if ( gop_connect.how[site] == "Connectted" ) {
        that = "This is gop station.";
        that += '\n';}
//========================================================

    else if ( gop_connect.how[site] == "Sopi" ){
        that = "This is gop station.";
        that += '\n';}
//========================================================

    else if ( site == -1 ){
        that =  "This is a smile.";
        that += '\n';

        int that_smile = -1;
        srand(unsigned(time(0)));
        while ( (gop_connect.information[that_smile]).find("Linux") == -1 ) {
            that_smile = 1+(4-1)*rand()/(RAND_MAX+1.0);}
        that += gop_connect.address_ip[that_smile];

        return that;}
//========================================================

    if ( gop_connect.how[site] == "Connectted" or
        gop_connect.how[site] == "Sopi" ){

// SHOW ITSELF
            if ( buffer_recv == "" ) {
                that += "Who is that?";}
            else if (    buffer_recv.find("This is ") != 0
                      or buffer_recv.find('\n') == -1 ) {

                cout << endl << "WHAT?" << endl;
                cout <<    buffer_recv  << endl;
                that += "Who is that now?";}
            else {

// WHO IT IS
                string that3 = buffer_recv.substr(0, buffer_recv.find('\n'));

                if (     that3 != "This is gop station."
                     and that3 != "This is a leaf.") {

                    cout << endl << "What?" << endl;
                    cout <<          that3  << endl;
                    that += "Who is that now?";}
                else {

// GET INFORMATION
                     if ( buffer_recv.find("-----") != -1 ) {

                        string that4 = buffer_recv.substr( buffer_recv.find("-----"),
                                                           buffer_recv.rfind("-----")+6 -buffer_recv.find("-----"));
                        gop_connect.information[site] = that4;

                        string that5;
                        try {
                            that5 = buffer_recv.substr( buffer_recv.rfind("-----")+6,
                                                        buffer_recv.length());}
                        catch (...) {}
//-------------------------------------------------------------------------------------

                        if ( that5 == "Here." or that5 == "Recive." ) {
                            string that_file;
                            string that_file_length;

                            if ( gop_connect.command[site] == "Update." ) {
                                if ( count_update <= count_update_max ) {
                                    that += "Who is that now?";
                                    count_update++;}
                                else {
                                    count_update=0;
                                    that += "Update.";

                                    if ( gop_connect.update[site] == "" ) {
                                        if ( control_update(&(gop_connect.update[site])) == "Done.") {
                                            cout << "THERE IS NO GOP SOURCE." << endl;
                                            that += '\n';
                                            that += "Who is that now?";
                                            gop_connect.command[site] = "";
                                            return that;}}

                                    that_file        = file_get(gop_connect.update[site]);
                                    that_file_length = to_string(that_file.length());

                                    if ( gop_connect.step_update[site]*size_update > atoi(that_file_length.c_str()) ) {
                                        if ( control_update(&(gop_connect.update[site])) == "Done.") {
                                            cout << "Done" << endl;
                                            gop_connect.step_update[site] = 0;
                                            that += '\n';
                                            that += "Done.";
                                            gop_connect.command[site] = "";
                                            return that;}
                                         else {
                                             gop_connect.step_update[site] = 0;}}

                                     that_file        = file_get(gop_connect.update[site]);
                                     that_file_length = to_string(that_file.length());

                                     if ( gop_connect.step_update[site] == 0) {
                                         cout << gop_connect.update[site] << endl;
                                         cout << "    send size : ";
                                         cout << that_file.length() << endl;}

                                    that += '\n';
                                    that += (gop_connect.update[site]).substr(gop_connect.update[site].find("ravens"), (gop_connect.update[site]).length());
                                    that += ',';
                                    that += to_string(gop_connect.step_update[site]);
                                    that += ',';

                                    if ( (gop_connect.step_update[site]+1)*size_update > atoi(that_file_length.c_str()) ) {
                                        that += to_string(atoi(that_file_length.c_str())
                                             -  (gop_connect.step_update[site])*size_update);}
                                    else {
                                        that += to_string(size_update);}

                                    that += '.';
                                    that += '\n';
                                    that += that_file.substr((gop_connect.step_update[site])*size_update, size_update);
                                    (gop_connect.step_update[site])++;}}

                            else {

                                gop_connect.command[site] = "";
                                that += "Who is that now?";}}
//-------------------------------------------------------------------------------------
                        else if ( that5 == "Lost." ) {
                            if ( gop_connect.command[site] == "Update." ) {
                                that                   += "Update.";
                                that                   += '\n';
                                that                   += (gop_connect.update[site]).substr(gop_connect.update[site].find("ravens"), (gop_connect.update[site]).length());
                                string that_file        = file_get(gop_connect.update[site]);
                                string that_file_length = to_string(that_file.length());
                                that                   += ',';
                                that                   += to_string(gop_connect.step_update[site]);
				                                that                   += ',';

                                if ( (gop_connect.step_update[site])*size_update > atoi(that_file_length.c_str()) ) {
                                    that += to_string(atoi(that_file_length.c_str())
                                         -  (gop_connect.step_update[site]-1)*size_update);}
                                else {
                                    that += to_string(size_update);}

                                that += '.';

                                that += '\n';
                                that += that_file.substr((gop_connect.step_update[site]-1)*size_update, size_update);}
                            else {
                                gop_connect.command[site] = "";}}
//-------------------------------------------------------------------------------------
                        else if ( that5 == "Sopi." ) {
                            gop_connect.information[site] = "";
                            gop_connect.command[site] = "";
                            gop_connect.update[site] = "";
                            gop_connect.step_update[site] = 0;

                            for ( int i=0; i<=3; i++ ) {
                                if ( gop_connect.how[i] == "Connectting" or gop_connect.how[i] == "Sop" ) {
                                    gop_connect.command[i] = "Sopi.";}}
                            if (gop_connect.how[site] == "Connectted") {
                                gop_connect.how[site] = "Sop";}
                            else if (gop_connect.how[site] == "Sopi") {
                                gop_connect.how[site] = "Connectting";}
                            that += "Sopi.";}
//-------------------------------------------------------------------------------------
                        else {
                            that += "Who is that now?";}}
//-------------------------------------------------------------------------------------
                    else {
                        that += "Who is that now?";}}}}
    return that;}
