
pthread_t thread[4];



// many of strange ideas

void* gop[2][1024][1024][2];


void* dream( void* that_type ) {


// your dreams, the others does not know




    return that_type;}




int main( int argc, char *argv[] ) {

// 0/0.note
//
// read
// read : zero

    gop[0][0][0][0] = malloc( 4  + 1  );    strcpy( (char*)gop[0][0][0][0], "char"        );
    gop[0][0][0][1] = malloc( 4  + 1  );    strcpy( (char*)gop[0][0][0][1], "read"        );
    gop[0][0][1][0] = malloc( 4  + 1  );    strcpy( (char*)gop[0][0][1][0], "char"        );
    gop[0][0][1][1] = malloc( 11 + 1  );    strcpy( (char*)gop[0][0][1][1], "read : zero" );

    printf("%s\n", (char*)gop[0][0][0][1]);

    pthread_create (&thread[0], NULL, dream, (void*)"me");





// Sometimes other thread will use the args.

    number_args = argc;
    buffer_args = argv;






// If command, turn gopi to a deamon

    init_deamon();



    output_print( "string", "\n" );





    pthread_create (&thread[1], NULL, gop_dog         , NULL);

    pthread_create (&thread[2], NULL, gop_server_start, NULL);

    pthread_create (&thread[3], NULL, gop_client_start, NULL);

    pthread_create (&thread[4], NULL, gop_corde       , NULL);









    char buffer_command[129] = "";



// wait the dog run a circle

    while ( !information_flag.start ) {


        usleep(100000);}









// Deamon got blank alway in deamon.

    if ( information_flag.main && (!information_flag.deamon) ) {



        output_print( "string", "\n we met somewhere \n\n" );}




    note_save("command", "Command start", "now");








    while ( information_flag.main ) {




// When it is deamon process,
// that goes   wrong.

        if ( information_flag.deamon ) {


            usleep(100000);}





        else {




// Get the command

            fgets(buffer_command,129, stdin);






// Sometimes its goes wrong,
//     just  return blank chars.

            if ( strcmp(buffer_command, "") == 0 ) {


                usleep(100000);}



// Read the command

            else {


// The end of the command
//    will be a '\n'

                buffer_command[strlen(buffer_command)-1] = '\0';
                               strcat(buffer_command,      ".");



// Print a '\n'

                output_print( "string", "\n" );



// Judge for the command typed

                judge_message_command(
                                       -1,
                                       buffer_command,
                                       buffer_command
                                     );



// Clear the buffer

                strcpy(buffer_command, "");}}}




// The end of this program

    note_save("command", "Command close", "now");}



