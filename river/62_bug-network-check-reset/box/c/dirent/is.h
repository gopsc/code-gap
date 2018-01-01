
int is_dirent(const char *that_path){


    struct stat   buffer_status;




    if ( lstat(that_path, &buffer_status) == 0 ) {

        return S_ISDIR(buffer_status.st_mode) != 0;}

    return 0;}



int is_special_dir(const char *that_path){

    return strcmp(that_path, ".") == 0 || strcmp(that_path, "..") == 0;}
