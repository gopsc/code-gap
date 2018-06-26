
int about_CPU_frequency () {




    char  that_file [ 10240 ];

    char  that_result [ 1024 ];





    file_get ( "/proc/cpuinfo", that_file );



    commandline_get ( "lscpu",  that_result );







/*

 don't know where it is

 we try to found

*/




    if  (  strstr ( that_file, "cpu MHz" )  !=  NULL  ) {


/*

 there it is

*/


        strcpy  (  that_file,  strstr ( that_file, "cpu MHz" )     );
        strcpy  (  that_file,  strstr ( that_file, ": "      ) + 2 );

      * strchr ( that_file, '\n' ) = '\0';


        gop_about . cpu . frequency  =  atoi ( that_file );}






/*

 could be other way

*/


    else if  (  strstr ( that_result, "cpu max MHz" )  !=  NULL  ) {



        strcpy  (  that_result,  strstr ( that_result, "cpu max MHz" )  );

      * strchr ( that_result, '\n' ) = '\0';

        sscanf ( that_result, "%s %s %s %s", that_file, that_file, that_file, that_result );


        gop_about . cpu . frequency  =  atoi ( that_result );}





/*

 this show up on deepin linux

*/

    else if  (  strstr ( that_result, "CPU max MHz" )  !=  NULL  ) {



        strcpy  (  that_result,  strstr ( that_result, "CPU max MHz" )  );

      * strchr ( that_result, '\n' ) = '\0';

        sscanf ( that_result, "%s %s %s %s", that_file, that_file, that_file, that_result );


        gop_about . cpu . frequency  =  atoi ( that_result );}








    else {



/*

 this is not same like hz

 could very small

 on termux

*/

        if  (  strstr ( that_file, "BogoMIPS" )  != NULL  ) {


            strcpy ( that_file, strstr ( that_file,  "BogoMIPS") );
            strcpy ( that_file, strstr ( that_file,  ": "      ) + 2 );
                              * strchr ( that_file,  '\n'      ) = '\0';


            gop_about . cpu . frequency  =  atoi ( that_file );}




        else if  (  strstr ( that_file, "Bogomips" )  !=  NULL  ) {


            strcpy ( that_file, strstr ( that_file,   "Bogomips" ) );
            strcpy ( that_file, strstr ( that_file, ": " ) + 2 );
                              * strchr ( that_file, '\n' ) = '\0';


            gop_about . cpu . frequency  =  atoi ( that_file );}}





    return 1;}
