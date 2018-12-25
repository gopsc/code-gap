
void note_clear(const char* that_name ) {

    char           that_path[129];



    strcpy(that_path, path_the);
    strcat(that_path, "/gop/note/");
    strcat(that_path, that_name);
    strcat(that_path, ".note");

    file_save(that_path, "");}

