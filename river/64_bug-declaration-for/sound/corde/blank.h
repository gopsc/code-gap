
void* gop_corde(void* what) {

    while ( !information_flag.start ) {
        usleep(100000);}




    while (information_flag.main) {

        while ( information_flag.sound ) {

            note_save("corde", "Blank Corde start", "now");

            while ( information_flag.sound ) {

                usleep(100000);}

            note_save("corde", "Blank Corde close", "now");}

        usleep(100000);}



    pthread_exit(NULL);}