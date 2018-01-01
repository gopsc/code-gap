
void* gop_corde(void* what){

    while ( !flag_start ) {
        usleep(100000);}

    note_save("corde", "Blank Corde start", "now");




    while (flag_main) {

        if      ( !flag_sound ) {

            usleep(100000);}

        else if (  flag_sound ) {

            usleep(100000);}}



    note_save("corde", "Blank Corde close", "now");

    pthread_exit(NULL);}