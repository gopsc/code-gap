














 struct gopi_memory

  {



/*

 char symbol [ 16 ];

*/

 void * symbol;
 
 



/*

 unsigned long  total;

 unsigned long  free ;

*/

 void *  total;
 
 void *  free;
 
 
 
 



/*

 we note rate straitly

*/

/*

 unsigned long  rate;

*/

 void *  rate;
 
 
 

  };
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  



/*

 int clean_about_memory ( gopi_memory that_memory )

*/

 int clean_about_memory (  void * that_memory  )

  {
	  
	  


 *  ( unsigned long * )   that_memory . total = 0;

 *  ( unsigned long * )   that_memory . free  = 0;

 *  ( unsigned short * )  that_memory . rate  = 0;




 return 0;

  }

