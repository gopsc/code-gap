
void* information_user_get(){

    char buffer_result[129];

    commandline_get("whoami",                buffer_result);
    strcpy         (information_system.user, buffer_result);}
