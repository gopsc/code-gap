
void action_seed_append(
                           const char* that_result,
                           const char* that_path,
                           const char* that_target
                       ) {

    char        buffer_file                 [129];
    strcpy     (buffer_file,                that_path   );
    strcat     (buffer_file,                that_target );

    char        buffer_words                [102400];

    file_append(that_result,                "\n//"      );
    file_append(that_result,                "=========" );
    file_append(that_result,                "=========" );
    file_append(that_result,                buffer_file );


    if  ( 63 > (int)strlen(buffer_file) ) {

        for (
              int i = 0;
                  i <      63 - (int)strlen(buffer_file);
                  i ++
            ) {

            file_append(that_result,        "="         );}}


    file_append(that_result,                "\n"        );
    file_get   (buffer_file,                buffer_words);
    file_append(that_result,                buffer_words);}






void action_seed       (
                           const char* that_type
                       ) {


            char        buffer_path         [129];
            strcpy     (buffer_path,        path_the     );
            strcat     (buffer_path,        "/"          );
            strcat     (buffer_path,        name_the     );

            char        buffer_file         [129];
            strcpy     (buffer_file,        path_the     );
            strcat     (buffer_file,        "/flower.c");

            char        buffer_dirent       [129];
            strcpy     (buffer_dirent,      buffer_path  );
            strcat     (buffer_dirent,      "/network/message/command/action");

            char        buffer_file_action  [129];

            DIR*        pointer_dirent =    opendir(buffer_dirent);
    struct  dirent*     ent            =    NULL;



            file_save  (buffer_file,        "");



    action_seed_append( buffer_file, buffer_path, "/box/c/head/Linux.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/head/variable.h" );



    action_seed_append( buffer_file, buffer_path, "/watchdog/information/build.h" );

    action_seed_append( buffer_file, buffer_path, "/network/build.h" );

    action_seed_append( buffer_file, buffer_path, "/sound/build.h" );



    action_seed_append( buffer_file, buffer_path, "/box/c/dirent/is.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/file/is.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/file/get.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/file/save.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/file/append.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/commandline/shell.h" );

    action_seed_append( buffer_file, buffer_path, "/box/c/code/blank.h" );



    action_seed_append( buffer_file, buffer_path, "/watchdog/note/save.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/note/clear.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/system/user.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/system/name.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/system/build.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/ip/build.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/status.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/rate.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/temperature.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/frequency.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/cores.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/build.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/memory/build.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/disk/build.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/sound/alsa.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/get/build.h" );


    action_seed_append( buffer_file, buffer_path, "/watchdog/check/network.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/check/power.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/check/root.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/check/update.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/check/deamon.h" );


    action_seed_append( buffer_file, buffer_path, "/watchdog/load/configure.h" );

    action_seed_append( buffer_file, buffer_path, "/watchdog/load/listen.h" );


    action_seed_append( buffer_file, buffer_path, "/watchdog/show/information.h" );


    action_seed_append( buffer_file, buffer_path, "/watchdog/dog.h" );



    action_seed_append( buffer_file, buffer_path, "/sound/ft/show.h" );

    action_seed_append( buffer_file, buffer_path, "/sound/ft/dft.h" );

    action_seed_append( buffer_file, buffer_path, "/sound/ft/fft.h" );

    action_seed_append( buffer_file, buffer_path, "/sound/ft/test.h" );


    action_seed_append( buffer_file, buffer_path, "/sound/listen/save.h" );


    if      ( strcmp(that_type, "base") == 0 ) {

        action_seed_append( buffer_file, buffer_path, "/sound/corde/blank.h" );}

    else if ( strcmp(that_type, "alsa") == 0 ) {

        action_seed_append( buffer_file, buffer_path, "/sound/corde/alsa.h" );}



    action_seed_append( buffer_file, buffer_path, "/network/message/information/put.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/information/get.h" );


    action_seed_append( buffer_file, buffer_path, "/network/message/update/build.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/update/load.h" );


    action_seed_append( buffer_file, buffer_path, "/network/message/judgement/blank.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/judgement/hello.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/judgement/who.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/judgement/recived.h" );


    do {

        ent = readdir( pointer_dirent );

        if ( ent != NULL  &&  ent->d_type == 8 ) {

            strcpy(buffer_file_action, strstr(buffer_dirent, name_the) + strlen(name_the));
            strcat(buffer_file_action, "/"                );
            strcat(buffer_file_action, ent->d_name        );

            action_seed_append(
                               buffer_file,
                               buffer_path,
                               buffer_file_action
                              );}

       }while ( ent != NULL );

    closedir( pointer_dirent );

    action_seed_append( buffer_file, buffer_path, "/network/message/command/build.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/build.h" );

    action_seed_append( buffer_file, buffer_path, "/network/tcp/server.h" );

    action_seed_append( buffer_file, buffer_path, "/network/tcp/client.h" );




    action_seed_append( buffer_file, buffer_path, "/build.h" );



    return;}
