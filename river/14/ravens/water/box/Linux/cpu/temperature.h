void info_CPU_temp_get() {
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
    temp.close();}



