
void note_save(const char* that_name, const char* that_words ) {

    time_t time_now         = time(NULL);
    char   that_time[1024];
    char   that_path[1024];

    transform_int_string(time_now, that_time, 10);

    strcpy(that_path, path_the);
    strcat(that_path, "/gop/note/");
    strcat(that_path, that_name);
    strcat(that_path, ".note");

    file_append(that_path, that_time);
    file_append(that_path, "\n");
    file_append(that_path, that_words);
    file_append(that_path, "\n\n");}

