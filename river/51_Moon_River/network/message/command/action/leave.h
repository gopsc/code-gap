
void action_leave() {


// exit all of threads

    flag_dog        = 0;
    flag_client     = 0;
    flag_server     = 0;
    flag_sound      = 0;     
    flag_sound_show = 0;
    flag_sound_save = 0;
    flag_show       = 0;
    flag_main       = 0;


// Maybe socket is loop,
//   shut it down.
//   program  can be shutdown by itself.

//    shutdown(gop_connection.descriptor[0], SHUT_RDWR);
//    shutdown(gop_connection.descriptor[1], SHUT_RDWR);

//Threads need time to exit
    pthread_exit(NULL);}
