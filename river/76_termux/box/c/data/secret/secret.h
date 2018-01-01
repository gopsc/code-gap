

int secret_decode(
                           char* that_message,
                     const char* that_type
                 ) {

    if ( strcmp(that_type, "blank") == 0 ) {

        return 1;}


    return 0;}


int secret_encode(
                           char* that_message,
                     const char* that_type
                 ) {

    if      ( strcmp(that_type, "sum") == 0 ) {

        int number_length = strlen(that_message);
        int number_sum    = 0;

        int i;
        for ( i=0; i <= number_length; i++ ) {

            number_sum += (int)that_message[i];}

        snprintf(
                  that_message,
                  sizeof(that_message) / sizeof(char) - 1,
                  "%d", 
                  number_sum
                );

        return 1;}


    else if ( strcmp(that_type, "blank") == 0 ) {

        return 1;}


    return 0;}
