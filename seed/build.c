
pthread_t thread[4];



// many of strange ideas

void ***** gop;









int here () {


// gop [type] [number] [line] [data]
//
// gop [ 1 ]  [  1  ]  [ 2 ]  [ 2 ]

/*

 0/0.note

 read

 read    : one
 read me : 1

*/


    if (gop != NULL) {

        return 0;}




    else {


        if ( NULL == (          gop             = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0]          = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][0]       = malloc ( 2  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][0][0]    = malloc ( 2  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][0][1]    = malloc ( 2  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][0][2]    = malloc ( 2  * sizeof ( void * ) )        ) )  { return 0; }




        if ( NULL != (          gop[0][0][0][0] = malloc ( 4  * sizeof ( char ) )         ) )  {

            strcpy ( ( char * ) gop[0][0][0][0], "read" );}                               else { return 0;}




        if ( NULL != (          gop[0][0][0][1] = malloc (      sizeof ( int ) )          ) )  {

            * ( int * ) gop[0][0][0][1] = 9;}                                             else { return 0;}




        if ( NULL != (          gop[0][0][1][0] = malloc ( 10 * sizeof ( char ) )         ) )  {

            strcpy ( ( char * ) gop[0][0][1][0], "read : one");}                          else { return 0;}




        if ( NULL != (          gop[0][0][1][1] = malloc (      sizeof ( int ) )          ) )  {

           * ( int * ) gop[0][0][1][1] = -1;}                                             else { return 0;}




        if ( NULL != (          gop[0][0][2][0] = malloc ( 11 * sizeof ( char ) )         ) )  {

            strcpy ( ( char * )gop[0][0][2][0], "read me : 1");}                          else { return 0;}




        if ( NULL != (          gop[0][0][2][1] = malloc (      sizeof ( int ) )          ) )  {

            * ( int * )gop[0][0][2][1] = -1;}                                             else { return 0;}}






    return 1;}









void * dream ( void * that_type ) {


// your dreams, the others does not know


    int one   = 0;
    int two   = 0;
    int three = 0;
    int four  = 0;










// fall sleep, like a river, like forever

    sleep :








    if (

            strcmp (
                       ( char * ) gop [one] [two] [three] [four],               ( char * ) that_type
                   )
            == 0

        ) {

        goto about;}


    else {

        two ++;}







    if ( gop [one] [two] != NULL ) {

        goto sleep;}


    else {

        one   = -1;
        two   = -1;
        three = -1;
        four  = -1;}














// when u dreamed about something, u just did not know others

    about :








    printf (

             "%s %d %d %d %d\n",

              that_type,

                   one,  two,  three,  four

           );







    return that_type;}



















int main( int argc, char *argv[] ) {



// make the dream

    if ( here () )

    pthread_create (
                              & thread [0],
                                NULL,
                                dream,
                     ( void * ) gop [0] [0] [0] [0]
                   );





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









    char buffer_command[128] = "";



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



