
void action_connect( const char* that_command ) {


    if ( strstr(that_command, ":") != NULL ) {

//========================================================================
// Reboot client when it was block.

        if (
               strcmp(gop_connection.how[0], ""    ) == 0
        ||     strcmp(gop_connection.how[0], "Wait") == 0
           ) {

            information_flag.client = 0;

            shutdown(gop_connection.descriptor[0], SHUT_RDWR);}

//========================================================================

        strcpy(address_to,                   strchr(that_command, ' ') + 1);
       *strchr(address_to,                   ':') = '\0';
                  port_to                         = atoi(strchr(that_command, ':') + 1);

        strcpy(gop_connection.address_ip[0], strchr(that_command, ' ') + 1);
       *strchr(gop_connection.address_ip[0], ':') = '\0';
               gop_connection.port[0]             = atoi(strchr(that_command, ':') + 1);

        output_print( "string",         "Target "                    );
        output_print( "string",          gop_connection.address_ip[0]);
        output_print( "string",         ":"                          );
        output_print( "int",     (char*)&gop_connection.port[0]      );
        output_print( "string",         "\n...\n"                    );

//========================================================================

        if (
               strcmp(gop_connection.how[0], ""    ) == 0
        ||     strcmp(gop_connection.how[0], "Wait") == 0
           ) {

            usleep( 1000000 * (1 + step_connection) );

            information_flag.client = 1;

            output_print( "string",         "Done.\n"                      );}}}