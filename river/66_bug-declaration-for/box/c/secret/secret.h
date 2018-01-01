

void* secret_decode(
                             char* that_message,
                       const char* that_type
                   ) {

    if ( strcmp(that_type, "blank") == 0 ) {

        ;}}

void* secret_encode(
                             char* that_message,
                       const char* that_type
                   ) {

    if      ( strcmp(that_type, "sum") == 0 ) {

        int number_length = strlen(that_message);
        int number_sum    = 0;

        int i;
        for ( i=0; i <= number_length; i++ ) {

            number_sum += (int)that_message[i];}

        gcvt(number_sum, 10, that_message);}


    else if ( strcmp(that_type, "blank") == 0 ) {

        ;}}




