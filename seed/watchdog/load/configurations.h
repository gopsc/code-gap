



int load_configurations () {





// we start this load, and it will print in the output manage

    output_print ( "string", "Load configurations...\n" );







/*

 Prepare the values,

         the start path used is certaintly

*/

    char buffer_path     [ 128 ];






/*

 for saving files
 and saving configurations

 soon use realloc

*/

    char   that_file     [ 1024 ];
    char buffer_file     [ 1024 ];

    char target_configurations [ 21 ] [ 128 ];
    char result_configurations [ 21 ] [ 128 ];








/*

 If ur running a server or client program

 and you wanna change the target ip

 you mast close it first,

 then turn it up again

*/


//    int bool_reset = 0;






/*

 Check path.

 Get the user
    only root can access /opt/TxL

 the information not get at this time

*/

    commandline_get ( "whoami", that_file );






// The mode of deamon

    if    (  number_args > 1  ) {


// deamon program usually is run by root

        if    (

                  strcmp ( buffer_args [ 1 ], "deamon" ) == 0

        &&        strcmp ( that_file,         "root\n" ) == 0

              ) {





// If it's deamon mode, load the configuration file

            strcpy ( buffer_path, "/opt/TxL/sky/configurations/TxL/configurations_deamon" );





// If the deamon configuration is not found, load the common configuration file

            if    (  ! is_file ( buffer_path )  ) {


                strcpy ( buffer_path, "/opt/TxL/seed/configurations" );}}}







/*

 The mode of terminal
  of root

*/

    else if   (  strcmp ( that_file, "root\n" ) == 0  ) {




// be ready to get the common configuration file

        strcpy ( buffer_path, "/opt/TxL/seed/configurations" );





// if it's not found, try the dirent where you are

        if    (  ! is_file ( buffer_path )  ) {



            strcpy ( buffer_path, "seed/configurations" );}}








// The mode of terminal
//  of no root

    else if   (  strcmp ( that_file, "root\n" ) != 0  ){





// if it is not the root user, try to load the no-root configuration

        strcpy ( buffer_path, "/opt/TxL/sky/configurations/TxL/configurations_no-root" );





// if it's not found, try the dirent where you are

        if (  ! is_file ( buffer_path )  ) {

            strcpy ( buffer_path, "sky/configurations/TxL/configurations_no-root" );}}





/*

 There's still no configuration file
   ask the user

*/

    while (  ! is_file ( buffer_path )  ) {

        output_print ( "string", "\nCan't find the configuration file. :(\n" );
        output_print ( "string", " type a new path:"                         );

        fgets ( buffer_path,128, stdin );

        output_print ( "string", " u typed:        " );
        output_print ( "string", buffer_path         );
        output_print ( "string", "\n"                );



// it always take a '\n' at the end

        if (  strchr ( buffer_path, '\n' ) != NULL  ) {

            * strchr ( buffer_path, '\n' )  = '\0';}}




/*

 print the file path for test

 use this in text

*/

//    printf("%s\n", buffer_path);














// Get the file

    file_get ( buffer_path, that_file );









/*

 sometimes it maybe a empty file
 but the watchdog will keep running




 if it's not a empty file

 it will be read

 don't worry

*/






/*

 we don't need to reboot it

  because we could check it straightly

 by dog

*/





/*

// Reboot client when it was block.

    if (

         information_flag.connector
    &&

       (
           strcmp ( gop_connection.how [ 0 ], ""    ) == 0
    ||     strcmp ( gop_connection.how [ 0 ], "Wait") == 0
       )

       ) {

        bool_reset              = 1;

        information_flag.connector = 0;


        shutdown ( gop_connection.descriptor [ 0 ], SHUT_RDWR );}




// Reboot server when it was block.

    if (

         information_flag.connectted
    &&

       (

       (
            strcmp ( gop_connection.how [ 1 ], ""     ) == 0
         || strcmp ( gop_connection.how [ 1 ], "Wait" ) == 0
       )

    &&

       (

       (
            strcmp ( gop_connection.how [ 2 ], ""     ) == 0
         || strcmp ( gop_connection.how [ 2 ], "Wait" ) == 0
       )

    &&

       (
            strcmp ( gop_connection.how [ 3 ], ""     ) == 0
         || strcmp ( gop_connection.how [ 3 ], "Wait" ) == 0
       )

       )

       )

       ) {

        bool_reset              = 1;

        information_flag.connectted = 0;

        shutdown ( gop_connection.descriptor [ 1 ], SHUT_RDWR );


        int i;

        for ( i = 1; i < 4; i++ ) {

            if (

                   gop_connection.connection [ i ] != 0
            ||     gop_connection.connection [ i ] != -1

               ) {

                shutdown ( gop_connection.connection[i], SHUT_RDWR );}}}





//================================================================






    if ( information_flag.sound ) {

        bool_reset              = 1;

        information_flag.sound  = 0;}




//================================================================




    if ( information_flag.sound_show ) {

        information_flag.sound_show = 0;}

//================================================================

    if ( information_flag.sound_save ) {

        information_flag.sound_save = 0;}

//================================================================










// the time to reset

    if ( bool_reset ) {

        output_print( "string"                       , "Reset...");

        usleep      ( 1000000 );}

*/







    strcpy ( target_configurations [ 1  ], "path "           );
    strcpy ( target_configurations [ 2  ], "name "           );
    strcpy ( target_configurations [ 3  ], "data "           );
    strcpy ( target_configurations [ 4  ], "backup "         );

    strcpy ( target_configurations [ 5  ], "main "           );
    strcpy ( target_configurations [ 6  ], "dog "            );
    strcpy ( target_configurations [ 7  ], "show "           );
    strcpy ( target_configurations [ 8  ], "connector "      );
    strcpy ( target_configurations [ 9  ], "connectted "     );
    strcpy ( target_configurations [ 10 ], "sound "          );
    strcpy ( target_configurations [ 11 ], "sound-show "     );
    strcpy ( target_configurations [ 12 ], "sound-save "     );

    strcpy ( target_configurations [ 13 ], "address-to "     );
    strcpy ( target_configurations [ 14 ], "port-to "        );
    strcpy ( target_configurations [ 15 ], "port-this "      );
    strcpy ( target_configurations [ 16 ], "connect-step "   );
    strcpy ( target_configurations [ 17 ], "update-size "    );

    strcpy ( target_configurations [ 18 ], "sound-rate "     );
    strcpy ( target_configurations [ 19 ], "sound-channels " );
    strcpy ( target_configurations [ 20 ], "ft-N "           );










// start the researching



    int i;

    for (  i = 1; i <= 20; i ++  ) {




// find the name of configurations in the file


        if (  strstr  (  that_file, target_configurations [ i ] )  !=  NULL  ) {




/*

 we could use a pointer

 read this line

 and return the /0

*/

            strcpy( buffer_file,  strstr ( that_file, target_configurations [ i ] ) );


           *strchr( buffer_file,  '\n' ) = '\0';

            strcpy( buffer_file,  strrchr(buffer_file, ' ') +1 );


            strcpy( result_configurations [ i ], buffer_file );}}






    strcpy ( gop_configurations . path_the,    result_configurations [ 1 ] );
    strcpy ( gop_configurations . name_the,    result_configurations [ 2 ] );
    strcpy ( gop_configurations . name_data,   result_configurations [ 3 ] );
    strcpy ( gop_configurations . name_backup, result_configurations [ 4 ] );


    if (  strcmp ( result_configurations [ 5  ], "on") == 0  ) { gop_about . flag . main       = 1;}  else { gop_about . flag . main       = 0;}
    if (  strcmp ( result_configurations [ 6  ], "on") == 0  ) { gop_about . flag . dog        = 1;}  else { gop_about . flag . dog        = 0;}
    if (  strcmp ( result_configurations [ 7  ], "on") == 0  ) { gop_about . flag . show       = 1;}  else { gop_about . flag . show       = 0;}
    if (  strcmp ( result_configurations [ 8  ], "on") == 0  ) { gop_about . flag . connector  = 1;}  else { gop_about . flag . connector  = 0;}
    if (  strcmp ( result_configurations [ 9  ], "on") == 0  ) { gop_about . flag . connectted = 1;}  else { gop_about . flag . connectted = 0;}
    if (  strcmp ( result_configurations [ 10 ], "on") == 0  ) { gop_about . flag . sound      = 1;}  else { gop_about . flag . sound      = 0;}
    if (  strcmp ( result_configurations [ 11 ], "on") == 0  ) { gop_about . flag . sound_show = 1;}  else { gop_about . flag . sound_show = 0;}
    if (  strcmp ( result_configurations [ 12 ], "on") == 0  ) { gop_about . flag . sound_save = 1;}  else { gop_about . flag . sound_save = 0;}




    strcpy ( gop_configurations . address_to, result_configurations [ 13 ] );




    gop_configurations . port_to          = atof ( result_configurations [ 14 ] );
    gop_configurations . port_this        = atof ( result_configurations [ 15 ] );
    gop_configurations . step_connection  = atof ( result_configurations [ 16 ] );
    gop_configurations . size_update      = atof ( result_configurations [ 17 ] );
    gop_configurations . rate             = atof ( result_configurations [ 18 ] );
    gop_configurations . channels         = atof ( result_configurations [ 19 ] );
    gop_configurations . snake            = atof ( result_configurations [ 20 ] );





/*

 we don't need to reload others

 cause they are setted before

 but when this come, connector must be started

 we should change the range of connector

*/

//    if ( bool_reset ) {





/*

 reset not nessensary

 dog will check it

 we load this here because connector should be able to set a target instead of connect this address every time


 this load should be after the connector start

  and we could move it to be after of the dog run first circle


   so if this is the first load we don't neet load address

   if it's not we should load again


 because connector don't load address everytime cause something we give that a target


 and check reset is too slow

*/

    if (  gop_about . flag . start  ) {


        strcpy  (  gop_connections . address_ip [ 0 ], address_to  );

        gop_connections . port [ 0 ]  =  port_to ;}






/*

 print it out when we reset it

*/

//        output_print ( "string", "Done\n" );}









// ok

    return 1;}
