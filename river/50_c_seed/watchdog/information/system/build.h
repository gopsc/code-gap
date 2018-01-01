
void* information_system_get(){

    char that_result[129];

    commandline_get("uname -s", that_result);
    strcpy(information_system, that_result);}
