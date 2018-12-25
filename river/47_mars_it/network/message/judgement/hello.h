
bool judgement_message_hello(
                                int   site,
                                char* pointer_recv,
                                char* buffer_send
                            ) {




    if (
              strstr(pointer_recv, "This is ") != pointer_recv
           or strstr(pointer_recv, "\n")       == NULL
       ) {

        printf(
               "NETWORK WITH NO SMILE %d: \n%s\n",
                site,
                pointer_recv
              );

        strcat(buffer_send,    "Who is that now?");

        return 0;}

    else {

        return 1;}}

