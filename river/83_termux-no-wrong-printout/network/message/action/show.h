



int action_show() {





    if      ( information_flag.show == 0 ) {


        information_flag.show = 1;


        return 1;}







    else if ( information_flag.show == 1 ) {


        information_flag.show = 0;


        return 1;}






    else {


        return 0;}}
