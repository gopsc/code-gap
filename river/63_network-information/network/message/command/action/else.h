
void action_else(
                    int   that_site,
                    char* that_command,
                    char* buffer_send
                ) {





    if (
           gop_connection.how[that_site] == "Connectting"
    ||     gop_connection.how[that_site] == "Sop"
       ) {



        strcat      (buffer_send, "What's that?"             );

        output_print( "string",        "Network "                 );
        output_print( "int",    (char*)&that_site                 );
        output_print( "string",        "got a unknow command: \n" );
        output_print( "string",         that_command              );
        output_print( "string",        "\n"                       );}}