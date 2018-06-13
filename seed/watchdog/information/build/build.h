
struct gopi_system {

    char system [ 1024 ];
    char name   [ 1024 ];
    char user   [ 1024 ];};

//-------------------------------------------------------------------------

struct gopi_cpu {

             char name [ 128 ] ;
    unsigned int  user   ;
    unsigned int  nice   ;
    unsigned int  system ;
    unsigned int  idle   ;

             int cores       ;
             int frequency   ;
             int temperature ;
    unsigned int rate        ;};

//-------------------------------------------------------------------------

struct gopi_memory {

    unsigned long  total;
    unsigned long  free ;};

//-------------------------------------------------------------------------

struct gopi_disk {

    unsigned long  size     ;
    unsigned long  available;};


//-------------------------------------------------------------------------

struct gopi_network {

    char        ip     [ 32 ] [ 3 ] [ 1024 ];
    int         number;};

//-------------------------------------------------------------------------

struct gopi_sound {

    int         number_control  ;
    int         number_capture  ;
    int         number_playback ;

    char        device [ 3 ] [ 128 ] [ 16 ];
    int         device_playback ;
    int         device_capture  ;};

//-------------------------------------------------------------------------



struct gopi_about {

    struct gopi_flag    flag;


// we use this about to just save the informaion
//
// not for the configuration, network or what

//    struct gopi_configurations;


    struct gopi_system  system;

    struct gopi_cpu     cpu;

    struct gopi_memory  memory;

    struct gopi_disk    disk;

    struct gopi_network network;

    struct gopi_sound   sound;


    } gop_about;









// this struct is huge, i must use a function to clean it,,

int clean_this ( ) {


// first add this before i change the name of the about struct everywhere
//
//    or the dog won't run

    gop_about.flag.main = 1;

    return 1;}
