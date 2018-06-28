void test_ft(const char* site) {

    double t;

    for(double n=1;n<=4096;n=n+1){

        t=n/4096;
        result_sound[1][(int)n] = sin(2*M_PI*160*t+1)*10;}

    printf("FT TEST START.\n");

    if ( strcmp(site, "dft") == 0 ) {
        dft(1);}
    else if ( strcmp(site, "fft") == 0 ) {
        fft(1);}

    printf("FT TEST DONE.\n");}
