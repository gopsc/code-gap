



int action_leave() {



/*

 exit all of threads



 we use clean and could free space

*/

/*

    information_flag.dog        = 0;

    information_flag.connector  = 0;
    information_flag.connectted = 0;
    information_flag.show       = 0;

    information_flag.sound      = 0;
    information_flag.sound_show = 0;
    information_flag.sound_save = 0;

    information_flag.main       = 0;

*/

    clean_about ( gop_about );









/*

 Maybe socket is loop,
   shut it down.
   program  can be shutdown by itself.



 dog will clean this soon :D

*/



/*

    usleep  ( 2 * 1000000 * step_connection );

    shutdown ( gop_connection.descriptor[0], SHUT_RDWR );
    shutdown ( gop_connection.descriptor[1], SHUT_RDWR );


// wait for it exit

    usleep  ( 2 * 1000000 * step_connection );

*/






/*

 soon we use this



 the connector could be running not notice the flag

*/


    usleep (  2  *  step_connection  *  1000000  )


    int i;

    for  (  i = 0;  i < 4;  i ++  ) {

        clean_network ( i, that_about, "quit" );}







    usleep (  2  *  step_connection  *  1000000


    int i;

    for  (  i = 0;  i < 4;  i ++  ) {

        clean_network ( i, that_about, "all" );}










// Threads need time to quit

    pthread_exit ( NULL );





    return 1;}
