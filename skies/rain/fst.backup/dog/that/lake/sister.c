



/*

 struct gopi_system

*/


 struct that_sister
 
  {



/*

 use to put its type now could be waitting or others


 then put it about waitting could be little

*/


/*

 char symbol [ 16 ];

*/

 void * symbol;




/*

 1024 is too long to save system name

*/


/*

 char system [ 32 ];

 char name   [ 32 ];

*/


 void *  sister;
 
 void *  name;
 

/*

 char user   [ 32 ];

*/



  };











/*

 int clean_about_sister ( gopi_sister that_sister )

*/


 int clean_about_sister ( void * that_sister )

  {
 
 
 
 
 strcpy ( that_sister . sister, "" );

 strcpy ( that_sister . name, "" );


/*

 strcpy ( that_sister . user, "" );

*/
 
 
 
 
 return 0;
 
  }
