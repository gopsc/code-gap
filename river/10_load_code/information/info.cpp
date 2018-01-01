//---------------------------------------------------
string shell_get(char* commands){
    FILE *read;
    char that[60];

    read = popen(commands, "r");
    if (read != NULL){
        fread(that, sizeof(char), 20, read);
        pclose(read);
    string that2 = (string)that;

    return that2.substr(0, that2.find('\n'));}}
//----------------------------------------------------
void* info_name_get(){
    char that[9] = "uname -n";
    info_name = shell_get(that);}
//----------------------------------------------------
void* info_system_get(){
    char that[9] = "uname -s";
    info_system = shell_get(that);}
//----------------------------------------------------
void info_memory_get(){
    int n;
    FILE* fd;
    char buffer[256];

    fd = fopen("/proc/meminfo","r");
    fgets (buffer, sizeof(buffer), fd);
    sscanf(buffer, "%s %u %s", info_memory.name1, &info_memory.total, info_memory.name2);
    fgets (buffer, sizeof(buffer), fd);
    sscanf(buffer, "%s %u", info_memory.name2, &info_memory.free);
    fgets (buffer, sizeof(buffer), fd);
    fgets (buffer, sizeof(buffer), fd);
    sscanf(buffer, "%s %u %s", info_memory.name3, &info_memory.buffers, info_memory.name4);
    fgets (buffer, sizeof(buffer), fd);
    sscanf (buffer, "%s %u",info_memory.name4, &info_memory.cached);

    fclose(fd);}
//----------------------------------------------------
/*
void info_ip_get () {

    int point_buffer_ip  = 0;
    int point_buffer_ip6 = 0;
    string buffer_ip[5][1];
    string buffer_ip6[5][1];

    struct ifaddrs * ifAddrStruct=NULL;
        getifaddrs(&ifAddrStruct);
    void * tmpAddrPtr=NULL;


    while (ifAddrStruct!=NULL) {
        if (ifAddrStruct->ifa_addr->sa_family==AF_INET){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, tmpAddrPtr, addressBuffer, INET_ADDRSTRLEN);
                if (ifAddrStruct->ifa_name != "lo") {
                    buffer_ip[point_buffer_ip][0] = ifAddrStruct->ifa_name;
                    buffer_ip[point_buffer_ip][1] = addressBuffer;
                    point_buffer_ip++;   }}

        else if (ifAddrStruct->ifa_addr->sa_family==AF_INET6){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET6_ADDRSTRLEN];
            inet_ntop(AF_INET6, tmpAddrPtr, addressBuffer, INET6_ADDRSTRLEN);
                if (ifAddrStruct->ifa_name != "lo") {
                    buffer_ip6[point_buffer_ip6][0] = ifAddrStruct->ifa_name;
                    buffer_ip6[point_buffer_ip6][1] = addressBuffer;
                    point_buffer_ip6++;   }}
        ifAddrStruct=ifAddrStruct->ifa_next;}}
*/

struct OCCUPY_CPU buffer_cpu;
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
//-------------------------------------------------------------------------
void* info_cpu_get(){

    info_CPU_get(0);
    sleep(1);
    info_CPU_get(1);
//--------------------------------------------------------------------------
    std::string that;
    int temperature;
    char that1[52] = "cat /sys/class/thermal/thermal_zone0/temp";
    that = shell_get(that1);

    std::stringstream ss;
    ss << that;
    ss >> temperature;

    if (!ss.good()){
        temperature = atoi(that.c_str());}

    info_cpu.temperature = (int)temperature/1000;
//--------------------------------------------------------------------------
    //that2[31] = "lscpu | grep 'max' | sort|uniq";
    FILE *INFO_cpu;
    char buffer[128];

    INFO_cpu = fopen("/proc/cpuinfo","r");
    fgets(buffer, sizeof(buffer), INFO_cpu);
    fgets(buffer, sizeof(buffer), INFO_cpu);
    fgets(buffer, sizeof(buffer), INFO_cpu);

    that = (string)buffer;
    that = that.substr(that.find(":")+2, that.length()-1);
    info_cpu.f = atoi(that.c_str());
//--------------------------------------------------------------------------
    unsigned long od, nd;
    unsigned long id, sd;
    int cpu_use = 0;

    od = (unsigned long)(info_cpu.user + info_cpu.nice + info_cpu.system + info_cpu.idle);
    nd = (unsigned long)(buffer_cpu.user + buffer_cpu.nice + buffer_cpu.system + buffer_cpu.idle);

    id = (unsigned long)(buffer_cpu.user - info_cpu.user);
    sd = (unsigned long)(buffer_cpu.system - info_cpu.system);

    if((nd-od) != 0)
        cpu_use = ((sd+id)* 100)/(nd-od);
    else
        cpu_use = 0;

    info_cpu.rate = cpu_use;}
//----------------------------------------------------
void info_sound_get(){
           DIR    *dir;
    struct dirent *ptr;
    dir = opendir("/dev/snd");

    string that;
    string that2;
    int point_c=0, point_p=0;

    while ((ptr = readdir(dir)) != NULL){
        that = ptr->d_name;

        if (that.find("pcm") == 0){
           that = that.substr(that.find("pcm")+3, that.length());
           if (that[4] == 'c') {
               point_c++;
               that2 = "hw:";
               that2 += that[1];
               that2 += ',';
               that2 += that[3];
               info_sound[1][point_c] = that2;}
           else if (that[4] == 'p') {
               point_p++;
               that2 = "hw:";
               that2 += that[1];
               that2 += ',';
               that2 += that[3];
               info_sound[2][point_p] = that2;}}}
    point_capture = point_c;
    point_playback= point_p;
    closedir(dir);}
//----------------------------------------------------
void* gop_info(void*){
    while(true){
        info_name_get();
        info_system_get();
        info_memory_get();
        info_cpu_get();
        info_sound_get();

        flag_info = true;}}
