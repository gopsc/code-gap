
int information_sound_get() {


    DIR           *buffer_dirent;
    struct dirent *pointer_dirent;

    information_sound.number_control  = 0;
    information_sound.number_capture  = 0;
    information_sound.number_playback = 0;

    int number_control                = 0;
    int number_capture                = 0;
    int number_playback               = 0;

    char buffer_name[17]              = " \0";
    char buffer_id[17]                = " \0";

    char buffer[3][3];


    buffer_dirent = opendir("/dev/snd");

    pointer_dirent = readdir(buffer_dirent);

    closedir(buffer_dirent);


    while ( ( pointer_dirent = readdir(buffer_dirent) ) != NULL ) {

        strcpy(buffer_name, pointer_dirent->d_name);

        if ( strstr(buffer_name, "control") == buffer_name ) {

            number_control++;}

        else if ( strstr(buffer_name, "pcm") == buffer_name ){

           strcpy( buffer_name, strstr(buffer_name, "pcm")+3 );


           if (buffer_name[4] == 'c') {

               number_capture++;

               buffer[1][0] = buffer_name[1];
               buffer[2][0] = buffer_name[3];

               strcpy(buffer_id, "hw:");
               strcat(buffer_id, buffer[1]); 
               strcat(buffer_id, ",");
               strcat(buffer_id, buffer[2]);

               strcpy(information_sound.device[1][number_capture], buffer_id);}


           else if (buffer_name[4] == 'p') {

               number_playback++;

               buffer[1][0] = buffer_name[1];
               buffer[2][0] = buffer_name[3];

               strcpy(buffer_id, "hw:");
               strcat(buffer_id, buffer[1]); 
               strcat(buffer_id, ",");
               strcat(buffer_id, buffer[2]);

               strcpy(information_sound.device[2][number_playback], buffer_id);}}}


    information_sound.number_control  = number_control;
    information_sound.number_capture  = number_capture;
    information_sound.number_playback = number_playback;

    return 1;}