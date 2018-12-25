
void command_show_sound() {


    if ( !flag_sound_show ) {

        printf("Sound Start.");

        flag_sound = true;
        flag_sound_show = true;}

    else if ( flag_sound_show ) {

        flag_sound_show = false;}}