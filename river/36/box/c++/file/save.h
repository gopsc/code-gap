
void file_save(const char* that_path, const char* that_words) {


    FILE* that_file;
    int   that_count         = 1;
    char  buffer_path[1024];
    char* pointer_path;




    while ( that_count != 0 ) {

        strcpy(buffer_path, that_path);
        pointer_path = buffer_path;



        for ( int i=0; i<that_count; i++ ) {

            pointer_path = strstr(pointer_path + 1, "/");

            if ( pointer_path == NULL ) {
                that_count = 0;}}

        if ( that_count != 0 ) {
            that_count++;
           *pointer_path = '\0';

          if ( !is_dir(buffer_path) ) {
              mkdir(buffer_path, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);}}}




    that_file = fopen( that_path, "w" );

    fprintf( that_file, that_words );

    fclose( that_file );}




/*
// The way of c++ stream
    ofstream fout(that_path.c_str());

    fout << words;

    fout.close();}
*/
