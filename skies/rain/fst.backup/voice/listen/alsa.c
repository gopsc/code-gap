



#include <alsa/asoundlib.h>

void * gop_corde ( void * what ) {











// Preparing for this.
//
// ... i actually don't understand them
//
// :D

    int  buffer_size;
    int  period_size;

    int latency_min;
    int latency_max;

    int resample;

    snd_pcm_t * chandle;






// this is for saving what error it is

    int number_error;





// this count is for cuont
//  how many times it try
// there is something wrong
// when  it is too big.
//  Start this module after watchdog is ready

    int number_turnning;





// Wait the dog.

    while ( ! gop_about.flag.start ) {

        usleep ( 100000 );}




// Setup sound path
//
// this sould be saved at the new one in the trees
//
// and we have a number to save the new one now
//
// so we could not use this
/*
    strcpy ( path_sound, path_the       );
    strcat ( path_sound, "/trees/sound" );
*/














// Start.

    while ( gop_about.flag.main ) {




// Wait when it's stop &
//   there's no capture devices

        if (

               ! gop_about.flag.sound
        ||       gop_about.sound.number_capture == 0

           ) {

            usleep ( 100000 );}

        else {

// It's start.












// A clear, useful note system can make
//
//   user know more differences about this thing.
//   it's important.

            note_save ( "corde", "alsa corde start", "now" );






// If corde always reset , change corde device

            number_turnning ++;






// Auto find capture device

            if ( gop_about.sound.device_capture == 0 ) {

                 gop_about.sound.device_capture = 1;}//information_sound.number_capture;}






// If the device always reset
// turn device

            else if ( number_turnning > 2 ) {

                number_turnning = 0;

                output_print ( "string", "The target of capture device is turnning.\n" );


                if ( gop_about.sound.device_capture > 1 ) {

                    gop_about.sound.device_capture --;}


                else {

                    gop_about.sound.device_capture = gop_about.sound.number_capture;}}







// Re-preparing the values

            buffer_size  = 0;            /* auto */
            period_size  = 0;            /* auto */
            latency_min  = 32;           /* in frames / 2 */
            latency_max  = 2048;         /* in frames / 2 */
            resample     = 1;

// it goes wrong in c code
//            chandle      =  snd_pcm_t*;
            chandle      = NULL;

            number_error = 0;





//--------------------------------------------------------------------------
// Open the target device

            number_error = snd_pcm_open(
                                        &chandle,
                                         information_sound.device[1][information_sound.device_capture],
                                         SND_PCM_STREAM_CAPTURE,
                                         SND_PCM_NONBLOCK
                                       );
// When it's going wrong.

            if ( number_error < 0 ) {

                output_print("string", "Record open error\n");

                usleep(100000);

                continue;}

//--------------------------------------------------------------------------

            snd_pcm_hw_params_t      *ct_params;
            snd_pcm_hw_params_alloca(&ct_params);


            number_error = snd_pcm_hw_params_any(
                                                  chandle,
                                                  ct_params
                                                );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: configuration broken\n");

                information_flag.sound = 0;

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_hw_params_set_rate_resample(
                                                                chandle,
                                                                ct_params,
                                                                1
                                                              );
            if ( number_error < 0) {

                output_print("string", "Sound corde: resample setup failled\n");

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种访问类型。

            number_error = snd_pcm_hw_params_set_access(
                                                         chandle,
                                                         ct_params,
                                                         SND_PCM_ACCESS_RW_INTERLEAVED
                                                       );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: access type not available\n");

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种格式。

            snd_pcm_format_t    format   = SND_PCM_FORMAT_S16_LE;

            number_error = snd_pcm_hw_params_set_format(
                                                         chandle,
                                                         ct_params,
                                                         SND_PCM_FORMAT_S16_LE
                                                       );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: sample format not available\n");;

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一个通道计数。

            number_error = snd_pcm_hw_params_set_channels(
                                                           chandle,
                                                           ct_params,
                                                           channels
                                                         );

            if ( number_error < 0) {

                output_print("string",        "Sound corde: channels count ");
                output_print("string",        "not available for:"          );
                output_print("int"   , (char*)&channels                     );
                output_print("string",        "\n"                          );

                if ( channels == 1 ) {
                    channels = 2; }

                else if ( channels == 2 ) {
                    channels = 1; }


                snd_pcm_drop(chandle);
                snd_pcm_hw_free(chandle);
                snd_pcm_close(chandle);

                number_turnning++;

                usleep(100000);

                continue;}

//--------------------------------------------------------------------------
//将配置空间限制为最接近目标的速率。

            unsigned int rrate = rate;

            number_error = snd_pcm_hw_params_set_rate_near(
                                                            chandle,
                                                            ct_params,
                                                           &rrate,
                                                            0
                                                          );
            if ( number_error < 0   ) {

                output_print("string",         "Sound corde: rate Hz ");
                output_print("string",         "not available for : " );
                output_print("int"   ,  (char*)&rate                  );
                output_print("string",         "\n"                   );

                break;}

            if ( (int)rrate != rate ) {

                output_print("string",        "Sound corde: rate "       );
                output_print("string",        "doesn't match, requested ");
                output_print("int",    (char*)&rate                      );
                output_print("string",        "Hz   , get "              );
                output_print("int",    (char*)&snd_strerror              );
                output_print("string",        "Hz\n"                     );}

//--------------------------------------------------------------------------

                 int                       latency = latency_min - 4;
                 int                      *bufsize = &latency;
                 int                       last_bufsize = *bufsize;
        unsigned int                       c_time;
                 snd_pcm_hw_params_t      *c_params;
                 snd_pcm_sw_params_t      *c_swparams;
                 snd_pcm_uframes_t         c_size, c_psize;

            snd_pcm_hw_params_alloca( &c_params   );
            snd_pcm_sw_params_alloca( &c_swparams );
            snd_pcm_uframes_t          periodsize  ;

            snd_pcm_hw_params_copy  (  c_params, ct_params );

            periodsize              = *bufsize * 2;

//--------------------------------------------------------------------------

          __again:

            if ( buffer_size > 0          )

                break;


            if ( last_bufsize == *bufsize )

               *bufsize += 4;


            last_bufsize = *bufsize;

            if ( *bufsize > latency_max   )

                break;

//--------------------------------------------------------------------------

          __set_it:

            number_error = snd_pcm_hw_params_set_buffer_size_near(
                                                                   chandle,
                                                                   c_params,
                                                                  &periodsize
                                                                 );
            if ( number_error < 0 ) {

                output_print("string",       "Sound corde: unable to " );
                output_print("string",       "set buffer size for : "  );
                output_print("int"   , (char*)bufsize                  );
                output_print("string",        "\n"                     );

                break;}

//--------------------------------------------------------------------------

            if (period_size > 0)

                periodsize = period_size;

            else

                periodsize /= 2;

//--------------------------------------------------------------------------

            number_error = snd_pcm_hw_params_set_period_size_near(
                                                                   chandle,
                                                                   c_params,
                                                                  &periodsize,
                                                                   0
                                                                 );

            if ( number_error < 0 ) {

                output_print("string",        "Sound corde: unable to ");
                output_print("string",        "set period size  for : ");
                output_print("int"   , (char*)&periodsize              );
                output_print("string",        "\n"                     );

                break;}

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_period_size(
                                               c_params,
                                              &c_psize,
                                               NULL
                                             );

            if ( c_psize > (unsigned int)*bufsize )

                *bufsize = c_psize;

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_period_time(
                                               c_params,
                                              &c_time,
                                               NULL
                                             );

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_buffer_size(
                                               c_params,
                                              &c_size
                                             );

//--------------------------------------------------------------------------

            number_error = snd_pcm_hw_params(
                                              chandle,
                                              c_params
                                            );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to set hw params\n");

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_sw_params_current(
                                                      chandle,
                                                      c_swparams
                                                    );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to determine current swparams\n");

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_sw_params_set_start_threshold(
                                                                  chandle,
                                                                  c_swparams,
                                                                  0x7fffffff
                                                                );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to set start threshold mode\n");

                break;}

//--------------------------------------------------------------------------

            snd_pcm_uframes_t    val;

            number_error = snd_pcm_sw_params_set_avail_min(
                                                            chandle,
                                                            c_swparams,
                                                            val
                                                          );

            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to set avail min\n");

                break;}

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_period_size(
                                               c_params,
                                              &val,
                                               NULL
                                             );

            number_error = snd_pcm_sw_params(
                                              chandle,
                                              c_swparams
                                            );

            if ( number_error < 0 ) {

                output_print("string", "sound corde: unable to set sw params\n");

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_sw_params(
                                              chandle,
                                              c_swparams
                                            );

            if ( number_error < 0 ) {

                output_print("string", "Unable to set sw params\n");

                break;}

//--------------------------------------------------------------------------

            char*   buffer_sound = (char*)malloc(
                                                  (
                                                    latency_max
                                                  * snd_pcm_format_width(format) / 8
                                                  ) * 2
                                                );

            number_error = snd_pcm_format_set_silence(
                                                       format,
                                                       buffer_sound,
                                                       latency*channels
                                                     );

            if ( number_error < 0 ) {

                output_print("string", "Sound corde: set silence error\n");

                break;}


//--------------------------------------------------------------------------

            number_error = number_error = snd_pcm_start(chandle);

            if ( number_error < 0 ) {

                output_print("string", "Sound corde: go error\n");

                break;}




















// ready to corde
//
// this is for saving the value of force
 
            int number_force        = 0;


// sometimes it went wrong , print same data
// this is for compare

            int number_force_buffer = 0;




            int number_round        = 0;



// this is to note how aloud this piece of voice is

            int number_aloud        = 0;


//

            int number_step         = 1;


// this is to note the step of snake round

            int number_step_snake   = 1;


// how long this corde will keep

            int number_count        = 0;


// sometime it goes bad, always return the same data

            int number_reset        = 0;









//  Setting finished,
//    corde program start

            while ( gop_about.flag.sound ) {

// start code



// Read date

                long r;

                do {

                    r = snd_pcm_readi ( chandle, buffer_sound, latency );

                  } while (  r  ==  - EAGAIN  );





// Take the data

                int i;

                for (
                        i  = 0;
                        i <= 21;
                        i  = i+1
                    ) {



// What is this

//                    number_force_buffer++;





// Get data
// the data number is too big

                    number_force =  * ( ( int * ) buffer_sound + i ) / 100000;


// some device strange
//   we should do some

//                    number_force =  * ( ( long * ) buffer_sound + i ) / 100000   -   number_force;








// check data

// alsa have already set time, so we could not to set the time judged











// if we found a voice

                    if ( number_force >= 200 ) {

                        number_aloud++;}











// Save date
//
// this will be ok
//
// |                                                             |
// |  -----------------------------123456...--->---------------  |
// |                                                             |
//
// just like water
//
// the force could be banance when it start to note a big voice




                    if ( number_step < 200) {


                        result_sound [ number_step + 0 ] [ number_step_snake ] = number_force;}





// take a step

                    number_step_snake ++;








// Update date for next getting
//
// we need to compare maybe

//                    number_force = result_sound [ number_step + 0 ] [ number_step_snake - 1 ];















// judge the loop


                    if ( number_step_snake > N ) {



// whatever,

// be ready to start next looop

                        number_step_snake = 1;




// for test

/*
                        if ( !information_flag.sound_show ) {

                            output_print("int", (char*)&number_aloud);
                            output_print("string",     "\n");}
*/




// when this count buffer is not 0

// we keep listen and be ready to get out and fft

                        if (  number_aloud >= 200  ) {

                            number_count = 9;}



                        if ( number_step < 100 ) {

                            number_step++;}

                        else {

                            if      ( number_count > 1 ) {

                                number_count--;}


                            else if ( number_count == 1 ) {

                                information_flag.sound = 0;}}



                        number_aloud = 0;}}

//==========================================================================
// Big check after
//  21 x 1000 rand

                if (number_force_buffer != number_force) {

// if this time this got
// a  different data,
// prepare for the next time check.

                    number_force_buffer  = number_force;

// when it get different data
// don't reset it

                    number_turnning--;
                    number_reset   --;

// If number_turnning is so low,
//    that data will be too deep,
//    that never come back.

                    if ( number_turnning < 0 ) {

                        number_turnning = 0;}

                    if ( number_reset    < 0 ) {

                       number_reset    = 0;}}


                else {

// If this time this got
// a sample data,
// count this.

                    number_reset++;

// If it always get same data
// reset it
                    if ( number_reset >= 9 ) {

                        output_print("string", "Sound corde: reset\n");

                        number_count = 0;

                        break;}}}

//--------------------------------------------------------------------------
// close it

            snd_pcm_drop   (chandle);
            snd_pcm_hw_free(chandle);
            snd_pcm_close  (chandle);













// it will cause note save many times and data wrong

            if ( number_count == 1 ) {

// When it's testing,
// we could need to know
// how many piece of data it get

                if ( ! gop_about.flag.sound_show ) {

                    output_print("int",   (char*)&number_step);
                    output_print("string",       "\n"        );}



// Doing snake calculate,
//   it's a number of 400

                int i;

                for (

                        i  = 1;
                        i <= number_step  &&  i < 200;
                        i ++

                    ) {

                    fft(i);

// The speed of snake,
//      mast be changed

                    if ( gop_about.flag.sound_show ) {

                        usleep(100000);}}






// Save this voice.
// we dose not have it

//                if ( information_flag.sound_save ) {

//                    listen_save(number_step);}






/*

// Compair this & memory


*/





                information_flag.sound = 1;}





            else {

                note_save("corde", "alsa corde close", "now");}}}





    pthread_exit(NULL);}






