
void dft(int site) {


    double mo;
    double t;
    double w;
    double n;

    for ( w=1; w<=N/2; w++ ) {

        double num  = 0;
        double numi = 0;

        for ( n=1; n<=N; n++ ) {

            t = n/N;
            num  += (result_sound[site][(int)n]*cos(2*M_PI*w*t));
            numi -= (result_sound[site][(int)n]*sin(2*M_PI*w*t));}

        mo = sqrt(num*num+numi*numi)/(N/2);

        if (mo > 1){

            output_print( "double", (char*)&w    );
            output_print( "string",        ":"   );
            output_print( "double", (char*)&mo   );
            output_print( "string",        "\n"  );}

        result_ft[site][(int)w] = mo;}}
