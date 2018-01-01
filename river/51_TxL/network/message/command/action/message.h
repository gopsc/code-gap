
void action_information() {

    char buffer_information[2049];

    system("clear");

    information_get( buffer_information );


    printf("%s\n", buffer_information );
    printf("%s",   gop_connection.information[1]);
    printf("%s",   gop_connection.information[2]);
    printf("%s",   gop_connection.information[3]);
    printf("%s",   gop_connection.information[0]);}
