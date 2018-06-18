
void* information_CPU_status_get( int that_flag ) {

           FILE*      that_file         = fopen("/proc/stat", "r");
           char       buffer_file[1025];



    fgets( buffer_file, sizeof(buffer_file), that_file );

    if      ( that_flag == 0 ){
        sscanf(buffer_file, "%s %u %u %u %u",
                                              information_cpu.name,
                                             &information_cpu.user,
                                             &information_cpu.nice,
                                             &information_cpu.system,
                                             &information_cpu.idle);}
    else if ( that_flag == 1 ){
        sscanf(buffer_file, "%s %u %u %u %u",
                                              buffer_cpu.name,
                                             &buffer_cpu.user,
                                             &buffer_cpu.nice,
                                             &buffer_cpu.system,
                                             &buffer_cpu.idle);}
    fclose(that_file);}
