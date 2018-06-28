
void action_show_sound() {


    if ( !flag_sound_show ) {

        printf("Sound Start.");

        flag_sound      = 1;
        flag_sound_show = 1;}

    else if ( flag_sound_show ) {

        flag_sound_show = 0;}}