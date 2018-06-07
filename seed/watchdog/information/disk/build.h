
int information_disk_get () {




    char   file_commandline [ 2048 ];
    char   that_buffer      [ 16   ];
    char buffer_available   [ 16   ];
    char buffer_size        [ 16   ];








// it's different on some Linux system,
//
// we should find a way to do this



    if (  strcmp ( information_system.name, "localhost" )  == 0  ) {

// on termux, the permisson is different
//
// things are different with this

        information_disk.size = -1;
        information_disk.available = 0;

        return 1;}




// things usually just like this

    else {



// get the lable of disk space

        commandline_get ( "df", file_commandline );




        if (  strchr ( file_commandline, '\n' )  != NULL  ) {



            strcpy(
                    file_commandline,
                    strchr ( file_commandline, '\n' ) + 1
                  );



// this always has a enter at last

           *strchr ( file_commandline, '\n' ) = '\0';





            sscanf (
                     file_commandline, "%s %s %s %s",
                     that_buffer,
                     buffer_size,
                     that_buffer,
                     buffer_available
                   );



            information_disk.size      = atoi ( buffer_size      );
            information_disk.available = atoi ( buffer_available );



            return 0;}}





    return 1;}
