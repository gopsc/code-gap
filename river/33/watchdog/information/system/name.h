
void* info_name_get(){

    char that_result[129];

    cmd_get("uname -n", that_result);
    strcpy(information_name, that_result);}
