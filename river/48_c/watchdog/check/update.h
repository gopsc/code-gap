
void check_update() {


    char    buffer_path[65];
    char    buffer_commandline[65];

    strcpy(buffer_path,        path_the);
    strcat(buffer_path,        "/");
    strcat(buffer_path,        "downloads");

    strcpy(buffer_commandline, "rm -rf ");
    strcat(buffer_commandline, buffer_path);


    if ( is_dirent(buffer_path) ) {

        commandline_get(buffer_commandline, buffer_path);}}