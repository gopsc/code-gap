

bool judgement_message_recived(
                                  int   site,
                                  char* pointer_recv,
                                  char* buffer_send
                              ) {



    if (
           strstr(pointer_recv, "Here.")
           ==     pointer_recv
    or     strstr(pointer_recv, "Recive.")
           ==     pointer_recv
       ) {


        return 1;}

    else {

        strcat(buffer_send, "Who is that now?");

        return 0;}}
