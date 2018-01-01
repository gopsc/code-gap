
int action_else(

                   int     that_site,
                   char*   that_command,
                   char* buffer_send

               ) {


    if (
           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
       ) {


        if ( strstr(that_command, "Information of ") == that_command ) {

// omg the note lost..
//
// Sometims when the connection close
// after the gopi happened
//
// when they connect back
// they got a mess
//
// because the sopi or sop
// still think they are jut like before
// So we should let the Connectted device
// get back their control again




            if (

                   strcmp(gop_connection.command[that_site], ""    ) == 0
            &&     strcmp(gop_connection.how    [that_site], "Sop" ) == 0

               ) {

// This is the Connectted device,
// and it still saved as Sop



                 output_print("string",      "Get sopi back.\n");

                 clean_connection(that_site, "sopi"            );}



            return 0;}



        else if ( strcmp(that_command, "Here." ) == 0 ) {

            return 0;}

        else {


            output_print( "string",         "Network "                );
            output_print( "int"   ,  (char*)&that_site                );
            output_print( "string",         " dose not understand : " );
            output_print( "string",         "\n"                      );
            output_print( "string",         "*\n"                     );
            output_print( "string",          that_command             );
            output_print( "string",         "\n"                      );
            output_print( "string",         "*\n"                     );}


        return 0;}


    return 1;}
