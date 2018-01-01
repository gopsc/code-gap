
void action_who_is_that(
                           int   that_site,
                           char* buffer_send
                       ) {





    if (
           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
       ) {




        if (
               strcmp(gop_connection.command[that_site], "")
               != 0
           ) {

            strcat(buffer_send, gop_connection.command[that_site]);

            strcat(buffer_send, ".");

            strcpy(gop_connection.command[that_site], "");}


        else {

            strcat(buffer_send, "Here.");}}}