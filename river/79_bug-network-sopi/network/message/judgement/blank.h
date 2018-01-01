

int judgement_message_blank(
                                char* pointer_recv,
                                char* buffer_send
                           ) {



    if (
           strcmp(pointer_recv, "")
           != 0
       ) {

        return 1;}

    else {

        strcat(buffer_send, "Who is that?");

        return 0;}}
