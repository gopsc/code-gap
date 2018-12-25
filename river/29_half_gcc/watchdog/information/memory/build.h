
void info_memory_get(){
    int n;
    FILE* fd;
    char buffer[256];

    fd = fopen("/proc/meminfo","r");

    fgets (buffer, sizeof(buffer), fd);
    sscanf(buffer, "%s %u %s", info_memory.name1, &info_memory.total, info_memory.name2);

    fgets (buffer, sizeof(buffer), fd);
    sscanf(buffer, "%s %u", info_memory.name2, &info_memory.free);

    fclose(fd);}












