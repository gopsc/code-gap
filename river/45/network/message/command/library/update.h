
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

                printf("READY TO SEND update\n");
                strcpy(gop_connection.update[i],  "");
                strcpy(gop_connection.command[i], "Update.");}}}







    else if (
                strcmp(gop_connection.how[site], "Connectted"  ) == 0
         or     strcmp(gop_connection.how[site], "Sopi"        ) == 0
            ) {


// count_update means times between tow update message

        if ( count_update < count_update_max ) {

            strcat(buffer_send, "Who is that now?");

            count_update++;}

        else {

            count_update = 0;

            strcat(buffer_send, "Update.");



            char buffer_file[102400];
            char buffer_file_length[17];
            char buffer_length[17];

            if ( strcmp(gop_connection.update[site], "") == 0 ) {

                if ( control_message_update(gop_connection.update[site]) == 0 ) {

                    printf("THERE IS NO GOP SOURCE.\n");

                    strcat(buffer_send, "\n");
                    strcat(buffer_send, "Who is that now?");

                    strcpy(gop_connection.command[site], "");

                    return;}}


            file_get(gop_connection.update[site], buffer_file);
            gcvt    (strlen(buffer_file), 10, buffer_file_length);


            if ( gop_connection.step_update[site] * size_update > strlen(buffer_file) ) {

                if ( control_message_update(gop_connection.update[site]) == 0 ) {

                    printf("Done\n");

                    gop_connection.step_update[site] = 0;
                    strcpy(gop_connection.command[site], "");

                    strcat(buffer_send, "\n");
                    strcat(buffer_send, "Done.");

                    return;}

                else {

                    gop_connection.step_update[site] = 0;}}


                file_get(gop_connection.update[site], buffer_file);
                gcvt    (strlen(buffer_file), 10, buffer_file_length);

// show file name if it have not begin

                if ( gop_connection.step_update[site] == 0 ) {

                    printf("%s    send size : %s\n", gop_connection.update[site], buffer_file_length);}


                gcvt(gop_connection.step_update[site], 10, buffer_length);

                strcat(buffer_send, "\n");
                strcat(buffer_send, strstr(gop_connection.update[site], name_the) + strlen(name_the));
                strcat(buffer_send, ",");
                strcat(buffer_send, buffer_length);
                strcat(buffer_send, ",");



            if ( (gop_connection.step_update[site]+1) * size_update > atoi(buffer_file_length) ) {

                gcvt  (
                       strlen(buffer_file) - (gop_connection.step_update[site]) * size_update,
                       10,
                       buffer_file_length
                      );
                strcat(buffer_send, buffer_file_length);}

            else {

                
                gcvt  (size_update, 10, buffer_length);
                strcat(buffer_send,     buffer_length);}

                strcat(buffer_send, ".");
                strcat(buffer_send, "\n");
                strcpy(buffer_file, buffer_file + gop_connection.step_update[site] * size_update);
                       buffer_file[size_update] = '\0';
                strcat(buffer_send, buffer_file);
                gop_connection.step_update[site]++;}}


    else if (
                strcmp(gop_connection.how[site], "Connectting") == 0
         or     strcmp(gop_connection.how[site], "Sop"        ) == 0
            ) {


        strcpy(that_command, strchr(that_command, '\n') + 1);


        if (
               strcmp(that_command, "Done.")
               == 0
           ) {

            update_load(site);}

        else {





// name,site,length
// words

            char*  pointer_update;

            char   buffer_update_name[257];
            char   buffer_update_site[257];
            char   buffer_update_length[257];
            char   buffer_update_words[102400];

            pointer_update = strchr(that_command, '\n');
           *pointer_update = '\0';

            strcpy(buffer_update_site,   that_command);
            strcpy(buffer_update_length, that_command);
            strcpy(buffer_update_words,  pointer_update+1);

           *strrchr(buffer_update_site,  ',') = '\0';
            strcpy(
                    buffer_update_site,
                    strchr(buffer_update_site, ',') + 1
                  );

            strcpy(buffer_update_name,               path_the            );
            strcat(buffer_update_name,               "/downloads"        );
            strcat(buffer_update_name,               buffer_update_length);
           *strchr(strrchr(buffer_update_name, '/'), ',') = '\0';
            strcat(buffer_update_name,               "."                 );
            strcat(buffer_update_name,               buffer_update_site  );
           *strrchr(buffer_update_length,            '.') = '\0';
            strcpy(
                    buffer_update_length,
                    strrchr(buffer_update_length, ',') + 1
                  );





            if (
                   atoi(buffer_update_length)
            ==   strlen(buffer_update_words)
               ) {

                printf("%s\n", buffer_update_name);

                file_save(buffer_update_name, buffer_update_words);

                strcat(buffer_send, "Recive.");}


            else {

                printf("file lost.\n");
                printf("Send: %d\n", atoi(buffer_update_length));
                printf("Got : %d\n", strlen(buffer_update_words));

                strcat(buffer_send, "Lost.");
                strcat(buffer_send, "\n");
                strcat(buffer_send, that_command);}}}}