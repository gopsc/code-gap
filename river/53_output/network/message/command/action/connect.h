
void action_connect( const char* that_command ) {


    if ( strstr(that_command, ":") != NULL ) {


        strcpy(gop_connection.address_ip[0], strchr(that_command, ' ') + 1);
       *strchr(gop_connection.address_ip[0], ':') = '\0';
        gop_connection.port[0] = atoi(strchr(that_command, ':') + 1);


        flag_client               = 1;

        output_print( "string",         "Connect to "                );
        output_print( "string",          gop_connection.address_ip[0]);
        output_print( "string",         ":"                          );
        output_print( "int",     (char*)&gop_connection.port[0]      );
        output_print( "string",         "\n"                         );}}