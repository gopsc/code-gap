



int action_flower(

                     const char* that_type

                 ) {




// the preparation



// the buffer of commandline

    char            buffer_commandline  [128];



// the buffer of file name

    char            buffer_file         [128];

    strcpy         (buffer_file,        path_the   );
    strcat         (buffer_file,        "/flower.c");



// the result of gcc
//
// this could be very long
//
// and maybe take a judge in the commandline get program

    char            buffer_result       [102400];








// sometimes the machine does not install the alsa-lib
//
//  alsa is one of the software the we can use to corde
//
//  so we have two kind of resource to program



    if      (    strcmp(that_type,          "base"      ) == 0) {

// the version of base
//
// with the blank corde program

        strcpy         (buffer_commandline, "gcc "      );

        strcat         (buffer_commandline, buffer_file );

        strcat         (buffer_commandline, " -lm"      );
        strcat         (buffer_commandline, " -lpthread");
        strcat         (buffer_commandline, " -o"       );
        strcat         (buffer_commandline, " "         );

        strcat         (buffer_commandline, path_the    );
        strcat         (buffer_commandline, "/?"        );}





    else if (    strcmp(that_type,          "alsa"      ) == 0) {

// the version of alsa
//
// with the alsa corde program
//
// used the alsa-lib

        strcpy         (buffer_commandline, "gcc "      );

        strcat         (buffer_commandline, buffer_file );

        strcat         (buffer_commandline, " -lm"      );
        strcat         (buffer_commandline, " -lpthread");
        strcat         (buffer_commandline, " -lasound" );
        strcat         (buffer_commandline, " -o"       );
        strcat         (buffer_commandline, " "         );

        strcat         (buffer_commandline, path_the    );
        strcat         (buffer_commandline, "/"         );
        strcat         (buffer_commandline, "?"         );}



// run the command

    commandline_get(buffer_commandline, buffer_result);


// clean the code

    remove(buffer_file);


    return 1;}
