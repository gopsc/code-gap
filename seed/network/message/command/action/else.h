
int action_else(
                   int   that_site,
                   char* that_command,
                   char* buffer_send
               ) {

    if (
           strcmp(gop_connection.how[that_site], "Connectted") == 0
    ||     strcmp(gop_connection.how[that_site], "Sopi"      ) == 0
       ) {

        strcat(buffer_send, "What's that now?");

        return 1;}


    else if (
                strcmp(gop_connection.how[that_site], "Connectting") == 0
         ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {


        if (
               strcmp(that_command, "Here.") == 0
        &&            that_site              == 0
           ) {

            if ( strcmp(gop_connection.command[that_site], ""     ) == 0 ) {

                 strcpy(gop_connection.command[that_site], "Sopi.");}}

        else {

            output_print( "string",         "Network "                    );
            output_print( "int"   , (char*)&that_site                     );
            output_print( "string",         " got a unknow command: \n\"" );
            output_print( "string",          that_command                 );
            output_print( "string",         "\"\n"                        );}


        strcat      (buffer_send, "What's that?"                  );

        return 1;}


    return 0;}
