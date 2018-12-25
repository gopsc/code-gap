

bool message_information_get( int site, char* pointer_recv, char* buffer_send ) {



    if (
           strstr(pointer_recv, "-----")
           !=     pointer_recv
       ) {


        strcat(buffer_send, "Who is that now?");

        return 0;}






    else {

        strcpy(
                gop_connection.information[site],
                pointer_recv
              );



      *(strstr(
               strchr(gop_connection.information[site], '\n') + 1,
              "-----\n"
              )
    + 6) = '\0';



// If you connect to yourself,
// clear it.

        for (int i=1; i<=information_ip_num; i++) {

            if (
                 strcmp(
                         gop_connection.address_ip[site],
                         information_ip[i][2]
                       ) == 0
               ) {

                strcpy(gop_connection.information[site], "");}}

        return 1;}}