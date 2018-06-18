



int action_sound () {



    if (     !information_flag.sound ) {

        output_print( "string", "Sound Start.\n" );

        information_flag.sound = 1;}



    else if ( information_flag.sound ) {

        output_print( "string", "Sound Stop.\n"  );

        information_flag.sound      = 0;
        information_flag.sound_show = 0;}


    else {


        return 0;}


    return 1;}
