
int note_clear(

                 const char* that_name,
                 const char* that_type

             ) {


    char           that_path[128];


// Prepare the path

    strcpy(that_path, path_the );
    strcat(that_path, "/"      );
    strcat(that_path, name_data);

    strcat(that_path, "/0/"    );

    strcat(that_path, that_name);
    strcat(that_path, ".note"  );




    if ( strcmp(that_type, "all") == 0 ) {

// The save the words of blank

        file_save(that_path, "");

        return 1;}



    else {

// Got a wrong type of it

        return 0;}}


