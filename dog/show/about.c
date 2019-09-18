





int dog_show () {


    if  (  gop_about . flag . show  ==  1  ) {





// it is good if this funtion could count the number of words

        char buffer_show [ 4096 ];

        char buffer_words [ 2048 ];
        


// there are old way

/*

        information_append (

                             buffer_information,
                             information_system,
                             information_network,
                             information_cpu,
                             information_memory,
                             information_disk,
                             information_sound,
                             information_flag
                           );
*/



// get it

        put_about ( buffer_show, gop_about );





        system ( "clear" );

        strcpy ( buffer_show, buffer_words );

        strcat ( buffer_show, "\n\n" );







        int i;

        for (  i = 0; i <= 3; i ++  ) {


            if (
                   strcmp (  gop_connection.how [ i ], "Connectted"  )  ==  0 
            ||     strcmp (  gop_connection.how [ i ], "Sopi"        )  ==  0 
               ) {




// it clean it put

/*

                strcpy ( buffer_show, "" );

                information_append (
                                     buffer_information,
                                     gop_connection.system [ i ],
                                     gop_connection.network[ i ],
                                     gop_connection.cpu    [ i ],
                                     gop_connection.memory [ i ],
                                     gop_connection.disk   [ i ],
                                     gop_connection.sound  [ i ],
                                     gop_connection.flag   [ i ]
                                   );

*/




                put_about ( buffer_words, gop_connection . about [ i ] );




                strcat ( buffer_show, buffer_words );

                strcat ( buffer_show, "\n\n" );}}



        output_print ( "string", buffer_show );}



    return 1;}
