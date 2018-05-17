


int action_show_sound() {





    if ( !information_flag.sound_show ) {

        output_print( "string", "Sound Start." );

        information_flag.sound      = 1;
        information_flag.sound_show = 1;}





    else if ( information_flag.sound_show ) {

        information_flag.sound_show = 0;}




   else {


        return 0;}






    return 1;}



