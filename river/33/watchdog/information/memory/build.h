
void info_memory_get(){


    FILE* fd         = fopen("/proc/meminfo", "r");
    char  buffer_result[256];


    fgets (buffer_result, sizeof(buffer_result), fd);
    sscanf(buffer_result, "%s %u %s",     information_memory.name1, &information_memory.total, information_memory.name2);

    fgets (buffer_result, sizeof(buffer_result), fd);
    sscanf(buffer_result, "%s %u",        information_memory.name2, &information_memory.free);

    fclose(fd);}












