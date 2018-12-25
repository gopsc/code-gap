void* gop_corde(){

    snd_pcm_t             *chandle;
    int err;
//--------------------------------------------------------------------------
    if ((err = snd_pcm_open(&chandle, cdevice, SND_PCM_STREAM_CAPTURE,
                                               SND_PCM_NONBLOCK)) < 0) {
        printf("Record open error: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
        snd_pcm_hw_params_t *ct_params; 
        snd_pcm_hw_params_alloca(&ct_params);
        if ((err = snd_pcm_hw_params_any(chandle, ct_params)) < 0) {
            printf("Broken configuration", snd_strerror(err));
            exit(0);}
//--------------------------------------------------------------------------
        if ((snd_pcm_hw_params_set_rate_resample(chandle, ct_params, 1)) < 0) {
            printf("Resample setup failed",snd_strerror(err));
            exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种访问类型。
        if ((snd_pcm_hw_params_set_access(chandle, ct_params, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0) {
            printf("Access type not available", snd_strerror(err));
            exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种格式。
    snd_pcm_format_t       format   = SND_PCM_FORMAT_S16_LE;
    if ((err = snd_pcm_hw_params_set_format(chandle, ct_params, SND_PCM_FORMAT_S16_LE)) < 0) {
        printf("Sample format not available", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一个通道计数。
    if ((err = snd_pcm_hw_params_set_channels(chandle, ct_params, channels)) < 0) {
        printf("Channels count (%i) not available for %s: %s\n", channels, snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
//将配置空间限制为最接近目标的速率。
    unsigned int rrate;
    rrate = rate;
    if ((err = snd_pcm_hw_params_set_rate_near(chandle, ct_params, &rrate, 0)) < 0) {
        printf("Rate %iHz not available for %s: %s\n", rate, snd_strerror(err));
        exit(0);}
    if ((int)rrate != rate) {
        printf("Rate doesn't match (requested %iHz, get %iHz)\n", rate, err);}
//--------------------------------------------------------------------------
              int             latency = latency_min - 4;
              int            *bufsize = &latency;
              int             last_bufsize = *bufsize;
    unsigned int             c_time;
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
        printf("Unable to set buffer size %li for %s: %s\n", *bufsize * 2, snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
    if (period_size > 0)
        periodsize = period_size;
    else
        periodsize /= 2;
//--------------------------------------------------------------------------
    if ((err = snd_pcm_hw_params_set_period_size_near(chandle, c_params, &periodsize, 0)) < 0) {
        printf("Unable to set period size %li for %s: %s\n", periodsize, snd_strerror(err));
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
        printf("Unable to set hw params for %s: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
    if ((err = snd_pcm_sw_params_current(chandle, c_swparams)) < 0) {
        printf("Unable to determine current swparams for %s: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
    if ((err = snd_pcm_sw_params_set_start_threshold(chandle, c_swparams, 0x7fffffff)) < 0) {
        printf("Unable to set start threshold mode for %s: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
               snd_pcm_uframes_t                          val;
    if ((err = snd_pcm_sw_params_set_avail_min(chandle, c_swparams, val)) < 0) {
        printf("Unable to set avail min for %s: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
               snd_pcm_hw_params_get_period_size(c_params, &val, NULL);
    if ((err = snd_pcm_sw_params(chandle, c_swparams)) < 0) {
        printf("Unable to set sw params for %s: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
    if ((err = snd_pcm_sw_params(chandle, c_swparams)) < 0) {
        printf("Unable to set sw params for %s: %s\n", snd_strerror(err));
        exit(0);}
//--------------------------------------------------------------------------
    char*   buffer_sound;
    buffer_sound = (char*)malloc((latency_max * snd_pcm_format_width(format) / 8) * 2);

    if (snd_pcm_format_set_silence(format, buffer_sound, latency*channels) < 0) {
        fprintf(stderr, "silence error\n");
        exit(0);}
//--------------------------------------------------------------------------
    if ((err = snd_pcm_start(chandle)) < 0) {
        printf("Go error: %s\n", snd_strerror(err));
        exit(0);}



    int     time_dirta = dft_N/(rate/1000);

    int     that     = 0;
    int     num_reset = 0;

    int     num_sound = 0;


    while(flag_sound) {
//--------------------------------------------------------------------------
        long r;
        do {
            r = snd_pcm_readi(chandle, buffer_sound, latency);
            } while (r == -EAGAIN);
//--------------------------------------------------------------------------
        if (num_sound < time_dirta) {
            for (int i=0; i<21; i=i+7) {
                result_sound[num_sound*21+i] = *((int*)buffer_sound+i)/100000;}
            num_sound++;
//--------------------------------------------------------------------------
            if (that != result_sound[num_sound]) {
                that =  result_sound[num_sound];
                num_reset = 0;}
            else {
                num_reset++;
                if (num_reset == 10) {
                    break;}}}
//--------------------------------------------------------------------------
        else {
            num_sound = 0;
            dft();
            dft_print();}}


    snd_pcm_drop(chandle);
    snd_pcm_hw_free(chandle);
    snd_pcm_close(chandle);}

