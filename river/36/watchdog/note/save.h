
void note_save(const char* that_name, const char* that_words ) {

    time_t         time_now            = time(NULL);
    char           that_time[3][129];
    char*        buffer_time;
    char           that_path[1025];
    struct timeval time_test;





    gettimeofday( &time_test, NULL );

    gcvt(         time_test.tv_sec,          10, that_time[1] );
    gcvt( (double)time_test.tv_usec/1000000, 10, that_time[2] );

    buffer_time = that_time[2]+1;

    strcat( that_time[1], buffer_time );






    strcpy(that_path, path_the);
    strcat(that_path, "/gop/note/");
    strcat(that_path, that_name);
    strcat(that_path, ".note");

    file_append(that_path, that_time[1]);
    file_append(that_path, "\n");
    file_append(that_path, that_words);
    file_append(that_path, "\n\n");}

