
void* information_user_get(){

    char buffer_result[129];

    commandline_get("whoami",                buffer_result);
   *strchr         (buffer_result,             '\n'       ) = '\0';
    strcpy         (information_system.user, buffer_result);}
