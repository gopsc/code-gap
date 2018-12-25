string control_msg(string address_ip, string *how, string *information, string buffer_recv, string *command){
//--------------------------------------------------------
    string msg = "This is gop-raven.";

    msg += info_name;                       msg += ';';
    msg += info_system;                     msg += ';';

    msg += to_string(info_cpu.f);           msg += ',';
    msg += to_string(info_cpu.temperature); msg += ',';
    msg += to_string(info_cpu.rate);        msg += ';';

    msg += to_string(info_memory.total);    msg += ',';
    msg += to_string(info_memory.free);     msg += ',';
    msg += to_string(info_memory.buffers);  msg += ',';
    msg += to_string(info_memory.cached);   msg += ';';

    msg += to_string(point_capture);        msg += ',';
    msg += to_string(point_playback);       msg += ';';

    msg += *information;                    msg += '.';
//========================================================
    cout << msg << endl;
//--------------------------------------------------------
    if (*how == "Connectting" or *how == "Seed by") {
        *command = "";
        if (buffer_recv == "This is gop station,who is that?" or buffer_recv == "This is gop station,who is that now?") {
            }}
//========================================================
    else if (*how == "Connectted") {
        msg = "This is gop station,";}
    else if (*how == "Seed"){
        msg = "This is seed,";}
//--------------------------------------------------------
    if (*how == "Connectted" or *how == "Seed"){
    *information = buffer_recv;
        if (*information == "") {
            msg += "who is that?";}
        else {
            if (*command != "") {
                msg += *command;
                msg += '.';}
            else {
                msg += "who is that now?";}}}
//--------------------------------------------------------
    return msg;}

