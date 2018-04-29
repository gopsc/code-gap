
void file_save(
                  const char* that_path,
                  const char* that_words
              ) {


    FILE* buffer_file;
    int   buffer_count         = 1;
    char  buffer_path[1024];
    char* pointer_path;




    while ( buffer_count != 0 ) {

        strcpy(buffer_path, that_path);
        pointer_path = buffer_path;


        int i;
        for ( i = 0; i < buffer_count; i++ ) {

            pointer_path = strstr(pointer_path + 1, "/");

            if ( pointer_path == NULL ) {
                buffer_count = 0;}}

        if ( buffer_count != 0 ) {
            buffer_count++;
           *pointer_path = '\0';

          if ( !is_dirent(buffer_path) ) {
              mkdir(buffer_path, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);}}}




    buffer_file = fopen( that_path, "w" );

    fprintf( buffer_file, "%s", that_words );

    fclose( buffer_file );}




/*
// The way of c++ stream
    ofstream fout(that_path.c_str());

    fout << words;

    fout.close();}
*/
