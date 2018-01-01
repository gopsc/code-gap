








struct gopi_cpu {

             char name[129];
    unsigned int  user;
    unsigned int  nice;
    unsigned int  system;
    unsigned int  idle;

             int cores;
             int frequency;
             int temperature;
    unsigned int  rate;};

//-------------------------------------------------------------------------

struct gopi_memory {
    unsigned char name1[129];
    unsigned char name2[129];

    unsigned int  total;
    unsigned int  free;};

//-------------------------------------------------------------------------

struct gopi_disk {
    unsigned int  total[10];
    unsigned int  free[10];};

//-------------------------------------------------------------------------

struct gopi_sound {
    int         num_capture;
    int         num_playback;
    int         num_control;
    char        device[3][5][129];

    int         device_playback;
    int         device_capture;};













bool               information_done    = false;

char               information_user[129];
char               information_name[129];
char               information_system[129];

char               information_ip[10][3][255];
char               information_ip_num;

struct gopi_memory information_memory;
struct gopi_disk   information_disk;
struct gopi_cpu    information_cpu;
struct gopi_sound  information_sound;
