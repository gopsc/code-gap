

bool judgement_message_blank(
                                 int   site,
                                 char* pointer_recv,
                                 char* buffer_send
                             ) {



    if (
           strcmp(pointer_recv, "")
           != 0
       ) {

        return 1;}

    else {

        strcat(buffer_send, "Who is that now?");

        return 0;}}
