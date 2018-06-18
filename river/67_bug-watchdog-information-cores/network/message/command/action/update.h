
void action_update(
                      int   that_site,
                      char* that_command,
                      char* buffer_send
                  ) {




    if ( that_site == -1 ) {

        int i;
        for ( i=0; i<=3; i++) {

            if (
                 strcmp(gop_connection.how[i], "Connectted") == 0
            ||   strcmp(gop_connection.how[i], "Sopi")       == 0
               ) {

                output_print( "string", "Ready to send update message.\n" );

                strcpy(gop_connection.update[i],       "");
                       gop_connection.step_update[i]  = 0;
                strcpy(gop_connection.command[i],      "Update.");}}}

//================================================================================

    else if (
                strcmp(gop_connection.how[that_site], "Connectting") == 0
         ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {


        strcpy(that_command, strchr(that_command, '\n') + 1);


        if (
               strcmp(that_command, "Done.")
               == 0
           ) {

            load_update(that_site);}

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

                output_print( "string",  buffer_update_name );
                output_print( "string", "\n"                );

                file_save(buffer_update_name, buffer_update_words);

                //strcat(buffer_send, "Recive.");

                }


            else {

                int number_length_recived = atoi  (buffer_update_length );
                int number_length_got     = strlen(buffer_update_words  );

                output_print( "string",        "file lost.\n"         );
                output_print( "string",        "Send: "               );
                output_print( "int",    (char*)&number_length_recived );
                output_print( "string",        "\n"                   );
                output_print( "string",        "Got : "               );
                output_print( "int",    (char*)&number_length_got     );
                output_print( "string",        "\n"                   );

/*
                strcat(buffer_send, "Lost.");
                strcat(buffer_send, "\n");
                strcat(buffer_send, that_command);
*/
                }}}}
