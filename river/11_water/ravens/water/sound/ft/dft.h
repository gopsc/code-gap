
void dft() {
    int    N = dft_N;
    double mo;
    double t;
    for ( int w=1; w<dft_w; w=w+dirta_w ) {
        double num  = 0;
        double numi = 0;
        for ( double n=1; n<=N; n++ ) {
            t = n/N;
            num  += (result_sound[(int)n]*cos(2*M_PI*w*t));
            numi += (result_sound[(int)n]*sin(2*M_PI*w*t));}
        mo = sqrt(num*num+numi*numi)/N;
        result_dft[w] = mo;}}

void dft_print() {
    double max_f = 20;
    double h = 23;
    double w = 86;

    for (int i = h; i > 0; i--){
        cout << i;
        cout << " ";
        if (i < 10){
            cout << " ";}

        for (int ii = 1; ii <= w; ii++){
            if ( result_dft[(ii-1)*dirta_w+1] >= (max_f/h)*i )
                cout << "*";
            else 
                cout << " ";}

        cout << endl;}}



//        if (mo > 50){
//            cout << w <<":"<<mo<<endl;}
/*
//TEST
    int    N = 22100 ;
    int    w = 456  ;
    int    F = -234  ;
    double  t      ;

    for (double n = 1; n <= N; n++) {
        t=n/N;
        result_sound[(int)n] = sin(2*M_PI*w*t)*F;}
    cout << "start" << endl;
    dft();
    cout << "end" << endl;

*/
