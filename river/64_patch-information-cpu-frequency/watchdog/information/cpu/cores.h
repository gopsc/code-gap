void information_CPU_cores_get() {


    int    num_result        = -1;
    char   that_file[10240]  = "";
    char   target_name[17]   = "\nprocessor";
    char*  pointer_file      = that_file;




    file_get("/proc/cpuinfo", that_file);

    while( pointer_file != NULL ) {

        num_result++;
                       strcpy(that_file, pointer_file + 1);  
        pointer_file = strstr(that_file,  target_name);}


    if ( num_result == 0 ) {
        num_result = 1;}
    information_cpu.cores = num_result;}

