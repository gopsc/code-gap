
bool is_dir(const char *path){


    struct stat statbuf;

    if ( lstat(path, &statbuf) ==0 ) {

        return S_ISDIR(statbuf.st_mode) != 0;}

    return false;}



bool is_special_dir(const char *path){

    return strcmp(path, ".") == 0 || strcmp(path, "..") == 0;}
