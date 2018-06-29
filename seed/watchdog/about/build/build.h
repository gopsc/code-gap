




struct gopi_system {



/*

 then it put about waitting could be little 

*/


    char symbol [ 16 ];

    char system [ 1024 ];
    char name   [ 1024 ];

/*
    char user   [ 1024 ];
*/

    };






struct gopi_cpu {




/*

 them could not be here

*/


             char name [ 128 ];

/*
    unsigned  int  user;
    unsigned  int  nice;
    unsigned  int  system;
    unsigned  int  idle;
*/
              int  cores;
              int  frequency;
              int  temperature;
    unsigned  int  rate;};






struct gopi_memory {

    unsigned long  total;
    unsigned long  free ;

/*

 we note rate straitly

*/

    unsigned long  total;};






struct gopi_disk {

    unsigned long  size;
    unsigned long  available;

/*

 we note rate straitly

*/

    unsigned long  total;};







struct gopi_network {

    char        ip     [ 32 ] [ 3 ] [ 1024 ];
    int         number;};






struct gopi_sound {

    int         number_control;
    int         number_capture;
    int         number_playback;

    char        device [ 3 ] [ 128 ] [ 16 ];
    int         device_playback;
    int         device_capture;};















struct gopi_about {



/*

 sometimes we wanna put it out

 and it may be loading

 we set a symbol to sigh

*/

    char symbol [ 16 ];











/*

 what we should do

*/


    struct gopi_flag    flag;











/*

 we use this about to just save about it

 not for the configuration, network or what


 we touch af file to save configurations

*/


//    struct gopi_configurations;









    struct gopi_system  system;

    struct gopi_cpu     cpu;

    struct gopi_memory  memory;

    struct gopi_disk    disk;

    struct gopi_network network;

    struct gopi_sound   sound;




/*

 gop could have lots of mates

*/


    short    number_mates;

    void * * mates;




    } gop_about;








