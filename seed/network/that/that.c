




/*

 change the name to network soon

*/



 struct gopi_connection


  {

  
  
  
  
 /*
 
  could use iic, serial and more
  
 */

 /*

 char * type;

 */
  
  
  
 char how [ 4 ] [ 16 ];

 time_t  time [ 5 ];


 int descriptor [ 2 ];

 int connection [ 5 ];


 char address_ip [ 4 ] [ 128 ];

 int port [ 2 ];


 char command [ 4 ] [ 128 ];










 char update [ 4 ] [ 10240 ];



/*

 the step of update

 soon we won't use them

 we fresh it after recived

*/

 int step_update [ 4 ];

 int flag_update [ 4 ];










/*

 we're ready to note them :D

 use a big changed space



 ----<-----...43210-----------

*/


/*

 char video [ 4 ] [ 102400 ]; 
 char audio [ 4 ] [ 102400 ];

*/









/*

 we don't use this we use one include this

 :D

*/

/*
    struct gopi_system  system    [4];
    struct gopi_network network   [4];
    struct gopi_cpu     cpu       [4];
    struct gopi_memory  memory    [4];
    struct gopi_disk    disk      [4];
    struct gopi_sound   sound     [4];
    struct gopi_flag    flag      [4];
*/





 struct  gopi_about  about [ 4 ];






/*

 then we could add lots of mates


 give it to dog

*/

// * gopi_about  about [ 4 ];









/*

 maybe there're strange things like bettery

*/

 char  note [ 4 ] [ 1024 ];







  } gop_connection;










