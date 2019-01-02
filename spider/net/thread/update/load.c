


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




// there are tree importent dirent
//
//    source   dirent : path/name
//    backup   dirent : path/backup
//    download dirent : path/downloads


// mv path/name path/backup

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


// rm -rf path/name

    strcpy(buffer_commandline_remove, "rm -rf "        );
    strcat(buffer_commandline_remove, path_the         );
    strcat(buffer_commandline_remove, "/"              );
    strcat(buffer_commandline_remove, name_the         );


// mv path/downloads path/name

    strcpy(buffer_commandline_load,   "mv "            );
    strcat(buffer_commandline_load,   path_the         );
    strcat(buffer_commandline_load,   "/downloads"     );
    strcat(buffer_commandline_load,   " "              );
    strcat(buffer_commandline_load,   path_the         );
    strcat(buffer_commandline_load,   "/"              );
    strcat(buffer_commandline_load,   name_the         );



// clear the update buffer

    strcpy(gop_connection.update[that_site],         "");



// start it

    output_print( "string", "Load update...\n" );









// save code to backup

    commandline_get(buffer_commandline_save, buffer_words);


// load the  downloads

    commandline_get(buffer_commandline_load, buffer_words);





// readyto loop the files

    strcpy( gop_connection.update[that_site], path_the );
    strcat( gop_connection.update[that_site], "/"      );
    strcat( gop_connection.update[that_site], name_the );





// the main looop

    while ( control_message_update(gop_connection.update[that_site]) != 0 ) {




// the result is
//
// path/name/.../file.h.x

        strcpy (buffer_update, gop_connection.update[that_site]);
       *strrchr(buffer_update, '.'                             ) = '\0';




// now we creat the complete files in the path/downloads
//
// prepare

        strcpy( buffer_mix,    path_the);
        strcat( buffer_mix,   "/downloads/");
        strcat( buffer_mix,    strstr(buffer_update, name_the) + strlen(name_the) + 1);




// we may loop many of these name with a '.x'
//
//    but we should as the range
//
//     so we do that at first time to loop it
//
//     so if we'd creat that, does not need to creat again

        if ( !is_file(buffer_mix) ) {

// if we had not loop and creat the '.x' files before
//
// preare loop the file name downloads before

                   number_file  = 0;

            strcpy(buffer_file, buffer_update);
            strcat(buffer_file, ".0"         );



// ok let mix the downloads '.x' files

            while ( is_file(buffer_file) ) {

// we found the file named '.x' in this loop



//  get the convent of the file

                file_get (buffer_file,   buffer_words);



// save the convent of the file

                if ( number_file == 0 ) {

// if this is the first found, creat it

                    file_save  (buffer_mix, buffer_words);}

                else {

// if this is not first found, append to it
//
// called mix
                    file_append(buffer_mix, buffer_words);}




// try to found next file

                number_file++;


// prepare the next file

                strcpy(buffer_file, buffer_update);
                strcat(buffer_file, "."          );


// we havnt to declear another buffer to save the number of this loop file's '.x'
//
// we just use the buffer for saving the file convent before :l

                snprintf(buffer_words, sizeof(buffer_words) / sizeof(char) - 1, "%d", number_file);

                strcat(buffer_file, buffer_words );}



// we've creat a complete file form downloads files
//
// print out  it, and start the next downloads file loop

            output_print( "string",  buffer_mix );
            output_print( "string", "\n"        );}}




// we've done for loop the whole downloads files
//
//    remove, and load it

    strcpy(gop_connection.update[that_site],   path_the    );

    commandline_get(buffer_commandline_remove, buffer_words);
    commandline_get(buffer_commandline_load,   buffer_words);


// we've done

    output_print( "string", "Done.\n" );





// this is a whole update
//
//  and send message to the next sop

    int i;

    for ( i=0; i<=3; i++ ) {


        if (
               strcmp(gop_connection.how[i], "Sopi"      ) == 0
        ||     strcmp(gop_connection.how[i], "Connectted") == 0
           ) {


// we don't need to update to ourselves

            if (
                   strcmp(
                           gop_connection.address_ip[i],
                           address_to
                         )
                   != 0
               ) {



                strcpy(gop_connection.command[i], "Clean update.");

// we just need to send a update message onece
//
// don't know why
//
// maybe something changed in the file-system

                break;}}}



// return the comlete flag,
//
//    but there's wrong happened maybe
//
//    include the download files broke
//
//    or something else

  return 1;}
