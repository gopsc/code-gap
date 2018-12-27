

















/*

 struct gopi_disk

*/

 struct that_shadow
 
  {


/*

 char symbol [ 16 ];

*/

 void * symbol;




 unsigned long  size;

 unsigned long  available;

/*

 we note rate straitly

*/

 unsigned short  rate;

  };










/*

 int clean_about_disk ( gopi_disk that_disk )

*/

 int clean_about_shadow ( void * that_shadow )

  {


 * ( unsigned long )  that_shadow . size  =  0;

 * ( unsigned long )  that_shadow . available  =  0;

 * ( unsigned short ) that_shadow . rate  =  0;


 return 0;

  }
