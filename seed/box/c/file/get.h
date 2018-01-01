
void file_get(
                 const char* that_path,
                       char* that_result
             ) {



    FILE *buffer_file         = NULL;
    char  that_buffer[128];






    strcpy( that_result, "" );

    if ( is_file(that_path) ) {

        buffer_file = fopen(that_path, "r");


        while( fgets(that_buffer, 128, (FILE*)buffer_file) != NULL ) {

//            if ( sizeof(that_result) - strlen(that_result) >= 128 ) {

//                break;}

//            else {

                strcat(that_result, that_buffer);}//}

        fclose(buffer_file);}}



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
