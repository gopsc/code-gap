  





pthread_t    thread[6];





int main( int argc, char *argv[] ) {

    printf("\n");

    pthread_create (&thread[1], NULL, gop_dog,          NULL);
    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
//    pthread_create (&thread[4], NULL, gop_corde ,       NULL);







    char buffer_command[129] = "";


    while ( !information_done ) {
        usleep(100000);}






    if ( flag_mind ) {

        printf( "\nCommand is gonna start, take 'Help' to get commands list.\n" );}

    note_save("command", "Command start", "now");




    while (flag_mind) {



        printf("\n");

        fgets(buffer_command,100, stdin);

        buffer_command[strlen(buffer_command)-1] = '\0';
                       strcat(buffer_command, ".");
        printf("\n");

        control_command(
                         -1,
                         buffer_command,
                         buffer_command
                       );}



    note_save("command", "Command close", "now");}
