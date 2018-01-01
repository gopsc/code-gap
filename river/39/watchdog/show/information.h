
void dog_show() {

    if ( flag_show == true ) {

        char that_information[2049];

        information_get(that_information);

        system( "clear" );

        printf( "%s\n", that_information );
        printf( "%s\n", gop_connect.information[1] );
        printf( "%s\n", gop_connect.information[2] );
        printf( "%s\n", gop_connect.information[3] );
        printf( "%s\n", gop_connect.information[0] );}}







