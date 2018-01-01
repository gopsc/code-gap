


void* gop_dog(void* what){








// Load configure from:
// {path}/{name}/configure
    load_configure();

// Prepare the symbal just like 'NEXT'
    load_symbol();

// Listen modle of sound , it need a word libary loading.
    load_listen();

// TxL needs jurisdiction of root.
    check_root();

// When a update was stop, files left.
// Must be after loading.
    check_update();






    printf("Done\n");





    note_save("dog", "WatchDog start", "now");


    while (flag_main) {

        if      ( !flag_dog ) {

            usleep(100000);}

        else if (  flag_dog ) {

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

            flag_start = 1;}}






    note_save("dog", "WatchDog close", "now");

    pthread_exit(NULL);}