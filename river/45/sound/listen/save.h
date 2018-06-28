
void listen_save( int site ) {





    char   buffer_name[65];
    strcpy(buffer_name, path_the);
    strcat(buffer_name, "/");
    strcat(buffer_name, name_the);
    strcat(buffer_name, "/sound/listen/word/");

    char buffer_file[65];
    char buffer_number[33];
    char buffer_word[204800];


    for ( int w=1; w<=N; w++ ) {

        strcpy(buffer_file,      buffer_name  );
        gcvt  (number_listen, 2, buffer_number);
        strcat(buffer_file,      buffer_number);
        strcat(buffer_file,      "/"          );
        gcvt  (number_listen, 2, buffer_number);
        strcat(buffer_file,      buffer_number);
        strcat(buffer_file,      ".w"         );

        strcpy(buffer_word, "");

        for ( int t=1; t<=site; t++ ) {

            gcvt  (result_ft[t][w], 2, buffer_number);
            strcat(buffer_word,        buffer_number);
            strcat(buffer_word,        "\n"         );}

        file_save(buffer_file, buffer_word);}}