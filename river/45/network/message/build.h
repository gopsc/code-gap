
void* control_message(
                         int   site,
                         char* buffer_recv,
                         char* buffer_send
                     ) {



    char* pointer_recv = buffer_recv;







    if (
               strcmp(gop_connection.how[site], "Connectting") == 0
            or strcmp(gop_connection.how[site], "Sop")         == 0
       ) {



        strcpy( buffer_send, "This is gop station." );
        strcat( buffer_send, "\n");


        if (
               judgement_message_hello(
                                        site,
                                        pointer_recv,
                                        buffer_send
                                      )
           ) {


            if (
                   judgement_message_who(
                                          site,
                                          pointer_recv,
                                          buffer_send
                                        )
               ) {


// This is gop station, send information

                message_information_put(buffer_send);



// This is gop station,
// (command)
// ...
// (end)
// ...


                pointer_recv = strchr(pointer_recv, '\n') + 1;

                control_command(
                                 site,
                                 pointer_recv,
                                 buffer_send
                               );}}}










//========================================================

    else if (
           strcmp(gop_connection.how[site], "Connectted")
           == 0
    or     strcmp(gop_connection.how[site], "Sopi")
           == 0
       ) {


        strcpy(buffer_send, "This is gop station.");
        strcat(buffer_send, "\n"                  );

//========================================================


        if (
               judgement_message_blank(
                                        site,
                                        pointer_recv,
                                        buffer_send
                                      )
           ) {
// SHOW ITSELF

            if (
                   judgement_message_hello(
                                            site,
                                            pointer_recv,
                                            buffer_send
                                          )
               ) {

// WHO IT IS

                if (
                       judgement_message_who(
                                              site,
                                              pointer_recv,
                                              buffer_send
                                            )
                   ) {



                    pointer_recv = strchr(pointer_recv, '\n') + 1;

// Get information

                    if (   message_information_get(
                                                    site,
                                                    pointer_recv,
                                                    buffer_send
                                                  )
                       ) {

// Get command

                        pointer_recv = strstr(
                                               strchr(pointer_recv, '\n'),
                                               "-----\n"
                                             ) + 6;

//-------------------------------------------------------------------------------------

//It means client is ready

                        if (
                                    judgement_message_recived(
                                                               site,
                                                               pointer_recv,
                                                               buffer_send
                                                              )
                           ) {

//-------------------------------------------------------------------------------------

                            control_command(
                                             site,
                                             gop_connection.command[site],
                                             buffer_send
                                           );}}}}}}}