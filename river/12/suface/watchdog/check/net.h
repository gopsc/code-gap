void net_check() {

    time_t time_now = time(NULL);

    if ( time_now - gop_server.point_time >= 10 ) {
        gop_server.information = "";
        gop_server.how = "Wait";}
    if ( time_now - gop_client.point_time >= 10 ) {
        gop_client.information = "";
        gop_client.how = "Wait";}}
