string               info_system;
void* info_system_get(){
    char that[9] = "uname -s";
    info_system = shell_get(that);}

