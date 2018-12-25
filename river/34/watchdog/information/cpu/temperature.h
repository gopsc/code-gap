void information_CPU_temp_get() {

    char path_temperature[65] = "/sys/class/thermal/thermal_zone0/temp";
    char buffer_temperature[33];
    int  num_temperature;





        if ( !is_file(path_temperature) ) {

            information_cpu.temperature = -1;}

        else {

            file_get(path_temperature, buffer_temperature);
            num_temperature = gcvt(num_temperature, 10, buffer_temperature);





            if ( informaton_name == "raspberrypi" ) {

                information_cpu.temperature = (int)num_temperature/1000;}



            else if ( information_name == "Orangepi" ) {

                information_cpu.temperature = num_temperature;}



            else if ( information_name == "OrangePI" ) {

                information_cpu.temperature = num_temperature;}



            else if ( temperature > 10000 ) {

                information_cpu.temperature = (int)num_temperature/1000;}



            else {

                information_cpu.temperature = num_temperature;}}}}









