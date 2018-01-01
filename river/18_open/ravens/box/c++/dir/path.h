
void get_file_path(const char *path, const char *file_name,  char *file_path){
    strcpy(file_path, path);
    if(file_path[strlen(path) - 1] != '/')
        strcat(file_path, "/");
    strcat(file_path, file_name);}
