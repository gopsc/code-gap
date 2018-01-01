
int load_configure() {



    output_print( "string", "Load configure...\n" );




// Prepare the values,
//         the start path used is certaintlly

    char buffer_path     [128];


// For saving files
// and saving configurations

    char   that_file     [1024];
    char buffer_file     [1024];
    char target_configure[21][128];
    char result_configure[21][128];


// If ur running a server or client program
// and you wander change the target ip
// you mast close it first,
// then turn it up again

    int bool_reset = 0;






// Check path.
//
// Get the user
//    only root can access /opt/TxL

    commandline_get("whoami", that_file);





// The mode of deamon

    if    ( number_args > 1                       ) {

        if    (

                  strcmp(buffer_args[1], "deamon") == 0
        &&        strcmp(that_file,      "root\n") == 0

              ) {


            strcpy(buffer_path, "/opt/TxL/sky/configurations/TxL/configuration_deamon");


            if    ( !is_file(buffer_path) ) {


                strcpy(buffer_path, "/opt/TxL/seed/configuration");}}}





// The mode of terminal
//  of root

    else if   ( strcmp(that_file, "root\n") == 0 ) {


        strcpy(buffer_path, "/opt/TxL/seed/configuration");


        if    ( !is_file(buffer_path) ) {

            strcpy(buffer_path, "TxL/seed/configuration");}}


// The mode of terminal
//  of no root

    else if   ( strcmp(that_file, "root\n") == 1 ){


        strcpy(buffer_path, "/opt/TxL/sky/configurations/TxL/configuration_no-root");


        if ( !is_file(buffer_path) ) {

            strcpy(buffer_path, "TxL/sky/configurations/TxL/configuration_no-root");}}

//================================================================
// There's still no configuration file
//   ask the user

    while ( !is_file(buffer_path) ) {

        output_print( "string", "\nCan't find the configuration file. :(\n" );
        output_print( "string", " type a new path:"                         );

        fgets(buffer_path,128, stdin);

        output_print( "string", " u typed:        ");
        output_print( "string", buffer_path        );
        output_print( "string", "\n"               );

        if ( strchr(buffer_path, '\n') != NULL ) {

            *strchr(buffer_path, '\n')  = '\0';}}



// print the file path for test

//    printf("%s\n", buffer_path);



// Get the file

    file_get(buffer_path, that_file);


// sometimes it maybe a empty file

    if ( strcmp(that_file, "") == 0 ) {

        information_flag.main = 0;}




// If is's not a empty file
// read it

    else {


//================================================================
// Reboot client when it was block.

        if (
             information_flag.client
        &&
           (
               strcmp(gop_connection.how[0], ""    ) == 0
        ||     strcmp(gop_connection.how[0], "Wait") == 0
           )
           ) {

            bool_reset              = 1;
            information_flag.client = 0;

            shutdown(gop_connection.descriptor[0], SHUT_RDWR);}

//================================================================
// Reboot server when it was block.

        if (
             information_flag.server
        &&
           (
           (
                strcmp(gop_connection.how[1], ""    ) == 0
             || strcmp(gop_connection.how[1], "Wait") == 0
           )
        &&
           (
           (
                strcmp(gop_connection.how[2], ""    ) == 0
             || strcmp(gop_connection.how[2], "Wait") == 0
           )
        &&
           (
                strcmp(gop_connection.how[3], ""    ) == 0
             || strcmp(gop_connection.how[3], "Wait") == 0
           )
           )
           )
           ) {

            bool_reset              = 1;
            information_flag.server = 0;
            shutdown(gop_connection.descriptor[1], SHUT_RDWR);}

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

        if ( bool_reset ) {

            output_print( "string"                       , "Reset...");
            usleep      ( 1000000 * (1 + step_connection)            );}

//================================================================

        strcpy(target_configure[1] , "path "          );
        strcpy(target_configure[2] , "name "          );
        strcpy(target_configure[3] , "data "          );
        strcpy(target_configure[4] , "main "          );
        strcpy(target_configure[5] , "dog "           );
        strcpy(target_configure[6] , "show "          );
        strcpy(target_configure[7] , "client "        );
        strcpy(target_configure[8] , "server "        );
        strcpy(target_configure[9] , "sound "         );
        strcpy(target_configure[10], "sound-show "    );
        strcpy(target_configure[11], "sound-save "    );
        strcpy(target_configure[12], "address-to "    );
        strcpy(target_configure[13], "port-to "       );
        strcpy(target_configure[14], "port-this "     );
        strcpy(target_configure[15], "connect-step "  );
        strcpy(target_configure[16], "update-size "   );
        strcpy(target_configure[17], "update-step "   );
        strcpy(target_configure[18], "sound-rate "    );
        strcpy(target_configure[19], "sound-channels ");
        strcpy(target_configure[20], "ft-N "          );

//================================================================

        int i;
        for ( i=1; i<=19; i++ ) {

            if ( strstr(that_file, target_configure[i]) != NULL ) {

                strcpy( buffer_file,         strstr(that_file, target_configure[i]) );
               *strchr( buffer_file,         '\n' ) = '\0';
                strcpy( buffer_file,         strrchr(buffer_file, ' ')+1 );
                strcpy( result_configure[i], buffer_file );}}

//================================================================

        strcpy(path_the,   result_configure[1]);
        strcpy(name_the,   result_configure[2]);
        strcpy(name_data,  result_configure[3]);

        if ( strcmp(result_configure[4],  "on") == 0 ) {information_flag.main       = 1;} else {information_flag.main       = 0;}
        if ( strcmp(result_configure[5],  "on") == 0 ) {information_flag.dog        = 1;} else {information_flag.dog        = 0;}
        if ( strcmp(result_configure[6],  "on") == 0 ) {information_flag.show       = 1;} else {information_flag.show       = 0;}
        if ( strcmp(result_configure[7],  "on") == 0 ) {information_flag.client     = 1;} else {information_flag.client     = 0;}
        if ( strcmp(result_configure[8],  "on") == 0 ) {information_flag.server     = 1;} else {information_flag.server     = 0;}
        if ( strcmp(result_configure[9],  "on") == 0 ) {information_flag.sound      = 1;} else {information_flag.sound      = 0;}
        if ( strcmp(result_configure[10], "on") == 0 ) {information_flag.sound_show = 1;} else {information_flag.sound_show = 0;}
        if ( strcmp(result_configure[11], "on") == 0 ) {information_flag.sound_save = 1;} else {information_flag.sound_save = 0;}

        strcpy(address_to, result_configure[12]);

        port_to          = atof(result_configure[13]);
        port_this        = atof(result_configure[14]);
        step_connection  = atof(result_configure[15]);
        size_update      = atof(result_configure[16]);
        count_update_max = atof(result_configure[17]);
        rate             = atof(result_configure[18]);
        channels         = atof(result_configure[19]);
        N                = atof(result_configure[20]);}


//================================================================

    if ( bool_reset ) {

        strcpy(gop_connection.address_ip[0], address_to);
               gop_connection.port[0]      = port_to    ;

        output_print("string", "Done\n");}

    return 1;}
