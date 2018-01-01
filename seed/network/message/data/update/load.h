


int  load_update(int that_site) {


    char   buffer_commandline_rm[129];
    char   buffer_commandline_mv[129];

    int    num_file   = 0;
    char   buffer_file[129];
    char   buffer_words[10240];
    char   buffer_update[129];
    char   buffer_mix[129];

    strcpy(buffer_commandline_rm, "rm -rf "        );
    strcat(buffer_commandline_rm, path_the         );
    strcat(buffer_commandline_rm, "/"              );
    strcat(buffer_commandline_rm, name_the         );

    strcpy(buffer_commandline_mv, "mv "            );
    strcat(buffer_commandline_mv, path_the         );
    strcat(buffer_commandline_mv, "/downloads");
    strcat(buffer_commandline_mv, " "              );
    strcat(buffer_commandline_mv, path_the         );
    strcat(buffer_commandline_mv, "/"              );
    strcat(buffer_commandline_mv, name_the         );

    strcpy(gop_connection.update[that_site],     "");


    output_print( "string", "Load update...\n" );




    commandline_get(buffer_commandline_rm, buffer_words);
    commandline_get(buffer_commandline_mv, buffer_words);





    strcpy(                        gop_connection.update[that_site], path_the);
    strcat(                        gop_connection.update[that_site], "/");
    strcat(                        gop_connection.update[that_site], name_the);



    while ( control_message_update(gop_connection.update[that_site]) != 0 ) {

        strcpy (buffer_update, gop_connection.update[that_site]);
       *strrchr(buffer_update, '.') = '\0';

        strcpy( buffer_mix,    path_the);
        strcat( buffer_mix,   "/downloads/");
        strcat( buffer_mix,    strstr(buffer_update, name_the) + strlen(name_the) + 1);


        if ( !is_file(buffer_mix) ) {

                      num_file  = 0;
            strcpy(buffer_file, buffer_update);
            strcat(buffer_file, ".0");


            while ( is_file(buffer_file) ) {

                file_get (buffer_file,   buffer_words);

                if ( num_file == 0 ) {

                    file_save  (buffer_mix, buffer_words);}

                else {

                    file_append(buffer_mix, buffer_words);}

                num_file++;
                strcpy(buffer_file, buffer_update);
                strcat(buffer_file, "."          );
                snprintf(buffer_words, sizeof(buffer_words) / sizeof(char) - 1, "%d", num_file);
                strcat(buffer_file, buffer_words );}



 
            output_print( "string",  buffer_mix );
            output_print( "string", "\n"        );}}




    strcpy(gop_connection.update[that_site], path_the);

    commandline_get(buffer_commandline_rm, buffer_words);
    commandline_get(buffer_commandline_mv, buffer_words);

    output_print( "string", "Done.\n" );


    int i;

    for ( i=0; i<=3; i++ ) {


        if (
               strcmp(gop_connection.how[i], "Sopi"      ) == 0
        ||     strcmp(gop_connection.how[i], "Connectted") == 0
           ) {


            if (
                   strcmp(
                           gop_connection.address_ip[i],
                           address_to
                         )
                   != 0
               ) {


            
                strcpy(gop_connection.command[i], "Clean update.");

                break;}}}


  return 0;}
