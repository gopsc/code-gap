
int action_else(
                   int     that_site,
                   char*   that_command,
                   char* buffer_send
               ) {


    if (
           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
       ) {


        if ( strstr(that_command, "Information of host.") == that_command ) {

            if (
                   strcmp(gop_connection.command[that_site], ""     ) == 0
            &&     that_site                                          != 0
               ) {

                 output_print("string",      "Get sopi back.\n");

                 clean_connection(that_site, "sopi"            );}

            return 0;}

        else if ( strcmp(that_command, "Here." ) == 0 ) {

            return 0;}

        else {


            output_print( "string",         "Network "                    );
            output_print( "int"   ,  (char*)&that_site                    );
            output_print( "string",         " dose not understand : \n\"" );
            output_print( "string",          that_command                 );
            output_print( "string",         "\"\n"                        );}


        return 0;}


    return 1;}
