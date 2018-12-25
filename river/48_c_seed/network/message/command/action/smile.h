
void action_smile (
                      int   site,
                      char* that_command,
                      char* buffer_send
                  ) {



    if (
           strcmp(gop_connection.how[site], "Connectting") == 0
    ||     strcmp(gop_connection.how[site], "Sop"        ) == 0
       ) {



        printf(
               "SMILE FROM  %s\n",
                gop_connection.address_ip[site]
              );

        that_command = strchr(that_command, '\n') + 1;
        strcpy(gop_connection.address_ip[0], that_command);

        strcat(buffer_send, "Recive.");}}