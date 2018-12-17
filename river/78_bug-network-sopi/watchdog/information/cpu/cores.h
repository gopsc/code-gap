
int information_CPU_cores_get() {


    int    num_result        = 0;
    char   that_file[10240]  = "\n";
    char   target_name[17]   = "\nprocessor";
    char*  pointer_file      = that_file;




    file_get("/proc/cpuinfo",  that_file + 1);

    while( pointer_file != NULL ) {

        num_result++; 
        pointer_file = strstr(pointer_file + 1,  target_name    );}

    information_cpu.cores = num_result;


    return 1;}
