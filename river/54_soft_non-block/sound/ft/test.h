void test_ft(const char* site) {

    double t;

    for(double n=1;n<=4096;n=n+1){

        t=n/4096;
        result_sound[1][(int)n] = sin(2*M_PI*160*t+1)*10;}


    if      ( strcmp(site, "snake") == 0 ) {

        printf("FT test start.\n");

        dft(1);

        printf("FT test done.\n");}




    else if ( strcmp(site, "fft") == 0 ) {

        printf("FT test start.\n");

        fft(1);

        printf("FT test done.\n");}}
