
void action_else(
                    int   that_site,
                    char* that_command,
                    char* buffer_send
                ) {





    if (
           gop_connection.how[that_site] == "Connectting"
    ||     gop_connection.how[that_site] == "Sop"
       ) {



        strcat(buffer_send, "What's that?");
        printf(
               "NETWORK %d WITN UNKNOWN COMMAND: \n%s\n",
                that_site,
                that_command
              );}}