
















/*

 this is what it is

*/



 pthread_t  thread  [ 4 ];




/*



         __ 
        /  \
        \__/

                                                __
                                               /  \
                             ____              \__/
                            /    \
                           /      \
                           \      /
                            \____/


                                        __
                                       /  \
                 __                    \__/
                /  \
                \__/




*/






/*


              _
             |_|



              __              ___
             /  \            /   \ 
             \__/            |   |
                             \___/ 


              ___
             /   \
             \___/



              ___
             /   \
            |     |
             \___/



              ____
             /    \
            /      \
            \      /
             \____/  


*/


















int main( int argc, char *argv[] ) {


 
 
 
/*
 make the dream
*/
 
/*
    if ( here () )

    pthread_create (
                              & thread [0],
                                NULL,
                                dream,
                     ( void * ) gop [0] [1] [0] [0]
                   );
*/

















// Sometimes other thread will use the args.

    gop_about.configurations.number_options = argc;
    gop_about.configurations.buffer_options = argv;






// If command, turn gopi to a deamon

    init_deamon ();



    output_print ( "string", "\n" );





    pthread_create (  & thread [ 1 ],  NULL,  gop_dog      ,  NULL );

    pthread_create (  & thread [ 2 ], NULL,  gop_connectted,  NULL );

    pthread_create (  & thread [ 3 ], NULL,  gop_connector ,  NULL );




/*

 plug in

*/


/*

    pthread_create (  & thread [ 4 ], NULL,  gop_corde     ,  NULL );

*/







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



