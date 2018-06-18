
void* information_system_get(){

    char buffer_result[129];

    commandline_get("uname -s",                buffer_result);
    strcpy         (information_system.system, buffer_result);}
