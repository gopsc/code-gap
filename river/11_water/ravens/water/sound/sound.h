bool     flag_sound = true;

char   c_device[7]             = "hw:2,0";
int      rate                  = 44100;
int      channels              = 1;

int      dft_N                 = 3000;
int      dft_w                 = 500;
int      dirta_w               = 1;

double     result_sound[3000];
double     result_dft[3000];


#include "./ft/dft.h"
#include "./alsa/alsa.h"


