

void ft_show() {

    double max_f = 100;
    double h = 70;
    double w = 200;

	int dirta_w = N/w;

    for (int i = h; i > 0; i--){

        cout << i;
        cout << " ";

        if (i < 10){

            cout << " ";}

        for (int ii = 0; ii < w; ii++){

            if ( result_ft[ii*dirta_w+1] > (max_f/h)*i )
                cout << "*";
            else
                cout << " ";}

        cout << endl;}}











