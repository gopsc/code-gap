
void check_power() {


    string path  = path_the;
           path += "/";
           path += "gop/note/power.note";
    string that;







    if ( !is_file(path.c_str()) ) {

        file_save(path, "");}

    else {

        that = file_get(path);}






    time_t time_now = time(NULL);

    file_save( path, to_string(info_time) );



    if ( that != "" ) {

        if ( (int)time_now - atoi(that.c_str()) > 3 ) {

            string that1 = that;
                   that1 += " Power off";


            note_save("server", that1);

            note_save("client", that1);

            note_save("dog",    that1);

            note_save("corde",  that1);}}}

