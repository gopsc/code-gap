
void control_message(
                        int   that_site,
                        char* buffer_recv,
                        char* buffer_send
                    ) {



    char* pointer_recv = buffer_recv;






//========================================================

    if (
               strcmp(gop_connection.how[that_site], "Connectting") == 0
            || strcmp(gop_connection.how[that_site], "Sop")         == 0
       ) {


        strcpy( buffer_send, "This is gop station." );
        strcat( buffer_send, "\n");

//========================================================

        if (
               ! judgement_message_hello(
                                          that_site,
                                          pointer_recv,
                                          buffer_send
                                        )
           ) { return; }

//========================================================

        if (
               ! judgement_message_who(
                                        that_site,
                                        pointer_recv,
                                        buffer_send
                                      )
           ) { return; }

//========================================================
// This is gop station, send information

        strcat         (buffer_send, "Information of host.\n");
        information_append(
                            buffer_send,
                            information_system,
                            information_network,
                            information_cpu,
                            information_memory,
                            information_disk,
                            information_sound,
                            information_flag
                           );
        strcat         (buffer_send, symbol_next );


        for ( int i = 0; i <= 3; i++ ) {

            if (
                   strcmp( gop_connection.how[i], "Connectted" ) == 0 
            ||     strcmp( gop_connection.how[i], "Sopi"       ) == 0 
               ) {

                strcat(buffer_send, "Information of guest.\n"    );
                information_append(
                                    buffer_send,
                                    gop_connection.system [i],
                                    gop_connection.network[i],
                                    gop_connection.cpu    [i],
                                    gop_connection.memory [i],
                                    gop_connection.disk   [i],
                                    gop_connection.sound  [i],
                                    gop_connection.flag   [i]
                                  );
                strcat(buffer_send, symbol_next                  );}}

//========================================================

// This is gop station,
// (command)
// ...
// (end)
// ...


        pointer_recv = strchr(pointer_recv, '\n') + 1;

//========================================================

// Get imformation of host.

        char* pointer_next;

        do {

            pointer_next  = strstr(pointer_recv, symbol_next);

            if ( pointer_next != NULL ) {

                *pointer_next = '\0';}

            control_command(
                             that_site,
                             pointer_recv,
                             buffer_send
                           );

            if ( pointer_next != NULL ) {

               *pointer_next = '\n';

                pointer_recv = pointer_next + strlen(symbol_next);}

            } while ( pointer_next != NULL );}













//========================================================

    else if (
                strcmp(gop_connection.how[that_site], "Connectted")
                == 0
    ||          strcmp(gop_connection.how[that_site], "Sopi")
                == 0
            ) {


        strcpy(buffer_send, "This is gop station.");
        strcat(buffer_send, "\n"                  );

//========================================================

        if (
             ! judgement_message_blank(
                                        pointer_recv,
                                        buffer_send
                                      )
           ) { return; }

//========================================================

// SHOW ITSELF

        if (
               ! judgement_message_hello(
                                          that_site,
                                          pointer_recv,
                                          buffer_send
                                        )
            ) { return; }

//========================================================

// WHO IT IS

        if (
               ! judgement_message_who(
                                        that_site,
                                        pointer_recv,
                                        buffer_send
                                      )
           ) { return; }

//========================================================

// Other message just like audio

        control_message_data( that_site, buffer_send );

//========================================================

// Get imformation.

        pointer_recv = strchr(pointer_recv, '\n') + 1;

// Read the information of client.

        char* pointer_next;

        do {

            pointer_next = strstr(pointer_recv, symbol_next);

            if ( pointer_next != NULL ) {

                *pointer_next = '\0';}

            judgement_message_information(
                                           that_site,
                                           pointer_recv,
                                           buffer_send
                                         );

            if ( pointer_next != NULL ) {

               *pointer_next = '\n';

                pointer_recv = pointer_next + strlen(symbol_next);}

        } while ( pointer_next != NULL );

//========================================================

// Read the command of this host.

        control_command(
                         that_site,
                         gop_connection.command[that_site],
                         buffer_send
                       );}}