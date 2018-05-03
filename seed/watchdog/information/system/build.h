
int information_system_get() {

    char buffer_result[129];


    commandline_get("uname -s",                buffer_result);

   *strchr         (buffer_result,             '\n'         ) = '\0';
    strcpy         (information_system.system, buffer_result);

    return 1;}
