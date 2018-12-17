



 int about_sister_sister ()


  {





/*

 if we use it on arduino or stm32

 we could give it a value straightly

*/








 char that_result [ 128 ];







 commandline_get  (  "uname -s",  that_result  );








/*

 got a enter at end

*/

 * strchr  (  that_result,  '\n'  )   =   '\0';










 strcpy  (  gop_about . sister . sister,  that_result  );







 return 0;




  }














/*

 dont need to use

*/



/*
 get the user for it
 could see who
 and gop dream about it
*/





/*

 int about_user ()

  {

 char noet_result [ 128 ];

 commandline_get (  "whoami",  note_result  );


 if (
      strchr ( note_result,'\n' ) != NULL
    )

  {

 * strchr (  note_result,  '\n'  )  =  '\0';

  }

 strcpy (  gop_about_system . user,  note_result  );

 return 0;

  }


*/
