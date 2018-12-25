
void action_update_clean(
                            int   that_site,
                            char* buffer_send
                        ) {



    if      (
                strcmp(gop_connection.how[that_site], "Connectted")   == 0
    ||          strcmp(gop_connection.how[that_site], "Sopi"        ) == 0
            ) {

        strcpy(gop_connection.command[that_site],  ""           );
        strcpy(gop_connection.update [that_site],  path_the     );
        strcat(gop_connection.update [that_site], "/"           );
        strcat(gop_connection.update [that_site],  name_the     );
        strcat(buffer_send,                      "Clean update.");}



    else if (
                strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||          strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {

        printf("Clean update.\n");

        char    buffer_path[65];
        char    buffer_commandline[65];

        strcpy(buffer_path,        path_the);
        strcat(buffer_path,        "/");
        strcat(buffer_path,        "downloads");

        strcpy(buffer_commandline, "rm -rf ");
        strcat(buffer_commandline, buffer_path);



        if ( is_dirent(buffer_path) ) {

            commandline_get(buffer_commandline, buffer_path);}}}