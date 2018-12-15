

 int clean_about_network ( gopi_network )

  {









/*

 maybe we could found blank box

 or use realloc

*/



 int  number_ip;


 for (

       number_ip  = 0;
       number_ip <= 32;
       number_ip ++

     )

  {





 if  (

       strcmp (  that_network . ip [ number_ip ] [ 2 ],  ""  )  !=  0

     )

  {

 strcpy (  that_network . ip [ number_ip ] [ 2 ],  ""  );

  }



 else

  {

 break;

  }



  }













/*

 and others

 ...





 number is for load network by unstatic memory

*/


 that_network . number = 0;











 return 0;

  }
