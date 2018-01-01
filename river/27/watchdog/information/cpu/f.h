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
        that = cmd_get("INFORMATION_F", "lscpu | grep MHz");
        while ( that.find(" ")  <  that.find("\n") ) {
            that = that.substr(that.find(" ")+1, that.find("\n"));}
        info_cpu.f = atoi(that.c_str());}}









