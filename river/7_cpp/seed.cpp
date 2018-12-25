#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <pthread.h>
#include <unistd.h>

#include <cstdio>
#include <cstring>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#include <limits.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <sys/shm.h>
using namespace std;
//--------------------------------info---------------------------------
char info_system[100];
string info_ip[10][2];
//-----------------------------------------
void* info_system_get(){
    FILE *read;
    read = popen("uname -a", "r");
    if (read != NULL){
        fread(info_system, sizeof(char), 1000, read);
        pclose(read);}}

void info_ip_get () {
    int num = 1;
    struct ifaddrs * ifAddrStruct=NULL;

    void * tmpAddrPtr=NULL;

    getifaddrs(&ifAddrStruct);

    while (ifAddrStruct!=NULL) {
        if (ifAddrStruct->ifa_addr->sa_family==AF_INET){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, tmpAddrPtr, addressBuffer, INET_ADDRSTRLEN);
            info_ip[num][1] = ifAddrStruct->ifa_name;
            info_ip[num][2] = addressBuffer;
            num++;}
        else if (ifAddrStruct->ifa_addr->sa_family==AF_INET6){
            tmpAddrPtr = &((struct sockaddr_in *)ifAddrStruct->ifa_addr)  ->  sin_addr;
            char addressBuffer[INET6_ADDRSTRLEN];
            inet_ntop(AF_INET6, tmpAddrPtr, addressBuffer, INET6_ADDRSTRLEN);
            info_ip[num][1] = ifAddrStruct->ifa_name;
            info_ip[num][2] = addressBuffer;
            num++;}

        ifAddrStruct=ifAddrStruct->ifa_next;}}
//-----------------------------------------
void* info(){
    while(true){
        try{
            info_system_get();}
        catch(...){
            memset(info_ip,'\0',sizeof(info_ip));}
        try{
            info_ip_get();}
        catch(...){
            memset(info_ip,'\0',sizeof(info_ip));}
        sleep(1);}}
//-------------------------------connect---------------------------------
class gopi_connect{
    public:
        string how;
        string ip_address;
        ~gopi_connect();
        gopi_connect();
        void server();
        void client();};
gopi_connect::gopi_connect(){}
gopi_connect::~gopi_connect(){}
//--------------------------------------------------
void gopi_connect::server(){
    int port_server = 5200;
    int fd_server = socket(AF_INET,SOCK_STREAM,0);

    struct sockaddr_in address_server;
    address_server.sin_family = AF_INET;
    address_server.sin_port = htons(port_server);
    address_server.sin_addr.s_addr = htonl(INADDR_ANY);

    if(bind(fd_server,(struct sockaddr*)&address_server,sizeof(address_server)) == -1){
        perror("bind");
        exit(1);}

    if(listen(fd_server,3) == -1){
        perror("listen");
        exit(1);}

    struct sockaddr_in address_client;
    socklen_t lenth = sizeof(address_client);

    int conn = accept(fd_server,(struct sockaddr*)&address_client,&lenth);
    if(conn < 0){
        perror("accept");
        exit(0);}

    char buffer[8] = "welcome";
    send(conn, buffer, sizeof(buffer), 0);
    close(conn);
    close(fd_server);}
//--------------------------------------------------------
void gopi_connect::client(){

    int port = 5200;

    int fd_client = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in address_server;
    memset(&address_server, 0, sizeof(address_server));
    address_server.sin_family = AF_INET;
    address_server.sin_port = htons(port);
    address_server.sin_addr.s_addr = inet_addr("192.168.124.7");

    if (connect(fd_client, (struct sockaddr *)&address_server, sizeof(address_server)) < 0) {
        perror("connect");
        exit(1);}

    char buffer_recv[1024];
    char buffer_send[1024];
    recv(fd_client, buffer_recv, sizeof(buffer_recv), 0);
    close(fd_client);}
//----------------------sound------------------------------char *pdevice = "hw:0,1";
char *pdevice = "hw:0,0";
char *cdevice = "hw:1,0";
char* buffer_sound;
int   buffer_dft[10][3000],point_dft;

int   rate = 44100;
int   channels = 1;
#include <alsa/asoundlib.h>

         snd_pcm_format_t                format = SND_PCM_FORMAT_S16_LE;
         int                             buffer_size = 0;            /* auto */
         int                             period_size = 0;            /* auto */
         int                             latency_min = 32;           /* in frames / 2 */
         int                             latency_max = 2048;         /* in frames / 2 */
         int                             block = 0;                  /* block mode */
         int                             resample = 1;
         snd_output_t                   *output = NULL;

int setparams_stream(
         snd_pcm_t                      *handle,
         snd_pcm_hw_params_t            *params,

   const char                          *id){
         int                            err;
unsigned int                            rrate;
        err = snd_pcm_hw_params_any(handle, params);
        if (err < 0) {
                printf("Broken configuration for %s PCM: no configurations available: %s\n", snd_strerror(err), id);
                return err;}
        err = snd_pcm_hw_params_set_rate_resample(handle, params, resample);
        if (err < 0) {
                printf("Resample setup failed for %s (val %i): %s\n", id, resample, snd_strerror(err));
                return err;}
        err = snd_pcm_hw_params_set_access(handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
        if (err < 0) {
                printf("Access type not available for %s: %s\n", id, snd_strerror(err));
                return err;}
        err = snd_pcm_hw_params_set_format(handle, params, format);
        if (err < 0) {
                printf("Sample format not available for %s: %s\n", id, snd_strerror(err));
                return err;}
        err = snd_pcm_hw_params_set_channels(handle, params, channels);
        if (err < 0) {
                printf("Channels count (%i) not available for %s: %s\n", channels, id, snd_strerror(err));
                return err;}

        rrate = rate;
        err = snd_pcm_hw_params_set_rate_near(handle, params, &rrate, 0);

        if (err < 0) {
                printf("Rate %iHz not available for %s: %s\n", rate, id, snd_strerror(err));
                return err;}
        if ((int)rrate != rate) {
                printf("Rate doesn't match (requested %iHz, get %iHz)\n", rate, err);
                return -EINVAL;}
        return 0;}

int setparams_bufsize(snd_pcm_t *handle,
                      snd_pcm_hw_params_t *params,
                      snd_pcm_hw_params_t *tparams,
                      snd_pcm_uframes_t bufsize,
                      const char *id){
        int err;
        snd_pcm_uframes_t periodsize;
        snd_pcm_hw_params_copy(params, tparams);
        periodsize = bufsize * 2;
        err = snd_pcm_hw_params_set_buffer_size_near(handle, params, &periodsize);
        if (err < 0) {
                printf("Unable to set buffer size %li for %s: %s\n", bufsize * 2, id, snd_strerror(err));
                return err;}
        if (period_size > 0)
                periodsize = period_size;
        else
                periodsize /= 2;
        err = snd_pcm_hw_params_set_period_size_near(handle, params, &periodsize, 0);
        if (err < 0) {
                printf("Unable to set period size %li for %s: %s\n", periodsize, id, snd_strerror(err));
                return err;}
        return 0;}

int setparams_set(      snd_pcm_t               *handle,
                        snd_pcm_hw_params_t     *params,
                        snd_pcm_sw_params_t     *swparams,
                  const char                    *id){
                        int                      err;
                        snd_pcm_uframes_t        val;

        err = snd_pcm_hw_params(handle, params);
        if (err < 0) {
                printf("Unable to set hw params for %s: %s\n", id, snd_strerror(err));
                return err;}
        err = snd_pcm_sw_params_current(handle, swparams);
        if (err < 0) {
                printf("Unable to determine current swparams for %s: %s\n", id, snd_strerror(err));
                return err;}
        err = snd_pcm_sw_params_set_start_threshold(handle, swparams, 0x7fffffff);
        if (err < 0) {
                printf("Unable to set start threshold mode for %s: %s\n", id, snd_strerror(err));
                return err;}
        if (!block)
                val = 4;
        else
                snd_pcm_hw_params_get_period_size(params, &val, NULL);
        err = snd_pcm_sw_params_set_avail_min(handle, swparams, val);
        if (err < 0) {
                printf("Unable to set avail min for %s: %s\n", id, snd_strerror(err));
                return err;}
        err = snd_pcm_sw_params(handle, swparams);
        if (err < 0) {
                printf("Unable to set sw params for %s: %s\n", id, snd_strerror(err));
                return err;}
        return 0;}


int setparams(   snd_pcm_t                   *phandle,
                 snd_pcm_t                   *chandle,
                 int                         *bufsize){

                 int                          err,
        last_bufsize = *bufsize;
                 snd_pcm_hw_params_t         *pt_params, *ct_params;     /* templates with rate, format and channels */
                 snd_pcm_hw_params_t         *p_params, *c_params;
                 snd_pcm_sw_params_t         *p_swparams, *c_swparams;
                 snd_pcm_uframes_t            p_size, c_size, p_psize, c_psize;
        unsigned int p_time, c_time;
        unsigned int val;

        snd_pcm_hw_params_alloca(&p_params);
        snd_pcm_hw_params_alloca(&c_params);
        snd_pcm_hw_params_alloca(&pt_params);
        snd_pcm_hw_params_alloca(&ct_params);
        snd_pcm_sw_params_alloca(&p_swparams);
        snd_pcm_sw_params_alloca(&c_swparams);

        if ((err = setparams_stream(phandle, pt_params, "playback")) < 0) {
                printf("Unable to set parameters for playback stream: %s\n", snd_strerror(err));
                exit(0);}
        if ((err = setparams_stream(chandle, ct_params, "capture")) < 0) {
                printf("Unable to set parameters for playback stream: %s\n", snd_strerror(err));
                exit(0);}

        if (buffer_size > 0) {
                *bufsize = buffer_size;
                goto __set_it;}

      __again:

        if (buffer_size > 0)
                return -1;
        if (last_bufsize == *bufsize)
                *bufsize += 4;
        last_bufsize = *bufsize;
        if (*bufsize > latency_max)
                return -1;

      __set_it:

        if ((err = setparams_bufsize(phandle, p_params, pt_params, *bufsize, "playback")) < 0) {
                printf("Unable to set sw parameters for playback stream: %s\n", snd_strerror(err));
                exit(0);}
        if ((err = setparams_bufsize(chandle, c_params, ct_params, *bufsize, "capture")) < 0) {
                printf("Unable to set sw parameters for playback stream: %s\n", snd_strerror(err));
                exit(0);}

        snd_pcm_hw_params_get_period_size(p_params, &p_psize, NULL);
        if (p_psize > (unsigned int)*bufsize)
                *bufsize = p_psize;
        snd_pcm_hw_params_get_period_size(c_params, &c_psize, NULL);
        if (c_psize > (unsigned int)*bufsize)
                *bufsize = c_psize;

        snd_pcm_hw_params_get_period_time(p_params, &p_time, NULL);
        snd_pcm_hw_params_get_period_time(c_params, &c_time, NULL);

        if (p_time != c_time)
                goto __again;

        snd_pcm_hw_params_get_buffer_size(p_params, &p_size);
        if (p_psize * 2 < p_size) {
                snd_pcm_hw_params_get_periods_min(p_params, &val, NULL);
                if (val > 2) {
                        printf("playback device does not support 2 periods per buffer\n");
                        exit(0);}
                goto __again;}
        snd_pcm_hw_params_get_buffer_size(c_params, &c_size);
        if (c_psize * 2 < c_size) {
                snd_pcm_hw_params_get_periods_min(c_params, &val, NULL);
                if (val > 2 ) {
                        printf("capture device does not support 2 periods per buffer\n");
                        exit(0);}
                goto __again;}

        if ((err = setparams_set(phandle, p_params, p_swparams, "playback")) < 0) {
                printf("Unable to set sw parameters for playback stream: %s\n", snd_strerror(err));
                exit(0);}
        if ((err = setparams_set(chandle, c_params, c_swparams, "capture")) < 0) {
                printf("Unable to set sw parameters for playback stream: %s\n", snd_strerror(err));
                exit(0);}

        if ((err = snd_pcm_prepare(phandle)) < 0) {
                printf("Prepare error: %s\n", snd_strerror(err));
                exit(0);}
        fflush(stdout);
        return 0;}

int alsa_sound(){
     snd_pcm_t *phandle, *chandle;
     int err, latency, morehelp;
     snd_timestamp_t p_tstamp, c_tstamp;

     err = snd_output_stdio_attach(&output, stdout, 0);
     if (err < 0) {
         printf("Output failed: %s\n", snd_strerror(err));
         return 0;}
     latency = latency_min - 4;
     buffer_sound = (char*)malloc((latency_max * snd_pcm_format_width(format) / 8) * 2);

     if ((err = snd_pcm_open(&phandle, pdevice, SND_PCM_STREAM_PLAYBACK, block ? 0 : SND_PCM_NONBLOCK)) < 0) {
         printf("Playback open error: %s\n", snd_strerror(err));
         return 0;}
     if ((err = snd_pcm_open(&chandle, cdevice, SND_PCM_STREAM_CAPTURE, block ? 0 : SND_PCM_NONBLOCK)) < 0) {
         printf("Record open error: %s\n", snd_strerror(err));
         return 0;}
     while (1) {
         if (setparams(phandle, chandle, &latency) < 0)
             break;
         if ((err = snd_pcm_link(chandle, phandle)) < 0) {
             printf("Streams link error: %s\n", snd_strerror(err));
             exit(0);}
         if (snd_pcm_format_set_silence(format, buffer_sound, latency*channels) < 0) {
             fprintf(stderr, "silence error\n");
             break;}
         if (snd_pcm_writei(phandle, buffer_sound, latency) < 0) {
             fprintf(stderr, "write error\n");
             break;}
         if ((err = snd_pcm_start(chandle)) < 0) {
             printf("Go error: %s\n", snd_strerror(err));
                 exit(0);}

         int ok = 1;
         int result_sound[3000];
         int point_sound = 1;
         int that = 1;
         int what = 1;
         while (ok) {
             snd_pcm_readi(chandle, buffer_sound, latency);
             result_sound[point_sound] = (int)*buffer_sound;

             for(int i = point_sound ; i>1 ; i--){
                 if (result_sound[i-1] ==result_sound[i]){
                     that++;}
                 else{
                     i = 0;}}

             if (that > 10){
                      that = 0;
                      what++;}
             else{    what = 0;}

             if (what > 5){
                      cout << "break" << endl;}
             else{    cout << ""      << endl;}

             if (point_sound == 3000){
                 //buffer_dft[point_dft] == result_sound;
                 point_sound = 1;
                 point_dft++;}
             else{
                 point_sound++;}
             snd_pcm_writei(phandle, buffer_sound,latency);}
     snd_pcm_drop(chandle);
     snd_pcm_nonblock(phandle, 0);
     snd_pcm_drain(phandle);
     snd_pcm_nonblock(phandle, !block ? 1 : 0);
     snd_pcm_unlink(chandle);
     snd_pcm_hw_free(phandle);
     snd_pcm_hw_free(chandle);}
     snd_pcm_close(phandle);
     snd_pcm_close(chandle);
     return 0;}


void sound(){
    alsa_sound();}
//---------------------------------------------------------
void* gop_info(void*) {
    info();}
void* gop_sound(void*) {
    sound();}
void* gop_server(void*) {
    gopi_connect gopi_server;
    gopi_server.server();}
void* gop_client(void*) {
    gopi_connect gopi_client;
    gopi_client.client();}
//-------------------------BODY----------------------------
int main (){
    pthread_t thread[3];
    pthread_create (&thread[0], NULL, gop_info , NULL);
    //pthread_create (&thread[1], NULL, gop_sound , NULL);
    //pthread_create (&thread[2], NULL, gop_server, NULL);
    //pthread_create (&thread[3], NULL, gop_client, NULL);
    while(true) {
        cout << info_system << endl;
        sleep(1);}}
