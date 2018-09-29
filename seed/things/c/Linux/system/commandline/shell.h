
int commandline_get (
                        const char * that_commands,
                              char * that_result
                    ) {






    FILE  * file_commandline;

    char   buffer_lines [ 1024 ];


// clean this

           that_result[0]   = '\0';







    file_commandline = popen ( that_commands, "r" );



// sometimes it goes failed

    if ( file_commandline == NULL ) {

        return 0;}










    else {






        while (

                   fgets (

                             buffer_lines,
                             1024,
                  ( FILE * ) file_commandline

                         )

                   != NULL

              ) {


            strcat ( that_result, buffer_lines );}






        return 1;}




    pclose ( file_commandline );}
