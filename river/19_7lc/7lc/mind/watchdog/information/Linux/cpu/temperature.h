void info_CPU_temp_get() {
    int temperature;
    std::string that;

    fstream that2;


    if ( !is_file((char*)path_temperature.c_str()) ) {
        info_cpu.temperature = -1;}
    else {
        that = cmd_get(cmd_temperature);
        std::stringstream ss;
        ss << that;
        ss >> temperature;

        if (!ss.good()){
            temperature = atoi(that.c_str());}










        if ( info_name == "raspberrypi" ) {
            info_cpu.temperature = (int)temperature/1000;}




        else if ( info_name == "OrangePI" ) {
            info_cpu.temperature = temperature;}




        else if ( temperature > 10000 ) {
            info_cpu.temperature = (int)temperature/1000;}




        else {
            info_cpu.temperature = temperature;}}}









