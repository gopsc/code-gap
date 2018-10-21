
















 struct gopi_sound

  {


 char symbol [ 16 ];







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
