
void dog_show() {

    if ( flag_show == 1 ) {

        char that_information[2049];

        information_get(that_information);

        system( "clear" );

        output_print( "string", that_information              );
        output_print( "string", "\n"                          );
        output_print( "string", gop_connection.information[1] );
        output_print( "string", "\n"                          );
        output_print( "string", gop_connection.information[2] );
        output_print( "string", "\n"                          );
        output_print( "string", gop_connection.information[3] );
        output_print( "string", "\n"                          );
        output_print( "string", gop_connection.information[0] );
        output_print( "string", "\n"                          );}}