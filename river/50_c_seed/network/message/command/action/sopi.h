
void action_sopi(
                    int   site,
                    char* buffer_send
                ) {





    if ( site == -1 ) {

        for ( int i=0; i<=3; i++) {

            if (
                   strcmp(gop_connection.how[i], "Sop")         == 0
            ||     strcmp(gop_connection.how[i], "Connectting") == 0
               ) {

                printf("READY TO SEND sopi");

                strcpy(gop_connection.command[i], "Sopi");}}}




    else if (
                strcmp(gop_connection.how[site], "Connectting") == 0
         ||     strcmp(gop_connection.how[site], "Sop"        ) == 0
            ) {

        printf("Sopi ACCEPT\n");

        strcpy(gop_connection.information[site],  "");
        strcpy(gop_connection.update[site],       "");
        gop_connection.step_update[site] = 0;
        strcpy(gop_connection.command[site],      "");





        if (
               strcmp(gop_connection.how[site], "Connectting")
               == 0
           ) {


            strcpy(gop_connection.how[site], "Sopi");

            strcpy(buffer_send,           "This is gop station.\n");
            strcat(buffer_send,           "Who is that now?");}



        else if (
                    strcmp(gop_connection.how[site], "Sop")
                    == 0
                ) {


            strcpy(gop_connection.how[site], "Connectted");

            strcpy(buffer_send,           "This is gop station.\n");
            strcat(buffer_send,           "Who is that now?");}}}