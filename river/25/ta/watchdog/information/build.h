
char                 box_blank[1] = "";

int                  info_time;

string               info_name;
string               info_system;
string               info_ip[3][6][3];
int                  point_ip[2];


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

struct gopi_sound {
    int         num_capture;
    int         num_playback;
    int         num_control;
    string      device[3][5];

    int         device_playback;
    int         device_capture;};



struct OCCUPY_MEMORY info_memory;
struct OCCUPY_CPU    info_cpu;
struct OCCUPY_CPU    buffer_cpu;

struct gopi_sound    info_sound;








