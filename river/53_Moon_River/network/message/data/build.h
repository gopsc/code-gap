
void control_message_data(
                             int   that_site,
                             char* buffer_send
                         ) {

    if ( strcmp(gop_connection.update[that_site], "") != 0 ) {

        append_message_data_update( that_site, buffer_send );

        strcat(buffer_send, symbol_next);}

    return;}