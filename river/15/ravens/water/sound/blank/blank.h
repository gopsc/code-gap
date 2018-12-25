void* gop_corde(void*){
    file_append("/opt/gop/note/corde.note", info_time);
    file_append("/opt/gop/note/corde.note", "Blank Corde start");
    file_append("/opt/gop/note/corde.note", "\n"); 
    while(flag_sound) {
        sleep(1);}
    file_append("/opt/gop/note/corde.note", info_time);
    file_append("/opt/gop/note/corde.note", "Corde close");
    file_append("/opt/gop/note/corde.note", "\n");}




