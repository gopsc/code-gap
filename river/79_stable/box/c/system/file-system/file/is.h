
int is_file( const char *that_path ){

    struct stat buffer_status;


    if ( lstat(that_path, &buffer_status) == 0 ) {
        return 1;}

    else {
        return 0;}}