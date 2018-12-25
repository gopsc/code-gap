void check_net() {

    time_t time_now = time(NULL);

    for (int i = 1; i <= 3; i++) {
        if ( (time_now - gop_connect.point_time[i] >= 5) and gop_connect.how[i] != "Wait" ) {

            cout << "Server close with " << gop_connect.address_ip[i] << endl;

            string that_note  = "Client close with ";
                   that_note += gop_connect.address_ip[i];
            note_save("server.note", that_note);

            gop_connect.how[i] = "Wait";
            gop_connect.information[i] = "";
            gop_connect.command[i]     = "";
            gop_connect.update[i]      = "";
            gop_connect.step_update[i] = 0;
            gop_connect.address_ip[i]  = "";}}


    if ( (time_now - gop_connect.point_time[0] >= 5) and gop_connect.how[0] != "Wait" ) {


        gop_connect.information[0] = "";
        gop_connect.how[0]         = "Wait";
        gop_connect.command[0]     = "";
        gop_connect.update[0]      = "";
        gop_connect.step_update[0] = 0;

        cout << "Client close with " << gop_connect.address_ip[0] << endl;

        string that_note  = "Connect close with ";
               that_note += gop_connect.address_ip[0];
        note_save("client.note", that_note);}}










