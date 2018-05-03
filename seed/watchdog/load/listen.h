
int load_listen() {

    output_print( "string", "Load listen...\n" );






    char buffer_path[129];
    char buffer_name[129];
    char buffer_file[129];
    char buffer_word[10240];




// ~/listen/word/number/w/t

    strcpy(buffer_path, path_the   );
    strcat(buffer_path, "/"        );
    strcat(buffer_path, name_data  );
    strcat(buffer_path, "/word"    );

    int   number_step;
    char* buffer_pointer;
    char  buffer_buffer[10240];








    do {

        snprintf(buffer_buffer, sizeof(buffer_buffer) / sizeof(char) - 1, "%d", number_listen);

        strcpy(buffer_name, buffer_path);
        strcat(buffer_name, "/");
        strcat(buffer_name, buffer_buffer);

        number_listen++;


        if ( is_dirent(buffer_name) ) {

            output_print( "string",  buffer_name );
            output_print( "string", "\n"         );

            int w;
            for ( w=1; w<=N; w++) {

                snprintf(buffer_buffer, sizeof(buffer_buffer) / sizeof(char) - 1, "%d", w);

                strcpy(buffer_file, buffer_name);
                strcat(buffer_file, "/");
                strcat(buffer_file, buffer_buffer);
                strcat(buffer_file, ".w");



                if ( is_file(buffer_file) ) {

                    file_get(buffer_file, buffer_word);

                    number_step     = 1;

                    do {

                                         strcpy( buffer_buffer, buffer_word );
                        buffer_pointer = strchr( buffer_buffer, '\n' );

                        if ( buffer_pointer != NULL ) {

                           *buffer_pointer                           = '\0';
                            buffer_listen[number_listen][w][number_step] = atoi(buffer_buffer);

                            strcpy( buffer_word,   buffer_pointer + 1 );
                            number_step++;}

                  } while ( buffer_pointer != NULL );}}}

  } while ( is_dirent(buffer_name) );}
