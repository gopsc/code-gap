
void* gop_corde(void*){

    while ( !information_done ) {
        usleep(100000);}

    note_save("corde", "Blank Corde start", "now");




    while(flag_sound) {
        sleep(1);}



    note_save("corde", "Blank Corde close", "now");

    pthread_exit(NULL);}