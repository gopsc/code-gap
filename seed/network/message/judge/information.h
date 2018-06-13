

int judge_message_information (

                                  int       that_site,
                                  char * pointer_recv,
                                  char *  buffer_send

                              ) {




//PS. the varitable 'pointer_recv' was selected before

//        so there is one piece of command there.















// when there is not a command, we send this hello


    if (

           strstr ( pointer_recv, "Here."  )  ==  pointer_recv

    ||     strstr ( pointer_recv, "Recive.")  ==  pointer_recv

       ) {



// if u don't want to do anythong,

//  & so do anothers

// just keep this relationship





// and we don't need to add the ask, we ask if we don't thout out


//        if (  strcmp ( gop_connection.command [ that_site ], "" )  ==  0 ) {

//            strcat ( buffer_send, "Who is that now?" );}




// so we do nothing..:D

        return 1;}












// this is to send information i used

    else if  (  strstr ( pointer_recv, "Information of host." )  ==  pointer_recv   ) {



// we use 'information of it' & 'information of mate' next big change

// and we move it to it's mother site




// load it, anyway 

        load_about (  gop_network . about [ that_site ],  pointer_recv  );


        return 1;}






    else if ( strstr(pointer_recv, "Information of guest.") == pointer_recv ) {


        load_about_mate ( gop_network . about [ that_site ], pointer_recv );


        return 1;}

//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                        "Sopi."
                      )
                ==      pointer_recv
            ) {


        output_print( "string", "Got Sopi\n" );


        int i;

        for ( i=0; i<=3; i++ ) {

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

//-----------------------------------------------
// when we used the update way about get next when sop get that
//
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

//-----------------------------------------------
/*

            if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {


// the loop program returned wrong flag
//
// if this is just like started just before
//
// there're two kind of possibility
//
// it is a beginning, something goes wrong
// or it's end
//
//
// but we read the returned before
//
//  so if it's like a beginning now
//
//  it must be a beginning
//
//  because we we will clean the buffer when the






                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {


// so we just loop it first
//
// if it returned a special value that means something really goes wrong
//
// it is done, we should never send a update message and we can fix it

                    output_print( "string", "There is no TxL source.\n" );


// clean it.

                    strcpy(gop_connection.update[that_site], "" );


// clean buffer of send

                   *strstr(buffer_send, "Update.") = '\0';


// this is a wrong,,,

                    return 0;}}







// ok we had loop it before in the judging's value
//
//   now we get the files

            file_get( gop_connection.update[that_site], buffer_file );


// and get the length of the file

            snprintf(
                      buffer_file_length,
                      sizeof(buffer_file_length) / sizeof(char) - 1,
                      "%d",
                      strlen(buffer_file)
                    );







// some file is very long, we can't send it once
//
// even if we can't read it unless used the changed buffer size
//
//  and i still can't use that :c


            if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {


// the value named 'step_update' means how many times we have send it
//
// and if this is over the last time of send this file already,
//
//  we should loop it again
//
// for next append






// loop it again

                if ( control_message_update(gop_connection.update[that_site]) != 0 ) {


// this is the last step, but not the last file
//
//  and be ready to send next file;

                    gop_connection.step_update[that_site] = 0;}








                else {

// if it is normal before
//
// and returned wrong now
//
// it means there is no another one file now


// clean it and send message


                    strcpy(gop_connection.update     [that_site], ""        );

                           gop_connection.step_update[that_site] = 0;



// print out and send message

                    output_print( "string",                       "Done.\n" );

                    strcat      (buffer_send,                     "Done."   );





// ready to update to another one
//
// something went worng, can't send update together

                    int i;

                    for (
                            i  = that_site + 1;
                            i <= 3;
                            i ++
                        ) {


                        if (
                               strcmp(gop_connection.how[i],     "Sopi")       == 0
                        ||     strcmp(gop_connection.how[i],     "Connectted") == 0
                           ) {

// it is next sop client
//
// send the update

                            strcpy(gop_connection.command[that_site], ""             );
                            strcpy(gop_connection.command[i],         "Clean update.");


// update one client once

                            break;}}



// this update is done, return it

                    return 1;}}

*/
//-----------------------------------------------

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

//-----------------------------------------------
/*

<start>

80 HTTP/1.1
Host:www.soso.com
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*//*;q=0.8
User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36
Accept-Language:zh-CN,zh;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2

<end>

*/

    else if (

                strstr ( pointer_recv, "GET " ) != NULL
         &&     strstr ( pointer_recv, "HTTP" ) != NULL

            ) {




        strcpy ( pointer_recv, "<start>\n\n" );

        strcat ( pointer_recv, "GET "                                                            );
        strcat ( pointer_recv, "520 HTTP/1.1\n"                                                  );
        strcat ( pointer_recv, "host:gop\n"                                                      );
        strcat ( pointer_recv, "Accept: text/html\n"                                             );
        strcat ( pointer_recv, "User-Agent:gop\n"                                                );
        strcat ( pointer_recv, "User-Language:zh-CN,zh;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2\n" );

        strcat ( pointer_recv, "\n<end>\n\n" );





        strcat ( pointer_recv, "<html>\n" );

        strcat ( pointer_recv, "<head><title>gop</title></head>\n" );

        strcat ( pointer_recv, "body bgcolor=\"white\">\n" );
        strcat ( pointer_recv, "<center><h1>"              );

        strcat ( pointer_recv, information_system.name     );
        strcat ( pointer_recv, "</h1></center>\n"          );

        strcat ( pointer_recv, "</body>\n" );
        strcat ( pointer_recv, "</html>\n" );


        return 1;

        }



//-----------------------------------------------

    else {

        strcat(buffer_send, "Who is that now?");

        return 0;}

//===============================================

    return 0;}
