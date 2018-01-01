void net_check() {

    time_t time_now = time(NULL);

    if ( (time_now - gop_server.point_time >= 3) and gop_server.how != "Wait" ) {
        gop_server.information = "";
        gop_server.how     = "Wait";
        gop_server.update  = "";
        gop_server.command = "";
        file_append("/opt/gop/note/server.note", info_time);
        file_append("/opt/gop/note/server.note", "Connectted break.");
        file_append("/opt/gop/note/server.note", "\n");}
    if ( (time_now - gop_client.point_time >= 3) and gop_client.how != "Wait" ) {
        gop_client.information = "";
        gop_client.how = "Wait";
        file_append("/opt/gop/note/client.note", info_time);
        file_append("/opt/gop/note/client.note", "Connect break.");
        file_append("/opt/gop/note/client.note", "\n");}}




