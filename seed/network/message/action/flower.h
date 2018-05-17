



int action_flower(

                     const char* that_type

                 ) {



    char            buffer_commandline  [129];
    char            buffer_file         [129];
    char            buffer_result       [102400];

    strcpy         (buffer_file,        path_the    );
    strcat         (buffer_file,        "/flower.c" );



    if      (    strcmp(that_type,          "base"      ) == 0) {

        strcpy         (buffer_commandline, "gcc "      );
        strcat         (buffer_commandline, buffer_file );
        strcat         (buffer_commandline, " -lm"      );
        strcat         (buffer_commandline, " -lpthread");
        strcat         (buffer_commandline, " -o"       );
        strcat         (buffer_commandline, " "         );
        strcat         (buffer_commandline, path_the    );
        strcat         (buffer_commandline, "/../?"     );}

    else if (    strcmp(that_type,          "alsa"      ) == 0) {

        strcpy         (buffer_commandline, "gcc "      );
        strcat         (buffer_commandline, buffer_file );
        strcat         (buffer_commandline, " -lm"      );
        strcat         (buffer_commandline, " -lpthread");
        strcat         (buffer_commandline, " -lasound" );
        strcat         (buffer_commandline, " -o"       );
        strcat         (buffer_commandline, " "        );
        strcat         (buffer_commandline, path_the    );
        strcat         (buffer_commandline, "/../?"     );}


    commandline_get(buffer_commandline, buffer_result);

    remove(buffer_file);


    return 1;}
