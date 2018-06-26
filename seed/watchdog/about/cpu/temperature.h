

int about_CPU_temperature () {



    char   path_temperature [ 64 ]  =  "/sys/class/thermal/thermal_zone0/temp";
    char buffer_temperature [ 32 ];
    int  number_temperature;





/*

 some don't have it

 maybe other place

*/

    if (  ! is_file ( path_temperature )  ) {

        gop_about . cpu . temperature  =  -1;}




    else {


        file_get ( path_temperature, buffer_temperature );


        number_temperature  =  atoi ( buffer_temperature );





        if  (  strcmp ( information_system.name, "raspberrypi" )  ==  0  ) {

            gop_about . cpu . temperature  =  ( int ) number_temperature / 1000;}


        else if  (  strcmp ( gop_about . system . name, "Orangepi" )  ==  0  ) {

            gop_about . cpu . temperature  =  number_temperature;}


        else if  (  strcmp ( gop_about . system . name, "OrangePI" )  ==  0  ) {

            gop_about . cpu . temperature  =  number_temperature;}

/*

 ...

*/

        else if  (  number_temperature  >  10000  ) {

            gop_about . cpu . temperature  =  ( int ) number_temperature / 1000;}


        else {

            gop_about . cpu . temperature  =  number_temperature;}}


    return 1;}