
string cmd_get(string name, string commands){

    string path_temporary  = path_the;
           path_temporary += "/gop/";

    if ( !is_dir(path_temporary.c_str()) ) {
        string that_cmd  = "mkdir ";
               that_cmd += path_temporary;
        system(that_cmd.c_str());}

           path_temporary += "temporary";

    if ( !is_dir(path_temporary.c_str()) ) {
        string that_cmd  = "mkdir ";
               that_cmd += path_temporary;
        system(that_cmd.c_str());}







    string cmd_temporary  = commands;
           cmd_temporary += " > ";
           cmd_temporary += path_temporary;
           cmd_temporary += "/";
           cmd_temporary += name;





    string that  = path_temporary;
           that += "/";
           that += name;






    if ( !is_dir(path_temporary.c_str()) ) {

        string cmd_mkdir  = "mkdir ";
               cmd_mkdir += path_temporary;

        system(cmd_mkdir.c_str());}






    system(cmd_temporary.c_str());






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












