
bool is_file(const char *that_path){

    struct stat that_stat;


    if ( lstat(that_path, &that_stat) == 0 ) {
        return true;}

    else {
        return false;}}


// access
