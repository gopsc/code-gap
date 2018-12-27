
 int action_TxL ()

  {



/*

 there could be a thing at 10th there

 we should check it first






 sometimes there is already a link exist there
 and i don know what to do




 maybe i should use commandline get




 clean it

*/


 if (  is_file ( "/etc/init.d/?" )  )

  {

 system ( "rm /etc/init.d/?" );

  }





 if (  is_file ( "/etc/rc3.d/S10?" )  )

  {

 system ( "rm /etc/rc3.d/S10?" );

  }





 if (  is_file ( "/etc/rc5.d/S10?" )  )

  {

 system ( "rm /etc/rc5.d/S10?" );

  }





 if (  is_file ( "/etc/rc6.d/K10?" )  )

  {

 system ( "rm /etc/rc6.d/K10?" );

  }








/*

 process it

*/

 char  buffer_commandline [ 128 ];


 strcpy ( buffer_commandline, "gcc " );

 strcat ( buffer_commandline, path_the );

 strcat ( buffer_commandline, "/" );

 strcat ( buffer_commandline, name_the );

 strcat ( buffer_commandline, "things/c/code/deamon.c" );

 strcat ( buffer_commandline, " -o" );

 strcat ( buffer_commandline, " /etc/init.d/?" );


 commandline_get ( buffer_commandline, buffer_commandline  );





/*

 it is a little straightly




 make the link

*/

 system ( "ln /etc/init.d/? /etc/rc3.d/S10?" );

 system ( "ln /etc/init.d/? /etc/rc5.d/S10?" );

 system ( "ln /etc/init.d/? /etc/rc6.d/K10?" );






/*

 set the service



 sometimes it couldn't work

 and doesn't neet it

 i don't know

*/

 commandline_get ( "service ? restart", buffer_commandline );




/*

 return it

*/


 return 0;



  }
