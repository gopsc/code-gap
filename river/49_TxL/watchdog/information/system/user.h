
void* information_user_get(){

    char that_result[129];

    commandline_get("whoami", that_result);
    strcpy(information_user, that_result);}
