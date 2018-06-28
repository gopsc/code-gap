
bool is_file(const char *path){

    struct stat statbuf;

    if (lstat(path, &statbuf) ==0) {
        return true;}


    else {
        return false;}}


// access
