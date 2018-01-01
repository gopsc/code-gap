
bool                 info_done = false;


int                  info_time;
string               info_name;
string               info_system;
string               info_ip[3][6][3];
int                  point_ip[2];









struct gopi_cpu {
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

struct gopi_memory {
    unsigned char name1[20];
    unsigned char name2[20];

    unsigned int  total;
    unsigned int  free;};

//-------------------------------------------------------------------------

struct gopi_disk {
    unsigned int  total;
    unsigned int  free;};

//-------------------------------------------------------------------------

struct gopi_sound {
    int         num_capture;
    int         num_playback;
    int         num_control;
    string      device[3][5];

    int         device_playback;
    int         device_capture;};



struct gopi_memory info_memory;
struct gopi_disk   info_disk;
struct gopi_cpu    info_cpu;
struct gopi_cpu    buffer_cpu;


struct gopi_sound    info_sound;








