
void command_sound () {

    if ( !flag_sound ) {

        printf("Sound Start.");
        flag_sound = true;}

    else if ( flag_sound ) {

        printf("Sound Stop.");
        flag_sound      = false;
        flag_sound_show = false;}}