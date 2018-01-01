

double     result_sound[200][513];
//                     [num][ t ]

double     result_ft[200][513];
//                  [ t ][ w ]

double     buffer_listen[100][513][200];
//                      [num][ w ][ t ]

int        num_listen = 1;
// Number of word files






string     path_sound;




char* pdevice;
char* cdevice;

int buffer_size = 0;            /* auto */
int period_size = 0;            /* auto */
int latency_min = 32;           /* in frames / 2 */
int latency_max = 2048;         /* in frames / 2 */
int resample    = 1;











