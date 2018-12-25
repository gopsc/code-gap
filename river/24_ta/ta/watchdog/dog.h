

void* gop_dog(void*){
    note_save("dog.note", "WatchDog start");




    check_dirent();

// raspberrypi has a close ssh service
    check_ssh();


    while(flag_dog){

        info_time_get();
        
        gop_delay(0.1);
 
        info_name_get();
        
        gop_delay(0.1);
 
        info_system_get();
        
        gop_delay(0.1);
 
        info_memory_get();
        
        gop_delay(0.1);
 
        info_cpu_get();
        
        gop_delay(0.1);
 
        info_ip_get();
        
        gop_delay(0.1);
 
        info_sound_get();
        
        gop_delay(0.1);
 

        check_net();
        
        gop_delay(0.1);
 
        check_power();
        
        gop_delay(0.1);
 
        check_reboot();
        
        gop_delay(0.1);


        dog_show();}






    note_save("dog.note", "WatchDog close");}

