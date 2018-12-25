
int action_sopi(
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

                strcpy(gop_connection.command[i], "Sopi");}}

        return 1;}




    else if (
                strcmp(gop_connection.how[that_site], "Connectting") == 0
         ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {

        output_print( "string", "Sopi accept\n" );

        clean_connection(that_site, "sopi");

        strcpy(buffer_send,           "This is gop station.\n");
        strcat(buffer_send,           "Who is that now?"      );

        return 1;}


    return 0;}
