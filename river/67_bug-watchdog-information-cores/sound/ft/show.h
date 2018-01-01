

void ft_show( int site ) {

    double max_f   = 100;
    double h       = 24;      // High
    double w       = 77;      // Long
    double dirta_w = (N/4)/w;




    int i ;
    int ii;

    for ( i = h; i > 0; i-- ) {

        output_print("int"   , (char*)&i  );
        output_print("string",        " " );

        if ( i < 10 ) {

            output_print("string", " ");}

        for ( ii = 0; ii < w; ii++ ) {

            if ( result_ft[site][(int)(ii*dirta_w)+1] > (max_f/h)*i )
                output_print("string", "■");

            else
                output_print("string", " ");}

            output_print("string", "\n");}}
