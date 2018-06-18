
void* information_CPU_get( int that_flag ) {

           FILE*      fd                   = fopen("/proc/stat", "r");
           char       buffer_file[1025];
    struct gopi_cpu   buffer_cpu;



    fgets( buffer_file, sizeof(buffer_file), fd );

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
    fclose(fd);}
