



/*

 don't know what to give maybe a happy smile ?

*/


 void * gop_dog ( void * what )


  {













/*

 some of it may have a number used by another process

   so we clean it first

*/


 clean_about ( gop_about );















/*

 Load configure from:

 {path} / {name} / configurations


 first we load configurations without flag of main

 cause it is empty at first

 and this is the beginning



 or dog won't run


 gop may check without dog



 load from  ( path ) / ( name ) / hope  now

*/

 load_hope ();









/*

 Prepare the symbal just like 'NEXT'


 and we load one symbol now

*/

 load_symbol ();









/*

 Listen modle of sound , it need a word libary loading.


 use as trees now

*/

 load_listen ();












/*

 TxL needs root

 and no more

*/


/*

 check_root();

*/











/*

 When a update was stop, files left.

 Must be after loading.

*/

 check_update ();











 output_print ( "string", "done\n" );










/*

 note this

*/

 note_save ( "dog", "start with watchdog", "now" );






















 while (  gop_about . flag . main  )

  {


/*

 maybe run it just for watchdog and maybe not



 maybe for only once

*/






 if  (  ! gop_about . flag . dog  )

  {

 gop_wait ( 0.1 );

  }



 else if  (  gop_about . flag . dog  )

  {








/*

 run the functions



 then we could wait for it every step

*/

/*

 strcpy ( gop_about . system . symbol, "reading" );

*/


/*

 about_user ();   gop_wait ( 0.1 );

*/

 about_name ();   gop_wait ( 0.1 );

 about_system (); gop_wait ( 0.1 );


 about_memory (); gop_wait ( 0.1 );




/*

 maybe use it at some situation

*/



 about_disk ();    gop_wait ( 0.1 );


 about_cpu ();     gop_wait ( 0.1 );


 about_address (); gop_wait ( 0.1 );


 about_sound ();   gop_wait ( 0.1 );



/*

 check its

*/


 check_network ();          gop_wait ( 0.1 );

 check_power ();            gop_wait ( 0.1 );


 dog_show ();               gop_wait ( 0.1 );



/*

  it means the dog finished one time at least

  we have load about some like sound


  and we may need to cause we have the symbol

*/

 if ( ! gop_about . flag . start )

  {

 gop_about . flag . start  =  1;

  }




/*

 this is for if flag of dog is true

*/

  }





/*

 this is for flag of main is tru

*/

  }










/*

 note this

*/

 note_save ( "dog", "watchdog close", "now" );







/*

 sirisly i don't know what dose matter is u add this line

*/

 pthread_exit ( NULL );






/*

 done

*/

  }
