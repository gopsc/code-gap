
void check_power() {



    time_t time_now      = time(NULL);
    char   that_data[129];
    char   that_path[33];

           strcpy(that_path, path_the          );
           strcat(that_path, "/"               );
           strcat(that_path, name_data         );
           strcat(that_path, "/note/power.note");







    if ( !is_file(that_path) ) {

        file_save(that_path, "");}





    file_get( that_path, that_data );
    note_clear( "power", "all" );
    note_save(  "power", "Check power", "now" );






    if ( strcmp(that_data,   "" )  != 0 ) {

       *strchr( that_data+2, '\n' ) = '\0';

        if ( (int)time_now - atoi(that_data + 2) > 3 ) {


            note_save("command", "Power off", that_data + 2);

            note_save("server",  "Power off", that_data + 2);

            note_save("client",  "Power off", that_data + 2);

            note_save("dog",     "Power off", that_data + 2);

            note_save("corde",   "Power off", that_data + 2);}}}

