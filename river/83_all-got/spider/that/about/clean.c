

















 struct that_spider


  {


 void *  symbol;






 /*

  maybe use malloc straightly

 */

/*

 char ip [ 32 ] [ 3 ] [ 1024 ];

 int  number;

*/

 void * * address;

 void * number;

  };













 int clean_about_network ( void * that_network )

  {









/*

 maybe we could found blank box

 or use realloc

*/



 void *  number_address;


 number_address  =  malloc (  sizeof ( unsigned short )  );









 for (

       * ( unsigned short * ) number_address    =   0;
       * ( unsigned short * ) number_address   <=   * ( unsigned short * ) that_net . number;
       * ( unsigned short * ) number_address   ++

     )

  {







 if  (

       strcmp (  that_net . address  [ * ( unsigned short * ) number_address ] [ 2 ],  ""  )  !=  0

     )



  {

 strcpy (  that_net . address  [ * ( unsigned short * ) number_address ] [ 2 ],  ""  );

  }



 else

  {

 break;

  }






  }






 free ( number_address );










/*

 and others

 ...





 number is for load network
                            by unstatic memory

*/


 * ( unsigned short )  that_net . number  =  0;











 return 0;

  }
