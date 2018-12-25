
void command_update_clean(
                             int   site,
                             char* buffer_send
                         ) {



    if      (
                strcmp(gop_connection.how[site], "Connectted")   == 0
    or          strcmp(gop_connection.how[site], "Sopi"        ) == 0
            ) {

        strcpy(gop_connection.command[site], "Update.");
        strcat(buffer_send,               "Clean update.");}


    else if (
                strcmp(gop_connection.how[site], "Connectting") == 0
    or          strcmp(gop_connection.how[site], "Sop"        ) == 0
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