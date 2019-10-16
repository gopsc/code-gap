



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


*/







/*

#include <stdio.h>




#include <stdlib.h>

#include <unistd.h>





#include <string.h>     // for string ways

#include <math.h>       // for snake

#include <time.h>       // for time ( NULL )


#include <dirent.h>     // for dirent






#include <ifaddrs.h>    // for network socket
#include <fcntl.h>      // for ...





#include <pthread.h>    // for thread






#include <signal.h>     // for check_deamon() ->
                        // for tcp block out.






#include <sys/time.h>   // for note_save() -> gettimeofday()

#include <sys/socket.h> // for network -> socket

#include <sys/stat.h>   // for file system status


#include <sys/types.h>  // for check_deamon() ->
#include <sys/param.h>  // for ...





#include <arpa/inet.h>  // for network

*/







#include  <stdio.h>








int main ( int argc, char * argv [] )


{




begin_leaves_lake_existence ();




/*

void  *   note_words;



printf  (  "%s\n", get_leaves_system_trees_files (  "/home/qing/hello/hi",  note_words  )  );

printf  (  "%s\n",  note_words  );


free ( note_words );

*/






/*
    if ( here () )

    pthread_create (
                              & thread [ 0 ],
                                NULL,
                                dream,
                     ( void * ) gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]
                   );
*/

















/*

 that . hope . number_hope = argc;

 that . hope . hope = argv;

 */
















/*

 init_deamon ();

*/














/*

 output_print ( "string", "\n" );

*/
















/*

 that . hope . thread  =  malloc (  3  *  sizeof ( pthread_t )  );

*/







/*

pthread_create (  & thread [ 1 ], NULL,  gop_dog,  NULL  );

pthread_create (  & thread [ 2 ], NULL,  gop_connectted,  NULL  );

pthread_create (  & thread [ 3 ], NULL,  gop_connector,  NULL  );

*/



/*

 pthread_create (  & thread [ 4 ], NULL,  gop_corde,  NULL  );

*/




































/*

char  note_command  [ 128 ]   =   "";

*/




















/*

while   (   !  gop_about . flag . start   )

{

gop_wait   (  0.1  );

}

*/






























/*

if  (

                gop_about . flag . main

        &&  ( ! gop_about . flag . deamon )

    )

{



output_print   (   "string",   "\n we met somewhere \n\n"   );



}

*/

































/*

note_save   (   "command",   "command start",   "now"   );

*/


















/*

while   (   gop_about . flag . main   )

{

*/
























/*

if   (   gop_about . flag . deamon   )

{


gop_wait  (  0.1  );


}

*/












/*

else

{

*/


/*

fgets   (   note_command,   128,   stdin   );

*/


















/*

if (

     strcmp   (   note_command,   ""   )    ==    0

   )

{

gop_wait  (  0.1  );

}

*/












/*

else

{

*/




/*

note_command    [   strlen  (  note_command  )  -  1   ]    =    '.';

*/









/*

output_print   (   "string",   "\n"   );

*/















/*

judge_message_command (
                        -1,
                        note_command,
                        note_command
                      );

*/













/*

strcpy   (   note_command,   ""   );

*/

















/*

}

*/

















/*

}

*/














/*

}

*/















/*

note_save ( "command", "command close", "now" );

*/













}












