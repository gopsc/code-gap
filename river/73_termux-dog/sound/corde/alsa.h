



#include <alsa/asoundlib.h>

void* gop_corde(void* what) {



// Start this module after watchdog is ready

    while ( !information_flag.start ) {
        usleep(100000);}

// Setup sound path

    strcpy(path_sound, path_the    );
    strcat(path_sound, "/sky/sound");


// Start

    int number_changed;

    while ( information_flag.main ) {

// Wait when there's no capture devices

        if (
               !information_flag.sound
        ||      information_flag.number_capture == 0
           ) {

            usleep(100000);}

        else {


// A clear, useful note system can make
//
//   user know more changes about this thing.
//   it's important.

            note_save("corde", "Alsa corde start", "now");


// If corde always reset , change corde device

            number_changed++;


// Auto find capture device

            if ( information_sound.device_capture == 0 ) {

                 information_sound.device_capture = 1;}


// If the device always reset
// turn device

            else if ( number_changed > 9 ) {

                number_changed = 0;
                output_print("string", "The target of capture device is turnning.\n");


                if ( information_sound.number_capture > information_sound.device_capture ) {

                    information_sound.device_capture++;}

                else {

                    information_sound.device_capture = 1



            int buffer_size = 0;            /* auto */
            int period_size = 0;            /* auto */
            int latency_min = 32;           /* in frames / 2 */
            int latency_max = 2048;         /* in frames / 2 */
            int resample    = 1;

            snd_pcm_t             *chandle;
            int err;

//--------------------------------------------------------------------------

            if ((err = snd_pcm_open(&chandle, info_sound.device[1][info_sound.device_capture], SND_PCM_STREAM_CAPTURE, SND_PCM_NONBLOCK)) < 0) {

                output_print("string", "Record open error");

                usleep(100000);

                continue;}
//--------------------------------------------------------------------------
            snd_pcm_hw_params_t      *ct_params;
            snd_pcm_hw_params_alloca(&ct_params);

            if ((err = snd_pcm_hw_params_any(chandle, ct_params)) < 0) {

                output("string", "Sound corde: configuration broken");

                information_flag.sound = 0;

                break;}
//--------------------------------------------------------------------------
            if ((snd_pcm_hw_params_set_rate_resample(chandle, ct_params, 1)) < 0) {

                output_print("string", "Sound corde: resample setup failled");

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种访问类型。

            if ((snd_pcm_hw_params_set_access(chandle, ct_params, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0) {

                output_print("string", "Sound corde: access type not available");

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种格式。

            snd_pcm_format_t       format   = SND_PCM_FORMAT_S16_LE;

            if ((err = snd_pcm_hw_params_set_format(chandle, ct_params, SND_PCM_FORMAT_S16_LE)) < 0) {

                output_print("string", "Sound corde: sample format not available" << endl;

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一个通道计数。

            if ((err = snd_pcm_hw_params_set_channels(chandle, ct_params, channels)) < 0) {

                output_print("string", "Sound corde: channels count not available for:");
                output_print("int"   , (char*)&channels);

                if ( channels == 1 ) {
                    channels = 2; }

                else if ( channels == 2 ) {
                    channels = 1; }

                snd_pcm_drop(chandle);
                snd_pcm_hw_free(chandle);
                snd_pcm_close(chandle);

                number_changed++;

                continue;}
//--------------------------------------------------------------------------
//将配置空间限制为最接近目标的速率。

            unsigned int rrate;
                         rrate = rate;

            if ((err = snd_pcm_hw_params_set_rate_near(chandle, ct_params, &rrate, 0)) < 0) {

                output("string", "Sound corde: rate Hz not available for : ");
                output("int"      (char*)&rate                              );
                output("string", "\n"                                       );

                break;}

            if ((int)rrate != rate) {

                output_print("string", "Sound corde: rate doesn't match, requested ");
                output_print("int",    (char*)&rate        );
                output_print("string", "Hz   , get "       );
                output_print("int",    (char*)&snd_strerror);
                output_print("string", "Hz\n"              );}
//--------------------------------------------------------------------------

                 int                       latency = latency_min - 4;
                 int                      *bufsize = &latency;
                 int                       last_bufsize = *bufsize;
        unsigned int                       c_time;
                 snd_pcm_hw_params_t      *c_params;
                 snd_pcm_sw_params_t      *c_swparams;
                 snd_pcm_uframes_t         c_size, c_psize;

            snd_pcm_hw_params_alloca(&c_params  );
            snd_pcm_sw_params_alloca(&c_swparams);
            snd_pcm_uframes_t periodsize;

            snd_pcm_hw_params_copy  (c_params, ct_params);

            periodsize = *bufsize * 2;
//--------------------------------------------------------------------------
          __again:

            if (buffer_size > 0)

                break;

            if (last_bufsize == *bufsize)

               *bufsize += 4;

            last_bufsize = *bufsize;

            if (*bufsize > latency_max)

                break;
//--------------------------------------------------------------------------
          __set_it:

            if ((err = snd_pcm_hw_params_set_buffer_size_near(chandle, c_params, &periodsize)) < 0) {

                output_print("string", "Sound corde: unable to set buffer size for : ");
                output_print("int"   , (char*)bufsize * 2);

                break;}
//--------------------------------------------------------------------------
            if (period_size > 0)

                periodsize = period_size;

            else

                periodsize /= 2;
//--------------------------------------------------------------------------
            if ((err = snd_pcm_hw_params_set_period_size_near(chandle, c_params, &periodsize, 0)) < 0) {

                output_print("string", "Sound corde: unable to set period size  for : ");
                output_print("int"   , (char*)&periodsize);

                break;}
//--------------------------------------------------------------------------
            snd_pcm_hw_params_get_period_size(c_params, &c_psize, NULL);

            if (c_psize > (unsigned int)*bufsize)

                *bufsize = c_psize;
//--------------------------------------------------------------------------
            snd_pcm_hw_params_get_period_time(c_params, &c_time, NULL);
//--------------------------------------------------------------------------
            snd_pcm_hw_params_get_buffer_size(c_params, &c_size);
//--------------------------------------------------------------------------
            if ((err = snd_pcm_hw_params(chandle, c_params)) < 0) {

                output_print("string", "Sound corde: unable to set hw params\n");

                break;}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_sw_params_current(chandle, c_swparams)) < 0) {

                output_print("string", "Sound corde: unable to determine current swparams\n");

                break;}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_sw_params_set_start_threshold(chandle, c_swparams, 0x7fffffff)) < 0) {

                output_print("string", "Sound corde: unable to set start threshold mode\n");

                break;}
//--------------------------------------------------------------------------
            snd_pcm_uframes_t val;

            if ((err = snd_pcm_sw_params_set_avail_min(chandle, c_swparams, val)) < 0) {

                output_print("string", "Sound corde: unable to set avail min");

                break;}
//--------------------------------------------------------------------------
            snd_pcm_hw_params_get_period_size(c_params, &val, NULL);

            if ((err = snd_pcm_sw_params(chandle, c_swparams)) < 0) {

                output_print("string", "sound corde: unable to set sw params\n");

                break;}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_sw_params(chandle, c_swparams)) < 0) {

                output_print("string", "Unable to set sw params");

                break;}
//--------------------------------------------------------------------------
            char*   buffer_sound;
            buffer_sound = (char*)malloc((latency_max * snd_pcm_format_width(format) / 8) * 2);

            if (snd_pcm_format_set_silence(format, buffer_sound, latency*channels) < 0) {

                output_print("string", "Sound corde: set silence error\n");

                break;}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_start(chandle)) < 0) {

                output_print("string", "Sound corde: go error\n");

                break;}





















// ready to corde


            int     that         = 0;
            int     number_round = 0;
            int     number_force = 0;
            int     number_reset = 0;
            int     number_aloud = 0;
            int     number_step  = 1;
            int     number_step2 = 1;
            int     number_count = 0;









//  Setting finish , corde program start


            while( information_flag.sound ) {



//--------------------------------------------------------------------------

// Read date

                long r;

                do {
                    r = snd_pcm_readi(chandle, buffer_sound, latency);
                    } while (r == -EAGAIN);

//--------------------------------------------------------------------------


                for (int i=0; i<=21; i=i+1) {

                    that++;

// Get date
                    number_force =  *((int*)buffer_sound+i)/10000   -   number_force;


// Check date
                    if (number_force >= 100) {
                        number_aloud++;}

// Save date
                    if ( number_step < 400) {
                        result_sound[number_step+0][number_step2] = number_force;}

                    number_step2++;


// Update date for next getting

                    number_force = result_sound[number_step+0][number_step2-1];


//--------------------------------------------------------------------------

                    if ( number_step2 > N ) {
                        number_step2 = 1;

                        if ( number_aloud >= 50 ) {

                            number_count = 5;

                            if ( number_step < 400 ) {
                                number_step++;}}

                        else {

                            if ( number_count > 0 ) {

                                number_count--;


                                if ( number_step < 400 ) {
                                    number_step++;}

                                if ( number_count == 1 ) {
                                    flag_sound = false;}}}

                        number_aloud = 0;}}

//==========================================================================

// Big check after
// 21 x 1000 rand



                if (that != number_force) {
                    that  = number_force;

// when it get different data
// don't reset it

                    number_changed--;
                    number_reset--;

                    if (number_changed < 0) {
                        number_changed = 0;}

                    if (number_reset < 0) {
                        number_reset = 0;}}



                else {
                    number_reset++;

// If it always get same data
// reset it
                    if (number_reset >= 10) {
                        cout << "SOUND RESET" <<  endl;
                        break;}}}

//--------------------------------------------------------------------------



// close it
            snd_pcm_drop(chandle);
            snd_pcm_hw_free(chandle);
            snd_pcm_close(chandle);







            if ( number_count == 1 ) {





                if ( flag_sound_show == false ) {
                    cout << number_step << endl;
                    }


                for ( int i=1; i<=number_step and i<400; i++) {

                    fft(i);

                    if ( flag_sound_show ) {
                        gop_delay(0.1);}}






                if ( flag_sound_save ) {
                    listen_save(number_step);}



/*

// Compair this & memory


*/





                flag_sound = true;}}}





    note_save("corde", "Corde close");

    pthread_exit(NULL);}
