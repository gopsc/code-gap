
int note_save(

                 const char* that_name,
                 const char* that_words,
                 const char* target_time

             ) {


// Prepare

           char    that_time[3][128];
           char    that_path[128];

    struct timeval time_now;




// judgement the time
// i will note

    if ( strcmp(target_time, "now") == 0 ) {

// Get the  time
//     this time

        gettimeofday( &time_now, NULL );

        snprintf( that_time[1], sizeof(that_time[1]) / sizeof(char) -1, "%ld", time_now.tv_sec );
        snprintf( that_time[2], sizeof(that_time[2]) / sizeof(char) -1, "%ld", time_now.tv_usec);

        strcat( that_time[1], "."          );
        strcat( that_time[1], that_time[2] );}



    else {

// Use the time recived

        strcpy( that_time[1], target_time );}





// Prepare the path

    strcpy(that_path, path_the      );
    strcat(that_path, "/"           );
    strcat(that_path, name_data     );

    strcat(that_path, "/0/");

    strcat(that_path, that_name     );
    strcat(that_path, ".note"       );



// Append the file

    file_append(that_path, "\n\n");

    file_append(that_path, that_time[1]);
    file_append(that_path, "\n");

    file_append(that_path, that_words);



    return 1;}
