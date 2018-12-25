string file_get(string path_file) {

    ifstream file;
    string that;
    char  that_one;

    file.open(path_file.c_str());

    while(!file.eof()) {
        file.read(&that_one, 1);
        that += that_one;}

    file.close();
    sleep(0.1);
    return that;}









