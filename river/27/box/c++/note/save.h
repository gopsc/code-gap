void note_save(string name, string words ) {

    string path  = path_the;
           path += "/gop";

    if ( !is_dir(path.c_str()) ) {
        string that_cmd  = "mkdir ";
               that_cmd += path;
        system(that_cmd.c_str());}

           path += "/note/";

    if ( !is_dir(path.c_str()) ) {
        string that_cmd  = "mkdir ";
               that_cmd += path;
        system(that_cmd.c_str());}


           path += name;

    file_append(path, to_string(info_time));
    file_append(path, "\n");
    file_append(path, words);
    file_append(path, "\n");}

