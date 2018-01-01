void information_CPU_temperature_get() {

    char   path_temperature[65] = "/sys/class/thermal/thermal_zone0/temp";
    char buffer_temperature[33];
    int  number_temperature    ;


    if ( !is_file(path_temperature) ) {

        information_cpu.temperature = -1;}

    else {

        file_get(path_temperature, buffer_temperature);

        number_temperature = atoi(buffer_temperature);


        if      ( strcmp(information_system.name, "raspberrypi") == 0 ) {

            information_cpu.temperature = (int)number_temperature/1000;}


        else if ( strcmp(information_system.name, "Orangepi"   ) == 0 ) {

            information_cpu.temperature = number_temperature;}


        else if ( strcmp(information_system.name, "OrangePI"   ) == 0 ) {

            information_cpu.temperature = number_temperature;}


        else if ( number_temperature > 10000 ) {

            information_cpu.temperature = (int)number_temperature/1000;}


        else {

            information_cpu.temperature = number_temperature;}}}