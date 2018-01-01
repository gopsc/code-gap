

int judgement_message_blank(

                                int   that_site,
                                char* pointer_recv,
                                char* buffer_send

                           ) {



    if (
           strcmp(pointer_recv, "")
           != 0
       ) {

// omg that's fine,,,

        return 1;}



    else {

// It print every new cnonecting
/*
        output_print("string", "Network "              );
        output_print("int",    (char*)&that_site       );
        output_print("string", " Got a blank message\n");
*/
        strcat(buffer_send, "Who is that?");

        return 0;}}
