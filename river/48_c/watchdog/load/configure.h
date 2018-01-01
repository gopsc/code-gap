

void* load_configure() {




    printf("LOAD CONFIGURE...\n");





    char buffer_path[33] = "/opt/gop/seed/configure";

    char that_file[1025];
    char buffer_file[1025];
    char target_configure[20][17];
    char result_configure[20][17];



    if ( !is_file(buffer_path) ) {

        printf("Can't find the configure file. :(\n Type a new path:");

        fgets(buffer_path,33, stdin);}

    else {

        file_get(buffer_path, that_file);


        if ( strcmp(that_file, "") == 0 ) {

            flag_mind = false;}

        else {

            strcpy(target_configure[1],  "path ");
            strcpy(target_configure[2],  "name ");
            strcpy(target_configure[3],  "data ");
            strcpy(target_configure[4],  "mind ");
            strcpy(target_configure[5],  "show ");
            strcpy(target_configure[6],  "client ");
            strcpy(target_configure[7],  "server ");
            strcpy(target_configure[8],  "sound ");
            strcpy(target_configure[9],  "sound-show ");
            strcpy(target_configure[10], "sound-save ");
            strcpy(target_configure[11], "address-to ");
            strcpy(target_configure[12], "port-to ");
            strcpy(target_configure[13], "port-this ");
            strcpy(target_configure[14], "connect-step ");
            strcpy(target_configure[15], "update-size ");
            strcpy(target_configure[16], "update-step ");
            strcpy(target_configure[17], "sound-rate ");
            strcpy(target_configure[18], "sound-channels ");
            strcpy(target_configure[19], "ft-N ");




            for ( int i=1; i<=19; i++ ) {

                if ( strstr(that_file, target_configure[i]) != NULL ) {

                    strcpy( buffer_file,         strstr(that_file, target_configure[i]) );
                   *strchr( buffer_file,         '\n' ) = '\0';
                    strcpy( buffer_file,         strrchr(buffer_file, ' ')+1 );
                    strcpy( result_configure[i], buffer_file );}}





            strcpy(path_the,   result_configure[1]);
            strcpy(name_the,   result_configure[2]);
            strcpy(name_data,  result_configure[3]);

            if ( strcmp(result_configure[4],  "on") == 0 ) { flag_mind       = true;}
            if ( strcmp(result_configure[5],  "on") == 0 ) { flag_show       = true;}
            if ( strcmp(result_configure[6],  "on") == 0 ) { flag_client     = true;}
            if ( strcmp(result_configure[7],  "on") == 0 ) { flag_server     = true;}
            if ( strcmp(result_configure[8],  "on") == 0 ) { flag_sound      = true;}
            if ( strcmp(result_configure[9],  "on") == 0 ) { flag_sound_show = true;}
            if ( strcmp(result_configure[10], "on") == 0 ) { flag_sound_save = true;}

            strcpy(address_to, result_configure[11]);

            port_to          = atof(result_configure[12]);
            port_this        = atof(result_configure[13]);
            step_connection  = atof(result_configure[14]);
            size_update      = atof(result_configure[15]);
            count_update_max = atof(result_configure[16]);
            rate             = atof(result_configure[17]);
            channels         = atof(result_configure[18]);
            N                = atof(result_configure[19]);}}}
