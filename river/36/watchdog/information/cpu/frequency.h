void information_CPU_frequency_get() {

    char  that_file[1025];
    char  that_result[1025];
    char* buffer_file;
    char* point_file;


    file_get("/proc/cpuinfo", that_file);




    if      ( strstr(that_file, "cpu MHz")  != NULL ) {

        strcpy( buffer_file, strstr(that_file,   "cpu MHz") );
        strcpy( buffer_file, strstr(buffer_file, ": ")+2 );
                            *strchr(buffer_file, '\n') = '\0';
        information_cpu.frequency = atoi(buffer_file);}

    else if ( strstr(that_file, "BogoMIPS") != NULL ) {

        strcpy( buffer_file, strstr(that_file,    "BogoMIPS") );
        strcpy( buffer_file, strstr(buffer_file, ": ")+2 );
                            *strchr(buffer_file, '\n') = '\0';
        information_cpu.frequency = atoi(buffer_file);}

    else {



        cmd_get("lscpu | grep MHz", that_result);

        if ( strstr(that_result, "\n") != NULL ) {

           *strchr( that_result, '\n') = '\0';

            sscanf( that_result, "%s %s %s %s", that_file, that_file, that_file, that_result );

            information_cpu.frequency = atoi(that_result);}}}
