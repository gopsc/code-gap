struct OCCUPY_CPU{
             char name[20];
    unsigned int  user;
    unsigned int  nice;
    unsigned int  system;
    unsigned int  idle;

              int cores;
              int f;
              int temperature;
    unsigned int  rate;};

struct OCCUPY_CPU    info_cpu;
struct OCCUPY_CPU    buffer_cpu;

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
    int temperature;
    std::string that;

    fstream temp;
    temp.open("/sys/class/thermal/thermal_zone0/temp",ios::in);
    if(!temp){
        temperature = 0;}
    else {
        char that1[52] = "cat /sys/class/thermal/thermal_zone0/temp";
        that = shell_get(that1);
        std::stringstream ss;
        ss << that;
        ss >> temperature;

        if (!ss.good()){
            temperature = atoi(that.c_str());}
        info_cpu.temperature = (int)temperature/1000;}
    temp.close();
//--------------------------------------------------------------------------

    char that2[45] = "cat /proc/cpuinfo | grep 'cores' | sort|uniq";
    that = shell_get(that2);

    if (that == "") {
        info_cpu.cores = 1;}
    else {
        that = that.substr(that.length()-1, that.length());
        if (that == "") {
            info_cpu.cores = 1;}
        else {
            info_cpu.cores = atoi(that.c_str());}}

//--------------------------------------------------------------------------

    int that_num;
    that = file_get("/proc/cpuinfo");

    if      ( (that_num = that.find("cpu MHz")) >= 0 ) {
        that = that.substr(that_num, that.find('\n')+5);
        that = that.substr(that.find(": ")+2, that.find('\n'));
        info_cpu.f = atoi(that.c_str());}
    else if ( (that_num = that.find("BogoMIPS")) >= 0 ) {
        that = that.substr(that_num, that.find('\n')+5);
        that = that.substr(that.find(": ")+2, that.find('\n'));
        info_cpu.f = atoi(that.c_str());}
    else {
        info_cpu.f = 0;}
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


