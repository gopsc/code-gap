
void dft() {
    double mo;
    double t;
    for ( int w=1; w<=1500; w=w+dirta_w ) {
        double num  = 0;
        double numi = 0;
        for ( double n=1; n<=3000; n=n+1 ) {
            t = n/3000;
            num  += (result_sound[(int)n]*cos(2*M_PI*w*t));
            numi -= (result_sound[(int)n]*sin(2*M_PI*w*t));}
        mo = sqrt(num*num+numi*numi)/1500;
        if (mo > 1){
            cout<<w<<":"<<(int)mo<<"  "<<(int)num<<"  "<<(int)numi<<endl;}
        result_dft[w] = mo;}}






void dft_print() {
    double max_f = 5;
    double h = 23;
    double w = 86;

    for (int i = h; i > 0; i--){
        cout << i;
        cout << " ";
        if (i < 20){
            cout << " ";}
        for (int ii = 0; ii < w; ii++){
            if ( result_dft[ii*dirta_w+1] > (max_f/h)*i )
                cout << "*";
            else 
                cout << " ";}
        cout << endl;}}



/*
//TEST
        int    N = 1000 ;
        int    w = 456  ;
        int    F = -234  ;
        int    x = 0     ;
        double  t      ;

        for (double n = 1; n <= N; n++) {
            t=n/N;
            result_sound[(int)n] = sin(2*M_PI*w*t+x)*F;}
        cout << "start" << endl;
        dft();
        cout << "end" << endl;

*/
