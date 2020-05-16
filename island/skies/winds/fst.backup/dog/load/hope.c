



 int load_hope ()

  {








/*

 we start this load, and it will print in the output manage



 maybe some day we use muti-output surface

*/


 output_print ( "string", "Load hope...\n" );












/*

 Prepare the values,

         the start path used is certaintly



 now we won't use no root configurations

*/


 char note_path [ 128 ];












/*

 for saving files
 and saving configurations

 soon use realloc






 for save name of user

*/

// char that_file [ 128 ];










/*

 this is for saving hopes

*/


 char note_file [ 1024 ];









/*

 read pointer

*/


 char * pointer_file;







/*

 read to

*/


 char * pointer_to;













/*

 this two is for save

 hopes we'll found and found

*/


 char target_hopes [ 21 ] [ 32 ];

 char result_hopes [ 21 ] [ 32 ];











/*
	
 If ur running a server or client program

 and you wanna change the target ip

 you must close it first,

 then turn it up again



 and let dog do this


 close it anyway could mess me

*/


//    int bool_reset = 0;










/*

 Check path.

 Get the user
    only root can access /opt/TxL

 the information not get at this time



 it run all user

 just go

*/


// commandline_get ( "whoami", that_file );













/*

 The mode of deamon


 we use one hope

 use other way to judge sound

*/

/*

 if  (  gop_hopes . number_options  >  1  )


  {








/*

 deamon program usually is run by root

*/




 if (

          strcmp  (  gop_hopes . buffer_options [ 1 ],  "deamon"  )  ==  0

      &&  strcmp  (  that_file, "root\n"  )  ==  0

    )


  {




/*

 If it's deamon mode, load the configuration file



 could be different

 maybe we're gonna listen or what

*/

 strcpy ( note_path, "/opt/TxL/sky/hopes/TxL/hopes_deamon" );






/*

 If the deamon configuration is not found, load the common configuration file

*/

 if  (  ! is_file ( note_path )  )


  {


 strcpy ( note_path, "/opt/TxL/seed/hopes" );


  }




  }


  }














/*

 The mode of terminal
  of root

*/

 else if  (  strcmp ( that_file, "root\n" ) == 0  )


  {

*/












/*

 be ready to get the common configuration file

*/


 strcpy ( note_path, "/opt/TxL/seed/hopes" );






/*

 if it's not found, try the dirent where you are

*/

 if  (  ! is_file ( note_path )  )

  {


 strcpy ( note_path, "seed/hopes" );

  }











/*

  }

*/














/*

 The mode of terminal
  of no root



 won't need it

 they use one same hope

*/




/*

 else if  (  strcmp ( that_file, "root\n" )  !=  0  )


  {






/*

 if it is not the root user, try to load the no-root configuration

*/

 strcpy ( note_path, "/opt/TxL/sky/hopes/TxL/hopes_no-root" );







/*

 if it's not found, try the dirent where you are

*/

 if (  ! is_file ( note_path )  )

  {

 strcpy ( note_path, "sky/hopes/TxL/hopes_no-root" );


  }





  }

*/
















/*

 There's still no configuration file
   ask the user

*/



 while  (  ! is_file ( note_path )  )


  {














/*

 it couldn't recive keyboard type in in deamon

*/





 if  (
        gop_hopes . number_options  <=  1

 ||     strcmp ( gop_hopes . buffer_options [ 1 ],  "deamon" )  !=  0

     )


  {


 output_print ( "string", "hopes we can't find it" );

 return 0;

  }





 else

  {



 output_print ( "string", "\n Can't find hope :(\n" );

 output_print ( "string", "  type a new path:" );



 fgets ( note_path, 128, stdin );










/*

 print the file path for test

 use this in text

*/




 output_print ( "string", "\n u typed:        " );

 output_print ( "string", note_path );





/*

 it has a enter already

*/

 output_print ( "string", "\n" );










/*

 it always take a '\n' at the end

*/


 if (  strchr ( note_path, '\n' )  !=  NULL  )

  {

 * strchr ( notes_path, '\n' )  = '\0';

  }










/*

 this range for deamon check

*/

  }







/*

 this range for file not found

*/


  }















/*

 Get the file

*/

 file_get ( note_path, that_file );










/*

 sometimes it maybe a empty file

 but the watchdog will keep running




 if it's not a empty file

 it will be read

 don't worry


 dog run once

*/






/*

 we don't need to reboot it

  because we could check it straightly

 by dog

*/





/*

/*

 Reboot client when it was block.

*/



 if (

     gop_about . flag . connector

     &&

        (
          strcmp ( gop_connection . how [ 0 ], ""     )  ==  0
     ||   strcmp ( gop_connection . how [ 0 ], "Wait" )  ==  0
        )

    )


  {



 bool_reset = 1;


 gop_about . flag . connector  =  0;



/*

 could use clean now

*/

 shutdown ( gop_connection.descriptor [ 0 ], SHUT_RDWR );



  }






/*

 Reboot server when it was block.

*/


 if (

     gop_about . flag . connectted

     &&

     (

       (
            strcmp ( gop_connection.how [ 1 ], ""     ) == 0
         || strcmp ( gop_connection.how [ 1 ], "Wait" ) == 0
       )

     &&

       (

       (
            strcmp ( gop_connection.how [ 2 ], ""     ) == 0
         || strcmp ( gop_connection.how [ 2 ], "Wait" ) == 0
       )

     &&

       (
            strcmp ( gop_connection.how [ 3 ], ""     ) == 0
         || strcmp ( gop_connection.how [ 3 ], "Wait" ) == 0
       )

       )

       )

    )


  {

 bool_reset = 1;

 gop_about . flag . connectted = 0;

 shutdown ( gop_connection.descriptor [ 1 ], SHUT_RDWR );





 int i;

 for  (  i = 1;  i < 4;  i ++  )


  {



 if (

         gop_connection.connection [ i ] != 0
      || gop_connection.connection [ i ] != -1

    )


  {

 shutdown ( gop_connection.connection[i], SHUT_RDWR );


  }


  }




  }





//================================================================






 if ( gop_about . flag . sound )


  {



 bool_reset = 1;

 gop_about . flag . sound  = 0;


  }




//================================================================




 if ( gop_about . flag . sound_show )

  {

 gop_about . flag . sound_show = 0;

  }

//================================================================

 if ( gop_about . flag . sound_save )

  {

 gop_about . flag . sound_save = 0;

  }

//================================================================






/*

 the time to reset

*/


 if ( bool_reset )

  {

 output_print ( "string", "Reset..." );

 usleep ( 1000000 );

  }

*/


















/*

 prepare to read them

*/


 strcpy ( target_hopes [ 1  ], "path "   );
 strcpy ( target_hopes [ 2  ], "name "   );
 strcpy ( target_hopes [ 3  ], "data "   );
 strcpy ( target_hopes [ 4  ], "backup " );

 strcpy ( target_hopes [ 5  ], "main "       );
 strcpy ( target_hopes [ 6  ], "dog "        );
 strcpy ( target_hopes [ 7  ], "show "       );
 strcpy ( target_hopes [ 8  ], "connector "  );
 strcpy ( target_hopes [ 9  ], "connectted " );
 strcpy ( target_hopes [ 10 ], "sound "      );
 strcpy ( target_hopes [ 11 ], "sound-show " );
 strcpy ( target_hopes [ 12 ], "sound-save " );

 strcpy ( target_hopes [ 13 ], "address-to "   );
 strcpy ( target_hopes [ 14 ], "port-to "      );
 strcpy ( target_hopes [ 15 ], "port-this "    );
 strcpy ( target_hopes [ 16 ], "connect-step " );
 strcpy ( target_hopes [ 17 ], "update-size "  );

 strcpy ( target_hopes [ 18 ], "sound-rate "     );
 strcpy ( target_hopes [ 19 ], "sound-channels " );
 strcpy ( target_hopes [ 20 ], "ft-N "           );














/*

 start the researching

*/


 int i;

 for (  i = 1;  i <= 20;  i ++  )


  {







/*

 find the name of configurations in the file

*/


 if   (   strstr  (  note_file, target_hopes [ i ] )  !=  NULL   )


  {








/*

 we could use a pointer

 read this line

 and return the /0








 start here

*/

 pointer_file  =  strstr ( that_file, target_hopes [ i ] );








/*

 to here

*/

 pointer_to  =  strchr ( pointer_file, '\n' )


 * pointer_to  =  '\0';










/*

 then we go ahead to copy it

*/

/*

 strcpy (  buffer_file,  strrchr ( buffer_file, ' ') + 1  );

*/




 strcpy ( result_hopes [ i ], strrchr ( pointer_file, ' ' ) + 1  );









/*

 return it

*/


 * pointer_to  =  '\0';


  }






/*

 this is for range

*/


  }















/*

 now load them

*/














/*


 path of TxL,,

 :C

 :)





 the name where we saved code

 usually is where hope saved


 so maybe blank

 and maybe don't have a code here


 check it before update 


*/



 if  (  strcmp ( gop_hopes . path_the, "" )  !=  0  )

  {

 strcpy ( gop_hopes . path_the, result_hopes [ 1 ] );

  }


 else

  {

 strcpy ( gop_hopes . path_the, "" );

  } 










/*

 where code is

 maybe blank

 so we check it before sprinkle

*/



 if  (  strcmp ( gop_hopes . name_the, "" )  !=  0  )

  {

 strcpy ( gop_hopes . name_the, result_hopes [ 2 ] );

  }


 else

  {

 strcpy ( gop_hopes . name_the, "" );

  }











/*

 name where we save resource i found in the old time

 and i like it too

*/



 if  (  strcmp ( gop_hopes . name_data, "" )  !=  0  )

  {

 strcpy ( gop_hopes . name_data,   result_hopes [ 3 ] );

  }


 else

  {

 strcpy ( gop_hopes . name_data, "" );

  }













/*

 name where we save old code

 and i like it

*/


 if  (  strcmp ( gop_hopes . name_backup, "" )  !=  0  )

  {

 strcpy ( gop_hopes . name_backup, result_hopes [ 4 ] );

  }


 else

  {

 strcpy ( gop_hopes . name_backup, "" );

  }













/*

 if this open

 it run

 and recive type in


 we may recive type in many ways

 like serial, network, iic, spi ...

*/


 if (  strcmp ( result_hopes [ 5 ], "on" ) == 0  )

  {

 gop_about . flag . main  =  1;

  }


 else

  {

 gop_about . flag . main  =  0;

  }













/*

 if this open

 dog run


 dog check them

 and show u

*/


 if  (  strcmp ( result_hopes [ 6 ], "on" ) == 0  )

  {

 gop_about . flag . dog = 1;

  }


 else

  {

 gop_about . flag . dog = 0;

  }











/*

 if it open

 dog show


 dog may show on a output surface

*/


 if  (  strcmp ( result_hopes [ 7 ], "on" ) == 0  )

  {

 gop_about . flag . show = 1;

  }


 else

  {

 gop_about . flag . show = 0;

  }














/*

 connector run

*/


 if (  strcmp ( result_hopes [ 8 ], "on" ) == 0  )


  {

 gop_about . flag . connector = 1;

  }


 else

  {

 gop_about . flag . connector = 0;

  }










/*

 connectted


 is that good use no sopi connection ?

*/


 if  (  strcmp ( result_hopes [ 9 ], "on" ) == 0  )


  {

 gop_about . flag . connectted = 1;

  }


 else

  {

 gop_about . flag . connectted = 0;

  }













/*

 if open

 sound corde


 could be opened before

 :c

*/

 if  (  strcmp ( result_hopes [ 10 ], "on" ) == 0  )

  {

 gop_about . flag . sound = 1;

  }


 else

  {

 gop_about . flag . sound = 0;

  }









/*

 if it open

 sound show

*/

 if (  strcmp ( result_hopes [ 11 ], "on" ) == 0  )

  {

 gop_about . flag . sound_show = 1;

  }


 else

  {

 gop_about . flag . sound_show = 0;

  }











/*

 if it open save sound


 may not need it, we save sound anyway

*/


/*

 if  (  strcmp ( result_hopes [ 12 ], "on" ) == 0  )


  {

 gop_about . flag . sound_save = 1;

  }


 else

  {

 gop_about . flag . sound_save = 0;

  }

*/














/*

 address it want connect



 i want use more connector

 maybe i note more address



 and maybe it find it itself

*/



 if  (  strcmp ( result_hopes [ 13 ], "" )  == 0 )

  {

 strcpy ( gop_hopes . address_to, "" );

  }


 else

  {

 strcpy ( gop_hopes . address_to, result_hopes [ 13 ] );

  }










 

/*

 port to connect


 if we note more address we note more port

 
 and maybe it find it itself

*/


 if  (  atof ( result_hopes [ 14 ] )  ==  0  )

  {

 gop_hopes . port_to  =  0;

  }


 else

  {

 gop_hopes . port_to  =  atof ( result_hopes [ 14 ] );

  }












/*

 port connectted listen


 maybe it change it itself

*/


 if  (  atof ( result_hopes [ 15 ] )  ==  0  )

  {

 gop_hopes . port_this  =  0;

  }


 else

  {

 gop_hopes . port_this  =  atof ( result_hopes [ 15 ] );

  }








/*

 sleep bettwin to connect and 

*/


 if  (  atof ( result_hopes [ 16 ] )  ==  0  )

  {

 gop_hopes . step_connection  =  0;

  }


 else

  {

 gop_hopes . step_connection  =  atof ( result_hopes [ 16 ] );

  }









    gop_configurations . size_update      = atof ( result_configurations [ 17 ] );
    gop_configurations . rate             = atof ( result_configurations [ 18 ] );
    gop_configurations . channels         = atof ( result_configurations [ 19 ] );
    gop_configurations . snake            = atof ( result_configurations [ 20 ] );





/*

 we don't need to reload others

 cause they are setted before

 but when this come, connector must be started

 we should change the range of connector

*/

//    if ( bool_reset ) {





/*

 reset not nessensary

 dog will check it

 we load this here because connector should be able to set a target instead of connect this address every time


 this load should be after the connector start

  and we could move it to be after of the dog run first circle


   so if this is the first load we don't neet load address

   if it's not we should load again


 because connector don't load address everytime cause something we give that a target


 and check reset is too slow

*/

    if (  gop_about . flag . start  ) {


        strcpy  (  gop_connections . address_ip [ 0 ], address_to  );

        gop_connections . port [ 0 ]  =  port_to ;}






/*

 print it out when we reset it

*/

//        output_print ( "string", "Done\n" );}









// ok

    return 1;}
