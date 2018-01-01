string info_time;

void info_time_get() {
    time_t that;
    time(&that);   

    struct tm * that2;
    that2 = gmtime(&that);

    info_time = ctime(&that); }



