string control_message(string *how,         string *how_other,
                       string *information, string *information_other,
                       string *command,     string *command_other,
                       string buffer_recv){
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
//--------------------------------------------------------
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
//--------------------------------------------------------
            else {
                that += info_get();

                if (*information != "") {
                    that += *information; 
                    that += '\n'; }
                if (*information_other != "") {
                    that += *information_other; 
                    that += '\n'; }

                int    that_num1 = buffer_recv.find('\n')+1;
                string  that2     = buffer_recv.substr( that_num1,
                                                        buffer_recv.find('\n',that_num1)-21);
                //cout << endl << "<" << endl << that2 << endl << ">" << endl;
                string  that3;
                string  that4;
                int     that_num2 = buffer_recv.find('\n', that_num1)+1;

                if( that_num2 > 0 ) {

                    that3 = buffer_recv.substr( that_num2,
                                                buffer_recv.length());}
//--------------------------------------------------------
                if (that2 == "Sopi.") {    
//--------------------------------------------------------     
                    if (*how == "Connectting") {
                        *how = "Sop";
                        *command = "";

                        if (*how_other == "Connectted") {
                            *command_other = "Sopi";}
                        that =  "This is Sop.";
                        that += '\n';
                        that += "Who is that now?";
                        return that;}    
//--------------------------------------------------------     
                    else if (*how == "Sopi") {
                        *how = "Connectted";
                        *command = "";

                        if (*how_other == "Sop") {
                            *command_other = "Sopi";}
                        that =  "This is gop-station.";
                        that += '\n';
                        that += "Who is that now?";
                        return that;}}                             
//--------------------------------------------------------              
                else if (that2 == "Who is that?" or
                          that2 == "Who is that now?") {
                    if (*command != "") {
                        that += *command;}
                    else {
                        that += "Copy.";}}     
//--------------------------------------------------------     
                else if (that2 == "Update.") {
                    if ( that3 == "Done." ) {

                        dir_delete("./ravens");
                        rename("./gop-downloads/ravens", "./ravens");
                        dir_delete("./gop-downloads");
                        char that_shell[25] = "bash ./ravens/install.sh";
                        shell_get(that_shell);}
                    else {
                        string that_file_name  = "./gop-downloads/";
                               that_file_name += that3.substr(0, that3.find('\n'));
                        string that_file_words = that3.substr(that3.find('\n')+1, that3.length());

                        cout << that_file_name << endl;

                        file_save(that_file_name, that_file_words);
                        that +=  "Recive.";}}
//--------------------------------------------------------     
                else {
                    that =  "?";
                    cout << endl << that << endl;
                    return that;}}}}
//========================================================
    if (*how == "Connectted") {
        that = "This is gop-station.";
        that += '\n';}    
//--------------------------------------------------------     
    else if (*how == "Sop"){
        that = "This is Sop.";
        that += '\n';}    
//--------------------------------------------------------     
    else if (*how_other == "Smile"){
        that =  "This is a smile.";
        that += '\n';
        that += buffer_recv;
        return that;}
//========================================================
    if (*how == "Connectted" or
        *how == "Sop"){

        *information = buffer_recv;    
//--------------------------------------------------------     
        if (*command != "") {
            that += *command;    
//--------------------------------------------------------     
            if (*command == "Update.") {
                string that_path = control_update();

                that += '\n';
                that += that_path;    
//--------------------------------------------------------     
                if ( that_path == "Done.") {
                    *command = "";}    
//--------------------------------------------------------     
                else {
                    that += '\n';
                    that += file_get(that_path);}}}    
//--------------------------------------------------------     
        else {
            if (buffer_recv == "") {
                that += "Who is that?";}
            else if (    buffer_recv.find("This is ") != 0 or
                          buffer_recv.find('\n') == -1) {
                cout << endl << "What?";
                that += "Who is that now?";}
            else {                       
//--------------------------------------------------------
                string that3 = buffer_recv.substr(0, buffer_recv.find('\n'));
                if (      that3 != "This is gop-station." and
                           that3 != "This is Sopi.") {
                    cout << endl << "What?";
                    that += "Who is that now?";}
                else {                       
//--------------------------------------------------------------------------------------------------
                     if (buffer_recv.find("-----") != -1) {
                        string that4 = buffer_recv.substr(buffer_recv.find( "-----"),
                                                          buffer_recv.rfind("-----")-16);
                        //cout << endl << "<" << endl << that4 << endl << ">" << endl;
                        *information = that4;                      
//--------------------------------------------------------
                        string that5 = buffer_recv.substr(buffer_recv.rfind("-----")+6, 
                                                      buffer_recv.length());    
                        //cout << endl << "<" << endl << that5 << endl << ">" << endl;                   
//--------------------------------------------------------------------------------------------------
                        if (that5 == "Sopi.") {
//--------------------------------------------------------     
                            if (*how == "Connectted") {
                                *how = "Sopi";
                                that += "Sopi.";
                                if (*how_other == "Connectting") {
                                    *command_other = "Sopi";}}    
//--------------------------------------------------------     
                            else if (*how == "Sop") {
                                *how = "Connectting";
                                that += "Sopi.";
                                if (*how_other == "Sopi") {
                                    *command_other = "Sopi";}}}    
//--------------------------------------------------------     
                        else {
                            that += "Who is that now?";}}
                    else {
                        that += "Who is that now?";}}}}}
//--------------------------------------------------------
    return that;}



