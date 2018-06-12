
void * gop_corde ( void * what ) {





    while ( ! gop_about.flag.start ) {

        usleep ( 100000 );}






    while ( gop_about.flag.main ) {





        if ( ! gop_about.flag.sound ) {

            usleep ( 100000 );}




        else {


            note_save ( "corde", "blank Corde start", "now" );


            while ( gop_about.flag.sound ) {

                usleep ( 100000 );}


            note_save ( "corde", "blank Corde close", "now" );}}



    pthread_exit ( NULL );}
