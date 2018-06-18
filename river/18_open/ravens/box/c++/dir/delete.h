

void dir_delete(const char *path){
    DIR *dir;
    dirent *dir_info;
    char file_path[PATH_MAX];
    if(is_file(path)){
        remove(path);
        return;}
    if(is_dir(path)){
        if((dir = opendir(path)) == NULL)
            return;
        while((dir_info = readdir(dir)) != NULL){
            get_file_path(path, dir_info->d_name, file_path);
            if(is_special_dir(dir_info->d_name))
                continue;
            dir_delete(file_path);
            rmdir(file_path);}}
    rmdir(path);}

