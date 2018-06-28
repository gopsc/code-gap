
void* info_system_get(){

    char that_result[129];

    cmd_get("uname -s", that_result);
    strcpy(information_system, that_result);}
