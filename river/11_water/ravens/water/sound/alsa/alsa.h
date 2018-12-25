
#include <alsa/asoundlib.h>

char* pdevice;
char* cdevice = c_device;

int buffer_size = 0;            /* auto */
int period_size = 0;            /* auto */
int latency_min = 32;           /* in frames / 2 */
int latency_max = 2048;         /* in frames / 2 */
int resample    = 1;

#include "./corde/corde.h"
void* gop_sound(void*) {
    while (flag_sound) {
        gop_corde();
        sleep(0.1);}}

