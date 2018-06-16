

int judge_message_information (

                                  int       that_site,
                                  char * pointer_recv,
                                  char *  buffer_send

                              ) {




/*

 PS. the varitable 'pointer_recv' was selected before

        so there is one piece of command there.

*/













// when there is not a command, we send this hello


    if (

           strstr ( pointer_recv, "Here."   )  ==  pointer_recv

    ||     strstr ( pointer_recv, "Recive." )  ==  pointer_recv

       ) {


/*

 if u don't want to do anythong,

  & so do anothers

 just keep this relationship

*/



/*

 and we don't need to add the ask, we ask if we don't thought out

 but it's not sames

*/



        if (  strcmp ( gop_connection.command [ that_site ], "" )  ==  0 ) {

            strcat ( buffer_send, "Who is that now?" );}




// so we do nothing..:D

        return 1;}












// this is to send information i used

    else if  (  strstr ( pointer_recv, "Information of host." )  ==  pointer_recv   ) {


/*

 we use 'information of it' & 'information of mate' next big change

 and we move it to it's mother site

*/





/*

 moved from watchdog/information/load.h

 so we can send a complete content

*/


        pointer_recv   =  strchr ( pointer_recv, '\n' ) + 1;




// load it, anyway 

        load_about (  gop_network . about [ that_site ],  pointer_recv  );


        return 1;}






    else if ( strstr(pointer_recv, "Information of guest.") == pointer_recv ) {




        pointer_recv   =  strchr ( pointer_recv, '\n' ) + 1;


        load_about_mate ( gop_network . about [ that_site ], pointer_recv );


        return 1;}





    else if (
                strstr(
                        pointer_recv,
                        "Sopi."
                      )
                ==      pointer_recv
            ) {


        output_print ( "string", "Got Sopi\n" );


        int i;

        for ( i = 0; i <= 3; i ++ ) {

            if (

                   strcmp(
                           gop_connection.how[i],
                          "Connectted"
                         )
                   == 0

            ||     strcmp(
                           gop_connection.how[i],
                          "Sopi"
                         )
                   == 0

               ) {

                strcpy(gop_connection.command[i], "Sopi.");}}


        clean_connection( that_site,   "sopi"  );

        strcat          ( buffer_send, "Sopi." );

        return 1;}












// we used the update next  when sop get message

// this can be sleep

    else if (
                strstr(
                        pointer_recv,
                       "Update lost."
                      )
                ==      pointer_recv
            ) {

        if (
               strcmp(
                       strchr(pointer_recv, '\n'),
                       "\n"
                     )
               == 0
           ) {

            strcpy( gop_connection.update     [that_site], path_the );
            strcat( gop_connection.update     [that_site], "/"      );
            strcat( gop_connection.update     [that_site], name_the );

                    gop_connection.step_update[that_site] = 0;}

        else {

            strcpy( gop_connection.update     [that_site], strchr(pointer_recv, '\n')+1 );
                    gop_connection.step_update[that_site]
     = atoi(strrchr(gop_connection.update     [that_site], '.') + 1)  ;
           *strrchr(gop_connection.update     [that_site], '.') = '\0';}


//        output_print    ( "string" , "Update lost." );
//        clean_connection( that_site, "update"       );

        return 1;}






    else if (
                strstr(
                        pointer_recv,
                        "Who is that now?"
                      )
                ==      pointer_recv
            ) {

// It means giving you  sopi
//    when  a host send sopi

        if ( strcmp(gop_connection.how[that_site], "Sopi") == 0 ) {


            output_print("string",    "Get Sopi back\n");

            strcat      (buffer_send, "Sopi."          );

            return 1;}}









    else {



// we will add this if they don't have a repeat

//        strcat ( buff