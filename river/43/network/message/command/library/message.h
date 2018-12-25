
void command_message() {

    char buffer_message[2049];

    system("clear");

    information_get( buffer_message );

    printf( "%s\n", buffer_message );
    printf("%s",   gop_connection.information[1]);
    printf("%s",   gop_connection.information[2]);
    printf("%s",   gop_connection.information[3]);
    printf("%s",   gop_connection.information[0]);}