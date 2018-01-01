



int action_smile (

                      int     that_site,
                      char*   that_command,
                      char* buffer_send

                 ) {



    if (

           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0

       ) {




        output_print( "string", "Smile from  "                        );
        output_print( "string",  gop_connection.address_ip[that_site] );
        output_print( "string", "\n"                                  );


        that_command = strchr(that_command, '\n') + 1;


        strcpy(gop_connection.address_ip[0], that_command);
        strcat(buffer_send,                 "Recive."    );


        return 1;}




    else {


        return 0;}}


