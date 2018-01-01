
char                 box_blank[1] = "";

int                  info_time;

string               info_name;
string               info_system;

string  info_ip[3][6][3];
int     point_ip[2];

class gopi_sound { public:
    int         num_capture           = 0;
    int         num_playback          = 0;
    int         num_control           = 0;
    string      device[3][5];

    char*       device_playback      = device_p;
    char*       device_capture       = device_c;};

struct OCCUPY_CPU{
             char name[20];
    unsigned int  user;
    unsigned int  nice;
    unsigned int  system;
    unsigned int  idle;

              int cores;
              int f;
              int temperature;
    unsigned int  rate;};
//-------------------------------------------------------------------------
struct OCCUPY_MEMORY{
    unsigned char name1[20];
    unsigned char name2[20];
    unsigned char name3[20];
    unsigned char name4[20];

    unsigned int  total;
    unsigned int  free;

    unsigned int  buffers;
    unsigned int  cached;};
//-------------------------------------------------------------------------



struct OCCUPY_MEMORY info_memory;
struct OCCUPY_CPU    info_cpu;
struct OCCUPY_CPU    buffer_cpu;

gopi_sound info_sound;







