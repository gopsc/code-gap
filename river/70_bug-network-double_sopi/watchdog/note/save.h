
void note_save(
                const char* that_name,
                const char* that_words,
                const char* target_time ) {


           char    that_time[3][129];
           char    that_path[1025];
    struct timeval time_now;




    if ( strcmp(target_time, "now") == 0 ) {

        gettimeofday( &time_now, NULL );

        gcvt(         time_now.tv_sec,          10, that_time[1] );
        gcvt( (double)time_now.tv_usec/1000000, 10, that_time[2] );

        strcat( that_time[1], that_time[2]+1 );}

    else {

        strcpy( that_time[1], target_time );}





    strcpy(that_path, path_the      );
    strcat(that_path, "/"           );
    strcat(that_path, name_data     );
    strcat(that_path, "/note/");
    strcat(that_path, that_name     );
    strcat(that_path, ".note"       );

    file_append(that_path, "\n\n");
    file_append(that_path, that_time[1]);
    file_append(that_path, "\n");
    file_append(that_path, that_words);}

