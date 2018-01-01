

double     result_sound[1025];
double     result_ft[1025];




char* pdevice;
char* cdevice;

int buffer_size = 0;            /* auto */
int period_size = 0;            /* auto */
int latency_min = 32;           /* in frames / 2 */
int latency_max = 2048;         /* in frames / 2 */
int resample    = 1;




pthread_t       thread_fft;








