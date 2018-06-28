
void* gop_corde(void* what){

    while ( !information_flag.start ) {
        usleep(100000);}

    note_save("corde", "Blank Corde start", "now");




    while (information_flag.main) {

        if      ( !information_flag.sound ) {

            usleep(100000);}

        else if (  information_flag.sound ) {

            usleep(100000);}}



    note_save("corde", "Blank Corde close", "now");

    pthread_exit(NULL);}