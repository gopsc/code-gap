
void action_sopi(
                    int   that_site,
                    char* buffer_send
                ) {





    if ( that_site == -1 ) {

        int i;
        for ( i=0; i<=3; i++) {

            if (
                   strcmp(gop_connection.how[i], "Sop")         == 0
            ||     strcmp(gop_connection.how[i], "Connectting") == 0
               ) {

                output_print( "string", "Ready to send sopi\n" );

                strcpy(gop_connection.command[i], "Sopi");}}}




    else if (
                strcmp(gop_connection.how[that_site], "Connectting") == 0
         ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {

        output_print( "string", "Sopi accept\n" );

        clean_connection(that_site, "sopi");





        if (
               strcmp(gop_connection.how[that_site], "Connectting")
               == 0
           ) {


            strcpy(gop_connection.how[that_site], "Sopi");

            strcpy(buffer_send,           "This is gop station.\n");
            strcat(buffer_send,           "Who is that now?");}



        else if (
                    strcmp(gop_connection.how[that_site], "Sop")
                    == 0
                ) {


            strcpy(gop_connection.how[that_site], "Connectted");

            strcpy(buffer_send,           "This is gop station.\n");
            strcat(buffer_send,           "Who is that now?");}}}
