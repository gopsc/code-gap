

/*

 int clean_about_disk ( gopi_disk that_disk )

*/

 int clean_about_shadow ( void * that_shadow )

  {


 that_shadow . size  =  0;

 that_shadow . available  =  0;

 that_shadow . rate  =  0;


 return 0;

  }
