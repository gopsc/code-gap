
void information_CPU_frequency_get() {

    char  that_file[10240];
    char  that_result[129];




    file_get("/proc/cpuinfo", that_file);

    if      ( strstr(that_file, "cpu MHz")  != NULL ) {

        strcpy( that_file, strstr(that_file,   "cpu MHz") );
        strcpy( that_file, strstr(that_file, ": ")+2 );
                          *strchr(that_file, '\n') = '\0';
        information_cpu.frequency = atoi(that_file);}

    else if ( strstr(that_file, "BogoMIPS") != NULL ) {

        strcpy( that_file, strstr(that_file,   "BogoMIPS") );
        strcpy( that_file, strstr(that_file, ": ")+2 );
                          *strchr(that_file, '\n') = '\0';
        information_cpu.frequency = atoi(that_file);}

    else if ( strstr(that_file, "Bogomips") != NULL ) {

        strcpy( that_file, strstr(that_file,   "Bogomips") );
        strcpy( that_file, strstr(that_file, ": ")+2 );
                          *strchr(that_file, '\n') = '\0';
        information_cpu.frequency = atoi(that_file);}

    else {

        commandline_get("lscpu | grep 'cpu max MHz'", that_result);

        if ( strstr(that_result, "\n") != NULL ) {

           *strchr( that_result, '\n') = '\0';

            sscanf( that_result, "%s %s %s %s", that_file, that_file, that_file, that_result );

            information_cpu.frequency = atoi(that_result);}}}
