
void check_network() {

/*
    time_t time_now = time(NULL);




    for (int i=0; i<=3; i=i+1) {
        if ( gop_connect.point_time[i] == 0 ) {
            gop_connect.point_time[i] = time_now;}}




    if ( (time_now - gop_connect.point_time[0] >= 3) and (gop_connect.how[0] != "Wait" and gop_connect.how[0] != "") ) {

        gop_connect.information[0] = "";
        gop_connect.how[0]         = "Wait";
        gop_connect.command[0]     = "";
        gop_connect.update[0]      = "";
        gop_connect.step_update[0] = 0;

        cout << "CLIENTTING CLOSE WITH " << gop_connect.address_ip[0] << endl;

        string that_note  = "Connectting close with ";
               that_note += gop_connect.address_ip[0];
        note_save("client.note", that_note);}

//-----------------------------------------------------------------------------------------

    for ( int i = 1; i <= 3; i++ ) {

        if ( (time_now - gop_connect.point_time[i] >= 3) and (gop_connect.how[i] != "Wait" and gop_connect.how[i] != "") ) {
            cout << "SERVER CLOSE WITH " << gop_connect.address_ip[i] << endl;

            string that_note  = "Client close with ";
                   that_note += gop_connect.address_ip[i];
            note_save("server.note", that_note);

            gop_connect.how[i] = "Wait";
            gop_connect.information[i] = "";
            gop_connect.command[i]     = "";
            gop_connect.update[i]      = "";
            gop_connect.step_update[i] = 0;
            gop_connect.address_ip[i]  = "";}


//-----------------------------------------------------------------------------------------
        if ( gop_connect.how[i] == "Connectted") {

            int num1 = gop_connect.information[i].find("CPU CORES");
            int num2 = gop_connect.information[i].find(":", num1);
            int num3 = gop_connect.information[i].find('\n', num1);

            int that1 = atoi(gop_connect.information[i].substr(num2+1, num3-num2).c_str());

            num1 = gop_connect.information[i].find("CPU F");
            num2 = gop_connect.information[i].find(":", num1);
            num3 = gop_connect.information[i].find('\n', num1);

            int that2 = atoi(gop_connect.information[i].substr(num2+1, num3-num2).c_str());



            if ( that1*that2 > 2*info_cpu.cores*info_cpu.f and gop_connect.command[i] != "Update.") {




// reconnect for bigger speed

                gop_connect.how[0] = "Wait";
                gop_connect.information[0] = "";
                gop_connect.command[0] = "";
                gop_connect.update[0] = "";
                gop_connect.step_update[0] = 0;





                string that_ip = gop_connect.address_ip[0];

                for ( int ii=1;ii<=point_ip[1];ii++) {

                    if ( gop_connect.address_ip[0] == info_ip[1][ii][2].c_str()){

                        that_ip = gop_connect.address_ip[i];

                        break;}}



                cout << "SMILE TO BIG ONE : " << that_ip << endl;

                string that_command       = "Smile.";
                       that_command      += '\n';
                       that_command      += that_ip;


                gop_connect.command[i]    = that_command;
                gop_connect.point_time[0] = time(NULL);
                gop_connect.address_ip[0] = gop_connect.address_ip[i];}}

//------------------------------------------------------------------------------------


        if ( gop_connect.how[0] == "Wait"   and   gop_connect.address_ip[0] != address_to ) {


// If smiled to another, do not reset it.

            for ( int i = 1; i <= 3; i++ ) {

                if ( gop_connect.address_ip[i] == address_to) {

                    gop_connect.point_time[0] = time(NULL);}}



            if ( time_now - gop_connect.point_time[0] >= 5 ) {

                cout << "NET CONNECT RESET." << endl;

                gop_connect.address_ip[0] = address_to;}}}
*/
}
