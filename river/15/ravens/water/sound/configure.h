
string   buffer_path_sound = "";

double     result_sound[3000];
double     result_dft[3000];


char* pdevice = info_sound.device_playback;
char* cdevice = info_sound.device_capture;

int buffer_size = 0;            /* auto */
int period_size = 0;            /* auto */
int latency_min = 32;           /* in frames / 2 */
int latency_max = 2048;         /* in frames / 2 */
int resample    = 1;








