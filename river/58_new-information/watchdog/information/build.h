
struct gopi_system {

    char system[1024];
    char name  [1024];
    char user  [1024];};

//-------------------------------------------------------------------------

struct gopi_cpu {

             char name[128] ;
    unsigned int  user      ;
    unsigned int  nice      ;
    unsigned int  system    ;
    unsigned int  idle      ;

             int cores      ;
             int frequency  ;
             int temperature;
    unsigned int rate       ;};

//-------------------------------------------------------------------------

struct gopi_memory {

    unsigned long  total;
    unsigned long  free ;};

//-------------------------------------------------------------------------

struct gopi_disk {

    unsigned long  available;
    unsigned long  used     ;};


//-------------------------------------------------------------------------

struct gopi_network {

    char        ip    [10][3][1024];
    int         number             ;};

//-------------------------------------------------------------------------

struct gopi_sound {

    int         number_capture  ;
    int         number_playback ;
    int         number_control  ;

    char        device[3][9][17];
    int         device_playback ;
    int         device_capture  ;};

//-------------------------------------------------------------------------

struct gopi_system  information_system;
struct gopi_cpu     information_cpu;
struct gopi_memory  information_memory;
struct gopi_disk    information_disk;
struct gopi_network information_network;
struct gopi_sound   information_sound;