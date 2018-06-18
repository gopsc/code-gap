
struct gopi_cpu {

             char name[129];
    unsigned int  user;
    unsigned int  nice;
    unsigned int  system;
    unsigned int  idle;

             int cores;
             int frequency;
             int temperature;
    unsigned int rate;};

//-------------------------------------------------------------------------

struct gopi_memory {

    unsigned long  total;
    unsigned long  free;};

//-------------------------------------------------------------------------

struct gopi_disk {

    unsigned long  available;
    unsigned long  used;};

//-------------------------------------------------------------------------

struct gopi_sound {

    int         number_capture;
    int         number_playback;
    int         number_control;

    char        device[3][9][17];
    int         device_playback;
    int         device_capture;};








char               information_user[129];
char               information_name[129];
char               information_system[129];

char               information_ip[10][3][255];
char               information_ip_number;

struct gopi_memory information_memory;
struct gopi_disk   information_disk;
struct gopi_sound  information_sound;
struct gopi_cpu    information_cpu;