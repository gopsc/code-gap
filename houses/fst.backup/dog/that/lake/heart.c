










 struct gopi_heart

  {




/*

 wait...

*/


/*

 char symbol [ 16 ]

*/

 void *  symbol;







/*

 them could not be here


 use in cpu/rate

 and now it do it itself

*/


/*

 char name [ 16 ];

 unsigned  int  user;

 unsigned  int  nice;

 unsigned  int  system;

 unsigned  int  idle;

*/




 int  core;

 int  frequency;

 int  temperature;

 unsigned  int  rate;


  };











/*

 int clean_about_heart  (  void * that_heart  )
 
*/



 int clean_about_heart  (  gopi_heart  that_heart  )

  {




 that . about . heart . temperature  =  0;


 that . about . heart . core  =  0;


 that . about . heart . frequency  =  0;


 that . about . heart . rate  =  0;




 return 0;

  }
