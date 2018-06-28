
bool is_dir(const char *that_path){


    struct stat   that_stat;




    if ( lstat(that_path, &that_stat) ==0 ) {

        return S_ISDIR(that_stat.st_mode) != 0;}

    return false;}



bool is_special_dir(const char *that_path){

    return strcmp(that_path, ".") == 0 || strcmp(that_path, "..") == 0;}
