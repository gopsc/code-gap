



/*

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






void fft(int site) {



    double mo;
    double t;

    double buffer_fft[33][17][3];




    double round;
    double w;
    double n;

    for ( round=1; round<=32; round++ ) {

        for ( w=1; w<=16; w++ ) {

            buffer_fft[(int)round][(int)w][1] = 0;
            buffer_fft[(int)round][(int)w][2] = 0;

            for ( n=round; n<=N; n=n+32 ) {

                t = (n-round)/N;
                buffer_fft[(int)round][(int)w][1] += (result_sound[site][(int)n]*cos(2*M_PI*(double)w*t));
                buffer_fft[(int)round][(int)w][2] -= (result_sound[site][(int)n]*sin(2*M_PI*(double)w*t));}}}






//          result_sound[site][(int)n] * cos(2*M_PI*w/N * (n-round+round))

//        = result_sound[site][(int)n] * cos(2*M_PI*w/N*(n-round)) * cos(2*M_PI*(double)w/N*round)
//        - result_sound[site][(int)n] * sin(2*M_PI*w/N*(n-round)) * sin(2*M_PI*(double)w/N*round)



    double bin_fft[257][3];

    for ( w=1; w<=N/2; w++ ) {

        bin_fft[(int)w][1] = 0;
        bin_fft[(int)w][2] = 0;

        for ( round=1; round<=32; round++ ){



            bin_fft[(int)w][1]

        += (buffer_fft[(int)round][(int)w%16][1] * cos(2*M_PI*w*round/N)
           +buffer_fft[(int)round][(int)w%16][2] * sin(2*M_PI*w*round/N));



            bin_fft[(int)w][2]

        -= (buffer_fft[(int)round][(int)w%16][2] * cos(2*M_PI*w*round/N)
           -buffer_fft[(int)round][(int)w%16][1] * sin(2*M_PI*w*round/N));}




        mo = sqrt(bin_fft[(int)w][1]*bin_fft[(int)w][1] + bin_fft[(int)w][2]*bin_fft[(int)w][2]);
        mo = mo/(N/2);


//        if (mo >= 1) {
//
//            output_print( "double", (char*)&w    );
//            output_print( "string",        ":"   );
//            output_print( "double", (char*)&mo   );
//            output_print( "string",        "\n"  );}


        result_ft[site][(int)w] = mo;}

    if ( information_flag.sound_show ) {

        ft_show(site);}}





void test_ft(const char* site) {







    double t;

    double n;



    for( n=1;n<=4096;n=n+1 ) {



        t=n/4096;

        result_sound[1][(int)n] = sin(2*M_PI*160*t+1)*10;}









    if      ( strcmp(site, "snake") == 0 ) {



        output_print("string", "FT test start.\n");



        dft(1);



        output_print("string", "FT test done.\n");}









    else if ( strcmp(site, "fft") == 0 ) {



        output_print("string", "FT test start.\n");



        fft(1);



        output_print("string", "FT test done.\n");}}

*/







#include  "./things/linux/system/trees/dirents/create.c"


#include  "./leaves/lake/that.c"

#include  "./leaves/lake/begin.c"

#include  "./leaves/lake/end.c"    

#include  "./leaves/lake/write.c"

#include  "./leaves/lake/fish.c"

#include  "./leaves/lake/drop.c"
   

#include  "./leaves/lake/existence/begin.c"

#include  "./leaves/lake/existence/end.c"




#include  "./leaves/system/trees/dirents/is.c"

#include  "./leaves/system/trees/files/is.c"

#include  "./leaves/system/trees/files/save.c"

#include  "./leaves/system/trees/files/append.c"

#include  "./leaves/system/trees/files/get.c"







#include  "./dog/that/hope.h"



#include  "./spider/that/hope.h"

#include  "./spider/that/that/that.h"

#include  "./spider/that/lake/that.h"



#include  "./voice/that/hope.h"

#include  "./voice/that/that.h"






#include  "./leaves/that/seed.c"




