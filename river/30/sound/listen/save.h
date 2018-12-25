
void listen_save( int site ) {






    string that_name  = path_the;
           that_name += "/";
           that_name += name_the;
           that_name += "/sound/listen/word/";

    string that_file;

    string that;




    for ( int w=1; w<=N; w++ ) {

        that_file  = that_name;
        that_file += to_string(num_listen);
        that_file += "/";
        that_file += to_string(w);
        that_file += ".w";

        that = "";

        for ( int t=1; t<=site; t++ ) {

            that += to_string(result_ft[t][w]);
            that += "\n";}

        file_save(that_file,that);}}




