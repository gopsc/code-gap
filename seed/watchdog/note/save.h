
int note_save(

                 const char* that_name,
                 const char* that_words,
                 const char* target_time

             ) {




           char    that_time[3][128];
           char    that_path[128];

    struct timeval time_now;





    if ( strcmp(target_time, "now") == 0 ) {



        gettimeofday( &time_now, NULL );

        snprintf( that_time[1], sizeof(that_time[1]) / sizeof(char) -1, "%ld", time_now.tv_sec );
        snprintf( that_time[2], sizeof(that_time[2]) / sizeof(char) -1, "%ld", time_now.tv_usec);

        strcat( that_time[1], "."          );
        strcat( that_time[1], that_time[2] );}



    else {


        strcpy( that_time[1], target_time );}







    strcpy(that_path, path_the      );
    strcat(that_path, "/"           );
    strcat(that_path, name_data     );

    strcat(that_path, "/0/");

    strcat(that_path, that_name     );
    strcat(that_path, ".note"       );


    file_append(that_path, "\n\n");

    file_append(that_path, that_time[1]);
    file_append(that_path, "\n");

    file_append(that_path, that_words);



    return 1;}
