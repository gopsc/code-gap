void net_check() {

    time_t time_now = time(NULL);

    if ( time_now - gop_server.point_time >= 3 ) {
        gop_server.information = "";
        gop_server.how     = "Wait";
        gop_server.update  = "";
        gop_server.command = "";}
    if ( time_now - gop_client.point_time >= 3 ) {
        gop_client.information = "";
        gop_client.how = "Wait";}}


