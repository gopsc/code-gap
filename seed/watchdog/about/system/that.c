



 int about_system ()


  {





/*

 if we use it on arduino or stm32

 we could give it a value straightly

*/








 char note_result [ 128 ];







 commandline_get ( "uname -s", note_result );



/*

 got a enter at end

*/

 * strchr ( note_result, '\n' )  =  '\0';






 strcpy ( gop_about . system . system, note_result );



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
