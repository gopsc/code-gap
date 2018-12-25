
void command_sprinkle_away(
                              int   site
                          ) {





    if ( site == -1 ) {

        for ( int i=0; i<=3; i++ ) {

            if (
                   strcmp(gop_connection.how[i],     "Sopi")       == 0
            or     strcmp(gop_connection.how[i],     "Connectted") == 0
               ) {

                   strcpy(gop_connection.command[site], ""             );
                   strcpy(gop_connection.command[i],    "Clean update.");}}}}