



int action_connect(

                      const char * that_command

                  ) {






    if (  strstr ( that_command, ":" )  !=  NULL  ) {



// Reboot client when it was block.
//
// the dog will do this
/*
        if (

               strcmp ( gop_connection.how [ 0 ], ""    )  ==  0
        ||     strcmp ( gop_connection.how [ 0 ], "Wait")  ==  0

           ) {


            information_flag.connector = 0;

            shutdown(gop_connection.descriptor[0], SHUT_RDWR);}
*/


// load the address

        strcpy ( address_to,                   strchr ( that_command, ' ' ) + 1  );
       *strchr ( address_to,                   ':') = '\0';
                    port_to                         = atoi ( strchr ( that_command, ':' ) + 1  );


// laod the port

        strcpy ( gop_connection.address_ip [ 0 ], strchr ( that_command, ' ' ) + 1  );
       *strchr ( gop_connection.address_ip [ 0 ], ':' ) = '\0';
                 gop_connection.port [ 0 ]              = atoi ( strchr ( that_command, ':' ) + 1  );



        output_print( "string",              "Target "                       );
        output_print( "string",              gop_connection.address_ip [ 0 ] );
        output_print( "string",              ":"                             );
        output_print( "int",     (char * ) & gop_connection.port[0]          );
        output_print( "string",              "\n...\n"                       );




/*
        if (

               strcmp ( gop_connection.how [ 0 ], ""     )  ==  0
        ||     strcmp ( gop_connection.how [ 0 ], "Wait" )  ==  0

           ) {


//            usleep(  1000000  *  ( 1 + step_connection ) );
*/


        information_flag.connector = 1;

        output_print( "string",         "Done.\n" );


//            }



// return

        return 1;}




// the type was mistake
//
// but
//
// this still happen when a wrong address:port happend



    output_print ( "string", " please type 'Connect address:port'\n" );

    return 0;}
