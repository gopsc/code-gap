void load_listen() {

    printf("LOAD LISTEN...\n");






// ~/sound/listen/word/number/w/t

    string that_path  = path_the;
           that_path += "/";
           that_path += name_the;
           that_path += "/sound/listen/word";


    string that_name  = that_path;
           that_name += "/";
           that_name += to_string(num_listen);

    string that_file;

    string that;







    while (is_dir(that_name.c_str())) {

        cout << that_name << endl;





        for ( int w=1; w<=N; w++) {

            that_file  = that_name;
            that_file += "/";
            that_file += to_string(w);
            that_file += ".w";



            if ( is_file(that_file.c_str()) ) {




                that = file_get(that_file);



                int num  = 1;
                int num1 = 0;
                int num2 = that.find("\n");



                while ( num2 != -1 ) {

                    buffer_listen[num_listen][w][num] = atoi(that.substr(num1, num2-num1).c_str());

                    num++;
                    num1 = num2 + 1;
                    num2 = that.find("\n",num2 + 1);}}}







        num_listen++;

        that_name  = that_path;
        that_name += "/";
        that_name += to_string(num_listen);}}
