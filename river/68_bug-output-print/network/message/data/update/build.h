
int control_message_update( char* path_update ) {


//    /opt/gop/?

            char    path_update_start[129];
            strcpy (path_update_start, path_the);
            strcat (path_update_start, "/"     );
            strcat (path_update_start, name_the);

            DIR*    pointer_dirent = NULL;
    struct  dirent* ent            = NULL;




// is saving what file we are send

            char    that_file[129];
            strcpy (that_file, "");







    if ( strcmp(path_update, path_update_start) != 0 ) {

        strcpy(that_file, strrchr(path_update, '/') + 1);

       *strrchr(path_update, '/') = '\0';}




    if ( strcmp(path_update, "") == 0 ) {

// There's no TxL source.

       return 0;}





// Sometimes it return the dirent before.

    pointer_dirent = opendir(path_update);



// Read and return to target path.

    if ( strcmp(that_file, "") != 0 ) {

        ent = readdir( pointer_dirent );

        while ( strcmp(that_file, ent->d_name) != 0 ) {

            ent = readdir( pointer_dirent );}}





    ent = readdir( pointer_dirent );

    while ( ent != NULL ) {

        if (   (int)ent->d_type == 4 ) {

            if ( *ent->d_name == '.') {

                ent = readdir(pointer_dirent);}

            else {

                strcat(path_update, "/");
                strcat(path_update, ent->d_name);

                closedir( pointer_dirent );

                pointer_dirent = opendir(path_update);
                ent  = readdir(pointer_dirent);}}


        else if ( (int)ent->d_type == 8 ) {

            strcat(path_update, "/");
            strcat(path_update, ent->d_name);

            closedir( pointer_dirent );

            return 1;}}



     // A dirent is finished

    if ( strcmp(path_update, path_update_start) != 0 ) {

        closedir( pointer_dirent );

        return control_message_update(path_update);}


    else {

        closedir( pointer_dirent );

        strcpy(path_update, "");

        return 0;}}