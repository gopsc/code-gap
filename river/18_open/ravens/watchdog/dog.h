

void* gop_dog(void*){
    note_save("dog.note", "WatchDog start");

    gop_delay(0.1);

    if (info_name == "raspberrypi") {
        cmd_get(cmd_ssh_sudo);}

    while(flag_dog){

        info_time_get();
        info_name_get();
        info_system_get();
        info_memory_get();
        info_cpu_get();
        info_ip_get();
        info_sound_get();

        check_net();
        check_power();
        check_reboot();

        dog_show();}
    note_save("dog.note", "WatchDog close");}

