


int about_disk () {




    char   file_commandline [ 2048 ];




// to save the name of option


    char buffer_name      [ 16 ];

    char buffer_size      [ 16 ];

    char buffer_used      [ 16 ];

    char buffer_available [ 16 ];

    char buffer_rate      [ 16 ];

    char buffer_path      [ 16 ];





/*

 it's different on some Linux system,

 we find a way to do this

*/







    if (  strcmp ( gop_about . system . name, "localhost" )  == 0  ) {


/*

 on termux, the permisson is different

 things are different with this

*/

        gop_about . disk . size       =  -1;
        gop_about . disk . available  =  0;


        return 1;}







// things usually just like this



    else {



// get the lable of disk space


        commandline_get ( "df", file_commandline );





/*

 use a loop

 to found the path it hope

*/






        if (  strchr ( file_commandline, '\n' )  != NULL  ) {



            strcpy(

                    file_commandline,

                    strchr ( file_commandline, '\n' ) + 1

                  );



// this always has a enter at last

           *strchr ( file_commandline, '\n' ) = '\0';





            sscanf (

                     file_commandline, "%s %s %s %s",

                     buffer_name,

                     buffer_size,

                     buffer_used,

                     buffer_available,

                     buffer_rate,

                     buffer_path

                   );





            gop_about . disk . size      = atoi ( buffer_size      );
            gop_about . disk . available = atoi ( buffer_available );



            return 1;}}




/*

 something happened

*/

    return 0;}
