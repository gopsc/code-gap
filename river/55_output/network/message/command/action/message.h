
void action_information() {

    char   buffer_information[2049];
    strcpy(buffer_information, "");

    system("clear");

    information_get( buffer_information );


    output_print("string", "------------------------------\n" );
    output_print("string",  buffer_information                );
    output_print("string", "\n"                               );
    output_print("string", "------------------------------\n" );

    for (
            int i=0;
                i<4;
                i++
        ) {

        if ( strcmp( gop_connection.information[i], "") != 0 ) {

            output_print("string", gop_connection.information[i]      );
            output_print("string", "------------------------------\n" );}}

    return;}
