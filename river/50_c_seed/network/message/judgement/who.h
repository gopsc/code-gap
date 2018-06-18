
int judgement_message_who(
                             int   site,
                             char* pointer_recv,
                             char* buffer_send
                         ) {

    if (
           strstr(pointer_recv, "This is gop station.")
           != pointer_recv
    &&    strstr(pointer_recv, "This is a leaf.")
           !=     pointer_recv
       ) {

        printf(
                "NETWORK %d WITH UNKNOWN PERSON: \n%s\n",
                 site,
                 pointer_recv
              );
        strcat(buffer_send,    "Who is that now?");

        return 0;}

    else {

        return 1;}}
