string shell_get(char* commands){
    FILE *read;
    char that[60];

    read = popen(commands, "r");
    if (read != NULL){
        fread(that, sizeof(char), 20, read);
        pclose(read);
    string that2 = (string)that;

    return that2.substr(0, that2.find('\n'));}}











