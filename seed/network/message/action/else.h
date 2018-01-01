
int action_else(

                   int     that_site,
                   char*   that_command,
                   char* buffer_send

               ) {




    if (

           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0

       ) {

// For Sop, the words
//  is command,
//
// for sopi, it's judgement




        if ( strstr(that_command, "Information of ") == that_command ) {

// Sometimes, when a sop disconnectted,
//
//  but reconnectted in the round time
//
//  the Sopi Still think it's sopi,
//
//
// Another way,
//  the sopi
//  break, & return
//  soon
// The Sop
// still think
// it's sop
// but the connectter does not






            if (

                   strcmp(gop_connection.how    [that_site], "Sop" ) == 0
            &&     strcmp(gop_connection.command[that_site], ""    ) == 0

               ) {

// When the sop meet this situation,
//  get the sopi back.






                 output_print("string",      "Get sopi back.\n");

                 clean_connection(that_site, "sopi"            );


                 return 1;}



// If this is not a server
// do not do anything

            return 1;}






        else if ( strcmp(that_command, "Here." ) == 0 ) {

// Sometimes the sop device
//
//     found the sopi
// think it's a  sop
// and this is a good staff
// whatever
//
// In the way,
//    the the truth sopi still keep it
//
// By the way,
//    when the sopi changing
// is running,
//
//  something happened,
//  they got a little mess
//
//  there's 1 or 2 pieces of message
//
// 'the sopi' still think it's sop
//  This happened.
//
//   and dose not know why
//   and sopi still finished




            return 0;}







        else {

// It's not "Information of ..."
//      nor "Here"



            output_print( "string",         "Network "                    );
            output_print( "int"   ,  (char*)&that_site                    );
            output_print( "string",         " dose not understand : \n"   );

            output_print( "string",         "\\*"                         );
            output_print( "string",          that_command                 );
            output_print( "string",         "\n"                          );
            output_print( "string",         "*\\"                         );}






        return 0;}



// If it's not a user used
//    this function
// there must be a mistake


    return 0;}
