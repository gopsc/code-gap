

int judgement_message_information(
                                     int   that_site,
                                     char* pointer_recv,
                                     char* buffer_send
                                 ) {

//PS. the varitable 'pointer_recv' was selected before
//        so there is just a command leave.

//-----------------------------------------------

    if (
           strstr(pointer_recv, "Here.")
           ==     pointer_recv
    ||     strstr(pointer_recv, "Recive.")
           ==     pointer_recv
       ) {

        return 1;}

//-----------------------------------------------

    else if ( strstr(pointer_recv, "Information of host." ) == pointer_recv ) {

        strcpy(
                gop_connection.information[that_site],
                strchr(pointer_recv, '\n') + 1
              );

        return 1;}

//-----------------------------------------------

    else if ( strstr(pointer_recv, "Information of guest.") == pointer_recv ) {

        strcat(
                gop_connection.information[that_site],
                "------------------------------\n"
              );

        strcat(
                gop_connection.information[that_site],
                strchr(pointer_recv, '\n') + 1
              );

        return 1;}

//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                       "Lost."
                      )
                ==      pointer_recv
            ) {


        output_print( "string", "Update lost.\n" );

        clean_connection( that_site,  "update" );

        return 1;}

//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                        "Sopi."
                      )
                ==      pointer_recv
            ) {


        output_print( "string", "Got Sopi\n" );





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



        clean_connection( that_site, "sopi");

        strcat(buffer_send, "Sopi.");

        return 1;}

//-----------------------------------------------

    else {

        strcat(buffer_send, "Who is that now?");

        return 1;}}
