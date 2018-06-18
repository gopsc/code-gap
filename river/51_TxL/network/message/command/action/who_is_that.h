
void action_who_is_that(
                           int   site,
                           char* buffer_send
                       ) {





    if (
           strcmp(gop_connection.how[site], "Connectting") == 0
    ||     strcmp(gop_connection.how[site], "Sop"        ) == 0
       ) {




        if (
               strcmp(gop_connection.command[site], "")
               != 0
           ) {

            strcat(buffer_send, gop_connection.command[site]);

            strcat(buffer_send, ".");

            strcpy(gop_connection.command[site], "");}


        else {

            strcat(buffer_send, "Here.");}}}