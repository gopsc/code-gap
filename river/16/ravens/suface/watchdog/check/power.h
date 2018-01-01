void power_check() {


    file_save("/opt/gop/note/power.note", "");
    string that = file_get("/opt/gop/note/power.note");

    time_t time_now = time(NULL);
    file_save("/opt/gop/note/power.note", to_string(info_time));

    if ( that != "" ) {
        if ( (int)time_now - atoi(that.c_str()) > 3 ) {

            file_append("/opt/gop/note/server.note",   that);
            file_append("/opt/gop/note/server.note",   "Power off");
            file_append("/opt/gop/note/server.note",   "\n");

            file_append("/opt/gop/note/client.note",   that);
            file_append("/opt/gop/note/client.note",   "Power off");
            file_append("/opt/gop/note/client.note",   "\n");

            file_append("/opt/gop/note/dog.note",   that);
            file_append("/opt/gop/note/dog.note", "Power off");
            file_append("/opt/gop/note/dog.note", "\n");

            file_append("/opt/gop/note/corde.note",   that);
            file_append("/opt/gop/note/corde.note",   "Power off");
            file_append("/opt/gop/note/corde.note",   "\n");}}}






