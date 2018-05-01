
void action_sound () {

    if (     !information_flag.sound ) {

        output_print( "string", "Sound Start." );

        information_flag.sound = 1;}

    else if ( information_flag.sound ) {

        output_print( "string", "Sound Stop."  );

        information_flag.sound      = 0;
        information_flag.sound_show = 0;}}