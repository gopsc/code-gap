
void fft() {
    double t;
    double mo;

    double     what1[10000];
    double     buffer_dft[8][375][2];

    //N/2^3 = 375 ,Re numbie & Im number

    for ( int round=1; round<=2*2*2; round++ ) {
        for ( double w=1; w<=N/(2*2*2); w=w+dirta_w ) {
            for ( double n=round; n <= N; n=n+(2*2*2) ) {
                t = n/N;
                buffer_dft[round][(int)w][1] += ( result_sound[(int)n]*cos(2*M_PI*(w+0)*t));
                buffer_dft[round][(int)w][2] -= ( result_sound[(int)n]*sin(2*M_PI*(w+0)*t));}}}
    cout<<endl;
    double numr;
    double numi;


    for ( int w=1; w<=1500; w=w+dirta_w ) {
        numr = 0;
        numi = 0;
        if ( w/375 == 0 ) {
            for ( int line=1; line<=8; line=line+1 ) {
                numr += buffer_dft[line][w][1];
                numi += buffer_dft[line][w][2];}}


        else if ( w/375 == 1 ) {
            numr -= buffer_dft[1][375-(w-375*1)][2];
            numi -= buffer_dft[1][375-(w-375*1)][1];
            numr -= buffer_dft[5][375-(w-375*1)][2];
            numi -= buffer_dft[5][375-(w-375*1)][1];

            numr += buffer_dft[2][w-375*1][2];
            numi -= buffer_dft[2][w-375*1][1];
            numr -= buffer_dft[6][w-375*1][2];
            numi += buffer_dft[6][w-375*1][1];

            numr += buffer_dft[3][375-(w-375*1)][2];
            numi += buffer_dft[3][375-(w-375*1)][1];
            numr += buffer_dft[7][375-(w-375*1)][2];
            numi += buffer_dft[7][375-(w-375*1)][1];

            numr -= buffer_dft[4][w-375*1][1];
            numi -= buffer_dft[4][w-375*1][2];
            numr += buffer_dft[8][w-375*1][1];
            numi += buffer_dft[8][w-375*1][2];}

        else if ( w/375 == 2 ) {
            numr += buffer_dft[1][w-375*2][2];
            numi -= buffer_dft[1][w-375*2][1];
            numr += buffer_dft[5][w-375*2][2];
            numi -= buffer_dft[5][w-375*2][1];

            numr -= buffer_dft[2][w-375*2][1];
            numi -= buffer_dft[2][w-375*2][2];
            numr -= buffer_dft[6][w-375*2][1];
            numi -= buffer_dft[6][w-375*2][2];

            numr -= buffer_dft[3][w-375*2][2];
            numi += buffer_dft[3][w-375*2][1];
            numr -= buffer_dft[7][w-375*2][2];
            numi += buffer_dft[7][w-375*2][1];

            numr += buffer_dft[4][w-375*2][1];
            numi += buffer_dft[4][w-375*2][2];
            numr += buffer_dft[8][w-375*2][1];
            numi += buffer_dft[8][w-375*2][2];}


        else if ( w/375 == 3 ) {
            numr -= buffer_dft[1][375-(w-375*3)][1];
            numi += buffer_dft[1][375-(w-375*3)][2];
            numr -= buffer_dft[5][375-(w-375*3)][1];
            numi += buffer_dft[5][375-(w-375*3)][2];

            numr -= buffer_dft[2][w-375*3][2];
            numi += buffer_dft[2][w-375*3][1];
            numr += buffer_dft[6][w-375*3][2];
            numi -= buffer_dft[6][w-375*3][1];

            numr -= buffer_dft[3][375-(w-375*3)][1];
            numi += buffer_dft[3][375-(w-375*3)][2];
            numr -= buffer_dft[7][375-(w-375*3)][1];
            numi += buffer_dft[7][375-(w-375*3)][2];

            numr -= buffer_dft[4][w-375*3][1];
            numi -= buffer_dft[4][w-375*3][2];
            numr += buffer_dft[8][w-375*3][1];
            numi += buffer_dft[8][w-375*3][2];}


        mo = sqrt( numr*numr + numi*numi ) / 1500;
        result_dft[w] = mo;
        //if (mo > 1){
        //    cout << w << ":" << mo << "   " << numr << "   " << numi<< endl;}
}}



/*
//TEST code


    double     N = 3000 ;
    double     w = 30  ;
    double     F = 10  ;
    double     x = 1  ;
    double     t      ;
    for (double n = 1; n <= N; n=n+1) {
        t=n/N;
        result_sound[(int)n] += sin(2*M_PI*w*t+x)*F;}
    fft();
    cout << endl;

*/


/*
//  fft with 1 round

    double     result_dft1[1500][2];
    double     result_dft2[1500][2];

    for ( double w=1; w<=N/2; w=w+dirta_w ) {
        for ( double n=1; n <= N; n=n+2 ) {
            t = n/N;
            result_dft1[(int)w][1] += (result_sound[(int)n]*cos(2*M_PI*w*t));
            result_dft1[(int)w][2] += (-(result_sound[(int)n]*sin(2*M_PI*w*t)));}}
    for ( double w=1; w<=N/2; w=w+dirta_w ) {
        for ( double n=2; n <= N; n=n+2 ) {
            t = n/N;
            result_dft2[(int)w][1] += (result_sound[(int)n]*cos(2*M_PI*w*t));
            result_dft2[(int)w][2] += (-(result_sound[(int)n]*sin(2*M_PI*w*t)));}}

    for ( double w=1; w<=N/2; w=w+dirta_w ) {
        num  = result_dft1[(int)w][1] + result_dft2[(int)w][1];
        numi = result_dft1[(int)w][2] + result_dft2[(int)w][2];
        mo = sqrt(num*num+numi*numi)/N;
*/

/*
//  fft with 3 round
//  P.S.

the one-hand
  //dirta n = 4, N = 750  (w/2^2)  1st
            buffer_dft[1][1][1][(int)w][1];
          + buffer_dft[1][1][2][(int)w][1];

  //dirta n = 4, N = 750  (w/2^2) 1st
          + buffer_dft[1][2][1][(int)w][1];
          + buffer_dft[1][2][2][(int)w][1];

  //dirta n = 2, N = 1500 (w/2^1) 2nd
            

  //dirta n = 4, N = 750  (w/2^2) 1st
            numr[2] += buffer_dft[2][1][1][(int)w][1];
            numr[2] += buffer_dft[2][1][2][(int)w][1];

  //dirta n = 1, N = 3000 (w/2^0) 3rd
  //dirta n = 2, N = 1500 (w/2^1) 2nd
  //dirta n = 4, N = 750  (w/2^2) 1st
            numr[2] += buffer_dft[2][2][1][(int)w][1];
            numr[2] += buffer_dft[2][2][2][(int)w][1];
the other-hand ()
*/









