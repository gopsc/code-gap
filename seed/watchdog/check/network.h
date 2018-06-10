
int check_network () {





// this function is to check network going,
//
//   maybe i should put them into the file named network/build.h










// Get the time for comparing

    time_t  time_now  =  time ( NULL );










// if it's a new startting
//
//  the time note zero
//
//
//   so something goes wrong
//
//  and we fix it




    int i;

    for (  i = 0;  i <= 3; i = i + 1  ) {


        if (  gop_connection.time [ i ]  == 0  ) {

            gop_connection.time [ i ] = time_now;}}













// check them  1 by 1

    for (  i = 0; i <= 4; i ++  ) {



// p.s
//
// 4th  is time number and connection descriptor
//
// for connectted to smile









// check the time out
//
//   and reconnect by speed, return the connect not by configuration
//
// if for first 0-3
//
//
//
// and it's different for 4
//
//  it is to note smile things


        if (  i < 4  ) {















// if connection is available,
//
// check the time of last connectting.
//
//
// clean them when it's stop over 9 seconeds
//
// (  it's 3 seconds at the beginning, and we changed it  )
//
//
// and make sure it's not a new starting
//
//
//
//
// if they doesn't move over 9 secend, and are connecttd
//
// this time could be not conectted
//
// we do something
//
//
//
// and sometimes the connection does not finish
//
// and another went away
//
//
//  we should let it go
//
// and this may be more quick than cleaning all of this


            if (

                      strcmp ( gop_connection.how [ i ], "Wait" )  != 0
                   && strcmp ( gop_connection.how [ i ], ""     )  != 0

               ) {


// if it isn't keep talking


















// 3 seconds for  recive / send  waitting
//
// 9 seconds for doesn't connect





                if  (

                        time_now - gop_connection.time [ i ]  >=  3
                &&      time_now - gop_connection.time [ i ]  <   9

                    ) {





// check
//
// is the connection still running but another not ?
//
//
// this is better to short than connection running, 3 seconds may be ok



                    if (  gop_connection.connection [ i ]  !=  0  ) {

// it is still  send / recive
//
// ...
                        }}















// if they are not connectted any more
//
// we should clean them


                else if  (  time_now - gop_connection.time [ i ]  >=  9  ) {







// prepare to note this

                    char buffer_note [ 32 ];






// clean all about this

                    clean_connection ( i, "all" );





// it's two way betwin   connector and connectted
//
// to note
//
//
//
// and this is connector's

                    if (  i == 0  ) {


// print it out

                        output_print ( "string", "connector close with "          );
                        output_print ( "string",  gop_connection.address_ip [ 0 ] );
                        output_print ( "string", "\n"                             );


// save the note

                        strcpy ( that_note,   "connectting close with "        );
                        strcat ( that_note,    gop_connection.address_ip [ 0 ] );


                        note_save ( "connector", that_note, "now" );}








// the way for connecteed

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

// save it

                        note_save("connectted", that_note, "now");}}}













// reconnect to the high speed one
//
//
// this is good
//
// cause connectted by several
//
//  make this slow
//
//  the highspeed to do this, make them connect stable
//
// make them faster, make it good
//
//
// faster be faster
//
//
//
//
// and
//
// They are high speed board i used
//
//   do not need this for now
//
//  may restart it in the mind of trees plan
//
//
//  maybe now



        if (

               strcmp ( gop_connection.how [ i ],          "Connectted" )  == 0

        &&     strcmp ( gop_connection.informastion [ i ], ""           )  != 0

           ) {




// since i used information trees i used them straightly
//
// instead of read the information here



/*
            char *  that_pointer;

            char    that_buffer [ 1024 ];


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

*/







// compare them
//
//
// at the beginning, we let them change site
//
// when quicker is quicker more than 2 times
//
//  but now we let it quicker more any one little

            if (

                     gop_network.about.cpu.cores  *  gop_network.about.cpu.frequency

                   >         gop_about.cpu.cores  *          gop_about.cpu.frequency

               ) {




// reconnect for bigger speed

                clean_connection( 0, "all" );





// if we connect to ourself in the configuration
//
// we dont let it connect to us again
//
// then we are going to connect them
//
// make a loop
//
//
// so we let it connect itself





                char    buffer_ip [ 32 ];

// by default, we want it connect to what we connect

                strcpy (  buffer_ip, gop_connection.address_ip [ 0 ]  );







// compare it with address here
//
// if it is a address here, we change the plan
//
// and let it connect to itself


                int ii;

                for (  ii = 1; ii <= information_ip_number; ii ++  ) {


                    if (  strcmp ( buffer_ip, information_ip [ ii ] [ 2 ] ) == 0  ) {



// the connector connect  our address, don't send it
//
// send the address itself

                         strcpy ( buffer_ip, gop_connection.address_ip[i] );

                        break;}}





// prepare the message

                output_print ( "string", "smile to bigger : " );
                output_print ( "string",  buffer_ip              );
                output_print ( "string", "\n"                    );



                char     buffer_command [ 32 ];

                strcpy ( buffer_command,     "Smile."   );
                strcat ( buffer_command,     "\n"       );
                strcat ( buffer_command,      buffer_ip );

// and the port
// ...


// why we fresh the time note

                         gop_connection.time       [ 0 ]      = time ( NULL );


// load the message we will send

                strcpy ( gop_connection.command    [ i ], buffer_command                  );



// connect to this bigger

                strcpy ( gop_connection.address_ip [ 0 ], gop_connection.address_ip [ i ] );}}



















// if we let it connect some addrees
//
// by some way without configuration before
//
//
// this usually be a special thing
//
// we let it come back when it don't connect it anymore
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
