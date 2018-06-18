


int action_show_sound() {





    if ( !information_flag.sound_show ) {

        output_print( "string", "Sound Show Start.\n" );

        information_flag.sound      = 1;
        information_flag.sound_show = 1;}





    else if ( information_flag.sound_show ) {

       output_print( "string", "Sound keep going.\n" );

        information_flag.sound_show = 0;}




   else {


        return 0;}






    return 1;}



