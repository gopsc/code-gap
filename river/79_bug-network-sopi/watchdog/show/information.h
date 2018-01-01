
int dog_show() {

    if ( information_flag.show == 1 ) {

        char buffer_information[2049];

        information_append(
                            buffer_information,
                            information_system,
                            information_network,
                            information_cpu,
                            information_memory,
                            information_disk,
                            information_sound,
                            information_flag
                          );

        system( "clear" );

        output_print( "string", buffer_information );
        output_print( "string", "\n\n"             );


        int i;
        for ( i = 0; i <= 3; i++ ) {

            if (
                   strcmp( gop_connection.how[i], "Connectted" ) == 0 
            ||     strcmp( gop_connection.how[i], "Sopi"       ) == 0 
               ) {

                strcpy(buffer_information, "");

                information_append(
                                    buffer_information       ,
                                    gop_connection.system [i],
                                    gop_connection.network[i],
                                    gop_connection.cpu    [i],
                                    gop_connection.memory [i],
                                    gop_connection.disk   [i],
                                    gop_connection.sound  [i],
                                    gop_connection.flag   [i]
                                  );
                output_print( "string", buffer_information );
                output_print( "string", "\n\n"             );}}}

    return 1;}
