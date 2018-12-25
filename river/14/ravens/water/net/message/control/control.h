string control_message(string *how,         string *how_other,
                       string *information, string *information_other,
                       string *command,     string *command_other,
                       string *update,      int    *step_update,
                       string buffer_recv){
//cout << buffer_recv << endl;
//========================================================
    string that;
    if (*how == "Connectting") {
        that = "This is gop-station.";
        that += '\n';}
    else if (*how == "Sopi"){
        that = "This is Sopi.";
        that += '\n';}
//========================================================
    if (*how == "Connectting" or
        *how == "Sopi") {
        if (buffer_recv.find("This is ") != 0 or
            buffer_recv.find('\n') == -1) {
            that += "Who is that now?";
            return that;}
        else { 
            string that1 = buffer_recv.substr(0, buffer_recv.find('\n'));

            if (that1 == "This is a smile.") {                 
                *how = "Turn";
                string that_turn = buffer_recv.substr(buffer_recv.find('\n')+1,        
                                                      buffer_recv.length());
                return that_turn;} 

            else if (that1 != "This is gop-station." and
                that1 != "This is Sop.") {
                that += "Who is that now?";
                return that;}
            else {
                that += info_get();
                if (*information != "") {
                    that += *information; 
                    that += '\n'; }
                if (*information_other != "") {
                    that += *information_other; 
                    that += '\n'; }

                int    that_num1 = buffer_recv.find('\n')+1;
                int    that_num2 = buffer_recv.find('\n', that_num1);
                string  that2;
                string  that3;
                string  that4;

                if ( that_num2 != -1 ) {
                    that2 = buffer_recv.substr( that_num1, that_num2-that_num1 );}
                else {
                    that2 = buffer_recv.substr( that_num1, buffer_recv.length() );}
                int     that_num3 = buffer_recv.find('\n', that_num1)+1;

                if( that_num3 > 0 ) {
                    that3 = buffer_recv.substr( that_num3, buffer_recv.length());}
                if (that2 == "Sopi.") {    
                    if (*how == "Connectting") {
                        *how = "Sop";
                        *command = "";
                        if (*how_other == "Connectted") {
                            *command_other = "Sopi.";}
                        that =  "This is Sop.";
                        that += '\n';
                        that += "Who is that now?";
                        return that;}     
                    else if (*how == "Sopi") {
                        *how = "Connectted";
                        *command = "";
                        if (*how_other == "Sop") {
                            *command_other = "Sopi.";}
                        that =  "This is gop-station.";
                        that += '\n';
                        that += "Who is that now?";
                        return that;}}

                else if (that2 == "Who is that?" or
                          that2 == "Who is that now?") {
                    if (*command != "") {
                        that += *command;
                        *command = "";}
                    else {
                        that += "Here.";}}   
 
                else if (that2 == "Update.") {
                    if ( that3 == "Done." ) {
                        cout << "Done." << endl;
                        dir_delete("/opt/ravens");
                        rename("/opt/gop-downloads/ravens", "/opt/ravens");
                        dir_delete("/opt/gop-downloads");
                        char that_shell[34] = "sudo bash /opt/ravens/install.sh";
                        shell_get(that_shell);

                        if      ( *how_other == "Sop" ) {
                            *command_other = "Update.";}
                        else if ( *how_other == "Connectted") {
                            *command_other = "Update.";}}

                    else {
                        int    num_file_name         = that3.find(',');
                        int    num_file_length       = that3.find('\n')-1;
                        string that_file_name        = "/opt/gop-downloads/";
                               that_file_name       += that3.substr(0, num_file_name);
                        string that_file_length      = that3.substr(num_file_name  +1, num_file_length-num_file_name-1);
                        string that_file_words       = that3.substr(num_file_length+2, that3.length());
                        if ( atoi(that_file_length.c_str()) == that_file_words.length() ) {
                            cout << that_file_name << endl;
                            file_append(that_file_name, that_file_words);
                            that +=  "Recive.";}
                        else {
                            cout << "file lost." << endl;
                            cout << "Send: " << atoi(that_file_length.c_str()) << endl;
                            cout << "Got : " << that_file_words.length()       << endl;
                            cout << buffer_recv  << endl;
                            that += "Lost.";}}}
                else {
                    that =  "?";
                    cout << endl << that  << endl;
                    cout << endl << buffer_recv  << endl;
                    return that;}}}}
//========================================================
    if (*how == "Connectted") {
        that = "This is gop-station.";
        that += '\n';}    
    else if (*how == "Sop"){
        that = "This is Sop.";
        that += '\n';}    
    else if (*how_other == "Smile"){
        that =  "This is a smile.";
        that += '\n';
        that += buffer_recv;
        return that;}
//========================================================
    if (*how == "Connectted" or
        *how == "Sop"){
        *information = buffer_recv; 

            if (buffer_recv == "") {
                that += "Who is that?";}
            else if (    buffer_recv.find("This is ") != 0 or
                          buffer_recv.find('\n') == -1) {
                    cout << endl << "What?" << endl;
                    cout <<    buffer_recv  << endl;
                that += "Who is that now?";}
            else {
                string that3 = buffer_recv.substr(0, buffer_recv.find('\n'));
                if (      that3 != "This is gop-station." and
                           that3 != "This is Sopi.") {
                    cout << endl << "What?" << endl;
                    cout <<          that3  << endl;
                    that += "Who is that now?";}
                else {
                     if (buffer_recv.find("-----") != -1) {
                        string that4 = buffer_recv.substr(
                                       buffer_recv.find( "-----"),
                                       buffer_recv.rfind("-----")-buffer_recv.find("-----")+6);
                        *information = that4;
                        string that5 = buffer_recv.substr(buffer_recv.rfind("-----")+6, 
                                                      buffer_recv.length());

                        if (that5 == "Here." or that5 == "Recive.") {
                            string that_file;
                            string that_file_length;
                            if (*command == "Update.") {

                                if ( buffer_update <= buffer_update_max ) {
                                    that += "Who is that now?";
                                    buffer_update++;}
                                else {
                                    buffer_update=0;
                                    that += "Update.";
                                    if ( *update == "" ) {
                                        if ( control_update(update) == "Done.") {
                                            cout << "Done" << endl;
                                            that += '\n';
                                            that += "Done.";
                                            *command = "";
                                            return that;}}

                                    that_file = file_get(*update);
                                    that_file_length = to_string(that_file.length());

                                    if ( (*step_update)*size_update > atoi(that_file_length.c_str()) ) {
                                        if ( control_update(update) == "Done.") {
                                            cout << "Done" << endl;
                                            *step_update = 0;
                                            that += '\n';
                                            that += "Done.";
                                            *command = "";
                                            return that;}
                                         else {
                                             *step_update = 0;}}
                                     that_file        = file_get(*update);
                                     that_file_length = to_string(that_file.length());

                                     if (*step_update == 0) {
                                         cout << *update << endl;
                                         cout << "    send size : ";
                                         cout << that_file.length() << endl;}

                                    that += '\n';
                                    that += (*update).substr(5, (*update).length());
                                    that += ',';
                                    if ( (*step_update+1)*size_update > atoi(that_file_length.c_str()) ) {
                                        that += to_string(atoi(that_file_length.c_str())
                                                 -(*step_update)*size_update);}
                                    else {
                                        that += to_string(size_update);}
                                    that += '.';
                                    that += '\n';
                                    that += that_file.substr((*step_update)*size_update, size_update);
                                    (*step_update)++;}}
                            else {
                                *command = "";
                                that += "Who is that now?";}}






                        else if (that5 == "Lost.") {
                            if (*command == "Update.") { 
                                if ( buffer_update <= buffer_update_max ) {
                                    that += "Who is that now?";
                                    buffer_update++;}
                                else {
                                    buffer_update = 0;
                                    that += "Update.";
                                    that += '\n';
                                    that += (*update).substr(5, (*update).length());
                                    string that_file        = file_get(*update);
                                    string that_file_length = to_string(that_file.length());
                                    that += ',';

                                    if ( (*step_update)*size_update > atoi(that_file_length.c_str()) ) {
                                        that += to_string(atoi(that_file_length.c_str())
                                                     -(*step_update)*size_update);}
                                    else {
                                        that += to_string(size_update);}

                                    that += '.';
                                    that += '\n';
                                    that += that_file.substr((*step_update-1)*size_update, size_update);}}
                            else {
                                *command = "";}}

                        else if (that5 == "Sopi.") {
                            if (*how == "Connectted") {
                                *how = "Sopi";
                                that += "Sopi.";
                                if (*how_other == "Connectting") {
                                    *command_other = "Sopi.";}}
                            else if (*how == "Sop") {
                                *how = "Connectting";
                                that += "Sopi.";
                                if (*how_other == "Sopi") {
                                    *command_other = "Sopi.";}}}
                        else {
                            that += "Who is that now?";}}
                    else {
                        that += "Who is that now?";}}}}
    return that;}


