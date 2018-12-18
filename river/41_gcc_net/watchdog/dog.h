


void* gop_dog(void*){








// TxL needs jurisdiction of root
    check_root();

// raspberrypi has a close ssh service
    check_ssh();

// {path}/{name}/configure
    load_configure();

// listen modle of sound , it need a word libary loading
    load_listen();



    printf("DONE\n");







    note_save("dog", "WatchDog start", "now");

    while(flag_dog){

        information_user_get();   usleep(100000);
        information_name_get();   usleep(100000);
        information_system_get(); usleep(100000);
        information_memory_get(); usleep(100000);
        information_disk_get();   usleep(100000);
        information_cpu_get();    usleep(100000);
        information_ip_get();     usleep(100000);
        information_sound_get();  usleep(100000);

        check_network();          usleep(100000);
        check_power();            usleep(100000);
        dog_show();               usleep(100000);

        information_done = true;}






    note_save("dog", "WatchDog close", "now");

    pthread_exit(NULL);}