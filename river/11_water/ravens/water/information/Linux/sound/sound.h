
int point_capture=0, point_playback=0;
string         info_sound[2][5];

void info_sound_get() {
    DIR           *dir;
    struct dirent *ptr;
    dir = opendir("/dev/snd");

    point_capture=0;
    point_playback=0;
    string that;
    string that2;

    while ((ptr = readdir(dir)) != NULL){
        that = ptr->d_name;

        if (that.find("pcm") == 0){
           that = that.substr(that.find("pcm")+3, that.length());
           if (that[4] == 'c') {
               point_capture++;
               that2 = "hw:";
               that2 += that[1];
               that2 += ',';
               that2 += that[3];
               info_sound[1][point_capture] = that2;}
           else if (that[4] == 'p') {
               point_playback++;
               that2 = "hw:";
               that2 += that[1];
               that2 += ',';
               that2 += that[3];
               info_sound[2][point_playback] = that2;}}}
    closedir(dir);}


