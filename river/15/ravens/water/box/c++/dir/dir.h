/*
#include <dirent.h> 
DIR *opendir(const char *dirname); 
struct dirent *readdir(DIR *dirp); 
int closedir(DIR *dirp);

struct dirent
{
#ifndef __USE_FILE_OFFSET64
    __ino_t d_ino;
    __off_t d_off;
#else
    __ino64_t d_ino;
    __off64_t d_off;
#endif
    unsigned short int d_reclen;
    unsigned char d_type;
    char d_name[256];
};

enum
{
    DT_UNKNOWN = 0,     //未知类型
# define DT_UNKNOWN DT_UNKNOWN
    DT_FIFO = 1,        //管道
# define DT_FIFO DT_FIFO
    DT_CHR = 2,         //字符设备文件
# define DT_CHR  DT_CHR
    DT_DIR = 4,         //目录
# define DT_DIR  DT_DIR
    DT_BLK = 6,         //块设备文件
# define DT_BLK  DT_BLK
    DT_REG = 8,         //普通文件
# define DT_REG  DT_REG
    DT_LNK = 10,        //连接文件
# define DT_LNK  DT_LNK
    DT_SOCK = 12,       //套接字类型
# define DT_SOCK DT_SOCK
    DT_WHT = 14         //
# define DT_WHT  DT_WHT
};
*/

bool is_dir(const char *path){
    struct stat statbuf;
    if(lstat(path, &statbuf) ==0){
        return S_ISDIR(statbuf.st_mode) != 0;}
    return false;}

bool is_file(const char *path){
    struct stat statbuf;
    if(lstat(path, &statbuf) ==0)
        return S_ISREG(statbuf.st_mode) != 0;
    return false;}

bool is_special_dir(const char *path){
    return strcmp(path, ".") == 0 || strcmp(path, "..") == 0;}

void get_file_path(const char *path, const char *file_name,  char *file_path){
    strcpy(file_path, path);
    if(file_path[strlen(path) - 1] != '/')
        strcat(file_path, "/");
    strcat(file_path, file_name);}

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









