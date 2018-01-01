
void command_update(
                       int   site,
                       char* that_command,
                       char* buffer_send
                   ) {






    if ( site == -1 ) {

        for ( int i=0; i<=3; i++) {

            if (
                 strcmp(gop_connection.how[i], "Connectted") == 0
            or   strcmp(gop_connection.how[i], "Sopi")       == 0
               ) {

                strcpy(gop_connection.command[i], "Update");}}}







    else if (
                strcmp(gop_connection.how[site], "Connectted"  ) == 0
         or     strcmp(gop_connection.how[site], "Sopi"        ) == 0
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

                if ( control_message_update(&(gop_connection.update[site])) == "Done.") {

                    cout << "THERE IS NO GOP SOURCE." << endl;

                    that += '\n';
                    that += "Who is that now?";

                    gop_connection.command[site] = "";

                    return NULL;}}


            that_file        = file_get(gop_connection.update[site]);
            that_file_length = to_string(that_file.length());


            if ( gop_connection.step_update[site]*size_update > that_file.length() ) {

                if ( control_message_update(&(gop_connection.update[site])) == "Done.") {

                    cout << "Done" << endl;

                    gop_connection.step_update[site] = 0;
                    gop_connection.command[site] = "";

                    that += '\n';
                    that += "Done.";

                    return NULL;}

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


    else if (
                strcmp(gop_connection.how[site], "Connectting") == 0
         or     strcmp(gop_connection.how[site], "Sop"        ) == 0
            ) {


        that_command = strchr(that_command, '\n') + 1;


        if (
               strcmp(that_command, "Done.")
               == 0
           ) {

            update_mix(site);}

            else {





// name,site,length
// words

            char*  pointer_update;

            char   buffer_update_name[33];
            char   buffer_update_site[33];
            char   buffer_update_length[9];
            char   buffer_update_words[10240];

            pointer_update = strchr(that_command, '\n');
           *pointer_update = '\0';

            strcpy(buffer_update_name,   that_command);
            strcpy(buffer_update_site,   that_command);
            strcpy(buffer_update_length, that_command);
            strcpy(buffer_update_words,  pointer_update + 1);

           *strrchr(buffer_update_site,  ',') = '\0';
            strcpy(
                    buffer_update_site,
                    strchr(buffer_update_site, ',') + 1
                  );

            strcpy(buffer_update_name,   path_the            );
            strcat(buffer_update_name,   "/gop/downloads/"   );
            strcat(buffer_update_name,   buffer_update_length);
           *strchr(buffer_update_name,   ','                 ) = '\0';
            strcat(buffer_update_name,   "."                 );
            strcat(buffer_update_name,   buffer_update_site  );

            strcpy(
                    buffer_update_length,
                    strchr(buffer_update_length, ',') + 1
                  );





            if (
                        atoi(buffer_update_length)
                   == strlen(buffer_update_length)
               ) {

                printf("%s\n", buffer_update_name);

                file_save(buffer_update_name, buffer_update_words);

                strcat(buffer_send, "Recive.");}


            else {

                printf("file lost.\n");
                printf("Send: %s", buffer_update_length);
                printf("Got : %d", strlen(buffer_update_words));

                strcat(buffer_send, "Lost.");
                strcat(buffer_send, "\n");
                strcat(buffer_send, buffer_update_name);}}}}