
int judge_message_hello(

                           int   that_site,
                           char* pointer_recv,
                           char* buffer_send

                       ) {

// This is gop station
// Who is that now?

// This is gop station
// ------
// ...
// ------
// Here




    if (

              strstr(pointer_recv, "This is ") == pointer_recv
           && strstr(pointer_recv, "\n")       != NULL

       ) {

// This is fine...
// omg...

        return 1;}




    else {

        output_print( "string",        "Network with no smile " );
        output_print( "int"   , (char*)&that_site               );
        output_print( "string",        ": \n"                   );

        output_print( "string",        "\\*"                    );
        output_print( "string",         pointer_recv            );
        output_print( "string",        "\n"                     );
        output_print( "string",        "*\\"                    );

        strcat(buffer_send,    "Who is that?");

        return 0;}}

