
int information_name_get() {

    char buffer_result[129];


    commandline_get("uname -n",              buffer_result);

   *strchr         (buffer_result,             '\n'       ) = '\0';
    strcpy         (information_system.name, buffer_result);

    return 1;}
