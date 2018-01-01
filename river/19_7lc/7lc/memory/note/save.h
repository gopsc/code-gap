void note_save(string name, string words ) {
    string path  = path_note;
           path += name;

    file_append(path, to_string(info_time));
    file_append(path, "\n");
    file_append(path, words);
    file_append(path, "\n");}

