
void check_network() {


    time_t time_now = time(NULL);




    for (int i=0; i<=3; i=i+1) {

        if ( gop_connection.time[i] == 0 ) {

            gop_connection.time[i] = time_now;}}



// If connection is available,
// check the time of last loop.
// Restet when it's stop over 3 seconeds

    if (
           time_now - gop_connection.time[0]       >= 3
    &&    (
               strcmp(gop_connection.how[0], "Wait")   != 0
            && strcmp(gop_connection.how[0], ""    )   != 0
          )
       ) {

        clean_connection( 0, "all" );

        output_print( "string", "Client close with "          );
        output_print( "string",  gop_connection.address_ip[0] );
        output_print( "string", "\n"                          );

        char   that_note[33];
        strcpy(that_note,   "Connectting close with ");
        strcat(that_note,    gop_connection.address_ip[0]);
        note_save("client", that_note, "now");}

//-----------------------------------------------------------------------------------------

    for ( int i = 1; i <= 3; i++ ) {

        if (
              (time_now - gop_connection.time[i] >= 3)
        &&    (
                  strcmp(gop_connection.how[i], "Wait") != 0
               && strcmp(gop_connection.how[i], ""    ) != 0
              )
           ) {

            output_print( "string", "Server close with  "        );
            output_print( "string",  gop_connection.address_ip[i]);
            output_print( "string", "\n"                         );

            clean_connection(i,"all");

            char   that_note[33];
            strcpy(that_note,    "Client close with ");
            strcat(that_note,     gop_connection.address_ip[i]);

            note_save("server", that_note, "now");}


//-----------------------------------------------------------------------------------------

        if (
               strcmp(gop_connection.how[i],         "Connectted") == 0
        &&     strcmp(gop_connection.information[i], ""          ) != 0
           ) {

            char* that_pointer;
            char  that_buffer[1024];
            int   number_cores;
            int   number_frequency;

            strcpy(
                    that_buffer,
                    strstr(
                            strstr( gop_connection.information[i], "CPU CORES" ),
                           ":"
                          )+1
                  );

           *strchr(that_buffer, '\n') = '\0';

            number_cores = atoi(that_buffer);




            strcpy(
                    that_buffer,
                    strstr(
                            strstr( gop_connection.information[i], "CPU FREQUENCY" ),
                           ":"
                          )+1
                  );

           *strchr(that_buffer, '\n') = '\0';

            number_frequency = atoi(that_buffer);




            if (
                              number_cores *             number_frequency
                   > information_cpu.cores * information_cpu.frequency * 2
               ) {




// reconnect for bigger speed

                clean_connection( 0, "all" );



                char   buffer_ip[33];
                strcpy(buffer_ip, gop_connection.address_ip[0]);

                for ( int ii=1; ii<=information_ip_number; ii++) {

                    if ( strcmp(buffer_ip, information_ip[ii][2]) == 0) {

                         strcpy(buffer_ip, gop_connection.address_ip[i]);

                        break;}}



                output_print( "string", "Smile to a big one : " );
                output_print( "string",  buffer_ip              );
                output_print( "string", "\n"                    );



                char   buffer_command[33];
                strcpy(buffer_command,     "Smile."   );
                strcat(buffer_command,     "\n"       );
                strcat(buffer_command,      buffer_ip );


                       gop_connection.time[0]      = time(NULL);
                strcpy(gop_connection.command[i],    buffer_command);
                strcpy(gop_connection.address_ip[0], gop_connection.address_ip[i]);}}

//------------------------------------------------------------------------------------

        if (
               strcmp(gop_connection.how[0],       "Wait"     ) == 0
        &&    (strcmp(gop_connection.address_ip[0], address_to) != 0
        ||            gop_connection.port[0]                    != port_to)
           ) {


// If smiled to another, do not reset it.

            for ( int i = 1; i <= 3; i++ ) {


                if (
                       strcmp(gop_connection.address_ip[i], address_to) == 0
                &&            gop_connection.port[0]                    == port_to
                   ) {


                    gop_connection.time[0] = time(NULL);}}



            if ( time_now - gop_connection.time[0] >= 5 ) {

                output_print( "string", "Net connection reset.\n" );

                strcpy(gop_connection.address_ip[0], address_to);
                       gop_connection.port[0]      = port_to;}}}}
