void power_check() {


    file_save("/opt/gop/note/power.note", "");
    string that = file_get("/opt/gop/note/power.note");

    time_t time_now = time(NULL);
    file_save("/opt/gop/note/power.note", to_string((int)time_now));

    if ( that != "" ) {
        if ( (int)time_now - atoi(that.c_str()) > 3 ) {
                   time_t time_that    = *((time_t*)&that);
            struct tm*    time_that2;
                          time_that2   = gmtime(&time_that);
                          that         = ctime(&time_that);
            file_append("/opt/gop/note/server.note",   info_time);
            file_append("/opt/gop/note/server.note",   "Power off");
            file_append("/opt/gop/note/server.note",   "\n");

            file_append("/opt/gop/note/client.note",   info_time);
            file_append("/opt/gop/note/client.note",   "Power off");
            file_append("/opt/gop/note/client.note",   "\n");

            file_append("/opt/gop/note/watchdog.note",   info_time);
            file_append("/opt/gop/note/watchdog.note", "Power off");
            file_append("/opt/gop/note/watchdog.note", "\n");

            file_append("/opt/gop/note/corde.note",   info_time);
            file_append("/opt/gop/note/corde.note",   "Power off");
            file_append("/opt/gop/note/corde.note",   "\n");}}}

