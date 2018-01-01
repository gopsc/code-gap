void information_sound_get() {



    DIR           *that_dirent;
    struct dirent *pointer_dirent;


    information_sound.num_control   = 0;
    information_sound.num_capture  = 0;
    information_sound.num_playback = 0;

    int num_control                = 0;
    int num_capture                = 0;
    int num_playback               = 0;

    char that_name[17]             = " \0";
    char that_id[17]               = " \0";

    char that_buffer1[3];
    char that_buffer2[3];









    that_dirent = opendir("/dev/snd");

    pointer_dirent = readdir(that_dirent);

    closedir(that_dirent);










    while ( ( pointer_dirent = readdir(that_dirent) ) != NULL ) {

        strcpy(that_name, pointer_dirent->d_name);








        if ( strstr(that_name, "control") == that_name ) {

            num_control++;}

        else if ( strstr(that_name, "pcm") == that_name ){

           strcpy( that_name, strstr(that_name, "pcm")+3 );











           if (that_name[4] == 'c') {


               num_capture++;

               that_buffer1[0] = that_name[1];
               that_buffer2[0] = that_name[3];

               strcpy(that_id, "hw:");
               strcat(that_id, that_buffer1); 
               strcat(that_id, ",");
               strcat(that_id, that_buffer2);

               strcat(information_sound.device[1][num_capture], that_id);}



           else if (that_name[4] == 'p') {


               num_playback++;

               that_buffer1[0] = that_name[1];
               that_buffer2[0] = that_name[3];

               strcpy(that_id, "hw:");
               strcat(that_id, that_buffer1); 
               strcat(that_id, ",");
               strcat(that_id, that_buffer2);

               strcat(information_sound.device[2][num_playback], that_id);}}}






    information_sound.num_control  = num_control;
    information_sound.num_capture  = num_capture;
    information_sound.num_playback = num_playback;}