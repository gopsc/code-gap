
void action_information() {

    char   buffer_information[2049];
    strcpy(buffer_information, "");

    system("clear");

    information_get( buffer_information );


    printf("------------------------------\n" );
    printf("%s\n", buffer_information );
    printf("------------------------------\n" );

    for (
            int i=0;
                i<4;
                i++
        ) {

        if ( strcmp( gop_connection.information[i], "") != 0 ) {

            printf("%s",   gop_connection.information[i]);
            printf("------------------------------\n" );}}

    return;}
