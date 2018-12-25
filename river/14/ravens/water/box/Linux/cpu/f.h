void info_CPU_f_get() {

    std::string that;
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
        info_cpu.f = 0;}}



