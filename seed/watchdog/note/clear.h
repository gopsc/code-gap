
int note_clear(

                 const char* that_name,
                 const char* that_command

             ) {


    char           that_path[129];

    strcpy(that_path, path_the );
    strcat(that_path, "/"      );
    strcat(that_path, name_data);

    strcat(that_path, "/0/"    );

    strcat(that_path, that_name);
    strcat(that_path, ".note"  );




    if ( strcmp(that_command, "all") == 0 ) {


        file_save(that_path, "");


        return 1;}}
