

int append_message_data_update(
                                  int   that_site,
                                  char* buffer_send
                              ) {

    if (
           strcmp(gop_connection.how[that_site], "Connectted"  ) != 0
    &&     strcmp(gop_connection.how[that_site], "Sopi"        ) != 0
       ) {

        return 0;}


    else {

// count_update means times between tow update message

        if ( count_update < count_update_max ) {

            count_update++;

            return 0;}

        else {

            count_update = 0;

            strcat(buffer_send, "Update.");
            strcat(buffer_send, "\n");


            char buffer_file          [102400];
            char buffer_file_length   [16];
            char buffer_sum           [16];
            char buffer_step          [16];


            char   buffer_path_start  [33];
            strcpy(buffer_path_start, path_the);
            strcat(buffer_path_start, "/"     );
            strcat(buffer_path_start, name_the);


            if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {

                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {

                    output_print( "string", "There is no TxL source.\n" );

                    strcpy(gop_connection.update[that_site], ""     );
                    strcat(buffer_send,                      "Done.");

                    return 1;}}


            file_get(gop_connection.update[that_site], buffer_file       );
            snprintf(buffer_file_length, sizeof(buffer_file_length) / sizeof(char) - 1, "%d", strlen(buffer_file));


            if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {

                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {

                    output_print( "string",                       "Done.\n" );
                           gop_connection.step_update[that_site] = 0         ;
                    strcpy(gop_connection.update     [that_site], ""        );
                    strcat(buffer_send,                           "Done."   );

                    int i;
                    for ( i = that_site + 1; i <= 3; i++ ) {

                        if (
                               strcmp(gop_connection.how[i],     "Sopi")       == 0
                        ||     strcmp(gop_connection.how[i],     "Connectted") == 0
                           ) {

                            strcpy(gop_connection.command[that_site], ""             );
                            strcpy(gop_connection.command[i],    "Clean update.");
                            break;}}

                    return 1;}

                else {

                    gop_connection.step_update[that_site] = 0;}}


// get the numer of sums;

            file_get(gop_connection.update[that_site], buffer_file);

            strcpy(buffer_file, buffer_file + gop_connection.step_update[that_site] * size_update);
                   buffer_file[size_update] = '\0';

            secret_encode(buffer_file, "sum");

            strcpy(buffer_sum, buffer_file);




            file_get(gop_connection.update[that_site], buffer_file);

            snprintf(buffer_file_length, sizeof(buffer_file_length) / sizeof(char) - 1, "%d", strlen(buffer_file));


// show file name if it have not begin

            if ( gop_connection.step_update[that_site] == 0 ) {

                output_print( "string", gop_connection.update[that_site] );
                output_print( "string", "    send size : "               );
                output_print( "string", buffer_file_length               );
                output_print( "string", "\n"                             );}


            snprintf(buffer_step, sizeof(buffer_step) / sizeof(char) - 1, "%d", gop_connection.step_update[that_site]);

            strcat(buffer_send, strstr(gop_connection.update[that_site], name_the) + strlen(name_the));
            strcat(buffer_send, ",");
            strcat(buffer_send, buffer_step);
            strcat(buffer_send, ",");



            if ( (gop_connection.step_update[that_site]+1) * size_update > atoi(buffer_file_length) ) {

                snprintf(
                         buffer_file_length,
                         sizeof(buffer_file_length) / sizeof(char) - 1,
                         "%d",
                         strlen(buffer_file) - (gop_connection.step_update[that_site]) * size_update
                        );
                strcat(buffer_send, buffer_file_length);}

            else {

                snprintf(buffer_file_length, sizeof(buffer_file_length) / sizeof(char) - 1, "%d", size_update);
                strcat  (buffer_send,        buffer_file_length);}

            strcat(buffer_send, ","       );
            strcat(buffer_send, buffer_sum);
            strcat(buffer_send, "."       );
            strcat(buffer_send, "\n"      );

            strcpy(buffer_file, buffer_file + gop_connection.step_update[that_site] * size_update);
                   buffer_file[size_update] = '\0';

            strcat(buffer_send, buffer_file);
            gop_connection.step_update[that_site]++;}

        return 1;}}
