
void* info_CPU_get(int flag){
    FILE *fd;
    int n;
    char buffer[256];

    int that;

    fd = fopen("/proc/stat","r");
    fgets(buffer, sizeof(buffer), fd);

    if (flag == 0){
        sscanf(buffer,"%s %u %u %u %u",
               info_cpu.name, &info_cpu.user, &info_cpu.nice, &info_cpu.system, &info_cpu.idle);}
    else if (flag == 1){
        sscanf(buffer,"%s %u %u %u %u",
            buffer_cpu.name, &buffer_cpu.user, &buffer_cpu.nice, &buffer_cpu.system, &buffer_cpu.idle);}
    fclose(fd);}






