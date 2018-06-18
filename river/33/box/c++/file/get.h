void file_get(const char* that_path, char* that_result) {

    FILE *fp                = NULL;
    char  that_buffer[10];
          that_result[0]    = '\0';





    if ( is_file(that_path) ) {

        fp = fopen(that_path, "r");

        while( fgets(that_buffer, 10, (FILE*)fp) != NULL ) {
            strcat(that_result, that_buffer);}

        fclose(fp);}}



/*
//c++

string file_get(string path_file) {

    ifstream    file;
    string      that;
    char        that_one;

    file.open(path_file.c_str());

    while(!file.eof()) {
        file.read(&that_one, 1);
        that += that_one;}

    file.close();


    that = that.substr(0, that.length()-1);

    return that;}
*/
