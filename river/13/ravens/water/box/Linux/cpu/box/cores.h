void info_CPU_cores_get() {

    char that2[45] = "cat /proc/cpuinfo | grep 'cores' | sort|uniq";
    std::string that = shell_get(that2);

    if (that == "") {
        info_cpu.cores = 1;}
    else {
        that = that.substr(that.length()-1, that.length());
        if (that == "") {
            info_cpu.cores = 1;}
        else {
            info_cpu.cores = atoi(that.c_str());}}}

