

void append_message_data_update(
                                   int   that_site,
                                   char* buffer_send
                               ) {

    if (
           strcmp(gop_connection.how[that_site], "Connectted"  ) == 0
    ||     strcmp(gop_connection.how[that_site], "Sopi"        ) == 0
       ) {


// count_update means times between tow update message

        if ( count_update < count_update_max ) {

            strcat(buffer_send, "Who is that now?");

            count_update++;}

        else {

            count_update = 0;

            strcat(buffer_send, "Update.");
            strcat(buffer_send, "\n");



            char buffer_file          [102400];
            char buffer_file_length   [17];
            char buffer_length        [17];


            char   buffer_path_start  [33];
            strcpy(buffer_path_start, path_the);
            strcat(buffer_path_start, "/"     );
            strcat(buffer_path_start, name_the);



            if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {

                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {

                    printf("There is no TxL source.\n");

                    strcpy(gop_connection.update[that_site], ""     );
                    strcat(buffer_send,                      "Done.");

                    return;}}

            file_get(gop_connection.update[that_site], buffer_file       );
            gcvt    (strlen(buffer_file), 10,          buffer_file_length);


            if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {

                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {

                    printf(             "Done.\n");
                           gop_connection.step_update[that_site] = 0;
                    strcpy(gop_connection.update     [that_site], "");
                    strcat(buffer_send, "Done.");


                    for ( int i = that_site + 1; i <= 3; i++ ) {

                        if (
                               strcmp(gop_connection.how[i],     "Sopi")       == 0
                        ||     strcmp(gop_connection.how[i],     "Connectted") == 0
                           ) {

                            strcpy(gop_connection.command[that_site], ""             );
                            strcpy(gop_connection.command[i],    "Clean update.");
                            break;}}

                    return;}

                else {

                    gop_connection.step_update[that_site] = 0;}}


                file_get(gop_connection.update[that_site], buffer_file);
                gcvt    (strlen(buffer_file), 10, buffer_file_length);

// show file name if it have not begin

                if ( gop_connection.step_update[that_site] == 0 ) {

                    printf("%s    send size : %s\n", gop_connection.update[that_site], buffer_file_length);}


                gcvt(gop_connection.step_update[that_site], 10, buffer_length);

                strcat(buffer_send, strstr(gop_connection.update[that_site], name_the) + strlen(name_the));
                strcat(buffer_send, ",");
                strcat(buffer_send, buffer_length);
                strcat(buffer_send, ",");



            if ( (gop_connection.step_update[that_site]+1) * size_update > atoi(buffer_file_length) ) {

                gcvt  (
                       strlen(buffer_file) - (gop_connection.step_update[that_site]) * size_update,
                       10,
                       buffer_file_length
                      );
                strcat(buffer_send, buffer_file_length);}

            else {

                
                gcvt  (size_update, 10, buffer_length);
                strcat(buffer_send,     buffer_length);}

                strcat(buffer_send, ".");
                strcat(buffer_send, "\n");
                strcpy(buffer_file, buffer_file + gop_connection.step_update[that_site] * size_update);
                       buffer_file[size_update] = '\0';
                strcat(buffer_send, buffer_file);
                gop_connection.step_update[that_site]++;}}}