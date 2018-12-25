
void* information_name_get(){

    char buffer_result[129];

    commandline_get("uname -n",              buffer_result);
    strcpy         (information_system.name, buffer_result);}
