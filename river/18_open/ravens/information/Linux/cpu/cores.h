void info_CPU_cores_get() {

    int    num        = 0;
    int    num_step   = 0;
    string that       = "\n";
           that      += file_get("/proc/cpuinfo");
    string This       = "\n";
           This      += "processor";

    num_step   = that.find(This);

    while( num_step != -1 ) {

        num++;
        that     = that.substr(num_step+9, that.length());
        num_step = that.find(This);}

    info_cpu.cores = num;}

