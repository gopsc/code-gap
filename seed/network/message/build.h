



int control_message(
                       int   that_site,
                       char* buffer_recv,
                       char* buffer_send
                   ) {



    char* pointer_recv = buffer_recv;











    if (
               strcmp ( gop_connection.how [ that_site ], "Connectting" ) == 0
            || strcmp ( gop_connection.how [ that_site ], "Sop"         ) == 0
       ) {


        strcpy( buffer_send, "This is gop station." );
        strcat( buffer_send, "\n" );






        if (
             ! judge_message_blank (
                                     that_site,
                                     pointer_recv,
                                     buffer_send
                                   )
           ) { return 0; }







        if (
               ! judge_message_hello (
                                       that_site,
                                       pointer_recv,
                                       buffer_send
                                     )
           ) { return 0; }







        if (
               ! judge_message_who (
                                     that_site,
                                     pointer_recv,
                                     buffer_send
                                   )
           ) { return 0; }






// This is gop station, send information

        strcat ( buffer_send, "Information of host.\n" );

// this is old code now
/*
        information_append (
                             buffer_send,
                             information_system,
                             information_network,
                             information_cpu,
                             information_memory,
                             information_disk,
                             information_sound,
                             information_flag
                           );
*/

        information_append (
                             buffer_send,
                             gop_about
                           )


// we use a complicate symbol to understand two piece of message

        strcat ( buffer_send, symbol_next );



// Append th information of the clients

        int i;

        for (  i = 0; i <= 3; i ++  ) {

            if (

                   strcmp( gop_connection.how [ i ], "Connectted" ) == 0
            ||     strcmp( gop_connection.how [ i ], "Sopi"       ) == 0

               ) {

                strcat(buffer_send, "Information of guest.\n"    );



// maybe sometimes we could use it again
//
// whatever, this is a big-disk time
/*
                information_append (
                                     buffer_send,
                                     gop_connection.system  [ i ],
                                     gop_connection.network [ i ],
                                     gop_connection.cpu     [ i ],
                                     gop_connection.memory  [ i ],
                                     gop_connection.disk    [ i ],
                                     gop_connection.sound   [ i ],
                                     gop_connection.flag    [ i ]
                                   );
*/

                information_append (
                                     buffer_send,
                                     gop_network.about [ i ]
                                   );


                strcat ( buffer_send, symbol_next );}}





// This is gop station,
// (command)
// ...
// (end)
// ...


// the start path
//
//  we found the hello before, then next line is the beginning of this message

        pointer_recv = strchr ( pointer_recv, '\n' ) + 1;





// Get information of host.

        char* pointer_next;

        do {

// find next symbol
//
// symbol start with a enter type
//
// and the end with two of it
//
// so this will be found easier


// get the place of symbol

            pointer_next  = strstr ( pointer_recv, symbol_next );


// if it's the end of the message,
//
// there won't be a symbol
//
// if not we read this piece
//
// we save the path of the symbol

            if (  pointer_next != NULL  ) {

               * pointer_next = '\0';}



// and we read it

            judge_message_command (
                                       that_site,
                                    pointer_recv,
                                     buffer_send
                                  );



// if this is not a end, we return it, and jump over this symbol

            if (  pointer_next != NULL  ) {

              * pointer_next = '\n';

                pointer_recv = pointer_next + strlen(symbol_next);}



// and if this range we found the end, we exit

          } while (  pointer_next != NULL  );






// sometimes we could not found a known message, we add recive here

        if (  buffer_send [ strlen ( buffer_send ) - 1 ]  == '\n'  ) {

            strcat ( buffer_send, "Who is that?" );}

        return 1;}

















// i want let this be dissapear, very single connector and connectted use the same command


    else if (

                strcmp ( gop_connection.how [ that_site ], "Connectted" )
                == 0

    ||          strcmp ( gop_connection.how [ that_site ], "Sopi"       )
                == 0

            ) {


        strcpy ( buffer_send, "This is gop station." );
        strcat ( buffer_send, "\n"                   );










        if (
             ! judge_message_blank (
                                        that_site,
                                     pointer_recv,
                                      buffer_send
                                   )
           ) { return 0; }





// SHOW ITSELF

        if (
               ! judge_message_hello (
                                          that_site,
                                       pointer_recv,
                                        buffer_send
                                     )
            ) { return 0; }




// WHO IT IS

        if (
               ! judge_message_who (
                                        that_site,
                                     pointer_recv,
                                      buffer_send
                                   )
           ) { return 0; }













// Other message just like audio

        control_message_data ( that_site, buffer_send );










// Get imformation.

        pointer_recv = strchr ( pointer_recv, '\n' ) + 1;




// Read the information of client.



// we don't let the buffer of next one
//
// to save this message, we let the buffer of recive to do this

        char * pointer_next;




// we won't know how long it was and we judge it every time

        do {


// find the place the next symbol

            pointer_next = strstr ( pointer_recv, symbol_next );




// we just read this line and we just move is be a end signal
//
// and we don't change this buffer of path, so we could return it later
//
// if it's not the last one, we do this and change the buffer of path later

            if (  pointer_next != NULL  ) {

               * pointer_next = '\0';}


// judge it

            judge_message_information(
                                          that_site,
                                       pointer_recv,
                                        buffer_send
                                     );



// ok we return it
//
// and jump over the symbol
//
// if it's not the last one

            if (  pointer_next != NULL  ) {

              * pointer_next = '\n';

                pointer_recv = pointer_next + strlen ( symbol_next );}




// if this is not the last one we start again

        } while (  pointer_next != NULL  );











// Read the command of this host.

        if (
               strcmp ( gop_connection.how[that_site], "Connectted" ) == 0
        ||     strcmp ( gop_connection.how[that_site], "Sopi"       ) == 0
           ) {


// the action we do
//
// and the message we send
//
// will do at one time

            judge_message_command (
                                        that_site,
                                         gop_connection.command [ that_site ],
                                      buffer_send
                                  );}}







// if we don't send any action
//
// we append a normal return here

        if (  buffer_send [ strlen ( buffer_send ) - 1 ]  == '\n'  ) {

            strcat(buffer_send, "Who is that?");}




// ok we've done this

    return 1;}
