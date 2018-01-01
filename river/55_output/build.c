  





pthread_t    thread[6];



int main( int argc, char *argv[] ) {



    number_args = argc;
    buffer_args = argv;



// If command, turn gopi to a deamon.
    init_deamon();



    output_print( "string", "\n" );

    pthread_create (&thread[1], NULL, gop_dog,          NULL);
    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
    pthread_create (&thread[4], NULL, gop_corde ,       NULL);







    char buffer_command[129] = "";


    while ( !flag_start ) {
        usleep(100000);}






    if ( flag_main && (!flag_deamon) ) {

        output_print( "string",  "\nCommandline is gonna start, take 'Help' to get commands list.\n" );}

    note_save("command", "Command start", "now");




    while ( flag_main ) {


        if ( flag_deamon ) {

            usleep(100000);}

        else               {

            output_print( "string", "\n" );

            fgets(buffer_command,100, stdin);

            buffer_command[strlen(buffer_command)-1] = '\0';
                           strcat(buffer_command,      ".");
            output_print( "string", "\n" );

            control_command(
                             -1,
                             buffer_command,
                             buffer_command
                           );}}



    note_save("command", "Command close", "now");}
