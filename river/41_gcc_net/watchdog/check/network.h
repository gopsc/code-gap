
void check_network() {


    time_t time_now = time(NULL);




    for (int i=0; i<=3; i=i+1) {

        if ( gop_connection.time[i] == 0 ) {

            gop_connection.time[i] = time_now;}}




    if (
          (time_now - gop_connection.time[0] >= 3)
    and   (strcmp(gop_connection.how[0], "Wait")   != 0
    and    strcmp(gop_connection.how[0], ""    )   != 0)
       ) {

        strcpy(gop_connection.information[0], ""    );
        strcpy(gop_connection.how[0],         "Wait");
        strcpy(gop_connection.command[0],     ""    );
        strcpy(gop_connection.update[0],      ""    );

        printf("CLIENTTING CLOSE WITH %s\n", gop_connection.address_ip[0]);

        char   that_note[33];
        strcpy(that_note,   "Connectting close with ");
        strcat(that_note,    gop_connection.address_ip[0]);
        note_save("client", that_note, "now");}

//-----------------------------------------------------------------------------------------

    for ( int i = 1; i <= 3; i++ ) {

        if (
              (time_now - gop_connection.time[i] >= 3)
        and   (strcmp(gop_connection.how[i], "Wait") != 0
        and    strcmp(gop_connection.how[i], "") != 0)
           ) {

            printf("SERVER CLOSE WITH %s\n", gop_connection.address_ip[i]);

            char   that_note[33];
            strcpy(that_note,    "Client close with ");
            strcat(that_note,     gop_connection.address_ip[i]);

            note_save("server", that_note, "now");

            strcpy(gop_connection.how[i],         "Wait");
            strcpy(gop_connection.information[i], ""    );
            strcpy(gop_connection.command[i],     ""    );
            strcpy(gop_connection.update[i],      ""    );
            strcpy(gop_connection.address_ip[i],  ""    );}


//-----------------------------------------------------------------------------------------

        if ( strcmp(gop_connection.how[i], "Connectted") == 0 ) {
/*
            int num1 = gop_connection.information[i].find("CPU CORES");
            int num2 = gop_connection.information[i].find(":", num1);
            int num3 = gop_connection.information[i].find('\n', num1);

            int that1 = atoi(gop_connection.information[i].substr(num2+1, num3-num2).c_str());

            num1 = gop_connection.information[i].find("CPU F");
            num2 = gop_connection.information[i].find(":", num1);
            num3 = gop_connection.information[i].find('\n', num1);

            int that2 = atoi(gop_connection.information[i].substr(num2+1, num3-num2).c_str());



            if ( that1*that2 > 2*info_cpu.cores*info_cpu.f and gop_connect.command[i] != "Update.") {




// reconnect for bigger speed

                gop_connection.how[0] = "Wait";
                gop_connection.information[0] = "";
                gop_connection.command[0] = "";
                gop_connection.update[0] = "";
                gop_connection.step_update[0] = 0;





                string that_ip = gop_connection.address_ip[0];

                for ( int ii=1;ii<=point_ip[1];ii++) {

                    if ( gop_connection.address_ip[0] == info_ip[1][ii][2].c_str()){

                        that_ip = gop_connection.address_ip[i];

                        break;}}



                cout << "SMILE TO BIG ONE : " << that_ip << endl;

                string that_command       = "Smile.";
                       that_command      += '\n';
                       that_command      += that_ip;


                gop_connect.command[i]    = that_command;
                gop_connect.point_time[0] = time(NULL);
                gop_connect.address_ip[0] = gop_connect.address_ip[i];}
*/}

//------------------------------------------------------------------------------------

/*
        if ( gop_connect.how[0] == "Wait"   and   gop_connect.address_ip[0] != address_to ) {


// If smiled to another, do not reset it.

            for ( int i = 1; i <= 3; i++ ) {

                if ( gop_connect.address_ip[i] == address_to) {

                    gop_connect.point_time[0] = time(NULL);}}



            if ( time_now - gop_connect.point_time[0] >= 5 ) {

                cout << "NET CONNECT RESET." << endl;

                gop_connect.address_ip[0] = address_to;}}}
*/
}}
