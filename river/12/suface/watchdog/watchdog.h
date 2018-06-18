
#include "./check/net.h"
#include "./show/show.h"

bool  flag_dog  = false;
int   num_dog   = 1;

void* gop_dog(void*){
    string that;
    char   restart_ssh[25] = "sudo service ssh restart";

    while(true){
        info_time_get();
        info_name_get();
        info_system_get();
        info_memory_get();
        info_cpu_get();
        //info_ip_get();
        info_sound_get();

        net_check();

        dog_show();

        num_dog++;
        if ( num_dog == 120 ) {
            num_dog = 0;
            //that = shell_get(restart_ssh);
            if (that != "") {
                cout << "ssh restart failled!" << endl;}}

        flag_dog  = true;
        sleep(1);}}
