
void* load_listen() {

    printf("LOAD LISTEN...\n");






    char that_path[129];
    char that_name[129];
    char that_file[129];
    char that_word[10240];




// ~/sound/listen/word/number/w/t

    strcpy(that_path, path_the);
    strcat(that_path, "/");
    strcat(that_path, name_the);
    strcat(that_path, "/sound/listen/word");

    int   num_step;
    char* that_pointer;
    char  that_buffer[10240];








    do {

        gcvt(num_listen, 10, that_buffer);

        strcpy(that_name, that_path);
        strcat(that_name, "/");
        strcat(that_name, that_buffer);

        num_listen++;


        if ( is_dir(that_name) ) {

            printf("%s\n", that_name);

            for ( int w=1; w<=N; w++) {

                gcvt(w, 10, that_buffer);

                strcpy(that_file, that_name);
                strcat(that_file, "/");
                strcat(that_file, that_buffer);
                strcat(that_file, ".w");



                if ( is_file(that_file) ) {

                    file_get(that_file, that_word);

                    num_step     = 1;

                    do {

                                       strcpy( that_buffer, that_word );
                        that_pointer = strchr( that_buffer, '\n' );

                        if ( that_pointer != NULL ) {

                           *that_pointer                           = '\0';
                            buffer_listen[num_listen][w][num_step] = atoi(that_buffer);

                            strcpy( that_word,   that_pointer + 1 );
                            num_step++;}

                  } while ( that_pointer != NULL );}}}

  } while ( is_dir(that_name) );}
