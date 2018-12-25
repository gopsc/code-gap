
void check_power() {


    string path  = path_the;
           path += "/";
           path += "gop/note/power.note";
    string that;







    if (is_file(path.c_str()) == 0) {

        file_save(path, "");}

    else {

        that = file_get(path);}






    time_t time_now = time(NULL);

    file_save( path, to_string(info_time) );



    if ( that != "" ) {


        string that1 ;
        that1  = that;
        that1 += " Power off";



        if ( (int)time_now - atoi(that.c_str()) > 3 ) {

            note_save("server.note", that1);

            note_save("client.note", that1);

            note_save("dog.note",    that1);

            note_save("sound.note",  that1);}}}

