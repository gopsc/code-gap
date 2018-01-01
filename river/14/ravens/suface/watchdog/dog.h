

void* gop_dog(void*){
    file_append("/opt/gop/note/dog.note", info_time);
    file_append("/opt/gop/note/dog.note", "WatchDog start");
    file_append("/opt/gop/note/dog.note", "\n");

    while(flag_dog){
        info_time_get();
        info_name_get();
        info_system_get();
        info_memory_get();
        info_cpu_get();
        //info_ip_get();
        info_sound_get();

        net_check();
        ssh_check();
      power_check();

        dog_show();

        sleep(1);}
    file_append("/opt/gop/note/dog.note", info_time);
    file_append("/opt/gop/note/dog.note", "WatchDog close");
    file_append("/opt/gop/note/dog.note", "\n");}




