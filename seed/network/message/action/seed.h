




// we use this function to save a piece of code


int action_seed_append (

                           const char * that_result,

                           const char * that_path,

                           const char * that_target

                       ) {




    char         buffer_file [ 128 ];



    strcpy     ( buffer_file, that_path   );

    strcat     ( buffer_file, that_target );




// this is not easy, maybe the file is too long

// we can't read it


/*

    char * buffer_words;

           buffer_words = malloc (   (  file_length ( that_target ) + 1  )   *   sizeof ( char );

    free ( buffer_words );

*/


    char         buffer_words [ 102400 ];







// sometimes this file is not here

// maybe we should exit this seed


    if (  ! is_file ( buffer_file )  ) {




        output_print ( "string", "This file we can't find it:   " );

        output_print ( "string", buffer_file );

        output_print ( "string", "\n"        );



        return 0;}







// if this file exist

// prepare to add it


    else {






// make the title


// maybe we should make a buffer to note this

// then append once to finish it


        file_append ( that_result,                "\n//"      );

        file_append ( that_result,                "=========" );

        file_append ( that_result,                "=========" );

        file_append ( that_result,                buffer_file );





// titles don't have a same length,

// and of cause


        if  (  63  >  ( int ) strlen ( buffer_file )  ) {



            int i;

            for (

                    i = 0;
                    i <      63 - ( int ) strlen ( buffer_file );
                    i ++

                ) {




                file_append ( that_result, "=" );}}




// titile finished

        file_append ( that_result, "\n" );







// get the convent


        file_get ( buffer_file, buffer_words );





// save it

        file_append ( that_result, buffer_words );







        return 1;}}











int action_seed (

                    const char * that_type

                ) {



// where the code is

// and it could be changed


            char        buffer_path               [ 128 ];


            strcpy    ( buffer_path,               path_the                );

            strcat    ( buffer_path,              "/"                      );

            strcat    ( buffer_path,               name_the                );





// the file we will make named flower


            char        buffer_file               [ 128 ];



            strcpy    ( buffer_file,               path_the                );

            strcat    ( buffer_file,              "/flower.c"              );




/*

 there is a file named action

 we auto add file in that

*/

            char        buffer_dirent             [ 128 ];


            char        buffer_file_action        [ 128 ];



            DIR *       pointer_dirent;


    struct  dirent *    ent;









// clean it

            file_save ( buffer_file,              ""                                         );









    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/head/Linux.h"                   );

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/head/flags.h"                   );



    action_seed_append( buffer_file, buffer_path, "/watchdog/information/build/build.h"         );

    action_seed_append( buffer_file, buffer_path, "/network/build/build.h"                      );
    action_seed_append( buffer_file, buffer_path, "/network/build/check/connection.h"           );
    action_seed_append( buffer_file, buffer_path, "/network/build/clean/connection.h"           );

    action_seed_append( buffer_file, buffer_path, "/sound/build.h"                              );




/*

 put this to the last of  list of head and build

 then it can use the struct of configuration to note configurations everywhere


 but if we don't have them in code, we set a head of blank to fill them

*/

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/head/configurations.h"         );






    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/data/translate/number_word.h"       );



    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/output/print.h"           );

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/file-system/dirent/is.h"     );


    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/file-system/file/is.h"       );

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/file-system/file/get.h"      );

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/file-system/file/save.h"     );

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/file-system/file/append.h"   );


    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/process/deamon.h"     );

    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/system/commandline/shell.h" );



    action_seed_append( buffer_file, buffer_path, "/box/c/Linux/data/secret/secret.h"               );







    action_seed_append( buffer_file, buffer_path, "/watchdog/note/save.h"                           );

    action_seed_append( buffer_file, buffer_path, "/watchdog/note/clear.h"                          );



// get them form a convent, maybe from network

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/build/load.h"         );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/build/load_mate.h"         );



// get them from system

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/system/user.h"             );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/system/name.h"             );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/system/build.h"            );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/ip/build.h"                );



    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/rate.h"                );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/temperature.h"         );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/frequency.h"           );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/cores.h"               );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/cpu/build.h"               );




    action_seed_append( buffer_file, buffer_path, "/watchdog/information/memory/build.h"            );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/disk/build.h"              );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/sound/alsa.h"              );

    action_seed_append( buffer_file, buffer_path, "/watchdog/information/get/append.h"              );



    action_seed_append( buffer_file, buffer_path, "/watchdog/check/network.h"                       );

    action_seed_append( buffer_file, buffer_path, "/watchdog/check/power.h"                         );

//    action_seed_append( buffer_file, buffer_path, "/watchdog/check/root.h"                          );

    action_seed_append( buffer_file, buffer_path, "/watchdog/check/update.h"                        );



    action_seed_append( buffer_file, buffer_path, "/watchdog/load/configuration.h"                  );

    action_seed_append( buffer_file, buffer_path, "/watchdog/load/symbol.h"                         );

    action_seed_append( buffer_file, buffer_path, "/watchdog/load/listen.h"                         );



    action_seed_append( buffer_file, buffer_path, "/watchdog/show/information.h"                    );




    action_seed_append( buffer_file, buffer_path, "/watchdog/dog.h"                                 );







    action_seed_append( buffer_file, buffer_path, "/sound/ft/show.h"                                );

    action_seed_append( buffer_file, buffer_path, "/sound/ft/dft.h"                                 );

    action_seed_append( buffer_file, buffer_path, "/sound/ft/fft.h"                                 );

    action_seed_append( buffer_file, buffer_path, "/sound/ft/test.h"                                );







// add the sound code

    if      ( strcmp(that_type, "base") == 0 ) {

        action_seed_append( buffer_file, buffer_path, "/sound/corde/blank.h" );}



    else if ( strcmp(that_type, "alsa") == 0 ) {

        action_seed_append( buffer_file, buffer_path, "/sound/corde/alsa.h"  );}






// The data code
//  is for send some data
//  in the network connection

    action_seed_append( buffer_file, buffer_path, "/network/message/data/update/build.h"  );
v
    action_seed_append( buffer_file, buffer_path, "/network/message/data/update/backup.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/data/update/append.h" );

    action_seed_append( buffer_file, buffer_path, "/network/message/data/update/next.h"   );

    action_seed_append( buffer_file, buffer_path, "/network/message/data/update/load.h"   );





// Append the action codes
// it's instatic

    strcpy    ( buffer_dirent,             buffer_path             );

    strcat    ( buffer_dirent,            "/network/message/action");



    pointer_dirent          = opendir(buffer_dirent);






    do {




        ent = readdir( pointer_dirent );




        if ( ent != NULL  &&  ent->d_type == 8 ) {



            strcpy(buffer_file_action, strstr(buffer_dirent, name_the) + strlen(name_the));

            strcat(buffer_file_action, "/"                                               );

            strcat(buffer_file_action, ent->d_name                                       );




            action_seed_append(
                               buffer_file,
                               buffer_path,
                               buffer_file_action
                              );}


       } while ( ent != NULL );




    closedir( pointer_dirent );





// the module of judge
// means to take the words get on network
//
// the plan is using the trees system

    action_seed_append( buffer_file, buffer_path, "/network/message/judge/blank.h"                  );

    action_seed_append( buffer_file, buffer_path, "/network/message/judge/hello.h"                  );

    action_seed_append( buffer_file, buffer_path, "/network/message/judge/who.h"                    );

    action_seed_append( buffer_file, buffer_path, "/network/message/judge/information.h"            );

    action_seed_append( buffer_file, buffer_path, "/network/message/judge/command.h"                );



// appending data to the message

    action_seed_append( buffer_file, buffer_path, "/network/message/data/build.h"                   );



// build the network message system

    action_seed_append( buffer_file, buffer_path, "/network/message/build.h"                        );



// the translate system of network

    action_seed_append( buffer_file, buffer_path, "/network/tcp/connectted.h"                       );

    action_seed_append( buffer_file, buffer_path, "/network/tcp/connector.h"                        );





// build the

    action_seed_append( buffer_file, buffer_path, "/build.c"                                        );





    return 1;}

