
string cmd_get(string commands){

    //path_temporary_shell
    //cmd_temporary_shell




    file_save(path_temporary_shell, "");

    commands += cmd_temporary_shell;





    system(commands.c_str());






    string that = file_get(path_temporary_shell);



    if ( that.length() != 0 ) {

        while ( that.substr(that.length()-1, 1) == "\n" ) {
            that = that.substr(0, that.length()-1);}}

    return that;


/*
    FILE *read;
    char that[60];

    read = popen(commands.c_str(), "r");

    if (read != NULL){
        fread(that, sizeof(char), 20, read);
        pclose(read);

    string that2 = (string)that;
           that2 = that2.substr(0, that2.rfind('\n'));
    return that2;}
*/


}












