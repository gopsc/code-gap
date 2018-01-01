
int judgement_message_who(
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
           strstr(pointer_recv, "This is gop station.")
           != pointer_recv
    &&    strstr(pointer_recv, "This is a leaf.")
           !=     pointer_recv
       ) {


        output_print( "string",         "Network "                 );
        output_print( "int"   ,  (char*)&that_site                 );
        output_print( "string",         " with unknown person: \n" );

        output_print( "string",         "\\*"                      );
        output_print( "string",          pointer_recv              );
        output_print( "string",         "\n"                       );
        output_print( "string",         "*\\"                      );


        strcat(buffer_send,    "Who is that?");

        return 0;}

    else {

// This is fine...
// omg..

        return 1;}}
