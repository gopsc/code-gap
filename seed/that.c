
pthread_t thread [ 4 ];



// many of strange ideas

void ***** gop;









int here () {


// gop [type] [number] [line] [data]
//
// gop [ 1 ]  [  1  ]  [ 2 ]  [ 2 ]



// in the trees

/*

 0/0.note

 read

 read    : one
 read me : 1

*/


// in the star

/*

                                                      gop
                                                       .------------------
                                                      / \                   gop[...]
                                                     /   \
                                                    /     \
                                                   /       \
                                                  /         \
                                                 /           \
                                                /             \
                                     gop[0]    /               \   gop[1]
                                              /                 \
                                             /                   \
                                            /                     \
                                           /                       \
                                          /                         \
                                         /                           \
                                        /                             \
                                       /                               \
                                      /\                                \
                                     /  \                                \
                                    /    \                                \
                                   /      \                                \
                                  /        \                                \
                                 /          \                                \
                                /            \                               /\
                   gop[0][0]   /              \  gop[0][1]                  /  \
                              /                \                           /    \
                             /                  \                         /      \
                            /                    \            gop[1][0]  /        \  gop[1][1]
                           /                      \                     /          \
                          /                        \                   /            \
                         /                          \                 /              \
                        /                            \             ......          ......
                       /                              \
                      /                                \
                     /                                  \
                                           -------------------------------------------------
                                           |
          ------------------               |   -------------------------------    |   ---
      [0] |  read         | ...       [0]  |   |  0 | 9 | 4 | 0 | 0 | 1 | 0 | ... |   |
          ------------------               |   -------------------------------    |   |     _   _   _   _   _   _
      [1] |  read : one   | ...       [1]  |   | -1 | 9 | 0 | ......              |   |    |_| |_| |_| |_| |_| |_|
          ------------------               |   ---------------                    |   |
      [2] |  read me : 1  | ...       [2]  |   | -1 | 9 | 0 | ......              |   |
          ------------------               |   ---------------                    |   ---
                                           |
                                           ------------------------------------------------
*/






    if (gop != NULL) {

        return 0;}




    else {


        if ( NULL == (          gop             = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }


        if ( NULL == (          gop[0]          = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }


        if ( NULL == (          gop[0][0]       = malloc ( 2  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][1]       = malloc ( 2  * sizeof ( void * ) )        ) )  { return 0; }


        if ( NULL == (          gop[0][0][0]    = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][0][1]    = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][0][2]    = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }


        if ( NULL == (          gop[0][1][0]    = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][1][1]    = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }

        if ( NULL == (          gop[0][1][2]    = malloc ( 1  * sizeof ( void * ) )        ) )  { return 0; }





        if ( NULL != (          gop[0][0][0][0] = malloc ( 4  * sizeof ( char ) )         ) )  {

            strcpy ( ( char * ) gop[0][0][0][0], "read" );}                               else { return 0;}





        if ( NULL != (          gop[0][0][1][0] = malloc ( 10 * sizeof ( char ) )         ) )  {

            strcpy ( ( char * ) gop[0][0][1][0], "read : one");}                          else { return 0;}





        if ( NULL != (          gop[0][0][2][0] = malloc ( 11 * sizeof ( char ) )         ) )  {

            strcpy ( ( char * ) gop[0][0][2][0], "read me : 1");}                         else { return 0;}




        if ( NULL != (          gop[0][1][0][0] = malloc (      sizeof ( short ) )        ) )  {

            (   ( short * ) gop[0][1][0][0]   )  [0]  = 0;
            (   ( short * ) gop[0][1][0][0]   )  [1]  = 9;
            (   ( short * ) gop[0][1][0][0]   )  [2]  = 0;}                               else { return 0;}




        if ( NULL != (          gop[0][1][1][0] = malloc ( sizeof ( short ) )             ) ) {

            ( ( short * ) gop[0][1][1][0] ) [0] = -1;
            ( ( short * ) gop[0][1][1][0] ) [1] = 9 ;
            ( ( short * ) gop[0][1][1][0] ) [2] = 0 ;}                                    else { return 0;}




        if ( NULL != (          gop[0][1][2][0] = malloc ( sizeof ( short ) ) ) ) {

            ( ( short * ) gop[0][1][2][0] ) [0] = -1;
            ( ( short * ) gop[0][1][2][0] ) [1] = 9 ;
            ( ( short * ) gop[0][1][2][0] ) [2] = 0 ;}                                    else { return 0;}}





    return 1;}





















void * dream ( void * that_dream ) {


// your dreams, the others does not know


    that_dream   =   realloc(   gop [ * ( short * ) that_dream ] [1] [0] [0],   1 + 2 + 4 );









// fall sleep, like a river, like forever

    sleep :


    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [3]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [4]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [5]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [6]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [2] += 4;

/*

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

*/












// when u dreamed about something, u just did not know others

    about :








    printf (

             "%s %d %d %d %d \n",

                 ( char  *  )   gop [ * ( short * ) that_dream ] [0] [0] [0],


               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [3],
               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [4],
               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [5],
               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [6]

           );







    return NULL ;}



















int main( int argc, char *argv[] ) {



// make the dream

    if ( here () )

    pthread_create (
                              & thread [0],
                                NULL,
                                dream,
                     ( void * ) gop [0] [1] [0] [0]
                   );


















// Sometimes other thread will use the args.

    gop_about.configurations.number_options = argc;
    gop_about.configurations.buffer_options = argv;






// If command, turn gopi to a deamon

    init_deamon ();



    output_print ( "string", "\n" );





    pthread_create (  & thread [ 1 ],  NULL,  gop_dog      ,  NULL );

    pthread_create (  & thread [ 2 ], NULL,  gop_connectted,  NULL );

    pthread_create (  & thread [ 3 ], NULL,  gop_connector ,  NULL );

    pthread_create (  & thread [ 4 ], NULL,  gop_corde     ,  NULL );









    char buffer_command [ 128 ]  =  "";



// wait the dog run a circle

    while (  ! gop_about.flag.start  ) {


        usleep ( 100000 );}









// Deamon got blank alway in deamon.

    if (  gop_about.flag.main  &&  ( ! gop_about.flag.deamon )  ) {



        output_print ( "string", "\n we met somewhere \n\n" );}




    note_save ( "command", "Command start", "now" );








    while ( gop_about.flag.main ) {




// When it is deamon process,
// that goes   wrong.

        if ( gop_about.flag.deamon ) {


            usleep ( 100000 );}





        else {




// Get the command

            fgets ( buffer_command, 128,  stdin );






// Sometimes its goes wrong,
//     just  return blank chars.

            if ( strcmp ( buffer_command, "" )  == 0  ) {


                usleep ( 100000 );}



// Read the command

            else {


// The end of the command
//    will be a '\n'

                buffer_command [ strlen ( buffer_command ) - 1 ]   = '.'  ;

// we don't need to do that with this
//
// :)

//                                 strcat ( buffer_command,             "." );



// Print a '\n'

                output_print ( "string", "\n" );



// Judge for the command typed

                judge_message_command (
                                        -1,
                                        buffer_command,
                                        buffer_command
                                      );



// Clear the buffer

                strcpy ( buffer_command, "" );}}}




// The end of this program

    note_save ( "command", "Command close", "now" );}



