  





pthread_t    thread[6];



int main( int argc, char *argv[] ) {

//================================================
// Sometimes other thread will use the args.

    number_args = argc;
    buffer_args = argv;

//================================================

// If command, turn gopi to a deamon.
    init_deamon();

//================================================

    output_print( "string", "\n" );

    pthread_create (&thread[1], NULL, gop_dog         , NULL);
    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
    pthread_create (&thread[4], NULL, gop_corde       , NULL);

//================================================

    char buffer_command[129] = "";

    while ( !information_flag.start ) {
        usleep(100000);}

//================================================

// Deamon got blank alway in deamon.

    if ( information_flag.main && (!information_flag.deamon) ) {

        output_print( "string", "\n we met somewhere \n\n" );}

    note_save("command", "Command start", "now");

//================================================

    while ( information_flag.main ) {


// When it is deamon process,
// that goes   wrong.

        if ( information_flag.deamon ) {

            usleep(100000);}


        else {

            fgets(buffer_command,100, stdin);


// Sometimes its goes wrong,
//     just  reuten blank chars.

            if ( strcmp(buffer_command, "") == 0 ) {

                usleep(100000);}

            else {

                buffer_command[strlen(buffer_command)-1] = '\0';
                               strcat(buffer_command,      ".");

                output_print( "string", "\n" );

                control_command(
                                 -1,
                                 buffer_command,
                                 buffer_command
                               );

                strcpy(buffer_command, "");}}}

//================================================

    note_save("command", "Command close", "now");}
