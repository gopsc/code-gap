
int check_network () {




// Get the time for comparing

    time_t  time_now  =  time ( NULL );





// If it's a new startting
//
//  the time note is zero
//
//  and it make something wrong
//
//  and we fix it

    int i;

    for (  i = 0;  i <= 3; i = i + 1  ) {


        if (  gop_connection.time [ i ]  == 0  ) {

            gop_connection.time [ i ] = time_now;}}









// If connection is available,
//
// check the time of last loop.
//
//
// Restet when it's stop over 9 seconeds
//
// (  it's 3 seconds at the beginning, and we changed it  )
//
// and make sure it's not a new starting


    for (  i = 0; i <= 4; i ++  ) {

// p.s
//
// 4th  is time number and connection descriptor
//
// for connectted to smile






// check the time out
//
// it's different for 4


        if (  i < 4  ) {





// if they doesn't move over 9 secend, and are connecttd
//
// this time could be not conectted
//
// we do something
//
//
// and sometimes the connection does not finish
//
//  we should let it go
//
// and this may be more quick than cleaning all of this


            if (

                      strcmp ( gop_connection.how [ i ], "Wait" )  != 0
                   && strcmp ( gop_connection.how [ i ], ""     )  != 0

               ) {






// if it isn't keep talking
//
//
// 3 seconds for  recive / send  waitting
//
// 9 seconds for doesn't connect






                if  (  time_now - gop_connection.time [ i ]  >=  3  ) {


// check the connection running
//
// this is better to short than connection running, 3 seconds may be ok


// ...

                    if (  gop_connection.connection [ i ]  !=  0  ) {

// it is still  send / recive

                        }}






// if they don't connect

                else if  (  time_now - gop_connection.time [ i ]  >=  9  ) {







// prepare to note his

                    char buffer_note [ 32 ];




// clean all about this 

                    clean_connection ( i, "all" );





// it's two way betwin connector and connectted
//
// to note

                    if (  i == 0  ) {


// print it out

                        output_print ( "string", "connector close with "          );
                        output_print ( "string",  gop_connection.address_ip [ 0 ] );
                        output_print ( "string", "\n"                             );


// save the note

                        strcpy ( that_note,   "connectting close with "        );
                        strcat ( that_note,    gop_connection.address_ip [ 0 ] );


                        note_save ( "connector", that_note, "now" );}




                    else {


// note connectted note
//
// print out

                        output_print( "string", "connectted close with  "    );
                        output_print( "string",  gop_connection.address_ip[i]);
                        output_print( "string", "\n"                         );


// prepare to note

                        strcpy(that_note,    "connectted close with ");
                        strcat(that_note,     gop_connection.address_ip[i]);


                        note_save("connectted", that_note, "now");}}}













// reconnect to the high speed one




// They are high speed board i used
//
//   do not need this for now
//
//  may restart it in the mind of trees plan

/*
        if (
               strcmp ( gop_connection.how [ i ],          "Connectted" ) == 0
        &&     strcmp ( gop_connection.informastion [ i ], ""           ) != 0
           ) {

            char* that_pointer;
            char  that_buffer[1024];
            int   number_cores;
            int   number_frequency;

            strcpy(
                    that_buffer,
                    strstr(
                            strstr( gop_connection.information [ i ], "CPU CORES" ),
                           ":"
                          ) + 1
                  );

           *strchr(that_buffer, '\n') = '\0';

            number_cores = atoi(that_buffer);




            strcpy(
                    that_buffer,
                    strstr(
                            strstr( gop_connection.information [ i ], "CPU FREQUENCY" ),
                           ":"
                          ) + 1
                  );

           *strchr ( that_buffer, '\n' ) = '\0';

            number_frequency = atoi ( that_buffer );




            if (
                              number_cores *             number_frequency
                   > information_cpu.cores * information_cpu.frequency * 2
               ) {




// reconnect for bigger speed

                clean_connection( 0, "all" );



                char    buffer_ip[33];
                strcpy ( buffer_ip, gop_connection.address_ip [ 0 ] );

                for ( int ii=1; ii<=information_ip_number; ii++) {

                    if (  strcmp ( buffer_ip, information_ip [ ii ] [ 2 ] ) == 0  ) {

                         strcpy ( buffer_ip, gop_connection.address_ip[i] );

                        break;}}



                output_print ( "string", "Smile to a big one : " );
                output_print ( "string",  buffer_ip              );
                output_print ( "string", "\n"                    );



                char     buffer_command [ 32 ];
                strcpy ( buffer_command,     "Smile."   );
                strcat ( buffer_command,     "\n"       );
                strcat ( buffer_command,      buffer_ip );


                         gop_connection.time [ 0 ]      = time ( NULL );
                strcpy ( gop_connection.command [ i ],    buffer_command );
                strcpy ( gop_connection.address_ip [ 0 ], gop_connection.address_ip [ i ] );}}
*/


















// if we let it connect some addrees before
//
// we let it come back when it don't connect anymore
//
//
// not for smile this relation

            if (

                     strcmp ( gop_connection.how [ 0 ],       "Wait"     )  == 0

            &&     (

                     strcmp ( gop_connection.address_ip [ 0 ], agop_configurations.ddress_to ) != 0

            ||                gop_connection.port [ 0 ] != gop_configurations.port_to

                   )

                ) {




// if smiled to another, not to reset it.
//
//
// If the target ip in plan
//
// connectting to u
//
//
// it make a loop
//
//  u connectting to it again


                for (  i = 1; i <= 3; i ++  ) {







// if it smiled before
//
// fresh the time note

                    if (

                           strcmp ( gop_connection.address_ip [ i ], gop_configurations.address_to ) == 0

                    &&              gop_connection.port [ i ]  ==  gop_configurations.port_to

                       ) {




// this time we don't reset it
//
// fresh the time..

                        gop_connection.time [ 0 ]  =  time ( NULL );}}







// if the check time of connectting
//
// is in 9 seconds
//
//  & the connector doesn't get the
//
// ip in the plan
//
//    return it


                if (  time_now - gop_connection.time [ 0 ]  >= 9  ) {


                    output_print( "string", "Network connection reset.\n" );


                    strcpy ( gop_connection.address_ip [ 0 ],  gop_configurations.address_to);

                             gop_connection.port       [ 0 ] = gop_configurations.   port_to;}}}














    else if ( i == 4 ) {



// it is for smile  and  can't recive or send
      
        if (
               time_now  -  gop_connection.time [ i ]        >=  9  )

        &&                  gop_connection.connection [ i ]  !=  0

           ) {


// let it go

            }





    return 1;}
