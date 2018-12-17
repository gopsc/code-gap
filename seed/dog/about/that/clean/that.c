


/*

 this struct is huge, i must use a function to clean it,,


 give a value of its structure and that could clean many where



 and could set a clean loop

*/







/*

 int clean_about   (  void *  that_about  )

*/


 int clean_about  (  struct  gopi_about  that_about  )

  {

















/*

 there is a symbol about it

 if it is reading we don't clean the symbol

 if not we clean it to blank



 we use symbol to little about soon

 then we put them with waitting








 it is blank when we clean it at start

*/


 while  (

/*

          strcmp ( that . about . symbol, "reading" )  ==  0

*/

          strcmp ( that . about . symbol, "waitting" )  != 0

     &&   strcmp ( that . about . symbol, "" ) != 0;

        )


  {







/*

    it is 0.1  seconds for a connector

 so it is 0.1- seconds for a about load


 actualy them couldn't meet cause we don't clean it after first load

*/


 gop_wait ( 0.05 );

  }





/*

 strcpy ( that_about . symbol, "waitting" );

*/

 strcpy ( that . about . symbol, "cleanning" );



/*

 strcpy ( that_about . flag . symbol, "cleanning" );

*/

 strcpy ( that . about . system . symbol, "cleanning" );

 strcpy ( that . about . cpu . symbol, "cleanning" );

 strcpy ( that . about . memory . symbol, "cleanning" );

 strcpy ( that . about . disk . symbol. "cleanning" );

 strcpy ( that . about . network . symbol. "cleanning" );

 strcpy ( that . about . sound . symbol. "cleanning" );













/*

 clean about this

 ...

*/





/*

 clean_flag ( that_about . flag );

 strcpy ( that_about . flag . symbol, "waitting" );

*/











/*

 wait connector / connectted exit maybe

 ...


  doesn't need because we just use it at sometime now

*/










/*

 waitting for reading, take savnig after it maybe

*/




/*

 strcpy ( that_about . system . symbol, "cleanning" );

*/


 clean_about_system ( that . about . system );

/*

 strcpy ( that_about . system . symbol, "waitting" );

*/


 clean_about_cpu ( that . about . cpu );

/*

 strcpy ( that_about . cpu . symbol, "waitting" );

*/


 clean_about_memory ( that . about . memory );

/*

 strcpy ( that_about . memory . symbol, "waitting" );

*/


 clean_about_disk ( that . about . disk );

/*

 strcpy ( that_about . disk . symbol, "waitting" );

*/


 clean_about_network ( that . about . network );

/*

 strcpy ( that_about . network . symbol, "waitting" );

*/


 clean_about_sound ( that . about . sound );

/*

 strcpy ( that_about . sound . symbol, "waitting" );

*/


 clean_about_mate ( that . about );

/*

 strcpy ( that_about . symbol, "waitting" );

*/








 strcpy ( that . about . system . symbol, "waitting" );

 strcpy ( that . about . cpu . symbol, "waitting" );

 strcpy ( that . about . memory . symbol, "waitting" );

 strcpy ( that . about . disk . symbol, "waitting" );

 strcpy ( that . about . network . symbol, "waitting" );

 strcpy ( that . about . sound . symbol, "waitting" );

 strcpy ( that . about . symbol, "waitting" );







 return 0;


  }















/*

 then it could clean mates of this


 doesnt't have it anymore
 
*/

  
  
/*

 int clean_flag ( gopi_flag that_flag )
 
  {
  
 
 
 
 
 
 
 
 
 
 
/*

 first add this before change about name

    or the dog won't run


 and dog load configurations



 sometimes we clean it

 when lost a connectting

*/







/*

 it is running default or program get a shutdown

*/

 that_flag . main  =  1;



/*

 it is not get from hope


 mates usually open it

*/

 that_flag . deamon  =  gop_about . flag . deamon;


 that_flag . dog  =  0;

 that_flag . start  =  0;

 that_flag . show  =  0;


 that_flag . connector  =  0;

 that_flag . connectted  =  0;


 that_flag . sound  =  0;

 that_flag . sound_show  =  0;

 that_flag . sound_save  =  0;
  
  }

  */
