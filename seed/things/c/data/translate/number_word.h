






/*

 something goes wrong with it

 maybe data format wrong

*/






int translate_number_word (

                              double  that_number,

                              int     that_round,

                              char *  that_word

                          )


  {








/*

 if it is less than zero

 could set it first

*/



 if ( that_number < 0 )


  {


 strcpy ( that_word, "-" );

 that_number = 0 - that_number;


  }




 else


  {


/*

 if not copy it to zero

*/

 strcpy ( that_word, "" );


  }













 int  note_number  =  ( int ) that_number;

 double  note_number_point  =  that_number - note_number;

 int  note_number_this  =  0;

 char  buffer_word[128]  =  "";




    printf("%d %f %d %s\n", buffer_number, buffer_number_point, buffer_number_this, buffer_word);

// The section before point.

    if ( buffer_number == 0 ) {

        strcat(buffer_word, "0");}

    else {

        while ( buffer_number != 0 ) {

            buffer_number_this   = buffer_number * 10 ;
            buffer_number_this   = buffer_number_this   % 100;
            buffer_number        = buffer_number / 10;

printf("%d %s\n", buffer_number_this, buffer_word);

            if ( buffer_number_this == 0  ) {

                if ( buffer_number != 0 ) {

                    strcat(buffer_word, "0");}}

            if ( buffer_number_this == 10 ) {

                strcat(buffer_word, "1");}

            if ( buffer_number_this == 20 ) {

                strcat(buffer_word, "2");}

            if ( buffer_number_this == 30 ) {

                strcat(buffer_word, "3");}

            if ( buffer_number_this == 40 ) {

                strcat(buffer_word, "4");}

            if ( buffer_number_this == 50 ) {

                strcat(buffer_word, "5");}

            if ( buffer_number_this == 60 ) {

                strcat(buffer_word, "6");}

            if ( buffer_number_this == 70 ) {

                strcat(buffer_word, "7");}

            if ( buffer_number_this == 80 ) {

                strcat(buffer_word, "8");}

            if ( buffer_number_this == 90 ) {

                strcat(buffer_word, "9");}

            else {

                break;}}}

printf("%s\n", buffer_word);

    for (
            buffer_number_this =  strlen(buffer_word);
            buffer_number_this >= 2                  ;
            buffer_number_this --
        ) {

        buffer_word[buffer_number_this-1] = '\0';

//        printf("%s\n", buffer_word+(buffer_number_this-2));
//        strcat( that_word, buffer_word + (buffer_number_this - 2) );
}


// The section after  point.

    buffer_number = 0;

    while ( that_round > 0 ) {

        that_round --;

        buffer_number        =                                       buffer_number       * 10  ;
        buffer_number       +=                                (int)( buffer_number_point * 10 );
        buffer_number_point  = ( buffer_number_point * 10 ) - (int)( buffer_number_point * 10 ); }

    if ( buffer_number != 0 ) {

        translate_number_word(buffer_number, that_round, buffer_word);

        strcat(that_word, ".");

        strcat(that_word, buffer_word);}

    return 1;}
