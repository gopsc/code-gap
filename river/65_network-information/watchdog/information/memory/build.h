
void information_memory_get(){


    FILE* that_file             = fopen("/proc/meminfo", "r");
    char  buffer_result[1025];
    char  buffer_name[33];


    fgets (buffer_result, sizeof(buffer_result), that_file);
    sscanf(buffer_result, "%s %lu %s",     buffer_name, &information_memory.total, buffer_name);

    fgets (buffer_result, sizeof(buffer_result), that_file);
    sscanf(buffer_result, "%s %lu",        buffer_name, &information_memory.free);

    fclose(that_file);}












