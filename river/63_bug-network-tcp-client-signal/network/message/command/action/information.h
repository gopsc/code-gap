
void action_information() {

    char   buffer_information[2049];
    strcpy(buffer_information, "");

    system("clear");

    information_append(
                        buffer_information,
                        information_system,
                        information_network,
                        information_cpu,
                        information_memory,
                        information_disk,
                        information_sound
                      );


    output_print("string", "------------------------------\n" );
    output_print("string",  buffer_information                );
    output_print("string", "\n"                               );
    output_print("string", "------------------------------\n" );


    for (
            int i=0;
                i<4;
                i++
        ) {

        if (
               strcmp( gop_connection.how[i], "Connectted" ) == 0 
        ||     strcmp( gop_connection.how[i], "Sopi"       ) == 0 
           ) {

            strcpy(buffer_information, "");

            information_append(
                                buffer_information,
                                gop_connection.system [i],
                                gop_connection.network[i],
                                gop_connection.cpu    [i],
                                gop_connection.memory [i],
                                gop_connection.disk   [i],
                                gop_connection.sound  [i]
                              );
            output_print( "string", buffer_information                 );
            output_print( "string", "------------------------------\n" );}}

    return;}
