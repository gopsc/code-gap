



int control_message(

                       int      that_site,
                       char * buffer_recv,
                       char * buffer_send

                   ) {



    char *  pointer_recv  =  buffer_recv;











    if (
               strcmp (  gop_connection.how [ that_site ], "Connectting"  ) == 0
            || strcmp (  gop_connection.how [ that_site ], "Sop"          ) == 0
       ) {


        strcpy( buffer_send, "This is gop station." );
        strcat( buffer_send, "\n" );






        if (

               ! judge_message_blank (  that_site,  pointer_recv,  buffer_send  ) 

           ) {

             return 0; }







        if (

               ! judge_message_hello (  that_site,  pointer_recv,  buffer_send  )

           ) {

            return 0; }







        if (

               ! judge_message_who (  that_site,  pointer_recv,  buffer_send  )

           ) {

            return 0; }






// This is gop station, send information

// we should move it to the data trees

// and no slave any more


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


// we use a complicate symbol to understand two or more piece of message

        strcat ( buffer_send, symbol_next );








// Append th information of the clients

        int i;

        for (  i = 0; i <= 3; i ++  ) {

            if (

                   strcmp ( gop_connection.how [ i ], "Connectted" ) == 0
            ||     strcmp ( gop_connection.how [ i ], "Sopi"       ) == 0

               ) {

                strcat ( buffer_send, "Information of guest.\n" );





// maybe sometimes we could use it again

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

//  we found the hello before, then next line is the beginning of this message

        pointer_recv = strchr ( pointer_recv, '\n' ) + 1;





// Get information of host.

        char * pointer_next;



// for is the complex loop

        do {




// find next symbol
//
// symbol start with a enter type  ( it bring one )
//
// and the end with two of it
//
// so this will be found easier




// get the place of symbol

            pointer_next  = strstr ( pointer_recv, symbol_next );






/*

 if it's the end of the message,

 there won't be a symbol

 if not we read this piece

 we save the path of the symbol

*/

            if (  pointer_next != NULL  ) {

               * pointer_next = '\0';}




// and we read it

            judge_message_command (  that_site,  pointer_recv,  buffer_send  );





// if this is not a end, we return it, and jump over