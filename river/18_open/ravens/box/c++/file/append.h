void file_append(string file_name, string words) {

    int    status;
    int    that = 0;
    string  that_path;

    while (that != -1) {
        that      = file_name.find('/', that+1);
        that_path = file_name.substr(0, that);

        if ( that_path.find('.', 1) == -1) {
            status    = mkdir(that_path.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);}}


    ofstream that_file;
    that_file.open(file_name, ios::app );

    that_file << words;
    that_file.close();}









