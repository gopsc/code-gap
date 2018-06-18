
bool judgement_message_sopi (
                                int   site,
                                char* pointer_recv,
                                char* buffer_send
                            ) {


    if (
           strstr(
                   pointer_recv,
                  "Sopi."
                 )
           !=      pointer_recv
       ) {

        return 0;}


    else {


        printf("GOT Sopi\n");

        strcpy(gop_connection.information[site],  "");
        strcpy(gop_connection.command[site],      "");
        strcpy(gop_connection.update[site],       "");
        gop_connection.step_update[site] = 0;



        for ( int i=0; i<=3; i++ ) {

            if (
                   strcmp(
                           gop_connection.how[i],
                          "Connectting"
                         )
                   == 0

            or     strcmp(
                           gop_connection.how[i],
                          "Sop"
                         )
                   == 0
               ) {


                strcpy(gop_connection.command[i], "Sopi.");}}



        if (
               strcmp(
                       gop_connection.how[site],
                      "Connectted"
                     )
               == 0
           ) {

            strcpy(gop_connection.how[site], "Sop");}



        if (
               strcmp(
                       gop_connection.how[site],
                      "Sop"
                     )
               == 0
           ) {

            strcpy(gop_connection.how[site], "Connectting");}



        strcat(buffer_send, "Sopi.");

        return 1;}}