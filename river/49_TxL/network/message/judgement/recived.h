

int judgement_message_recived(
                                 int   site,
                                 char* pointer_recv,
                                 char* buffer_send
                             ) {


//-----------------------------------------------

    if (
           strstr(
                   pointer_recv,
                  "Lost."
                 )
           ==      pointer_recv
       ) {


        printf("Update lost.\n");

        strcpy(gop_connection.update[site],  "");
        strcpy(gop_connection.command[site], "");


        return 0;}


//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                        "Sopi."
                      )
                ==      pointer_recv
            ) {


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

            ||     strcmp(
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

        return 0;}

//-----------------------------------------------


    else if (
           strstr(pointer_recv, "Here.")
           ==     pointer_recv
    ||     strstr(pointer_recv, "Recive.")
           ==     pointer_recv
       ) {


        return 1;}

    else {

        strcat(buffer_send, "Who is that now?");

        return 0;}}
