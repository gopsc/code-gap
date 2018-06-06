
int load_configure () {



    output_print ( "string", "Load configure...\n" );




// Prepare the values,
//         the start path used is certaintlly

    char buffer_path     [128];







// For saving files
// and saving configurations

    char   that_file     [ 1024 ];
    char buffer_file     [ 1024 ];

    char target_configuration [ 21 ] [ 128 ];
    char result_configuration [ 21 ] [ 128 ];







// If ur running a server or client program
// and you wanna change the target ip
// you mast close it first,
// then turn it up again

    int bool_reset = 0;






// Check path.
//
// Get the user
//    only root can access /opt/TxL

    commandline_get ( "whoami", that_file );






// The mode of deamon

    if    ( number_args > 1                       ) {


// deamon program usually is run by root

        if    (

                  strcmp ( buffer_args[1], "deamon" ) == 0

        &&        strcmp ( that_file,      "root\n" ) == 0

              ) {





// If it's deamon mode, load the configuration file

            strcpy ( buffer_path, "/opt/TxL/sky/configurations/TxL/configuration_deamon" );


            if    (  ! is_file ( buffer_path )  ) {


// If the deamon configuration is not found, load the common configuration file

                strcpy ( buffer_path, "/opt/TxL/seed/configuration" );}}}








// The mode of terminal
//  of root

    else if   (  strcmp ( that_file, "root\n" ) == 0  ) {

// be ready to get the common configuration file

        strcpy ( buffer_path, "/opt/TxL/seed/configuration" );


// if it's not found, try the dirent where you are

        if    (  ! is_file ( buffer_path )  ) {

            strcpy ( buffer_path, "seed/configuration" );}}








// The mode of terminal
//  of no root

    else if   (  strcmp ( that_file, "root\n" ) != 0  ){


// if it is not the root user, try to load the no-root configuration

        strcpy ( buffer_path, "/opt/TxL/sky/configurations/TxL/configuration_no-root" );


// if it's not found, try the dirent where you are

        if (  ! is_file ( buffer_path )  ) {

            strcpy ( buffer_path, "sky/configurations/TxL/configuration_no-root" );}}






// There's still no configuration file
//   ask the user

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





// print the file path for test

//    printf("%s\n", buffer_path);














// Get the file

    file_get ( buffer_path, that_file );











// sometimes it maybe a empty file
// but the watchdog will keep running




// if it's not a empty file
//
// it will be read
//
// don't worry










// we don't need to reboot it
//  because we could check it straightly
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

*/








// the time to reset

    if ( bool_reset ) {

        output_print( "string"                       , "Reset...");

        usleep      ( 1000000 );}






    strcpy ( target_configuration [ 1  ], "path "           );
    strcpy ( target_configuration [ 2  ], "name "           );
    strcpy ( target_configuration [ 3  ], "data "           );
    strcpy ( target_configuration [ 4  ], "backup "         );
    strcpy ( target_configuration [ 5  ], "main "           );
    strcpy ( target_configuration [ 6  ], "dog "            );
    strcpy ( target_configuration [ 7  ], "show "           );
    strcpy ( target_configuration [ 8  ], "connector "      );
    strcpy ( target_configuration [ 9  ], "connectted "     );
    strcpy ( target_configuration [ 10 ], "sound "          );
    strcpy ( target_configuration [ 11 ], "sound-show "     );
    strcpy ( target_configuration [ 12 ], "sound-save "     );
    strcpy ( target_configuration [ 13 ], "address-to "     );
    strcpy ( target_configuration [ 14 ], "port-to "        );
    strcpy ( target_configuration [ 15 ], "port-this "      );
    strcpy ( target_configuration [ 16 ], "connect-step "   );
    strcpy ( target_configuration [ 17 ], "update-size "    );
    strcpy ( target_configuration [ 18 ], "sound-rate "     );
    strcpy ( target_configuration [ 19 ], "sound-channels " );
    strcpy ( target_configuration [ 20 ], "ft-N "           );










// start the researching



    int i;

    for ( i=1; i<=20; i++ ) {


        if ( strstr(that_file, target_configuration [ i ] ) != NULL ) {


            strcpy( buffer_file,         strstr ( that_file, target_configuration[i] ) );

           *strchr( buffer_file,         '\n'                         ) = '\0';

            strcpy( buffer_file,         strrchr(buffer_file, ' ') +1 );

            strcpy( result_configuration[i], buffer_file              );}}






    strcpy ( path_the,    result_configuration [ 1 ] );
    strcpy ( name_the,    result_configuration [ 2 ] );
    strcpy ( name_data,   result_configuration [ 3 ] );
    strcpy ( name_backup, result_configuration [ 4 ] );


    if (  strcmp ( result_configuration [ 5  ], "on") == 0  ) { information_flag.main       = 1;}  else { information_flag.main       = 0;}
    if (  strcmp ( result_configuration [ 6  ], "on") == 0  ) { information_flag.dog        = 1;}  else { information_flag.dog        = 0;}
    if (  strcmp ( result_configuration [ 7  ], "on") == 0  ) { information_flag.show       = 1;}  else { information_flag.show       = 0;}
    if (  strcmp ( result_configuration [ 8  ], "on") == 0  ) { information_flag.connector  = 1;}  else { information_flag.connector  = 0;}
    if (  strcmp ( result_configuration [ 9  ], "on") == 0  ) { information_flag.connectted = 1;}  else { information_flag.connectted = 0;}
    if (  strcmp ( result_configuration [ 10 ], "on") == 0  ) { information_flag.sound      = 1;}  else { information_flag.sound      = 0;}
    if (  strcmp ( result_configuration [ 11 ], "on") == 0  ) { information_flag.sound_show = 1;}  else { information_flag.sound_show = 0;}
    if (  strcmp ( result_configuration [ 12 ], "on") == 0  ) { information_flag.sound_save = 1;}  else { information_flag.sound_save = 0;}




    strcpy ( address_to, result_configuration [ 13 ] );




    port_to          = atof ( result_configuration [ 14 ] );
    port_this        = atof ( result_configuration [ 15 ] );
    step_connection  = atof ( result_configuration [ 16 ] );
    size_update      = atof ( result_configuration [ 17 ] );
    rate             = atof ( result_configuration [ 18 ] );
    channels         = atof ( result_configuration [ 19 ] );
    N                = atof ( result_configuration [ 20 ] );






// we don't need to reload others
//
// cause they are setted before
//
// but when this come, connector must be started
//
// we should change the range of connector


//    if ( bool_reset ) {






// reset is not nessensary
//
// dog will check it
//
// we load this here because connector should be able to set a target instead of connect this address every time

    strcpy ( gop_connection.address_ip [ 0 ], address_to );

    gop_connection.port [ 0 ]      = port_to    ;






// this is not nessensary
//
//        output_print ( "string", "Done\n" );}





// ok

    return 1;}
