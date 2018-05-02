
int translate_number_word (
                              double that_number,
                              char*  that_word
                          ) {

    int    buffer_number       =               (int)that_number;
    double buffer_number_point = that_number -    buffer_number;


// The section before point.

    int  number_this;
    char buffer_word[1024];


    if ( buffer_number == 0 ) {

        strcpy(buffer_word, "0");}

    else {

        do {

            number_this   = buffer_number * 10 ;
            number_this   = number_this   % 100;
            buffer_number = buffer_number / 10;


            if ( number_this == 0  ) {

                if ( buffer_number != 0 ) {

                    strcat(buffer_word, "0");}}

            if ( number_this == 10 ) {

                strcat(buffer_word, "1");}

            if ( number_this == 20 ) {

                strcat(buffer_word, "2");}

            if ( number_this == 30 ) {

                strcat(buffer_word, "3");}

            if ( number_this == 40 ) {

                strcat(buffer_word, "4");}

            if ( number_this == 50 ) {

                strcat(buffer_word, "5");}

            if ( number_this == 60 ) {

                strcat(buffer_word, "6");}

            if ( number_this == 70 ) {

                strcat(buffer_word, "7");}

            if ( number_this == 80 ) {

                strcat(buffer_word, "8");}

            if ( number_this == 90 ) {

                strcat(buffer_word, "9");}}

        while ( buffer_number != 0 );}


    number_this            = strlen(buffer_word);
    that_word[number_this] = '\0';
    number_this            --    ;

    for (
            buffer_number = 0;
            number_this  >= 0;
            number_this  --
        ) {

        that_word[buffer_number] = buffer_word[number_this];
                  buffer_number ++                         ;}


// The section after  point.

    buffer_number = 0;

    while ( buffer_number_point != 0 ) {

        printf("%lf\n", buffer_number_point);

        buffer_number       =                                   buffer_number       * 10  ;
        buffer_number      +=                            (int)( buffer_number_point * 10 );
        buffer_number_point = buffer_number_point * 10 - (int)( buffer_number_point * 10 ); }

    if ( buffer_number != 0 ) {

        translate_number_word(buffer_number, buffer_word);

        strcat(that_word, ".");

        strcat(that_word, buffer_word);}

    return 1;}
