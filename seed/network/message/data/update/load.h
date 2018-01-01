


int  load_update(

                    int that_site

                ) {



// This is for saving the id
//   of each file

    int    number_file   = 0;


// This is for saving the name of the file

    char   buffer_file  [128];


// This is for saving the convent of the file

    char   buffer_words [10240];



// This is for saving the path of the download file

    char   buffer_update[128];







// This is for saving the mixing number of the file

    char   buffer_mix   [128];










// Check where the river saved


// this is for the id of backup

    snprintf(

              buffer_file,
              sizeof(buffer_file) / sizeof(char),
              "%d",
              count_backup() + 1
            );


// This is for the command of moving file

    char   buffer_commandline_save  [128];
    char   buffer_commandline_remove[128];
    char   buffer_commandline_load  [128];


    strcpy(buffer_commandline_save,   "mv "            );
    strcat(buffer_commandline_save,   path_the         );
    strcat(buffer_commandline_save,   "/"              );
    strcat(buffer_commandline_save,   name_the         );
    strcat(buffer_commandline_save,   " "              );
    strcat(buffer_commandline_save,   path_the         );
    strcat(buffer_commandline_save,   "/"              );
    strcat(buffer_commandline_save,   name_backup      );
    strcat(buffer_commandline_save,   "/"              );
    strcat(buffer_commandline_save,   buffer_file      );


    strcpy(buffer_commandline_remove, "rm -rf "        );
    strcat(buffer_commandline_remove, path_the         );
    strcat(buffer_commandline_remove, "/"              );
    strcat(buffer_commandline_remove, name_the         );


    strcpy(buffer_commandline_load,   "mv "            );
    strcat(buffer_commandline_load,   path_the         );
    strcat(buffer_commandline_load,   "/downloads"     );
    strcat(buffer_commandline_load,   " "              );
    strcat(buffer_commandline_load,   path_the         );
    strcat(buffer_commandline_load,   "/"              );
    strcat(buffer_commandline_load,   name_the         );

    strcpy(gop_connection.update[that_site],         "");


    output_print( "string", "Load update...\n" );




    commandline_get(buffer_commandline_save, buffer_words);
    commandline_get(buffer_commandline_load, buffer_words);





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

                   number_file  = 0;
            strcpy(buffer_file, buffer_update);
            strcat(buffer_file, ".0");


            while ( is_file(buffer_file) ) {

                file_get (buffer_file,   buffer_words);

                if ( number_file == 0 ) {

                    file_save  (buffer_mix, buffer_words);}

                else {

                    file_append(buffer_mix, buffer_words);}

                number_file++;
                strcpy(buffer_file, buffer_update);
                strcat(buffer_file, "."          );
                snprintf(buffer_words, sizeof(buffer_words) / sizeof(char) - 1, "%d", number_file);
                strcat(buffer_file, buffer_words );}



 
            output_print( "string",  buffer_mix );
            output_print( "string", "\n"        );}}




    strcpy(gop_connection.update[that_site], path_the);

    commandline_get(buffer_commandline_remove, buffer_words);
    commandline_get(buffer_commandline_load,   buffer_words);

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


  return 1;}
