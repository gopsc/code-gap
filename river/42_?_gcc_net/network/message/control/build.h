
void* control_message(
                         int   site,
                         char* buffer_recv,
                         char* buffer_send
                     ) {











    if (
               strcmp(gop_connection.how[site], "Connectting") == 0
            or strcmp(gop_connection.how[site], "Sop")         == 0
       ) {



        strcpy( buffer_send, "This is gop station." );
        strcat( buffer_send, "\n");




        if (
                  strstr(buffer_recv, "This is ") != buffer_recv
               or strstr(buffer_recv, "\n")       == NULL
           ) {

            printf("NETWORK: \n%s\n", buffer_recv);

            strcat(buffer_send,    "Who is that?");

            exit;}


        else {









            if (
                   strstr(
                          buffer_recv,
                          "This is gop station."
                         )
                   != buffer_recv
               ) {

                printf("NETWORK: \n%s\n", buffer_recv);
                strcat(buffer_send,    "Who is that now?");

                exit;}

            else {



                //This is gop station, send information

                char that_buffer[10240];

                information_get(that_buffer);

                strcat(buffer_send, that_buffer);


                for ( int i = 0; i <= 3; i++ ) {

                    strcat(buffer_send, gop_connection.information[i]);}






// This is gop station,
// (command)
// ...
// (end)
// ...


                strcpy(
                        buffer_recv,
                        strchr(buffer_recv, '\n') + 1
                      );

//---------------------------------------------------------

                if (
                       strstr(buffer_recv, "Sopi.")
                       ==     buffer_recv
                   ) {



                    strcpy(gop_connection.information[site],  "");
                    strcpy(gop_connection.update[site],       "");
                           gop_connection.step_update[site] = 0;
                    strcpy(gop_connection.command[site],      "");





                    if (
                          strcmp(gop_connection.how[site], "Connectting")
                          == 0
                       ) {


                        strcpy(gop_connection.how[site], "Sopi");

                        strcpy(buffer_send,           "This is gop station.\n");
                        strcat(buffer_send,           "Who is that now?");

                        exit;}



                    else if (
                                strcmp(gop_connection.how[site], "Sop")
                                == 0
                            ) {


                        strcpy(gop_connection.how[site], "Connectted");

                        strcpy(buffer_send,           "This is gop station.\n");
                        strcat(buffer_send,           "Who is that now?");

                        exit;}}

//---------------------------------------------------------

                else if (
                            strstr(buffer_recv, "Who is that?")
                            ==     buffer_recv
                     or     strstr(buffer_recv, "Who is that now?")
                            ==     buffer_recv
                        ) {



                    if (
                           strcmp(gop_connection.command[site], "")
                           != 0
                       ) {


                        strcat(buffer_send, gop_connection.command[site]);

                        strcat(buffer_send, ".");

                        strcpy(gop_connection.command[site], "");}


                    else {

                        strcat(buffer_send, "Here.");}}

//---------------------------------------------------------

                else if (
                            strstr(buffer_recv, "Smile." )
                            ==     buffer_recv
                        ) {


                    printf(
                           "SMILE FROM  %s\n",
                           gop_connection.address_ip[site]
                          );

                    strcpy(buffer_recv, strchr(buffer_recv, '\n') + 1);
                    strcpy(gop_connection.address_ip[0], buffer_recv);

                    strcat(buffer_send, "Recive.");}

//---------------------------------------------------------

                else if (
                            strstr(buffer_recv, "Update.")
                            ==     buffer_recv
                        ) {


/*
                    strcpy(
                            buffer_recv,
                            strchr(buffer_recv, '\n') + 1
                          );


                    if (
                           strcmp(buffer_recv, "Done.")
                           == 0
                       ) {

                        update_mix(site);}

                    else {


                        // name,site,length
			// words

                        int    num_file_name    = that3.find(',');
                        int    num_file_site    = that3.find(',', num_file_name+1);
                        int    num_file_length  = that3.find('\n')-1;

                        string that_file_site   = that3.substr(num_file_name+1, num_file_site - num_file_name-1);

                        string that_file_name   = path_the;
                               that_file_name  += "/gop/downloads/";
                               that_file_name  += that3.substr(0, num_file_name);
                               that_file_name  += '.';
                               that_file_name  += that_file_site;

                        string that_file_length = that3.substr(num_file_site+1, num_file_length-num_file_site-1);
                        string that_file_words  = that3.substr(num_file_length+2, that3.length());





                        if ( atoi(that_file_length.c_str()) == that_file_words.length() ) {

                            cout << that_file_name << endl;

                            file_save(that_file_name, that_file_words);

                            that +=  "Recive.";}



                        else {
                            cout << "file lost." << endl;
                            cout << "Send: " << atoi(that_file_length.c_str()) << endl;
                            cout << "Got : " << that_file_words.length()       << endl;

                            that += "Lost.";
                            that += '\n';
                            that += that_file_name;
                            that += '\n';}}
*/
}
//---------------------------------------------------------

                else {
                    strcat(buffer_send, "What's that?");
                    printf(
                           "NETWORK: \n%s\n",
                            buffer_recv
                          );
                    exit;}}}}










//========================================================

        if (
               strcmp(gop_connection.how[site], "Connectted")
               == 0
        or     strcmp(gop_connection.how[site], "Sopi")
               == 0
           ) {


            strcpy(buffer_send, "This is gop station.");
            strcat(buffer_send, "\n"                  );

//========================================================


// SHOW ITSELF

            if (
                   strcmp(buffer_recv, "")
                   == 0
               ) {


                 strcat(buffer_send, "Who is that?");}





            else if (
                        strstr(buffer_recv, "This is ")
                        !=     buffer_recv
                or      strchr(buffer_recv, '\n')
                        == NULL
                    ) {




                printf(
                       "NETWORK:1 \n%s\n",
                        buffer_recv
                      );

                strcat(buffer_send, "Who is that now?");}







            else {

// WHO IT IS

                if (
                       strstr(buffer_recv, "This is gop station.")
                       !=     buffer_recv
                and    strstr(buffer_recv, "This is a leaf.")
                       !=     buffer_recv
                   ) {




                    printf(
                           "NETWORK WITHOUT INFORMSTION: \n%s\n",
                            buffer_recv
                          );

                    strcat(buffer_send, "Who is that now?");}



                else {



                    strcpy(
                            buffer_recv,
                            strchr(buffer_send, '\n') + 1
                          );

// Get information

                    if (
                           strstr(buffer_recv, "-----")
                           ==     buffer_recv
                       ) {







                        strcpy(
                                gop_connection.information[site],
                                buffer_recv
                              );



                      *(strstr(
                                strchr(gop_connection.information[site], '\n') + 1,
                               "-----\n"
                              )
                        + 6) = '\0';



// If you connect to yourself,
// clear it.

                        for (int i=1; i<=information_ip_num; i++) {

                            if (
                                   strcmp(
                                           gop_connection.address_ip[site],
                                           information_ip[i][2]
                                         ) == 0
                               ) {

                                strcpy(gop_connection.information[site], "");}}



// Get command

                        strcpy(
                                buffer_recv,
                                strstr(
                                        strchr(buffer_recv, '\n'),
                                        "-----\n"
                                      )
                                + 6
                              );

//-------------------------------------------------------------------------------------

//It means client is ready

                        if (
                               strstr(buffer_recv, "Here.")
                               ==     buffer_recv
                        or     strstr(buffer_recv, "Recive.")
                               ==     buffer_recv
                           ) {

//-------------------------------------------------------------------------------------

                            if (
                                   strstr(
                                           gop_connection.command[site],
                                          "Smile"
                                         )
                                   ==      gop_connection.command[site]
                               ) {


                               strcat(buffer_send, gop_connection.command[site]);

                               strcpy(gop_connection.command[site], "");}

//-------------------------------------------------------------------------------------



                            else if (
                                        strcmp(
                                                gop_connection.command[site],
                                               "Update."
                                              )
                                        == 0
                                    ) {


// count_update means times between tow update message
/*
                                if ( count_update < count_update_max ) {

                                    that += "Who is that now?";

                                    count_update++;}

                                else {

                                    count_update=0;

                                    that += "Update.";



                                    if ( gop_connection.update[site] == "" ) {

                                        if ( control_update(&(gop_connection.update[site])) == "Done.") {

                                            cout << "THERE IS NO GOP SOURCE." << endl;

                                            that += '\n';
                                            that += "Who is that now?";

                                            gop_connection.command[site] = "";

                                            exit;}}


                                    that_file        = file_get(gop_connection.update[site]);
                                    that_file_length = to_string(that_file.length());


                                    if ( gop_connection.step_update[site]*size_update > that_file.length() ) {

                                        if ( control_update(&(gop_connection.update[site])) == "Done.") {

                                            cout << "Done" << endl;

                                            gop_connection.step_update[site] = 0;
                                            gop_connection.command[site] = "";

                                            that += '\n';
                                            that += "Done.";

                                            exit;}

                                        else {
                                            gop_connection.step_update[site] = 0;}}


                                    that_file        = file_get(gop_connection.update[site]);
                                    that_file_length = to_string(that_file.length());

                                    // show file name if it have not begin
                                    if ( gop_connection.step_update[site] == 0) {
                                        cout << gop_connection.update[site] << endl;
                                        cout << "    send size : ";
                                        cout << that_file.length() << endl;}


                                    that += '\n';
                                    that += (gop_connection.update[site]).substr(gop_connection.update[site].find(name_the), (gop_connection.update[site]).length());
                                    that += ',';
                                    that += to_string(gop_connection.step_update[site]);
                                    that += ',';



                                    if ( (gop_connection.step_update[site]+1)*size_update > atoi(that_file_length.c_str()) ) {
                                        that += to_string(atoi(that_file_length.c_str())
                                             -  (gop_connection.step_update[site])*size_update);}

                                    else {

                                        that += to_string(size_update);}

                                    that += '.';
                                    that += '\n';

                                    that += that_file.substr((gop_connection.step_update[site])*size_update, size_update);
                                    (gop_connection.step_update[site])++;}
*/
}
//-------------------------------------------------------------------------------------

                            else {

                                strcpy(gop_connection.command[site], "");

                                strcat(buffer_send, "Who is that now?");}}

//-------------------------------------------------------------------------------------

                        else if (
                                  strstr(
                                          buffer_recv,
                                         "Sopi."
                                        )
                                  ==      buffer_recv
                                ) {


                            strcpy(gop_connection.information[site],  "");
                            strcpy(gop_connection.command[site],      "");
                            strcpy(gop_connection.update[site],       "");
                                   gop_connection.step_update[site] = 0  ;



                            for ( int i=0; i<=3; i++ ) {

                                if (
                                       strcmp(
                                               gop_connection.how[i],
                                              "Connectting"
                                             )
                                       == 0
                                or     strcmp(
                                               gop_connection.how[i],
                                              "Sop"
                                             )
                                       == 0
                                   ) {


                                    strcpy(gop_connection.command[i], "Sopi.");}}



                            if (
                                   strcmp(
                                           gop_connection.how[site],
                                          "Connectted"
                                         )
                                   == 0
                               ) {

                                strcpy(gop_connection.how[site], "Sop");}



                            if (
                                   strcmp(
                                           gop_connection.how[site],
                                          "Sop"
                                         )
                                   == 0
                               ) {

                                strcpy(gop_connection.how[site], "Connectting");}



                            strcat(buffer_send, "Sopi.");}

//-------------------------------------------------------------------------------------

                        else {

                            strcat(buffer_send, "Who is that now?");}}

//-------------------------------------------------------------------------------------

                    else {

                        strcat(buffer_send, "Who is that now?");}}}}}
