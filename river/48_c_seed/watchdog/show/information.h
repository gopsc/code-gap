
void dog_show() {

    if ( flag_show == 1 ) {

        char that_information[2049];

        information_get(that_information);

        system( "clear" );

        printf( "%s\n", that_information );
        printf( "%s\n", gop_connection.information[1] );
        printf( "%s\n", gop_connection.information[2] );
        printf( "%s\n", gop_connection.information[3] );
        printf( "%s\n", gop_connection.information[0] );}}