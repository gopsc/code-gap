
void action_show_sound() {


    if ( !flag_sound_show ) {

        output_print( "string", "Sound Start." );

        flag_sound      = 1;
        flag_sound_show = 1;}

    else if ( flag_sound_show ) {

        flag_sound_show = 0;}}