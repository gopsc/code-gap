




 struct gopi_system

  {



/*

 use to put its type now could be wait or what


 then it put about waitting could be little

*/


 char symbol [ 16 ];





/*

 1024 is too long to save system name

*/

 char system [ 32 ];

 char name   [ 32 ];

/*

 char user   [ 32 ];

*/

  };

















 struct gopi_cpu

  {




/*

 wait...

*/

 char symbol [ 16 ]






/*

 them could not be here

*/


 char name [ 128 ];





/*

 use in cpu/rate

 and now it do it itself

*/

/*

 unsigned  int  user;

 unsigned  int  nice;

 unsigned  int  system;

 unsigned  int  idle;

*/




 int  cores;

 int  frequency;

 int  temperature;

 unsigned  int  rate;


  };














 struct gopi_memory

  {


 char symbol [ 16 ];



 unsigned long  total;

 unsigned long  free ;

/*

 we note rate straitly

*/

 unsigned long  rate;


  };


















 struct gopi_disk

  {

 char symbol [ 16 ];


 unsigned long  size;

 unsigned long  available;

/*

 we note rate straitly

*/

 unsigned long  rate;

  };


















 struct gopi_network


  {


 char symbol [ 16 ];



 /*

  maybe use malloc straightly

 */

 char ip [ 32 ] [ 3 ] [ 1024 ];

 int  number;


  };

















 struct gopi_sound

  {

 char symbol [ 16 ]


 int number_control;

 int number_capture;

 int number_playback;



/*

 for numbers 128 is too long

*/

 char device [ 3 ] [ 32 ] [ 16 ];

 int device_playback;

 int device_capture;


  };















 struct gopi_about


  {




/*

 sometimes we wanna put it out

 and it may be loading

 we set a symbol to sigh



 and sub-about could have a symbol too

 use for loading about

*/



 char symbol [ 16 ];











/*

 what we should do

*/


 struct  gopi_flag  flag;











/*

 we use this about to just save about it

 not for the configuration, network or what


 we touch a file to save configurations

*/


/*

 struct gopi_configurations;

*/








 struct gopi_system  system;

 struct gopi_cpu  cpu;

 struct gopi_memory  memory;

 struct gopi_disk  disk;

 struct gopi_network  network;

 struct gopi_sound  sound;




/*

 gop could have lots of mates

*/


    short  number_mates;

    void * * mates;




    } gop_about;








