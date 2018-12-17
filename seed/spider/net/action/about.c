





// if u type a blank type, just show the informations


int action_about () {



    char   buffer_about [ 2048 ];


    strcpy ( buffer_about, "" );






    system ( "clear" );







    put_about (

                buffer_about,

                gop_about

              );




    output_print ( "string", "------------------------------\n" );

    output_print ( "string",  buffer_about                      );

    output_print ( "string", "\n"                               );

    output_print ( "string", "------------------------------\n" );





    int i;


    for (

            i = 0;
            i < 4;
            i ++

        ) {





        if (

               strcmp  (  gop_connection.how [ i ], "Connectted"  )  ==  0
        ||     strcmp  (  gop_connection.how [ i ], "Sopi"        )  ==  0

           ) {



// we do this when put

//            strcpy ( buffer_about, "");



            put_about (

                        buffer_about,

                        gop_about

                      );

// this is difficult to deal these

/*

            information_about (

                                gop_connection.system  [ i ],
                                gop_connection.network [ i ],
                                gop_connection.cpu     [ i ],
                                gop_connection.memory  [ i ],
                                gop_connection.disk    [ i ],
                                gop_connection.sound   [ i ],
                                gop_connection.flag    [ i ]

                              );

*/


            output_print ( "string", buffer_about );

            output_print ( "string", "\n" );

            output_print ( "string", "------------------------------\n" );}}





    return 1;}
