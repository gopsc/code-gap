
void action_information() {

    char   buffer_information[2049];
    strcpy(buffer_information, "");

    system("clear");

    information_get( buffer_information );


    output_print("------------------------------\n" );
    output_print( buffer_information                );
    output_print("\n"                               );
    output_print("------------------------------\n" );

    for (
            int i=0;
                i<4;
                i++
        ) {

        if ( strcmp( gop_connection.information[i], "") != 0 ) {

            output_print(gop_connection.information[i]      );
            output_print("------------------------------\n" );}}

    return;}
