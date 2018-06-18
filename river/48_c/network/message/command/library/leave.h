
void command_leave() {


// exit all of threads

    flag_dog        = false;
    flag_client     = false;
    flag_server     = false;
    flag_sound      = false;     
    flag_sound_show = false;
    flag_sound_save = false;
    flag_show       = false;

// Maybe socket is loop,
// shut it down.
    shutdown(gop_connection.descriptor[0], SHUT_RDWR);
    shutdown(gop_connection.descriptor[1], SHUT_RDWR);

//Threads need time to exit
    pthread_exit(NULL);

//the thread of mind is main thread, when it exit, othes too
    flag_mind      = false;}
