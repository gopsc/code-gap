
void file_save(const char* that_path, const char* that_words) {


    FILE* fp;
    int   that_count         = 1;
    char  buffer_path[1024];
    char* point_path;




    while ( that_count != 0 ) {

        strcpy(buffer_path, that_path);
        point_path = buffer_path;



        for (int i=0; i<that_count; i++) {

            point_path = strstr(point_path + 1, "/");

            if ( point_path == NULL ) {
                that_count = 0;}}

        if ( that_count != 0 ) {
            that_count++;
           *point_path = '\0';

          if ( !is_dir(buffer_path) ) {
              mkdir(buffer_path, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);}}}




    fp = fopen( that_path, "w" );

    fprintf( fp, that_words );

    fclose( fp );}




/*
    ofstream fout(that_path.c_str());

    fout << words;

    fout.close();}
*/
