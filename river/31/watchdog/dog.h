


void* gop_dog(void*){

    note_save("dog", "WatchDog start");




// raspberrypi has a close ssh service

//    check_ssh();

//    load_configure();

// listen modle of sound , it need a word libary loading

//    load_listen();

//    printf("DONE\n");

    while(flag_dog){

        info_user_get();
        info_name_get();
        info_system_get();
//        info_memory_get();
//        info_cpu_get();
        info_ip_get();
//        info_sound_get();

//        check_network();
//        check_power();
//        check_reboot();

//        dog_show();

        info_done = true;}






    note_save("dog", "WatchDog close");}

