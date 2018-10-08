




 int init_deamon ()

  {







 if (  gop_hopes . number_options  <=  1  )


  {


/*

 not open


 it isn't deamon mode

*/


 return 1;


  }









 else


  {








 if  (  strcmp ( gop_hopes . note_args [ 1 ], "deamon" )  !=  0  )



  {


/*

 it isn't deamon mode


 not open

*/


 return 1;


  }













 else


  {


/*

 it is deamon mode

*/


 gop_about . flag . deamon = 1;











/*

 Maybe it need to wait
   for some of program

*/


 gop_wait ( 1000000 );




 output_print ( "string", "Start deamon...\n" );













 int  number_process  =  fork ();











 if  (  number_process  )


  {



/*

 It's father process, exit it.

*/


 return 0;


  }









 else if  (  number_process  <  0  )


  {


/*

 fork failled, exit it.

*/


 return 0;


  }












/*

 Now it's the first son process session.




 Make the 1st son process session become a

 new session and process session group leader

 and leave control terminal

*/




 setsid ();





 number_process  =  fork ();





 if ( number_process )


  {


/*

 It's the 1st son process session, exit it.

*/


 return 0;


  }










 else if  (  number_process  <  0  )


  {


/*

 fork failled, exit it.

*/

 return 0;


  }











/*

 Now it's the second son process session.

 the 2nd son process session is

 not session group leader

 any more

*/



 char note_nofile [ 16 ];


 int number_nofile  =  atoi ( note_nofile );



 int i;

 for  (  i = 0;  i < number_nofile;  ++ i  )


  {





 close(i);






/*

 Change work dirent.

*/

 chdir ( "/" );







/*

 Reset file building modeling

*/

 umask ( 0 );






 return 1;



  }







/*

 something goes wrong

*/


 else

  {

 return 0;

  }









/*

 them for compare

*/


  }


  }





/*

 this loop for function

*/

  }



