void info_sound_get() {
    DIR           *dir;
    struct dirent *ptr;
    dir = opendir("/dev/snd");

    info_sound.num_control  = 0;
    info_sound.num_capture  = 0;
    info_sound.num_playback = 0;
    string that;
    string that2;

    while ((ptr = readdir(dir)) != NULL){
        that = ptr->d_name;

        if (that.find("control") == 0){
            info_sound.num_control++;}

        else if (that.find("pcm") == 0){
           that = that.substr(that.find("pcm")+3, that.length());
           if (that[4] == 'c') {
               info_sound.num_capture++;
               that2 = "hw:";
               that2 += that[1];
               that2 += ',';
               that2 += that[3];
               info_sound.device[1][info_sound.num_capture] = that2;}
           else if (that[4] == 'p') {
               info_sound.num_playback++;
               that2 = "hw:";
               that2 += that[1];
               that2 += ',';
               that2 += that[3];
               info_sound.device[2][info_sound.num_playback] = that2;}}}
    closedir(dir);}







