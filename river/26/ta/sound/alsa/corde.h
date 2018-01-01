


#include <alsa/asoundlib.h>



void* gop_corde(void*){

    note_save("corde.note", "Corde start");







    int that0;
    while (true) {





        if ( flag_sound!=true ) {
            gop_delay(0.1);}
        else {






// if corde always reset , change corde device
//  that0 is the flag for that.

            that0++;


// auto find capture device

            if ( info_sound.device_capture == 0 ) {

                info_sound.device_capture = 1;}

            else if ( that0 > 3 ) {

                cout << "sound turn" << endl;


                if ( info_sound.num_capture > info_sound.device_capture ) {

                    info_sound.device_capture++;}

                else {

                    info_sound.device_capture = 1;}}









            cdevice = (char*)info_sound.device[1][info_sound.device_capture].c_str();










            snd_pcm_t             *chandle;
            int err;
//--------------------------------------------------------------------------

            if ((err = snd_pcm_open(&chandle, cdevice, SND_PCM_STREAM_CAPTURE, SND_PCM_NONBLOCK)) < 0) {
                cout << "Record open error" << endl;

                gop_delay(0.1);
                continue;}
//--------------------------------------------------------------------------
            snd_pcm_hw_params_t *ct_params;
            snd_pcm_hw_params_alloca(&ct_params);

            if ((err = snd_pcm_hw_params_any(chandle, ct_params)) < 0) {
                cout << "Broken configuration" << endl;
                exit(0);}
//--------------------------------------------------------------------------
            if ((snd_pcm_hw_params_set_rate_resample(chandle, ct_params, 1)) < 0) {
                cout << "Resample setup failed" << endl;
                exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种访问类型。
            if ((snd_pcm_hw_params_set_access(chandle, ct_params, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0) {
                cout << "Access type not available" << endl;
                exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种格式。
            snd_pcm_format_t       format   = SND_PCM_FORMAT_S16_LE;
            if ((err = snd_pcm_hw_params_set_format(chandle, ct_params, SND_PCM_FORMAT_S16_LE)) < 0) {
                cout << "Sample format not available" << endl;
                exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一个通道计数。
            if ((err = snd_pcm_hw_params_set_channels(chandle, ct_params, channels)) < 0) {
                //cout << "Channels count not available for:" << channels << endl;

                if ( channels == 1 ) {
                    channels = 2; }
                else if ( channels == 2 ) {
                    channels = 1; }

                snd_pcm_drop(chandle);
                snd_pcm_hw_free(chandle);
                snd_pcm_close(chandle);

                continue;}
//--------------------------------------------------------------------------
//将配置空间限制为最接近目标的速率。
            unsigned int rrate;
            rrate = rate;
            if ((err = snd_pcm_hw_params_set_rate_near(chandle, ct_params, &rrate, 0)) < 0) {
                cout << "Rate Hz not available for : " << rate << endl;
                exit(0);}
            if ((int)rrate != rate) {
                cout << "Rate doesn't match, requested " << rate << "Hz" << "   " << ", get " << snd_strerror << "Hz" << endl;}
//--------------------------------------------------------------------------

                 int                       latency = latency_min - 4;
                 int                      *bufsize = &latency;
                 int                       last_bufsize = *bufsize;
        unsigned int                       c_time;
                 snd_pcm_hw_params_t      *c_params;
                 snd_pcm_sw_params_t      *c_swparams;
                 snd_pcm_uframes_t         c_size, c_psize;

            snd_pcm_hw_params_alloca(&c_params);
            snd_pcm_sw_params_alloca(&c_swparams);
            snd_pcm_uframes_t periodsize;

            snd_pcm_hw_params_copy(c_params, ct_params);

            periodsize = *bufsize * 2;
//--------------------------------------------------------------------------
          __again:
            if (buffer_size > 0)
                exit(0);
            if (last_bufsize == *bufsize)
               *bufsize += 4;

            last_bufsize = *bufsize;
            if (*bufsize > latency_max)
                exit(0);
//--------------------------------------------------------------------------
          __set_it:
            if ((err = snd_pcm_hw_params_set_buffer_size_near(chandle, c_params, &periodsize)) < 0) {
                cout << "Unable to set buffer size  for : " << *bufsize * 2 << endl;
                exit(0);}
//--------------------------------------------------------------------------
            if (period_size > 0)
                periodsize = period_size;
            else
                periodsize /= 2;
//--------------------------------------------------------------------------
            if ((err = snd_pcm_hw_params_set_period_size_near(chandle, c_params, &periodsize, 0)) < 0) {
                cout << "Unable to set period size  for : " << periodsize << endl;
                exit(0);}
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
                cout << "Unable to set hw params for : " << endl;
                exit(0);}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_sw_params_current(chandle, c_swparams)) < 0) {
                cout << "Unable to determine current swparams for : " << endl;
                exit(0);}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_sw_params_set_start_threshold(chandle, c_swparams, 0x7fffffff)) < 0) {
                cout << "Unable to set start threshold mode for : " << endl;
                exit(0);}
//--------------------------------------------------------------------------
            snd_pcm_uframes_t val;
            if ((err = snd_pcm_sw_params_set_avail_min(chandle, c_swparams, val)) < 0) {
                cout << "Unable to set avail min for : " << endl;
                exit(0);}
//--------------------------------------------------------------------------
            snd_pcm_hw_params_get_period_size(c_params, &val, NULL);
            if ((err = snd_pcm_sw_params(chandle, c_swparams)) < 0) {
                cout << "Unable to set sw params for : " << endl;
                exit(0);}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_sw_params(chandle, c_swparams)) < 0) {
                cout <<"Unable to set sw params for : " << endl;
                exit(0);}
//--------------------------------------------------------------------------
            char*   buffer_sound;
            buffer_sound = (char*)malloc((latency_max * snd_pcm_format_width(format) / 8) * 2);

            if (snd_pcm_format_set_silence(format, buffer_sound, latency*channels) < 0) {
                cout << "silence error\n";
                exit(0);}
//--------------------------------------------------------------------------
            if ((err = snd_pcm_start(chandle)) < 0) {
                cout << "Go error: " << endl;
                exit(0);}















            int     that      = 0;
            int     num_round = 0;
            int     num_force = 0;
            int     num_reset = 0;
            int     num_aloud = 0;
            int     num_step  = 1;
            int     num_step2 = 1;
            int     num_count = 0;












            while(flag_sound) {



//--------------------------------------------------------------------------

                long r;
                do {
                    r = snd_pcm_readi(chandle, buffer_sound, latency);
                    } while (r == -EAGAIN);

//--------------------------------------------------------------------------


                for (int i=0; i<=21; i=i+1) {

                     that++;




//--------------------------------------------------------------------------

                    num_force =  *((int*)buffer_sound+i)/10000   -   num_force;
	
//--------------------------------------------------------------------------

                    if (num_force >= 100) {
                        num_aloud++;}

//--------------------------------------------------------------------------

                    if ( flag_sound and num_step < 400) {
                        result_sound[num_step+0][num_step2+0*(N/2)] = num_force;}

//--------------------------------------------------------------------------

                    num_step2++;

                    num_force =  *((int*)buffer_sound+i)/10000;


//--------------------------------------------------------------------------

                    if ( num_step2 > N ) {
                        num_step2 = 1;

                        if ( num_aloud >= 50 ) {

                            num_count = 20;

                            if ( num_step < 400 ) {
                                num_step++;}}

                        else {

                            if ( num_count > 0 ) {

                                num_count--;

                                if ( num_count == 1 ) {
                                    flag_sound = false;}}}

                        num_aloud = 0;}}

//==========================================================================

                if (that != num_force) {
                    that  = num_force;

                    that0--;
                    num_reset--;

                    if (that0<0) {
                        that0=0;}
                    if (num_reset<0) {
                        num_reset=0;}}

                else {
                    num_reset++;
                    if (num_reset >= 10) {
                        cout << "SOUND RESET" <<  endl;
                        break;}}}

//--------------------------------------------------------------------------




            snd_pcm_drop(chandle);
            snd_pcm_hw_free(chandle);
            snd_pcm_close(chandle);







            if ( num_count == 1 ) {

                if ( flag_sound_show == false ) {

                    cout << num_step << endl;}

                for ( int i=2; i<=num_step and i<400; i++) {

                    fft(i);
                    gop_delay(0.1);}

                flag_sound = true;}}}





    note_save("corde.note", "Corde close");}



