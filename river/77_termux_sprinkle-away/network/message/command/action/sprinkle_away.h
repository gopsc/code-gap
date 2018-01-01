
int action_sprinkle_away(
                            int   that_site
                        ) {





    if ( that_site == -1 ) {

        int i;

        for ( i=0; i<=3; i++ ) {

            if (
                   strcmp(gop_connection.how[i],          "Sopi"      ) == 0
            ||     strcmp(gop_connection.how[i],          "Connectted") == 0
               ) {

                strcpy(gop_connection.command[that_site], ""             );
                strcpy(gop_connection.command[i],         "Clean update.");

                return 1;}}}


    return 0;}
