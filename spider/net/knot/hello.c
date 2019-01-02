
int judge_message_hello(

                           int   that_site,
                           char* pointer_recv,
                           char* buffer_send

                       ) {

// This is gop station
// Who is that now?

// This is gop station
// ------
// ...
// ------
// Here




    if (

              strstr(pointer_recv, "This is ") == pointer_recv
           && strstr(pointer_recv, "\n")       != NULL

       ) {

// This is fine...
// omg...

        return 1;}




    else {

        if (

               strstr ( pointer_recv, " GET  " ) == pointer_recv
        ||     strstr ( pointer_recv, " HTTP " ) == pointer_recv 

           ) {

            char buffer_path [ 32 ];

            strcpy ( buffer_path, path_the  );
            strcat ( buffer_path, "/"       );
            strcat ( buffer_path, name_data );
            strcat ( buffer_path, "/0/http.note" );

            file_save ( buffer_path, pointer_recv );


            output_print ( "string", " got a http message" );





// this is wait to test

// and we should use a function to do this

/*

/*

// let it send https message

// moved it to the judge of hello


<start>

80 HTTP/1.1
Host:www.soso.com
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*//*;q=0.8
User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36
Accept-Language:zh-CN,zh;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2

<end>

*/




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

*/
            }



        else {

            output_print( "string",        "Network with no smile " );
            output_print( "int"   , (char*)&that_site               );
            output_print( "string",        ": \n"                   );

            output_print( "string",        "\\*"                    );
            output_print( "string",         pointer_recv            );
            output_print( "string",        "\n"                     );
            output_print( "string",        "*\\"                    );

            strcat(buffer_send,    "Who is that?");

            return 0;}}}

