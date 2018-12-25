
void command_else(
                     int   site,
                     char* that_command,
                     char* buffer_send
                 ) {





    if (
           gop_connection.how[site] == "Connectting"
    or     gop_connection.how[site] == "Sop"
       ) {



        strcat(buffer_send, "What's that?");
        printf(
               "NETWORK %d WITN UNKNOWN COMMAND: \n%s\n",
                site,
                that_command
              );}}