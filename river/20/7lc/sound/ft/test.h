void test_ft(string site) {

    double N=4096;
    double w=2245;
    double F=10;
    double x=1;
    double t;

    for(double n=1;n<=N;n=n+1){
        t=n/N;
        result_sound[(int)n] = sin(2*M_PI*w*t+x)*F;}

    cout << "FT TEST START." << endl;

    if ( site == "dft" ) {
        dft();}
    else if ( site == "fft" ){
        fft();}

    cout << "FT TEST DONE." << endl;}
