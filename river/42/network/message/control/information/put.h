
void message_information_put(char* buffer_send) {



    char that_buffer[10240];

    information_get(that_buffer);

    strcat(buffer_send, that_buffer);


    for ( int i = 0; i <= 3; i++ ) {

        strcat(buffer_send, gop_connection.information[i]);}}