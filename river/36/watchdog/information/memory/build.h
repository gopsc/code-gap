
void information_memory_get(){


    FILE* that_file             = fopen("/proc/meminfo", "r");
    char  buffer_result[1025];


    fgets (buffer_result, sizeof(buffer_result), that_file);
    sscanf(buffer_result, "%s %u %s",     information_memory.name1, &information_memory.total, information_memory.name2);

    fgets (buffer_result, sizeof(buffer_result), that_file);
    sscanf(buffer_result, "%s %u",        information_memory.name2, &information_memory.free);

    fclose(that_file);}












