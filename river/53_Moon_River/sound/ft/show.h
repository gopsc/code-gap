

void ft_show( int site ) {

    double max_f   = 100;
    double h       = 24;   // High
    double w       = 77;   // Long
    double dirta_w = (N/4)/w;

    for (int i = h; i > 0; i--){

        printf("%d ", i);

        if (i < 10){

            printf(" ");}

        for (int ii = 0; ii < w; ii++){

            if ( result_ft[site][(int)(ii*dirta_w)+1] > (max_f/h)*i )
                printf("■");
            else
                printf(" ");}

        printf("\n");}}
