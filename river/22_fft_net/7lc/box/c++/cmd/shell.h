
string cmd_get(string name, string commands){

    string that  = path_temporary;
           that += "/";
           that += name;

           commands += cmd_temporary;
           commands += "/";
           commands += name;





    system(commands.c_str());






    string that2 = file_get(that);






    if ( that2.length() != 0 ) {

        while ( that2.substr(that2.length()-1, 1) == "\n" ) {
            that2 = that2.substr(0, that2.length()-1);}}






    return that2;


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












