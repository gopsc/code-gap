
void action_sound () {

    if ( !flag_sound ) {

        printf("Sound Start.");
        flag_sound = 1;}

    else if ( flag_sound ) {

        printf("Sound Stop.");
        flag_sound      = 0;
        flag_sound_show = 0;}}