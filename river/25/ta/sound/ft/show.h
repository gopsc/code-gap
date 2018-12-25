

void ft_show( int site ) {

    double max_f   = 100;
    double h       = 61;
    double w       = 170;
    double max_w   = 70;

    double dirta_w = (N/4)/w;

    for (int i = h; i > 0; i--){

        cout << i;
        cout << " ";

        if (i < 10){

            cout << " ";}

        for (int ii = 0; ii < w; ii++){

            if ( result_ft[site][(int)(ii*dirta_w)+1] > (max_f/h)*i )
                cout << "*";
            else
                cout << " ";}

        cout << endl;}}











