



int action_leave() {




// exit all of threads

    information_flag.dog        = 0;

    information_flag.connector  = 0;
    information_flag.connectted = 0;
    information_flag.show       = 0;

    information_flag.sound      = 0;
    information_flag.sound_show = 0;
    information_flag.sound_save = 0;

    information_flag.main       = 0;








// Maybe socket is loop,
//   shut it down.
//   program  can be shutdown by itself.

    usleep  ( 2 * 1000000 * step_connection );

    shutdown ( gop_connection.descriptor[0], SHUT_RDWR );
    shutdown ( gop_connection.descriptor[1], SHUT_RDWR );


// wait for it exit

    usleep  ( 2 * 1000000 * step_connection );


//Threads need time to exit

    pthread_exit ( NULL );





    return 1;}
