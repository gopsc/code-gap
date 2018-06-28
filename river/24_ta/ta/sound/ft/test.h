void test_ft(string site) {

    double t;

    for(double n=1;n<=2048;n=n+1){
        t=n/4096;
        result_sound[1][(int)n] = sin(2*M_PI*160*t+1)*10;}

    cout << "FT TEST START." << endl;

    if ( site == "dft" ) {
        dft(1);}
    else if ( site == "fft" ){
        fft(1);}

    cout << "FT TEST DONE." << endl;}
