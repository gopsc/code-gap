string               info_name;
void* info_name_get(){
    char that[9] = "uname -n";
    info_name = shell_get(that);}



