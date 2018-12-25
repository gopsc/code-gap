
void action_sound () {

    if ( !flag_sound ) {

        output_print( "string", "Sound Start." );
        flag_sound = 1;}

    else if ( flag_sound ) {

        output_print( "string", "Sound Stop."  );
        flag_sound      = 0;
        flag_sound_show = 0;}}