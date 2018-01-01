

void* start_calculate(void*) {

    string that;


    that  = "Calculate:";
    that += calculate_now.substr( 10, calculate_now.find("sound/")-10 );
    that += "ft/";
    that += calculate_now.substr(calculate_now.find("sound/")+6, calculate_now.find(".sound")-calculate_now.find("sound/")-6);
    that += ".ft";
    that += ".";
    that += calculate_now.substr(calculate_now.rfind(",")+1, calculate_now.rfind("\n")-calculate_now.rfind(",")-1 );

    that += "\n";


    calculate_now = "Working";






    fft();






    for ( int i = 1; i <= 512; i++) {
        that += to_string((int)result_ft[i]);
        that += "\n";}


    for (int i = 0; i <= 3; i++) {

        if (gop_connect.how[i] == "Connectting" or gop_connect.how[i] == "Sop" ) {

            while(gop_connect.command[i] != "") {

                gop_delay(0.1);}

            gop_connect.command[i] = that;

            calculate_now = "Free";

            break;}}}  
