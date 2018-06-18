
void check_power() {
    string path  = path_note;
           path += "power.note";

    file_save(path, "");
    string that  = file_get(path);

    time_t time_now = time(NULL);
    file_save( path, to_string(info_time) );

    if ( that != "" ) {
        if ( (int)time_now - atoi(that.c_str()) > 3 ) {

            note_append(that, "server.note", "Power off");

            note_append(that, "client.note", "Power off");

            note_append(that, "dog.note",    "Power off");

            note_append(that, "sound.note",  "Power off");}}}

