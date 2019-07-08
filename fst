


'''

/fst/dog/load/listen.c












/*

 won't use it


 we use dream to save it


*/






 int load_listen ()


  {









/*

 it always tell us it doing

 maybe use a interface to do this

*/


 output_print ( "string", "Load listen...\n" );













/*

 the path of the files saved

 it is  trees/*  now

*/

 char note_path [ 128 ];













/*

 It's for saving the name of the dirent

*/


 char note_name [ 128 ];






/*

 it's for saving the name of the files

*/


 char note_file [ 128 ];









/*

 it's for saving the file content

 soon we use realloc

*/

 char note_word [ 10240 ];








/*

 Prepare the path

*/


 strcpy ( note_path, gop_hopes . path_the );

 strcat ( note_path, "/" );

 strcat ( note_path, gop_hopes . name_data );











/*

 it is for counting the files

*/


 int number_step;







/*

 if is for reading the file convent

*/


 char * pointer_word;







/*

 if is for reading the file entre

*/

 char * pointer_enter;











 do


  {





/*

 changed the number of listen 
     and into a buffer

*/


 snprintf  (

             note_word,

             sizeof ( note_word ) / sizeof ( char ) - 1,

             "%d",

             number_listen

           );













/*

 Prepare the path

 TxL/trees/number/w/t.snake

*/


 strcpy ( note_name, note_path );

 strcat ( note_name, "/"         );

 strcat ( note_name, note_word );









/*

 set it one

*/

 number_listen ++;



















/*

 If this dirent is exist
 we read it

*/


 if  (  is_dirent ( note_name )  )


  {









/*

 Print it

*/


 output_print ( "string",  note_name );

 output_print ( "string", "\n"         );












/*

 Take a loop to read note  files

 ...

 Take a loop to read snake files

*/

 int w;

 for  (  w = 1;  w <= N;  w ++  )


  {










/*

 Find a place to transform
  the number of w

*/

 snprintf (
            note_word,
            sizeof ( note_word )  /  sizeof ( char ) - 1,
            "%d",
            w
          );










/*

 Prepare the file name
 TxL/trees/number/w/t.snake
                    .
*/

 strcpy ( note_file, note_name );
 strcat ( note_file, "/"       );
 strcat ( note_file, note_word );
 strcat ( note_file, ".snake"  );












/*

 if the file does not exist

 read next onr

*/

 if  (  ! is_file ( note_file )  )

  {

 continue;

  }









/*

 If it is exist

*/

 else if  (  is_file ( note_file )  )

  {







/*


 read it



 get the file

*/


 file_get ( note_file, note_word );


 number_step = 1;









/*

 Take the loop for
 read the convent
   of the file




 start here

*/

 pointer_enter = note_word;









 do


  {



/*

 set the start path


 start here

*/

 pointer_word = pointer_enter;








/*

 find the next enter

*/

 pointer_enter = strchr (  pointer_enter, '\n'  );












/*

 The last line was no enter
  so we don't need to judge did it get the pointer

*/

 if ( pointer_enter != NULL )

  {

 * pointer_enter = '\0';

  }






/*

 Tranform the convent

*/


 gop_sound . buffer_listen [ number_listen ] [ w ] [ number_step ]  =  atoi ( pointer_word );







/*

 reset it

*/


 if ( pointer_enter != NULL )


  {

 * pointer_enter = '\n';

 pointer_enter ++;

 number_step  ++;

  }






/*

 end this loop when it's no more enter

*/

  } while ( pointer_enter != NULL );




/*

 this range for file exist

*/

  }





/*

 this loop to find dirent

*/

  }






/*

 thiss loop for function

*/

  }



// end this loop when is's no more dirent

  } while ( is_dirent(buffer_name) );




    return 1;}



'''







'''

/fst/dog/load/hope.c







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



'''







'''

/fst/dog/load/symbol.c




int load_symbol () {


    output_print ( "string", "Load symbol...\n" );


// The flag of 'NEXT'

    strcpy (  gop_configurations . symbol_next,  "\n\n"                                ); 
    strcat (  gop_configurations . symbol_next,  "|\\  |  +--  \\ /  -----  B \n"      ); 
    strcat (  gop_configurations . symbol_next,  "| \\ |  |--   X     |    Y: \n"      );
    strcat (  gop_configurations . symbol_next,  "|  \\|  +--  / \\    |    gap \n\n"  );


    return 1;}


'''







'''

/fst/dog/note/save.c









 int note_save (

                 const char * that_name,
                 const char * that_words,
                 const char * target_time

                )
                
  {


  
   
   
   
/*

 Prepare

*/
   
        char     note_time [ 3 ] [ 128 ];

        char     note_path [ 128 ];
   
 struct timeval  note_time_now;


   
   
   
   
   
   
   
   
   
  
   
   


/*

 judgement the time

 i will note
  
   
   


 save the note
 
 with this time

*/
   
   
 if  (  strcmp ( target_time, "now" )  ==  0  )
 
  {
 
   

/*

 Get the  time
     this time

*/
   
   
   
 gettimeofday ( & note_time_now, NULL );

 snprintf  (  note_time [ 1 ],  sizeof ( note_time [ 1 ] ) / sizeof ( char ) - 1,  "%ld",  note_time_now . tv_sec   );
 snprintf  (  note_time [ 2 ],  sizeof ( note_time [ 2 ] ) / sizeof ( char ) - 1,  "%ld",  note_time_now . tv_usec  );

 strcat ( note_time [ 1 ], "." );
 strcat ( note_time [ 1 ], note_time [ 2 ] );
 
 
 
  }


   
   
   
   
   

 else
 
  {

      
      
/*

 Use the time got

*/
      
 strcpy ( note_time [ 1 ], target_time );
 
 
  }





   
   
   
   
   
   
/*

 Prepare the path


 make this format more beautiful
 
 and i wanna write the code exed way naemd secret
 
 after this




 the path

*/
   
   
 strcpy ( note_path, path_the  );
 strcat ( note_path, "/"       );
 strcat ( note_path, name_data );

 strcat ( note_path, "/0/"     );

   
 
/*
 
 the name
 
*/
   
 strcat ( note_path, that_name );

   
  
   
   
/*

 just name then it could be simple

*/
   
   
/*

 strcat ( note_path, ".note"   );

*/


   
   

   
   
   
   
   
/*

 Append the file

*/
   
   
 file_append ( note_path, "\n\n" );

 file_append ( note_path, note_time [ 1 ] );
 file_append ( note_path, "\n" );

 file_append ( note_path, that_words );



   
   
 return 1;
 
 
  }



'''







'''

/fst/dog/note/clear.c








 int note_clear (

                 const char * that_name,
                 const char * that_type

                )
                
  {


 char note_path [ 128 ];


   
/*

 Prepare the path

*/

 strcpy ( note_path, path_the  );
 strcat ( note_path, "/"       );
 strcat ( note_path, name_data );

 strcat ( note_path, "/0/"     );

 strcat ( note_path, that_name );
  
   
/*
 
 strcat ( note_path, ".note"   );

*/


   
   
   
   
   
   
   
/*

Mmaybe we want more

*/

   
 if  (  strcmp ( that_type, "all" )  ==  0  )
 
  {

   
/*
   
 The save the words of blank

*/
   
   
 file_save ( that_path, "" );

   
   
   
   
 return 1;
 
 
   }



   
   
 else
 
  {

   
/*

 Got a wrong type of it


 we haven't set it yted
 
 maybe i could judge it by dream
 
*/
   
   
 return 0;
 
   
  }
 
 
 
 
  }





'''







'''

/fst/dog/show/about.c









int dog_show () {


    if  (  gop_about . flag . show  ==  1  ) {





// it is good if this funtion could count the number of words

        char buffer_show [ 4096 ];

        char buffer_words [ 2048 ];
        


// there are old way

/*

        information_append (

                             buffer_information,
                             information_system,
                             information_network,
                             information_cpu,
                             information_memory,
                             information_disk,
                             information_sound,
                             information_flag
                           );
*/



// get it

        put_about ( buffer_show, gop_about );





        system ( "clear" );

        strcpy ( buffer_show, buffer_words );

        strcat ( buffer_show, "\n\n" );







        int i;

        for (  i = 0; i <= 3; i ++  ) {


            if (
                   strcmp (  gop_connection.how [ i ], "Connectted"  )  ==  0 
            ||     strcmp (  gop_connection.how [ i ], "Sopi"        )  ==  0 
               ) {




// it clean it put

/*

                strcpy ( buffer_show, "" );

                information_append (
                                     buffer_information,
                                     gop_connection.system [ i ],
                                     gop_connection.network[ i ],
                                     gop_connection.cpu    [ i ],
                                     gop_connection.memory [ i ],
                                     gop_connection.disk   [ i ],
                                     gop_connection.sound  [ i ],
                                     gop_connection.flag   [ i ]
                                   );

*/




                put_about ( buffer_words, gop_connection . about [ i ] );




                strcat ( buffer_show, buffer_words );

                strcat ( buffer_show, "\n\n" );}}



        output_print ( "string", buffer_show );}



    return 1;}



'''







'''

/fst/dog/that/about/heart.c














 struct gopi_heart

  {




/*

 wait...

*/


/*

 char symbol [ 16 ]

*/

 void *  symbol;







/*

 them could not be here


 use in cpu/rate

 and now it do it itself

*/


/*

 char name [ 16 ];

 unsigned  int  user;

 unsigned  int  nice;

 unsigned  int  system;

 unsigned  int  idle;

*/




 int  core;

 int  frequency;

 int  temperature;

 unsigned  int  rate;


  };











/*

 int clean_about_heart  (  void * that_heart  )
 
*/



 int clean_about_heart  (  gopi_heart  that_heart  )

  {




 that . about . heart . temperature  =  0;


 that . about . heart . core  =  0;


 that . about . heart . frequency  =  0;


 that . about . heart . rate  =  0;




 return 0;

  }



'''







'''

/fst/dog/that/about/voice.c



















/*

 struct gopi_sound

*/

 
 struct about_voice

  {






/*

 char symbol [ 16 ];

*/

 void * symbol;





/*

 int number_control;

 int number_capture;

 int number_playback;

*/

 void  *  about_voice . number;
 
 void * * about_voice . thing;
 
 
 
 
/*

 for numbers 128 is too long

*/

/*

 char device [ 3 ] [ 32 ] [ 16 ];

 int device_playback;

 int device_capture;

*/


  };
  
  
  
  
  
  
  
  
  
  




















/*

 int clean_about_sound ( gopi_sound that_sound )

*/



 int clean_about_voice  (  void * that_voice  )
 
  {




/*

 that_voice . number_control   =  0;

 that_voice . number_capture   =  0;

 that_voice . number_playback  =  0;

*/


/*

 * ( unsigned short ) about_voice . listen  =  0;

 * ( unsigned short ) about_voice . say  =  0;
 
*/

 * ( unsigned short ) about_voice . number;
 
 
 
/*

 that_sound . device_playback  =  0;

 that_soundn . device_cpature  =  0;

*/







/*

 int note_loop;

 int note_number;

*/

 void * that_number;


 that_number  =  malloc (  sizeof ( unsigned short )  );
 
 
 
 if  (  that_voice . number  !=  -1  )

 {
 
 
 

/*

 for (
       note_loop = 0;
       note_loop < 2;
       note_loop ++
     )

  {



 for (
       note_number  = 0;
       note_number <= 32;
       note_number ++
     )

  {

*/


 for (
 
       that_number   =  0;
	   that_number  <=  about_voice;
	   that_number  ++;
 
     )

  {


/*

 if (

      strcmp ( that_sound . device [ note_loop ] [ note_number ], "" )  ==  0

    )

  {

*/



/*

 after break first loop the second loop run again

*/



/*

 break;

  }



 else

  {

 strcpy ( that_sound . device [ note_loop ] [ note_number ], "" );

  }

*/



 strcpy  (  that_voice . thing [ that_number ],  ""  );

 free  (  that_voice . thing [ that_number ]  );
 
 
 

/*

  }
  
*/

  }







 free ( that_number );
 
 
  }







 return 0;

  }




'''







'''

/fst/dog/that/about/shadow.c





















/*

 struct gopi_disk

*/

 struct that_shadow
 
  {


/*

 char symbol [ 16 ];

*/

 void * symbol;




 unsigned long  size;

 unsigned long  available;

/*

 we note rate straitly

*/

 unsigned short  rate;

  };










/*

 int clean_about_disk ( gopi_disk that_disk )

*/

 int clean_about_shadow ( void * that_shadow )

  {


 * ( unsigned long )  that_shadow . size  =  0;

 * ( unsigned long )  that_shadow . available  =  0;

 * ( unsigned short ) that_shadow . rate  =  0;


 return 0;

  }



'''







'''

/fst/dog/that/about/memory.c


















 struct gopi_memory

  {



/*

 char symbol [ 16 ];

*/

 void * symbol;
 
 



/*

 unsigned long  total;

 unsigned long  free ;

*/

 void *  total;
 
 void *  free;
 
 
 
 



/*

 we note rate straitly

*/

/*

 unsigned long  rate;

*/

 void *  rate;
 
 
 

  };
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  



/*

 int clean_about_memory ( gopi_memory that_memory )

*/

 int clean_about_memory (  void * that_memory  )

  {
	  
	  


 *  ( unsigned long * )   that_memory . total = 0;

 *  ( unsigned long * )   that_memory . free  = 0;

 *  ( unsigned short * )  that_memory . rate  = 0;




 return 0;

  }




'''







'''

/fst/dog/that/about/sister.c







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



'''







'''

/fst/dog/that/about/mate.c









 int clean_about_mate ( gopi_about that_about )
 
 
  {
  
  

/*

 there are space used where mates pointe

 and clean them


 could be zero

*/


    if  (  that_about . number_mates  >  0  ) {




/*

 clean them, and free space

*/

        int i;

        for  (  i = 0;  i < that_about . number_mates;  i ++  ) {


            clean_about (  ( gopi_about * ) that_about . mates [ i ]  );

            free ( that_about . mates [ i ] );}






    that_about = 0;
    
    
    
 return 0;

  }



'''







'''

/fst/dog/that/dog.c







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



'''







'''

/fst/dog/that/hope.c










/*

 the flags

 used in gop_about in watchdog/information/build.h -> struct gopi_about

*/






 struct hope_dog


  {



  
  /*

 use it when it is about

*/


/*

 char symbol [ 16 ];

*/









/*

 about system

*/


 int  main;

 int  deamon;

 
 
 
 
 
 
 
/*
 
 about dog
 
*/
 
 
 int  dog;
 
 
 
 
 
 
/*

 they run after dog

*/

 int  dog_start;
 
 int  dog_show;

 
 
 
 
 
 
/*
 
 about spider
 
*/
 
 
 int  spider_male;

 int  spider_female;

 
 
 
 
 
/*

 about voice 
 
*/


 int  voice;
 
 int  voice_show;
 
 int  voice_save;


 
 
 
 
  };



'''







'''

/fst/dog/about/net/that.c







 int about_address ()

  {





 struct  ifaddrs  *  buffer_struct  =  NULL;





 void * buffer_pointer  =  NULL;

 char   buffer_address [ 128 ];

 int    number_address [ 2 ]  =  [ 0, 0 ];








/*

 use free soon

 aftr we could use symbol every step

*/


/*

 int i;

 for  (  i = 0;  i <= gop_about . network . number;  i ++   )

  {

 free  (  gop_about . network . ip [ i ]  );

  }

*/







/*

 get address tree

*/


 getifaddrs ( & buffer_struct );






 while  (  buffer_struct  !=  NULL  )

  {










/*

 this address may not gets

*/






 if (

         buffer_struct
                       -> ifa_addr

         !=  NULL

     )


  {












// IPv4


 if (

        buffer_struct
                      -> ifa_addr
                                  -> sa_family

        ==  AF_INET

    )


  {






 number_address [ 1 ] ++;




 buffer_pointer = & (

                      ( struct sockaddr_in * ) buffer_struct
                                                             ->  ifa_addr
                    )
                      -> sin_addr;



 inet_ntop (

             AF_INET,

             buffer_pointer,

             buffer_address,

             INET_ADDRSTRLEN

           );





 strcpy (

          gop_about . network . ip [  number_ip [ 1 ]  ] [ 1 ],

          buffer_struct -> ifa_name

        );


 strcpy (

          gop_about . network . ip [  number_ip [ 1 ]  ] [ 2 ],

          buffer_address

        );



  }











/*

/*

 IPv6


 use a little later

*/




 else if (

             buffer_struct
                           -> ifa_addr
                                       -> sa_family

             ==  AF_INET6

         )


 {





 number_address [ 2 ] ++;




 buffer_pointer =
                  & (
                      ( struct sockaddr_in * ) buffer_struct
                                                             -> ifa_addr
                    )
                      -> sin_addr;



 inet_ntop (

             AF_INET6,

             buffer_pointer,

             buffer_address,

             INET6_ADDRSTRLEN

           );



 strcpy (

          gop_about . network . ip [ 2 ] [  number_address [ 2 ]  ] [ 1 ],

          buffer_struct -> ifa_name

        );


 strcpy (

          gop_about . network . ip [ 2 ] [  number_address [ 2 ]  ] [ 2 ],

          buffer_address

         );



  }



*/





  }




/*

 get next one's place

*/

 buffer_struct  =  buffer_struct -> ifa_next;



  }








 gop_about . network . number  =  number_address [ 1 ];




 freeifaddrs ( buffer_struct );




 return 1;



  }















/*

 get address from ifconfig

 some linux don't have this

 maybe we could use ip link



 1 for name, 2 for address

*/




/*


 commandline_get  (  "ifconfig | grep 'Link encap' | cut -d ' ' -f1",             buffer_address [ 1 ]  );

 commandline_get  (  "ifconfig | grep 'inet addr'  | tr -s ' ' : | cut -d: -f4",  buffer_address [ 2 ]  );




/*

 it use different word

 and some could be another

*/




 if  (  strcmp ( buffer_address [ 1 ], "" )  ==  0  )

  {

 commandline_get  (  "ifconfig | grep ': '  | tr -s ' ' : | cut -d: -f1",  buffer_address [ 1 ] );

  }



 if  (  strlen ( buffer_address [ 2 ] )  <  7  )

  {

 commandline_get  (  "ifconfig | grep 'inet 地址'  | tr -s ' ' : | cut -d: -f4",  buffer_address [ 2 ]  );

  }



 if  ( strlen ( buffer_address [ 2 ] )  <  7  )

  {

 commandline_get  (  "ifconfig | grep 'inet '  | tr -s ' ' : | cut -d: -f3",  buffer_address [ 2 ]  );

  }









// for second read


 if  (  buffer_address [ 1 ] [  strlen ( buffer_address [ 1 ] ) - 1  ]  !=  '\n'  )

  {

 strcat ( buffer_address [ 1 ], "\n" );

  }




 if  (  buffer_address [ 2 ] [  strlen ( buffer_address [ 2 ] ) - 1  ]  !=  '\n'  )

  {

 strcat ( buffer_address [ 2 ], "\n" );

  }












/*

 second read


 line by line

*/







 int     number_address [ 3 ];

 char    buffer_address [ 3 ] [ 256 ];

 char * pointer_address [ 3 ];







 int i;

 for  (  i = 1;  i <= 2;  i = i + 1  )

  {





 number_address [ i ]  =  0;






// It will goes mess


 strcpy ( buffer_address [ i ], " " );

 pointer_address [ i ]  =  buffer_address [ i ];








/*

 here mess


 read it long words

*/

 while  (  strlen ( pointer_address [ i ] )  !=  0  )

  {




 number_address [ i ] ++;





 strcpy ( buffer_address [ i ], buffer_address [ i ] );



 pointer_address [ i ]  =  strstr ( buffer_address [ i ],  "\n" );





 if  (  strcmp ( pointer_address [ i ], "\n" )  !=  0  )

  {





 strcpy ( buffer_address [ i ], pointer_address [ i ] + 1 );





 * pointer_address [ i ]  =  '\0';



 pointer_address [ i ] ++;




 strcpy  (  gop_about . network . ip [  number_address [ i ]  ] [ i ],  buffer_address [ i ]  );




  }

  }


  }




 gop_about . network . number  =  number_address [ 1 ];




 return 1;

*/



'''







'''

/fst/dog/about/heart/core.c





 int about_CPU_core ()

  {








/*

 When the loop start,
   it plus one so
 the  lines can be smaller



 if we can't found

 could note it straightly

*/

 int  note_result  =  -1;










/*

 Somehow,
  there should be
 some Enter there

*/

 char  note_file  [ 10240 ]  =  "\n\n";









/*

 There's 'processor' in
 the words sometimes

*/


 char  note_target_name  [ 16 ]  =  "\nprocessor";








/*

 u should put a pointer
  to note where you've read

*/

 char * note_pointer_file  =  note_file;








/*

 Put the words in the
 Second site



 to it's place

*/

 file_get  (
             "/proc/cpuinfo",
             note_file  +  (  strlen ( note_file )  - 1  )
           );






/*

 Start the loop

*/

 while ( note_pointer_file != NULL )

  {

 note_result ++;

 note_pointer_file  =  strstr (  note_pointer_file + 1,  note_target_name  );

  }




/*

 Get the data

*/

 gop_about . cpu . cores  =  note_result;





 return 0;

  }



'''







'''

/fst/dog/about/heart/rate.c






 int about_CPU_rate ()

  {




          char note_name   [ 2 ] [ 16 ];
 unsigned int  note_user   [ 2 ] [ 16 ];
 unsigned int  note_nice   [ 2 ] [ 16 ];
 unsigned int  note_system [ 2 ] [ 16 ];
 unsigned int  note_idle   [ 2 ] [ 16 ];



 FILE *  note_file;

 char    note_words [ 1024 ];



//===============================================================
/*
 Get status for cpu here.
      the first time
*/








/*

 open it

*/

 note_file  =  fopen ( "/proc/stat", "r" );






/*

 got a line

*/

 fgets  (  note_words,  sizeof ( note_words ),  note_file  );






/*

 got its convent

*/

 sscanf (
          note_words, "%s %u %u %u %u",
                                           note_name   [ 0 ],
                                         & note_user   [ 0 ],
                                         & note_nice   [ 0 ],
                                         & note_system [ 0 ],
                                         & note_idle   [ 0 ]
           );




/*

 close file

*/

 fclose ( note_file );










/*

 Wait 0.1 second.

*/

 gop_wait ( 0.1 );












/*

 the second time








 open file

*/

 note_file  =  fopen ( "/proc/stat", "r" );





/*

 get first line

*/

 fgets  (  note_words,  sizeof ( note_words ), note_file  );




 sscanf ( note_words, "%s %u %u %u %u",
                                              note_name   [ 1 ],
                                            & note_user   [ 1 ],
                                            & note_nice   [ 1 ],
                                            & note_system [ 1 ],
                                            & note_idle   [ 1 ]


 fclose ( note_file );

//===============================================================

/*

 Calculate.

 don't know what this mean

*/

 unsigned long od, nd;
 unsigned long id, sd;

          int  note_use = 0;


               od  =  ( unsigned long ) ( note_user [ 0 ] + note_nice [ 0 ]  +  note_system [ 0 ]  +  note_ idle [ 0 ] );

               nd  =  ( unsigned long ) ( note_user [ 1 ] + note_nice [ 1 ] + note_system [ 1 ]  + note_idle [ 1 ] );


               id  =  ( unsigned long ) ( note_user [ 1 ]   - note_user [ 0 ]   );

               sd  =  ( unsigned long ) ( note_system [ 1 ] - note_system [ 0 ] );

//===============================================================



 if (  ( nd - od )  !=  0  )

 note_use  =  (  ( sd + id ) * 100  )  /  ( nd - od );

 else

 note_use = 0;





 gop_about . cpu . rate  =  note_use;



 return 0;

  }



'''







'''

/fst/dog/about/heart/that.c




int about_cpu () {

    about_CPU_rate ();
    about_CPU_temperature ();
    about_CPU_cores ();
    about_CPU_frequency ();

    return 1;}


'''







'''

/fst/dog/about/heart/temperature.c





 int about_CPU_temperature ()

  {






 char note_path_temperature [ 64 ]  =  "/sys/class/thermal/thermal_zone0/temp";

 char note_temperature [ 32 ];

 int  note_number_temperature;










/*

 some don't have it

 maybe other place

*/

 if (  ! is_file ( path_temperature )  )

  {

 gop_about . cpu . temperature  =  -1;

  }




 else

  {


 file_get ( note_path_temperature, note_temperature );


 note_number_temperature  =  atoi ( note_temperature );





 if  (  strcmp ( gop_about . system . name, "raspberrypi" )  ==  0  )

  {

 gop_about . cpu . temperature  =  ( int ) note_number_temperature / 1000;

  }





 else if  (  strcmp ( gop_about . system . name, "Orangepi" )  ==  0  )

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }




 else if  (  strcmp ( gop_about . system . name, "OrangePI" )  ==  0  )

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }

/*

 ...

*/




 else if  (  number_temperature  >  10000  )

  {

 gop_about . cpu . temperature  =  ( int ) note_number_temperature / 1000;

  }


 else

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }





  }


 return 0;

  }



'''







'''

/fst/dog/about/heart/frequency.c







 int about_CPU_frequency ()

  {




 char  note_file [ 10240 ];

 char  note_result [ 1024 ];





 file_get ( "/proc/cpuinfo", note_file );



 commandline_get ( "lscpu",  note_result );

















/*

 don't know where it is

 we try to found

*/




 if  (  strstr ( note_file, "cpu MHz" )  !=  NULL  )

  {


/*

 there it is

*/


 strcpy  (  note_file,  strstr ( note_file, "cpu MHz" )     );

 strcpy  (  note_file,  strstr ( note_file, ": "      ) + 2 );

 * strchr ( note_file, '\n' ) = '\0';


 gop_about . cpu . frequency  =  atoi ( note_file );

 }













/*

 could be other way

*/


 else if  (  strstr ( that_result, "cpu max MHz" )  !=  NULL  )

  {



 strcpy  (  note_result,  note ( note_result, "cpu max MHz" )  );

 * strchr ( note_result, '\n' ) = '\0';

 sscanf ( note_result, "%s %s %s %s", note_file, note_file, note_file, note_result );


 gop_about . cpu . frequency  =  atoi ( note_result );

  }








/*

 this show up on deepin linux

*/

 else if  (  strstr ( note_result, "CPU max MHz" )  !=  NULL  )

  {



 strcpy  (  note_result,  strstr ( note_result, "CPU max MHz" )  );

 * strchr ( note_result, '\n' ) = '\0';

 sscanf ( note_result, "%s %s %s %s", note_file, note_file, note_file, note_result );


 gop_about . cpu . frequency  =  atoi ( note_result );


  }











 else

  {



/*

 this is not same like hz

 could very small

 on termux

*/

 if  (  strstr ( note_file, "BogoMIPS" )  != NULL  )

  {


 strcpy ( note_file, strstr ( note_file,  "BogoMIPS") );

 strcpy ( that_file, strstr ( that_file,  ": "      ) + 2 );

 * strchr ( note_file,  '\n' ) = '\0';


 gop_about . cpu . frequency  =  atoi ( noet_file );

  }




 else if  (  strstr ( note_file, "Bogomips" )  !=  NULL  )

  {


 strcpy ( note_file, strstr ( note_file,   "Bogomips" ) );

 strcpy ( note_file, strstr ( note_file, ": " ) + 2 );

 * strchr ( note_file, '\n' ) = '\0';


 gop_about . cpu . frequency  =  atoi ( note_file );

  }




/*

 this round for else

*/

  }





 return 0;

  }



'''







'''

/fst/dog/about/voice/alsa.c










int about_voice ()


  {








/*

 when reading

 clean them

*/

 that . about . voice . number_control  =  0;
 that . about . voice . number_capture  =  0;
 that . about . voice . number_playback =  0;










 DIR           * buffer_dirent;
 struct dirent * pointer_dirent;




// to note number


 int number_control   =  0;
 int number_capture   =  0;
 int number_playback  =  0;




    char buffer_name [ 16 ]  =  " \0";
    char buffer_id [ 16 ]    =  " \0";



    char buffer [ 3 ] [ 8 ];









    buffer_dirent  =  opendir ( "/dev/snd" );

    pointer_dirent =  readdir ( buffer_dirent );









    while (

              (  pointer_dirent  =  readdir ( buffer_dirent )  )  !=  NULL

          ) {




/*

 get name


 this could be control, pcm, hw ...

*/



        strcpy  (  buffer_name,  pointer_dirent -> d_name  );









        if  (  strstr ( buffer_name, "control" )  ==  buffer_name  ) {



// if it is a control device

            number_control ++;}









        else if  (  strstr ( buffer_name, "pcm" )  ==  buffer_name  ) {



// if it is a pcm device


           strcpy  (  buffer_name,  strstr ( buffer_name, "pcm") + 3  );




           if  (  buffer_name [ strlen ( buffer_name ) - 1 ]  ==  'c'  ) {

// if it is a pcm corde divice

               number_capture++;






// get the first number

               strcpy  (  buffer_name,  strchr ( buffer_name, 'C' ) + 1  );

             * strchr ( buffer_name, 'D' ) = '\0';

               strcpy ( buffer [ 1 ], buffer_name );


// return it

               buffer_name [ strlen ( buffer_name ) ]  =  'D';





// get the second number

               strcpy  (  buffer_name,  strchr ( buffer_name, 'D' ) + 1  );

               buffer_name [ strlen ( buffer_name ) - 1 ]  =  '\0';  

               strcpy ( buffer [ 2 ], buffer_name );



               strcpy ( buffer_id, "hw:"        );
               strcat ( buffer_id, buffer [ 1 ] ); 
               strcat ( buffer_id, ","          );
               strcat ( buffer_id, buffer [ 2 ] );


               strcpy ( gop_about . sound . device [ 1 ] [ number_capture ], buffer_id);}






// could be playback

           else if  (  buffer_name [ strlen ( buffer_name ) - 1 ]  ==  'p'  ) {



               number_playback ++;




// load first number

               strcpy ( buffer_name, strchr ( buffer_name, 'C' ) + 1 );

             * strchr ( buffer_name, 'D' ) = '\0';

               strcpy ( buffer [ 1 ], buffer_name );


// return the enter

               buffer_name [ strlen ( buffer_name ) ]  =  'D';


               strcpy  (  buffer_name, strchr ( buffer_name, 'D' ) + 1 );

                       buffer_name [ strlen ( buffer_name ) - 1 ]  =  '\0';  

               strcpy ( buffer [ 2 ], buffer_name );






               strcpy ( buffer_id, "hw:" );

               strcat ( buffer_id, buffer [ 1 ] ); 

               strcat ( buffer_id, "," );

               strcat ( buffer_id, buffer [ 2 ] );



               strcpy ( gop_about . sound . device [ 2 ] [ number_playback ], buffer_id );}}}





    closedir ( buffer_dirent );




    gop_about . sound . number_control   =  number_control;
    gop_about . sound . number_capture   =  number_capture;
    gop_about . sound . number_playback  =  number_playback;



    return 1;}



'''







'''

/fst/dog/about/memory/that.c







 int about_memory ()


  {




/*

 open the file about memory


 stm32 and arduino don't have this

 so them should do another thing


 so this should be after we know its system and name

 so we watch the name and system



 maybe a small command line for arduino & stm

*/



 FILE *  that_file  =  fopen  (  "/proc/meminfo",  "r"  );



 char buffer_result [ 1024 ];

 char buffer_name [ 32 ];






/*

 read the first line

 avalable: ? kb

*/

 fgets  (  buffer_result,  sizeof ( buffer_result ),  that_file  );

 sscanf (  buffer_result,  "%s %lu %s",  buffer_name, & gop_about . memory . total,  buffer_name );





/*

 read the second line

*/


 fgets  (  buffer_result,  sizeof ( buffer_result ),  that_file  );

 sscanf (  buffer_result,  "%s %lu",  buffer_name,  & gop_about . memory . free  );







 fclose ( that_file );



 return 1;}



'''







'''

/fst/dog/about/shadow/that.c






int about_disk () {

/*

 this take wrong when we used on termux

   so sometimes we don't read it

*/







    char   file_commandline [ 2048 ];








// to save the name of option


    char buffer_name      [ 16 ];

    char buffer_size      [ 16 ];

    char buffer_used      [ 16 ];

    char buffer_available [ 16 ];

    char buffer_rate      [ 16 ];

    char buffer_path      [ 16 ];











/*

 it's different on some Linux system,

 we find a way to do this

*/







    if (  strcmp ( gop_about . system . name, "localhost" )  == 0  ) {





/*

 on termux, the permisson is different

 things are different with this

*/



        gop_about . disk . size       =  -1;
        gop_about . disk . available  =  0;


        return 1;}












// things usually like this



    else {



// get the lable of disk space


        commandline_get ( "df", file_commandline );










/*

 use a loop

 to found the path it hope

*/






        if (  strchr ( file_commandline, '\n' )  != NULL  ) {



            strcpy(

                    file_commandline,

                    strchr ( file_commandline, '\n' ) + 1

                  );



// this always has a enter at last

           *strchr ( file_commandline, '\n' ) = '\0';





            sscanf (

                     file_commandline, "%s %s %s %s",

                     buffer_name,

                     buffer_size,

                     buffer_used,

                     buffer_available,

                     buffer_rate,

                     buffer_path

                   );





            gop_about . disk . size      = atoi ( buffer_size      );
            gop_about . disk . available = atoi ( buffer_available );



            return 1;}}




/*

 something happened

*/

    return 0;}



'''







'''

/fst/dog/about/sister/name.c







 int about_sister_name ()



  {







 char that_result [ 128 ];







 commandline_get  (  "uname -n",  that_result  );






 * strchr  (  that_result,  '\n'  )   =   '\0';





 strcpy  (  gop_about . sister . name,  that_result  );






 return 1;




  }



'''







'''

/fst/dog/about/sister/that.c







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



'''







'''

/fst/dog/check/update.c




int check_update() {

    char    buffer_path[65];
    char    buffer_commandline[65];

    strcpy(buffer_path,        path_the);
    strcat(buffer_path,        "/");
    strcat(buffer_path,        "downloads");

    strcpy(buffer_commandline, "rm -rf ");
    strcat(buffer_commandline, buffer_path);


    if ( is_dirent(buffer_path) ) {

        commandline_get(buffer_commandline, buffer_path);}

    return 1;}


'''







'''

/fst/dog/check/network.c


















 int check_network ()

  {




/*

 this function is to check network going,

   maybe i should put them into the file named network/build.h



 and yes








 Get the time for comparing

*/


 time_t  time_now  =  time ( NULL );

















/*

 if it's a new startting

  the time note zero


   so something goes wrong

  and we fix it

*/


 int i;

 for (  i = 0;  i <= 3; i ++  )

  {





/*

 if it is a new site, time flag is zero

*/

 if (  gop_connection . time [ i ]  == 0  )




  {


/*

 clean them

 give them a value

*/

 gop_connection . time [ i ] = time_now;

  }






  }



















/*

 check them  1 by 1

*/


 for (  i = 0; i <= 4; i ++  )

  {



/*

 p.s

 4th  is time number and connection descriptor

 for connectted to smile

*/







/*

 check the time out

   and reconnect by speed, return the connect not by configuration

 if for first 0-3



 and it's different for 4

  it is to note smile things

*/

 if (  i < 4  )


  {













/*

 if connection is available,

 check the time of last connectting.


 clean them when it's stop over 9 seconeds

 (  it's 3 seconds at the beginning, and we changed it  )


 and make sure it's not a new starting waitting site




 if they doesn't move over 9 secend, and are connecttd

 this time could be not conectted

 we do something



 and sometimes the connection does not finish

 and another went away


 and it could be stack



  we should let it go

 and this may be more quick than cleaning all of this

*/














 if (

      strcmp ( gop_connection . how [ i ], "Wait" )  != 0
 &&   strcmp ( gop_connection . how [ i ], ""     )  != 0

    )

  {


/*

 if it isn't keep talking

*/
















/*

 3 seconds for  recive / send  waitting

 9 seconds for doesn't connect

*/




 if  (

       time_now - gop_connection . time [ i ]  >=  3
 &&    time_now - gop_connection . time [ i ]  <   9

     )

  {




/*

 check

 is the connection still running but another not ?


 this is better to short than connection running, 3 seconds may be ok

*/


 if (  gop_connection . connection [ i ]  >  0  )

  {



/*

 it is still  send / recive

 ...


 after close the connection it return -1 and turn to end of round there

*/

 close ( gop_connection . connection [ i ] );



  }




/*

 this round for if

*/

  }




















/*

 if they are not connectted any more

 we should clean them

*/

 else if  (  time_now - gop_connection . time [ i ]  >=  9  )

  {





/*

 prepare to note this

*/

 char note_buffer [ 32 ];





/*

 clean all about this

*/

 clean_connection ( i, "all" );






/*

 it's two way betwin   connector and connectted

 to note



 and this is connector's

*/

 if (  i == 0  )

  {





/*

 print it out


 two for once

*/

/*

 output_print ( "string", "connector close with " );

 output_print ( "string",  gop_connection . address_ip [ 0 ] );

 output_print ( "string", "\n" );

*/



/*

 save the note

*/

 strcpy ( note_buffer,   "connectting close with " );

 strcat ( note_buffer,    gop_connection . address_ip [ 0 ] );


 note_save ( "connector", note_buffer, "now" );



 strcat ( note_buffer, "\n" );

 output_print ( "string", note_buffer );

  }








/*

 the way for connecteed

*/

 else {








/*

 note connectted note

 print out

*/

/*

 output_print ( "string", "connectted close with  " );

 output_print ( "string",  gop_connection . address_ip [ i ] );

 output_print ( "string", "\n" );

*/


/*

 prepare to note

*/

 strcpy ( note_buffer,  "connectted close with " );

 strcat ( note_buffer, gop_connection . address_ip [ i ] );



/*

 save it

*/

 note_save ( "connectted", note_buffer, "now" );



 strcat ( note_buffer, "\n" );

 output_print ( "string", note_buffer );



/*

 for if about its site

*/

  }











/*

 for if its connection time

*/

  }








/*

 this round is for if it is connectting

*/

  }




















/*

 reconnect to the high speed one


 this is good

 cause connectted by several

  make this slow

  the highspeed to do this, make them connect stable

 make them faster, make it good


 faster be faster




 and

 They are high speed board i used

   do not need this for now

  may restart it in the mind of trees plan


  maybe now

*/


 if (

      strcmp ( gop_connection . how [ i ],          "Connectted" )  == 0

 &&   strcmp ( gop_connection . information [ i ],  ""           )  != 0


    )


  {




/*

 since i used information trees i used them straightly

 instead of read the information here

*/


/*

 char *  note_pointer;

 char    note_buffer [ 1024 ];


 int   note_cores;

 int   note_frequency;




 strcpy (
          note_buffer,
          strstr (
                   strstr ( gop_connection . information [ i ], "CPU CORES" ),
                   ":"
                 ) + 1
        );

 * strchr ( note_buffer, '\n') = '\0';

 note_cores = atoi ( note_buffer );




 strcpy (
          note_buffer,
          strstr (
                   strstr( gop_connection . information [ i ], "CPU FREQUENCY" ),
                   ":"
                 ) + 1
        );

 * strchr ( note_buffer, '\n' ) = '\0';

 note_frequency = atoi ( note_buffer );

*/











/*

 compare them


 at the beginning, we let them change site

 when quicker is quicker more than 2 times

  but now we let it quicker more any one little



 if the one is blank we don't need to reset it

*/



 if (

      gop_network . about . cpu . cores  *  gop_network . about . cpu . frequency

  >             gop_about . cpu . cores  *            gop_about . cpu . frequency

    )

  {




/*

 reconnect for bigger speed

*/

 clean_connection( 0, "all" );











/*

 if we connect to ourself in the configuration

 we dont let it connect to us again

 then we are going to connect them

 make a loop


 so we let it connect itself



    _________
   /         \
   |         v

   we        mate

   ^          |       ( loop )
   |__________|

*/




 char buffer_ip [ 32 ];


/*

 by default, we want it connect to what we connect

*/

 strcpy (  buffer_ip, gop_connection . address_ip [ 0 ]  );







/*

 compare it with address here

 if it is a address here, we change the plan

 and let it connect to itself

*/


 int ii;

 for (
       ii  = 1;
       ii <= gop_about . network . ip_number;
       ii ++
     )

  {


 if (

      strcmp ( note_ip, gop_about . network . ip [ ii ] [ 2 ] ) == 0

    )

  {





/*

 the connector connect  our address, don't send it

 send the address itself

*/

 strcpy ( note_ip, gop_connection . address_ip [ i ] );

 break;



/*

 this round for for

*/

  }





/*

 this round for if

*/

  }







/*

 prepare the message

*/



 char * note_print;

 int * note_print_lenth;


 note_print_lenth = malloc ( sizeof ( int ) );



 * note_print_lenth  = strlen ( "smile to bigger : " );

 * note_print_lenth += strlen ( note_ip );

 * note_print_lenth += 1;




 note_print = malloc ( * note_print_lenth );



 strcpy ( note_print, "smile to bigger : " );

 strcat ( note_print, note_ip );

 strcat ( note_print, "\n" );


 output_print ( "string", note_print );



 free ( note_print_lenth );

 free ( note_print );


/*

 output_print ( "string", "smile to bigger : " );

 output_print ( "string",  buffer_ip );

 output_print ( "string", "\n" );

*/












 char note_command [ 32 ];

 strcpy ( note_command, "Smile." );

 strcat ( note_command, "\n" );

 strcat ( note_command, note_ip );



/*

 and the port
 ...



 why we fresh the time note

*/

 gop_connection . time [ 0 ] = time ( NULL );



/*

 load the message we will send

*/


 strcpy ( gop_connection . command [ i ], note_command );





/*

 connect to this bigger

*/

 strcpy ( gop_connection . address_ip [ 0 ], gop_connection . address_ip [ i ] );





/*

 for if cpu

*/

  }






/*

 for sub-check

*/

  }



















/*

 if we let it connect some addrees

 by some way without configuration before


 this usually be a special thing

 we let it come back when it don't connect it anymore


 not for smile this relation

*/

 if (

      strcmp ( gop_connection . how [ 0 ], "Wait" )  == 0


 &&   (

        strcmp (  gop_connection . address_ip [ 0 ],  gop_hope . network . address_to  ) != 0

        ||        gop_connection . port [ 0 ]    !=   gop_hope . network . port_to
      )


    )


  {





/*

 if smiled to another, not to reset it.


 If the target ip in plan

 connectting to u


 it make a loop

  u connectting to it again



 when it break the list without that ip

 and return

*/


 for (  i = 1; i <= 3; i ++  )


  {







/*

 if it smiled before

 fresh the time note

*/

 if (

      strcmp ( gop_connection . address_ip [ i ], gop_hope . network . address_to ) == 0

 &&            gop_connection . port [ i ]   ==   gop_hope . network . port_to

    )

  {




/*

 this time we don't reset it

 fresh the time..


 time symbol used by another too

 and we should be careful to use it

*/

 gop_connection . time [ 0 ]  =  time ( NULL );




/*

 this round is for if smiled

*/

  }




/*

 this round is for for all connectted

*/

  }





















/*

 if the check time of connectting

 is in 9 seconds

  & the connector doesn't get the

 ip in the plan

    return it

*/


 if (  time_now - gop_connection . time [ 0 ]  >= 9  )

  {


 output_print( "string", "connection reset.\n" );


 strcpy ( gop_connection . address_ip [ 0 ],  gop_hope . network . address_to );

          gop_connection . port [ 0 ]     =   gop_hope .  port_to;


  }




/*

 this round is for if it connect to a ip without hope

*/

  }






/*

 this round is for a site  1 - 3

*/

  }














 else if ( i == 4 )


  {



/*

 it is for smile  and  can't recive or send

*/


 if (
      time_now  -  gop_connection . time [ i ]  >=  9

 &&   gop_connection . connection [ i ]  >  0

    )

  {


/*

 let it go

*/

 close ( gop_connection . connection [ i ] );


  }














  return 0;


  }



'''







'''

/fst/dog/check/power.c




int check_power() {



    time_t time_now      = time(NULL);

    char   that_data[128];
    char   that_path[32];

           strcpy(that_path, path_the          );
           strcat(that_path, "/"               );
           strcat(that_path, name_data         );

           strcat(that_path, "/0/power.note"   );







    if ( !is_file(that_path) ) {

        file_save(that_path, "");}





    file_get( that_path, that_data );

    note_clear( "power", "all" );

    note_save(  "power", "Check power", "now" );






    if ( strcmp(that_data,   "" )  != 0 ) {

       *strchr( that_data+2, '\n' ) = '\0';



        if ( (int)time_now - atoi(that_data + 2) > 3 ) {


            note_save("command", "Power off", that_data + 2);

            note_save("server",  "Power off", that_data + 2);

            note_save("client",  "Power off", that_data + 2);

            note_save("dog",     "Power off", that_data + 2);

            note_save("corde",   "Power off", that_data + 2);


            return 1;}}


    return 0;}



'''







'''

/fst/fst






'''

/fst/dog/load/listen.c












/*

 won't use it


 we use dream to save it


*/






 int load_listen ()


  {









/*

 it always tell us it doing

 maybe use a interface to do this

*/


 output_print ( "string", "Load listen...\n" );













/*

 the path of the files saved

 it is  trees/*  now

*/

 char note_path [ 128 ];













/*

 It's for saving the name of the dirent

*/


 char note_name [ 128 ];






/*

 it's for saving the name of the files

*/


 char note_file [ 128 ];









/*

 it's for saving the file content

 soon we use realloc

*/

 char note_word [ 10240 ];








/*

 Prepare the path

*/


 strcpy ( note_path, gop_hopes . path_the );

 strcat ( note_path, "/" );

 strcat ( note_path, gop_hopes . name_data );











/*

 it is for counting the files

*/


 int number_step;







/*

 if is for reading the file convent

*/


 char * pointer_word;







/*

 if is for reading the file entre

*/

 char * pointer_enter;











 do


  {





/*

 changed the number of listen 
     and into a buffer

*/


 snprintf  (

             note_word,

             sizeof ( note_word ) / sizeof ( char ) - 1,

             "%d",

             number_listen

           );













/*

 Prepare the path

 TxL/trees/number/w/t.snake

*/


 strcpy ( note_name, note_path );

 strcat ( note_name, "/"         );

 strcat ( note_name, note_word );









/*

 set it one

*/

 number_listen ++;



















/*

 If this dirent is exist
 we read it

*/


 if  (  is_dirent ( note_name )  )


  {









/*

 Print it

*/


 output_print ( "string",  note_name );

 output_print ( "string", "\n"         );












/*

 Take a loop to read note  files

 ...

 Take a loop to read snake files

*/

 int w;

 for  (  w = 1;  w <= N;  w ++  )


  {










/*

 Find a place to transform
  the number of w

*/

 snprintf (
            note_word,
            sizeof ( note_word )  /  sizeof ( char ) - 1,
            "%d",
            w
          );










/*

 Prepare the file name
 TxL/trees/number/w/t.snake
                    .
*/

 strcpy ( note_file, note_name );
 strcat ( note_file, "/"       );
 strcat ( note_file, note_word );
 strcat ( note_file, ".snake"  );












/*

 if the file does not exist

 read next onr

*/

 if  (  ! is_file ( note_file )  )

  {

 continue;

  }









/*

 If it is exist

*/

 else if  (  is_file ( note_file )  )

  {







/*


 read it



 get the file

*/


 file_get ( note_file, note_word );


 number_step = 1;









/*

 Take the loop for
 read the convent
   of the file




 start here

*/

 pointer_enter = note_word;









 do


  {



/*

 set the start path


 start here

*/

 pointer_word = pointer_enter;








/*

 find the next enter

*/

 pointer_enter = strchr (  pointer_enter, '\n'  );












/*

 The last line was no enter
  so we don't need to judge did it get the pointer

*/

 if ( pointer_enter != NULL )

  {

 * pointer_enter = '\0';

  }






/*

 Tranform the convent

*/


 gop_sound . buffer_listen [ number_listen ] [ w ] [ number_step ]  =  atoi ( pointer_word );







/*

 reset it

*/


 if ( pointer_enter != NULL )


  {

 * pointer_enter = '\n';

 pointer_enter ++;

 number_step  ++;

  }






/*

 end this loop when it's no more enter

*/

  } while ( pointer_enter != NULL );




/*

 this range for file exist

*/

  }





/*

 this loop to find dirent

*/

  }






/*

 thiss loop for function

*/

  }



// end this loop when is's no more dirent

  } while ( is_dirent(buffer_name) );




    return 1;}



'''







'''

/fst/dog/load/hope.c







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



'''







'''

/fst/dog/load/symbol.c




int load_symbol () {


    output_print ( "string", "Load symbol...\n" );


// The flag of 'NEXT'

    strcpy (  gop_configurations . symbol_next,  "\n\n"                                ); 
    strcat (  gop_configurations . symbol_next,  "|\\  |  +--  \\ /  -----  B \n"      ); 
    strcat (  gop_configurations . symbol_next,  "| \\ |  |--   X     |    Y: \n"      );
    strcat (  gop_configurations . symbol_next,  "|  \\|  +--  / \\    |    gap \n\n"  );


    return 1;}


'''







'''

/fst/dog/note/save.c









 int note_save (

                 const char * that_name,
                 const char * that_words,
                 const char * target_time

                )
                
  {


  
   
   
   
/*

 Prepare

*/
   
        char     note_time [ 3 ] [ 128 ];

        char     note_path [ 128 ];
   
 struct timeval  note_time_now;


   
   
   
   
   
   
   
   
   
  
   
   


/*

 judgement the time

 i will note
  
   
   


 save the note
 
 with this time

*/
   
   
 if  (  strcmp ( target_time, "now" )  ==  0  )
 
  {
 
   

/*

 Get the  time
     this time

*/
   
   
   
 gettimeofday ( & note_time_now, NULL );

 snprintf  (  note_time [ 1 ],  sizeof ( note_time [ 1 ] ) / sizeof ( char ) - 1,  "%ld",  note_time_now . tv_sec   );
 snprintf  (  note_time [ 2 ],  sizeof ( note_time [ 2 ] ) / sizeof ( char ) - 1,  "%ld",  note_time_now . tv_usec  );

 strcat ( note_time [ 1 ], "." );
 strcat ( note_time [ 1 ], note_time [ 2 ] );
 
 
 
  }


   
   
   
   
   

 else
 
  {

      
      
/*

 Use the time got

*/
      
 strcpy ( note_time [ 1 ], target_time );
 
 
  }





   
   
   
   
   
   
/*

 Prepare the path


 make this format more beautiful
 
 and i wanna write the code exed way naemd secret
 
 after this




 the path

*/
   
   
 strcpy ( note_path, path_the  );
 strcat ( note_path, "/"       );
 strcat ( note_path, name_data );

 strcat ( note_path, "/0/"     );

   
 
/*
 
 the name
 
*/
   
 strcat ( note_path, that_name );

   
  
   
   
/*

 just name then it could be simple

*/
   
   
/*

 strcat ( note_path, ".note"   );

*/


   
   

   
   
   
   
   
/*

 Append the file

*/
   
   
 file_append ( note_path, "\n\n" );

 file_append ( note_path, note_time [ 1 ] );
 file_append ( note_path, "\n" );

 file_append ( note_path, that_words );



   
   
 return 1;
 
 
  }



'''







'''

/fst/dog/note/clear.c








 int note_clear (

                 const char * that_name,
                 const char * that_type

                )
                
  {


 char note_path [ 128 ];


   
/*

 Prepare the path

*/

 strcpy ( note_path, path_the  );
 strcat ( note_path, "/"       );
 strcat ( note_path, name_data );

 strcat ( note_path, "/0/"     );

 strcat ( note_path, that_name );
  
   
/*
 
 strcat ( note_path, ".note"   );

*/


   
   
   
   
   
   
   
/*

Mmaybe we want more

*/

   
 if  (  strcmp ( that_type, "all" )  ==  0  )
 
  {

   
/*
   
 The save the words of blank

*/
   
   
 file_save ( that_path, "" );

   
   
   
   
 return 1;
 
 
   }



   
   
 else
 
  {

   
/*

 Got a wrong type of it


 we haven't set it yted
 
 maybe i could judge it by dream
 
*/
   
   
 return 0;
 
   
  }
 
 
 
 
  }





'''







'''

/fst/dog/show/about.c









int dog_show () {


    if  (  gop_about . flag . show  ==  1  ) {





// it is good if this funtion could count the number of words

        char buffer_show [ 4096 ];

        char buffer_words [ 2048 ];
        


// there are old way

/*

        information_append (

                             buffer_information,
                             information_system,
                             information_network,
                             information_cpu,
                             information_memory,
                             information_disk,
                             information_sound,
                             information_flag
                           );
*/



// get it

        put_about ( buffer_show, gop_about );





        system ( "clear" );

        strcpy ( buffer_show, buffer_words );

        strcat ( buffer_show, "\n\n" );







        int i;

        for (  i = 0; i <= 3; i ++  ) {


            if (
                   strcmp (  gop_connection.how [ i ], "Connectted"  )  ==  0 
            ||     strcmp (  gop_connection.how [ i ], "Sopi"        )  ==  0 
               ) {




// it clean it put

/*

                strcpy ( buffer_show, "" );

                information_append (
                                     buffer_information,
                                     gop_connection.system [ i ],
                                     gop_connection.network[ i ],
                                     gop_connection.cpu    [ i ],
                                     gop_connection.memory [ i ],
                                     gop_connection.disk   [ i ],
                                     gop_connection.sound  [ i ],
                                     gop_connection.flag   [ i ]
                                   );

*/




                put_about ( buffer_words, gop_connection . about [ i ] );




                strcat ( buffer_show, buffer_words );

                strcat ( buffer_show, "\n\n" );}}



        output_print ( "string", buffer_show );}



    return 1;}



'''







'''

/fst/dog/that/about/heart.c














 struct gopi_heart

  {




/*

 wait...

*/


/*

 char symbol [ 16 ]

*/

 void *  symbol;







/*

 them could not be here


 use in cpu/rate

 and now it do it itself

*/


/*

 char name [ 16 ];

 unsigned  int  user;

 unsigned  int  nice;

 unsigned  int  system;

 unsigned  int  idle;

*/




 int  core;

 int  frequency;

 int  temperature;

 unsigned  int  rate;


  };











/*

 int clean_about_heart  (  void * that_heart  )
 
*/



 int clean_about_heart  (  gopi_heart  that_heart  )

  {




 that . about . heart . temperature  =  0;


 that . about . heart . core  =  0;


 that . about . heart . frequency  =  0;


 that . about . heart . rate  =  0;




 return 0;

  }



'''







'''

/fst/dog/that/about/voice.c



















/*

 struct gopi_sound

*/

 
 struct about_voice

  {






/*

 char symbol [ 16 ];

*/

 void * symbol;





/*

 int number_control;

 int number_capture;

 int number_playback;

*/

 void  *  about_voice . number;
 
 void * * about_voice . thing;
 
 
 
 
/*

 for numbers 128 is too long

*/

/*

 char device [ 3 ] [ 32 ] [ 16 ];

 int device_playback;

 int device_capture;

*/


  };
  
  
  
  
  
  
  
  
  
  




















/*

 int clean_about_sound ( gopi_sound that_sound )

*/



 int clean_about_voice  (  void * that_voice  )
 
  {




/*

 that_voice . number_control   =  0;

 that_voice . number_capture   =  0;

 that_voice . number_playback  =  0;

*/


/*

 * ( unsigned short ) about_voice . listen  =  0;

 * ( unsigned short ) about_voice . say  =  0;
 
*/

 * ( unsigned short ) about_voice . number;
 
 
 
/*

 that_sound . device_playback  =  0;

 that_soundn . device_cpature  =  0;

*/







/*

 int note_loop;

 int note_number;

*/

 void * that_number;


 that_number  =  malloc (  sizeof ( unsigned short )  );
 
 
 
 if  (  that_voice . number  !=  -1  )

 {
 
 
 

/*

 for (
       note_loop = 0;
       note_loop < 2;
       note_loop ++
     )

  {



 for (
       note_number  = 0;
       note_number <= 32;
       note_number ++
     )

  {

*/


 for (
 
       that_number   =  0;
	   that_number  <=  about_voice;
	   that_number  ++;
 
     )

  {


/*

 if (

      strcmp ( that_sound . device [ note_loop ] [ note_number ], "" )  ==  0

    )

  {

*/



/*

 after break first loop the second loop run again

*/



/*

 break;

  }



 else

  {

 strcpy ( that_sound . device [ note_loop ] [ note_number ], "" );

  }

*/



 strcpy  (  that_voice . thing [ that_number ],  ""  );

 free  (  that_voice . thing [ that_number ]  );
 
 
 

/*

  }
  
*/

  }







 free ( that_number );
 
 
  }







 return 0;

  }




'''







'''

/fst/dog/that/about/shadow.c





















/*

 struct gopi_disk

*/

 struct that_shadow
 
  {


/*

 char symbol [ 16 ];

*/

 void * symbol;




 unsigned long  size;

 unsigned long  available;

/*

 we note rate straitly

*/

 unsigned short  rate;

  };










/*

 int clean_about_disk ( gopi_disk that_disk )

*/

 int clean_about_shadow ( void * that_shadow )

  {


 * ( unsigned long )  that_shadow . size  =  0;

 * ( unsigned long )  that_shadow . available  =  0;

 * ( unsigned short ) that_shadow . rate  =  0;


 return 0;

  }



'''







'''

/fst/dog/that/about/memory.c


















 struct gopi_memory

  {



/*

 char symbol [ 16 ];

*/

 void * symbol;
 
 



/*

 unsigned long  total;

 unsigned long  free ;

*/

 void *  total;
 
 void *  free;
 
 
 
 



/*

 we note rate straitly

*/

/*

 unsigned long  rate;

*/

 void *  rate;
 
 
 

  };
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  



/*

 int clean_about_memory ( gopi_memory that_memory )

*/

 int clean_about_memory (  void * that_memory  )

  {
	  
	  


 *  ( unsigned long * )   that_memory . total = 0;

 *  ( unsigned long * )   that_memory . free  = 0;

 *  ( unsigned short * )  that_memory . rate  = 0;




 return 0;

  }




'''







'''

/fst/dog/that/about/sister.c







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



'''







'''

/fst/dog/that/about/mate.c









 int clean_about_mate ( gopi_about that_about )
 
 
  {
  
  

/*

 there are space used where mates pointe

 and clean them


 could be zero

*/


    if  (  that_about . number_mates  >  0  ) {




/*

 clean them, and free space

*/

        int i;

        for  (  i = 0;  i < that_about . number_mates;  i ++  ) {


            clean_about (  ( gopi_about * ) that_about . mates [ i ]  );

            free ( that_about . mates [ i ] );}






    that_about = 0;
    
    
    
 return 0;

  }



'''







'''

/fst/dog/that/dog.c







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



'''







'''

/fst/dog/that/hope.c










/*

 the flags

 used in gop_about in watchdog/information/build.h -> struct gopi_about

*/






 struct hope_dog


  {



  
  /*

 use it when it is about

*/


/*

 char symbol [ 16 ];

*/









/*

 about system

*/


 int  main;

 int  deamon;

 
 
 
 
 
 
 
/*
 
 about dog
 
*/
 
 
 int  dog;
 
 
 
 
 
 
/*

 they run after dog

*/

 int  dog_start;
 
 int  dog_show;

 
 
 
 
 
 
/*
 
 about spider
 
*/
 
 
 int  spider_male;

 int  spider_female;

 
 
 
 
 
/*

 about voice 
 
*/


 int  voice;
 
 int  voice_show;
 
 int  voice_save;


 
 
 
 
  };



'''







'''

/fst/dog/about/net/that.c







 int about_address ()

  {





 struct  ifaddrs  *  buffer_struct  =  NULL;





 void * buffer_pointer  =  NULL;

 char   buffer_address [ 128 ];

 int    number_address [ 2 ]  =  [ 0, 0 ];








/*

 use free soon

 aftr we could use symbol every step

*/


/*

 int i;

 for  (  i = 0;  i <= gop_about . network . number;  i ++   )

  {

 free  (  gop_about . network . ip [ i ]  );

  }

*/







/*

 get address tree

*/


 getifaddrs ( & buffer_struct );






 while  (  buffer_struct  !=  NULL  )

  {










/*

 this address may not gets

*/






 if (

         buffer_struct
                       -> ifa_addr

         !=  NULL

     )


  {












// IPv4


 if (

        buffer_struct
                      -> ifa_addr
                                  -> sa_family

        ==  AF_INET

    )


  {






 number_address [ 1 ] ++;




 buffer_pointer = & (

                      ( struct sockaddr_in * ) buffer_struct
                                                             ->  ifa_addr
                    )
                      -> sin_addr;



 inet_ntop (

             AF_INET,

             buffer_pointer,

             buffer_address,

             INET_ADDRSTRLEN

           );





 strcpy (

          gop_about . network . ip [  number_ip [ 1 ]  ] [ 1 ],

          buffer_struct -> ifa_name

        );


 strcpy (

          gop_about . network . ip [  number_ip [ 1 ]  ] [ 2 ],

          buffer_address

        );



  }











/*

/*

 IPv6


 use a little later

*/




 else if (

             buffer_struct
                           -> ifa_addr
                                       -> sa_family

             ==  AF_INET6

         )


 {





 number_address [ 2 ] ++;




 buffer_pointer =
                  & (
                      ( struct sockaddr_in * ) buffer_struct
                                                             -> ifa_addr
                    )
                      -> sin_addr;



 inet_ntop (

             AF_INET6,

             buffer_pointer,

             buffer_address,

             INET6_ADDRSTRLEN

           );



 strcpy (

          gop_about . network . ip [ 2 ] [  number_address [ 2 ]  ] [ 1 ],

          buffer_struct -> ifa_name

        );


 strcpy (

          gop_about . network . ip [ 2 ] [  number_address [ 2 ]  ] [ 2 ],

          buffer_address

         );



  }



*/





  }




/*

 get next one's place

*/

 buffer_struct  =  buffer_struct -> ifa_next;



  }








 gop_about . network . number  =  number_address [ 1 ];




 freeifaddrs ( buffer_struct );




 return 1;



  }















/*

 get address from ifconfig

 some linux don't have this

 maybe we could use ip link



 1 for name, 2 for address

*/




/*


 commandline_get  (  "ifconfig | grep 'Link encap' | cut -d ' ' -f1",             buffer_address [ 1 ]  );

 commandline_get  (  "ifconfig | grep 'inet addr'  | tr -s ' ' : | cut -d: -f4",  buffer_address [ 2 ]  );




/*

 it use different word

 and some could be another

*/




 if  (  strcmp ( buffer_address [ 1 ], "" )  ==  0  )

  {

 commandline_get  (  "ifconfig | grep ': '  | tr -s ' ' : | cut -d: -f1",  buffer_address [ 1 ] );

  }



 if  (  strlen ( buffer_address [ 2 ] )  <  7  )

  {

 commandline_get  (  "ifconfig | grep 'inet 地址'  | tr -s ' ' : | cut -d: -f4",  buffer_address [ 2 ]  );

  }



 if  ( strlen ( buffer_address [ 2 ] )  <  7  )

  {

 commandline_get  (  "ifconfig | grep 'inet '  | tr -s ' ' : | cut -d: -f3",  buffer_address [ 2 ]  );

  }









// for second read


 if  (  buffer_address [ 1 ] [  strlen ( buffer_address [ 1 ] ) - 1  ]  !=  '\n'  )

  {

 strcat ( buffer_address [ 1 ], "\n" );

  }




 if  (  buffer_address [ 2 ] [  strlen ( buffer_address [ 2 ] ) - 1  ]  !=  '\n'  )

  {

 strcat ( buffer_address [ 2 ], "\n" );

  }












/*

 second read


 line by line

*/







 int     number_address [ 3 ];

 char    buffer_address [ 3 ] [ 256 ];

 char * pointer_address [ 3 ];







 int i;

 for  (  i = 1;  i <= 2;  i = i + 1  )

  {





 number_address [ i ]  =  0;






// It will goes mess


 strcpy ( buffer_address [ i ], " " );

 pointer_address [ i ]  =  buffer_address [ i ];








/*

 here mess


 read it long words

*/

 while  (  strlen ( pointer_address [ i ] )  !=  0  )

  {




 number_address [ i ] ++;





 strcpy ( buffer_address [ i ], buffer_address [ i ] );



 pointer_address [ i ]  =  strstr ( buffer_address [ i ],  "\n" );





 if  (  strcmp ( pointer_address [ i ], "\n" )  !=  0  )

  {





 strcpy ( buffer_address [ i ], pointer_address [ i ] + 1 );





 * pointer_address [ i ]  =  '\0';



 pointer_address [ i ] ++;




 strcpy  (  gop_about . network . ip [  number_address [ i ]  ] [ i ],  buffer_address [ i ]  );




  }

  }


  }




 gop_about . network . number  =  number_address [ 1 ];




 return 1;

*/



'''







'''

/fst/dog/about/heart/core.c





 int about_CPU_core ()

  {








/*

 When the loop start,
   it plus one so
 the  lines can be smaller



 if we can't found

 could note it straightly

*/

 int  note_result  =  -1;










/*

 Somehow,
  there should be
 some Enter there

*/

 char  note_file  [ 10240 ]  =  "\n\n";









/*

 There's 'processor' in
 the words sometimes

*/


 char  note_target_name  [ 16 ]  =  "\nprocessor";








/*

 u should put a pointer
  to note where you've read

*/

 char * note_pointer_file  =  note_file;








/*

 Put the words in the
 Second site



 to it's place

*/

 file_get  (
             "/proc/cpuinfo",
             note_file  +  (  strlen ( note_file )  - 1  )
           );






/*

 Start the loop

*/

 while ( note_pointer_file != NULL )

  {

 note_result ++;

 note_pointer_file  =  strstr (  note_pointer_file + 1,  note_target_name  );

  }




/*

 Get the data

*/

 gop_about . cpu . cores  =  note_result;





 return 0;

  }



'''







'''

/fst/dog/about/heart/rate.c






 int about_CPU_rate ()

  {




          char note_name   [ 2 ] [ 16 ];
 unsigned int  note_user   [ 2 ] [ 16 ];
 unsigned int  note_nice   [ 2 ] [ 16 ];
 unsigned int  note_system [ 2 ] [ 16 ];
 unsigned int  note_idle   [ 2 ] [ 16 ];



 FILE *  note_file;

 char    note_words [ 1024 ];



//===============================================================
/*
 Get status for cpu here.
      the first time
*/








/*

 open it

*/

 note_file  =  fopen ( "/proc/stat", "r" );






/*

 got a line

*/

 fgets  (  note_words,  sizeof ( note_words ),  note_file  );






/*

 got its convent

*/

 sscanf (
          note_words, "%s %u %u %u %u",
                                           note_name   [ 0 ],
                                         & note_user   [ 0 ],
                                         & note_nice   [ 0 ],
                                         & note_system [ 0 ],
                                         & note_idle   [ 0 ]
           );




/*

 close file

*/

 fclose ( note_file );










/*

 Wait 0.1 second.

*/

 gop_wait ( 0.1 );












/*

 the second time








 open file

*/

 note_file  =  fopen ( "/proc/stat", "r" );





/*

 get first line

*/

 fgets  (  note_words,  sizeof ( note_words ), note_file  );




 sscanf ( note_words, "%s %u %u %u %u",
                                              note_name   [ 1 ],
                                            & note_user   [ 1 ],
                                            & note_nice   [ 1 ],
                                            & note_system [ 1 ],
                                            & note_idle   [ 1 ]


 fclose ( note_file );

//===============================================================

/*

 Calculate.

 don't know what this mean

*/

 unsigned long od, nd;
 unsigned long id, sd;

          int  note_use = 0;


               od  =  ( unsigned long ) ( note_user [ 0 ] + note_nice [ 0 ]  +  note_system [ 0 ]  +  note_ idle [ 0 ] );

               nd  =  ( unsigned long ) ( note_user [ 1 ] + note_nice [ 1 ] + note_system [ 1 ]  + note_idle [ 1 ] );


               id  =  ( unsigned long ) ( note_user [ 1 ]   - note_user [ 0 ]   );

               sd  =  ( unsigned long ) ( note_system [ 1 ] - note_system [ 0 ] );

//===============================================================



 if (  ( nd - od )  !=  0  )

 note_use  =  (  ( sd + id ) * 100  )  /  ( nd - od );

 else

 note_use = 0;





 gop_about . cpu . rate  =  note_use;



 return 0;

  }



'''







'''

/fst/dog/about/heart/that.c




int about_cpu () {

    about_CPU_rate ();
    about_CPU_temperature ();
    about_CPU_cores ();
    about_CPU_frequency ();

    return 1;}


'''







'''

/fst/dog/about/heart/temperature.c





 int about_CPU_temperature ()

  {






 char note_path_temperature [ 64 ]  =  "/sys/class/thermal/thermal_zone0/temp";

 char note_temperature [ 32 ];

 int  note_number_temperature;










/*

 some don't have it

 maybe other place

*/

 if (  ! is_file ( path_temperature )  )

  {

 gop_about . cpu . temperature  =  -1;

  }




 else

  {


 file_get ( note_path_temperature, note_temperature );


 note_number_temperature  =  atoi ( note_temperature );





 if  (  strcmp ( gop_about . system . name, "raspberrypi" )  ==  0  )

  {

 gop_about . cpu . temperature  =  ( int ) note_number_temperature / 1000;

  }





 else if  (  strcmp ( gop_about . system . name, "Orangepi" )  ==  0  )

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }




 else if  (  strcmp ( gop_about . system . name, "OrangePI" )  ==  0  )

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }

/*

 ...

*/




 else if  (  number_temperature  >  10000  )

  {

 gop_about . cpu . temperature  =  ( int ) note_number_temperature / 1000;

  }


 else

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }





  }


 return 0;

  }



'''







'''

/fst/dog/about/heart/frequency.c







 int about_CPU_frequency ()

  {




 char  note_file [ 10240 ];

 char  note_result [ 1024 ];





 file_get ( "/proc/cpuinfo", note_file );



 commandline_get ( "lscpu",  note_result );

















/*

 don't know where it is

 we try to found

*/




 if  (  strstr ( note_file, "cpu MHz" )  !=  NULL  )

  {


/*

 there it is

*/


 strcpy  (  note_file,  strstr ( note_file, "cpu MHz" )     );

 strcpy  (  note_file,  strstr ( note_file, ": "      ) + 2 );

 * strchr ( note_file, '\n' ) = '\0';


 gop_about . cpu . frequency  =  atoi ( note_file );

 }













/*

 could be other way

*/


 else if  (  strstr ( that_result, "cpu max MHz" )  !=  NULL  )

  {



 strcpy  (  note_result,  note ( note_result, "cpu max MHz" )  );

 * strchr ( note_result, '\n' ) = '\0';

 sscanf ( note_result, "%s %s %s %s", note_file, note_file, note_file, note_result );


 gop_about . cpu . frequency  =  atoi ( note_result );

  }








/*

 this show up on deepin linux

*/

 else if  (  strstr ( note_result, "CPU max MHz" )  !=  NULL  )

  {



 strcpy  (  note_result,  strstr ( note_result, "CPU max MHz" )  );

 * strchr ( note_result, '\n' ) = '\0';

 sscanf ( note_result, "%s %s %s %s", note_file, note_file, note_file, note_result );


 gop_about . cpu . frequency  =  atoi ( note_result );


  }











 else

  {



/*

 this is not same like hz

 could very small

 on termux

*/

 if  (  strstr ( note_file, "BogoMIPS" )  != NULL  )

  {


 strcpy ( note_file, strstr ( note_file,  "BogoMIPS") );

 strcpy ( that_file, strstr ( that_file,  ": "      ) + 2 );

 * strchr ( note_file,  '\n' ) = '\0';


 gop_about . cpu . frequency  =  atoi ( noet_file );

  }




 else if  (  strstr ( note_file, "Bogomips" )  !=  NULL  )

  {


 strcpy ( note_file, strstr ( note_file,   "Bogomips" ) );

 strcpy ( note_file, strstr ( note_file, ": " ) + 2 );

 * strchr ( note_file, '\n' ) = '\0';


 gop_about . cpu . frequency  =  atoi ( note_file );

  }




/*

 this round for else

*/

  }





 return 0;

  }



'''







'''

/fst/dog/about/voice/alsa.c










int about_voice ()


  {








/*

 when reading

 clean them

*/

 that . about . voice . number_control  =  0;
 that . about . voice . number_capture  =  0;
 that . about . voice . number_playback =  0;










 DIR           * buffer_dirent;
 struct dirent * pointer_dirent;




// to note number


 int number_control   =  0;
 int number_capture   =  0;
 int number_playback  =  0;




    char buffer_name [ 16 ]  =  " \0";
    char buffer_id [ 16 ]    =  " \0";



    char buffer [ 3 ] [ 8 ];









    buffer_dirent  =  opendir ( "/dev/snd" );

    pointer_dirent =  readdir ( buffer_dirent );









    while (

              (  pointer_dirent  =  readdir ( buffer_dirent )  )  !=  NULL

          ) {




/*

 get name


 this could be control, pcm, hw ...

*/



        strcpy  (  buffer_name,  pointer_dirent -> d_name  );









        if  (  strstr ( buffer_name, "control" )  ==  buffer_name  ) {



// if it is a control device

            number_control ++;}









        else if  (  strstr ( buffer_name, "pcm" )  ==  buffer_name  ) {



// if it is a pcm device


           strcpy  (  buffer_name,  strstr ( buffer_name, "pcm") + 3  );




           if  (  buffer_name [ strlen ( buffer_name ) - 1 ]  ==  'c'  ) {

// if it is a pcm corde divice

               number_capture++;






// get the first number

               strcpy  (  buffer_name,  strchr ( buffer_name, 'C' ) + 1  );

             * strchr ( buffer_name, 'D' ) = '\0';

               strcpy ( buffer [ 1 ], buffer_name );


// return it

               buffer_name [ strlen ( buffer_name ) ]  =  'D';





// get the second number

               strcpy  (  buffer_name,  strchr ( buffer_name, 'D' ) + 1  );

               buffer_name [ strlen ( buffer_name ) - 1 ]  =  '\0';  

               strcpy ( buffer [ 2 ], buffer_name );



               strcpy ( buffer_id, "hw:"        );
               strcat ( buffer_id, buffer [ 1 ] ); 
               strcat ( buffer_id, ","          );
               strcat ( buffer_id, buffer [ 2 ] );


               strcpy ( gop_about . sound . device [ 1 ] [ number_capture ], buffer_id);}






// could be playback

           else if  (  buffer_name [ strlen ( buffer_name ) - 1 ]  ==  'p'  ) {



               number_playback ++;




// load first number

               strcpy ( buffer_name, strchr ( buffer_name, 'C' ) + 1 );

             * strchr ( buffer_name, 'D' ) = '\0';

               strcpy ( buffer [ 1 ], buffer_name );


// return the enter

               buffer_name [ strlen ( buffer_name ) ]  =  'D';


               strcpy  (  buffer_name, strchr ( buffer_name, 'D' ) + 1 );

                       buffer_name [ strlen ( buffer_name ) - 1 ]  =  '\0';  

               strcpy ( buffer [ 2 ], buffer_name );






               strcpy ( buffer_id, "hw:" );

               strcat ( buffer_id, buffer [ 1 ] ); 

               strcat ( buffer_id, "," );

               strcat ( buffer_id, buffer [ 2 ] );



               strcpy ( gop_about . sound . device [ 2 ] [ number_playback ], buffer_id );}}}





    closedir ( buffer_dirent );




    gop_about . sound . number_control   =  number_control;
    gop_about . sound . number_capture   =  number_capture;
    gop_about . sound . number_playback  =  number_playback;



    return 1;}



'''







'''

/fst/dog/about/memory/that.c







 int about_memory ()


  {




/*

 open the file about memory


 stm32 and arduino don't have this

 so them should do another thing


 so this should be after we know its system and name

 so we watch the name and system



 maybe a small command line for arduino & stm

*/



 FILE *  that_file  =  fopen  (  "/proc/meminfo",  "r"  );



 char buffer_result [ 1024 ];

 char buffer_name [ 32 ];






/*

 read the first line

 avalable: ? kb

*/

 fgets  (  buffer_result,  sizeof ( buffer_result ),  that_file  );

 sscanf (  buffer_result,  "%s %lu %s",  buffer_name, & gop_about . memory . total,  buffer_name );





/*

 read the second line

*/


 fgets  (  buffer_result,  sizeof ( buffer_result ),  that_file  );

 sscanf (  buffer_result,  "%s %lu",  buffer_name,  & gop_about . memory . free  );







 fclose ( that_file );



 return 1;}



'''







'''

/fst/dog/about/shadow/that.c






int about_disk () {

/*

 this take wrong when we used on termux

   so sometimes we don't read it

*/







    char   file_commandline [ 2048 ];








// to save the name of option


    char buffer_name      [ 16 ];

    char buffer_size      [ 16 ];

    char buffer_used      [ 16 ];

    char buffer_available [ 16 ];

    char buffer_rate      [ 16 ];

    char buffer_path      [ 16 ];











/*

 it's different on some Linux system,

 we find a way to do this

*/







    if (  strcmp ( gop_about . system . name, "localhost" )  == 0  ) {





/*

 on termux, the permisson is different

 things are different with this

*/



        gop_about . disk . size       =  -1;
        gop_about . disk . available  =  0;


        return 1;}












// things usually like this



    else {



// get the lable of disk space


        commandline_get ( "df", file_commandline );










/*

 use a loop

 to found the path it hope

*/






        if (  strchr ( file_commandline, '\n' )  != NULL  ) {



            strcpy(

                    file_commandline,

                    strchr ( file_commandline, '\n' ) + 1

                  );



// this always has a enter at last

           *strchr ( file_commandline, '\n' ) = '\0';





            sscanf (

                     file_commandline, "%s %s %s %s",

                     buffer_name,

                     buffer_size,

                     buffer_used,

                     buffer_available,

                     buffer_rate,

                     buffer_path

                   );





            gop_about . disk . size      = atoi ( buffer_size      );
            gop_about . disk . available = atoi ( buffer_available );



            return 1;}}




/*

 something happened

*/

    return 0;}



'''







'''

/fst/dog/about/sister/name.c







 int about_sister_name ()



  {







 char that_result [ 128 ];







 commandline_get  (  "uname -n",  that_result  );






 * strchr  (  that_result,  '\n'  )   =   '\0';





 strcpy  (  gop_about . sister . name,  that_result  );






 return 1;




  }



'''







'''

/fst/dog/about/sister/that.c







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



'''







'''

/fst/dog/check/update.c




int check_update() {

    char    buffer_path[65];
    char    buffer_commandline[65];

    strcpy(buffer_path,        path_the);
    strcat(buffer_path,        "/");
    strcat(buffer_path,        "downloads");

    strcpy(buffer_commandline, "rm -rf ");
    strcat(buffer_commandline, buffer_path);


    if ( is_dirent(buffer_path) ) {

        commandline_get(buffer_commandline, buffer_path);}

    return 1;}


'''







'''

/fst/dog/check/network.c


















 int check_network ()

  {




/*

 this function is to check network going,

   maybe i should put them into the file named network/build.h



 and yes








 Get the time for comparing

*/


 time_t  time_now  =  time ( NULL );

















/*

 if it's a new startting

  the time note zero


   so something goes wrong

  and we fix it

*/


 int i;

 for (  i = 0;  i <= 3; i ++  )

  {





/*

 if it is a new site, time flag is zero

*/

 if (  gop_connection . time [ i ]  == 0  )




  {


/*

 clean them

 give them a value

*/

 gop_connection . time [ i ] = time_now;

  }






  }



















/*

 check them  1 by 1

*/


 for (  i = 0; i <= 4; i ++  )

  {



/*

 p.s

 4th  is time number and connection descriptor

 for connectted to smile

*/







/*

 check the time out

   and reconnect by speed, return the connect not by configuration

 if for first 0-3



 and it's different for 4

  it is to note smile things

*/

 if (  i < 4  )


  {













/*

 if connection is available,

 check the time of last connectting.


 clean them when it's stop over 9 seconeds

 (  it's 3 seconds at the beginning, and we changed it  )


 and make sure it's not a new starting waitting site




 if they doesn't move over 9 secend, and are connecttd

 this time could be not conectted

 we do something



 and sometimes the connection does not finish

 and another went away


 and it could be stack



  we should let it go

 and this may be more quick than cleaning all of this

*/














 if (

      strcmp ( gop_connection . how [ i ], "Wait" )  != 0
 &&   strcmp ( gop_connection . how [ i ], ""     )  != 0

    )

  {


/*

 if it isn't keep talking

*/
















/*

 3 seconds for  recive / send  waitting

 9 seconds for doesn't connect

*/




 if  (

       time_now - gop_connection . time [ i ]  >=  3
 &&    time_now - gop_connection . time [ i ]  <   9

     )

  {




/*

 check

 is the connection still running but another not ?


 this is better to short than connection running, 3 seconds may be ok

*/


 if (  gop_connection . connection [ i ]  >  0  )

  {



/*

 it is still  send / recive

 ...


 after close the connection it return -1 and turn to end of round there

*/

 close ( gop_connection . connection [ i ] );



  }




/*

 this round for if

*/

  }




















/*

 if they are not connectted any more

 we should clean them

*/

 else if  (  time_now - gop_connection . time [ i ]  >=  9  )

  {





/*

 prepare to note this

*/

 char note_buffer [ 32 ];





/*

 clean all about this

*/

 clean_connection ( i, "all" );






/*

 it's two way betwin   connector and connectted

 to note



 and this is connector's

*/

 if (  i == 0  )

  {





/*

 print it out


 two for once

*/

/*

 output_print ( "string", "connector close with " );

 output_print ( "string",  gop_connection . address_ip [ 0 ] );

 output_print ( "string", "\n" );

*/



/*

 save the note

*/

 strcpy ( note_buffer,   "connectting close with " );

 strcat ( note_buffer,    gop_connection . address_ip [ 0 ] );


 note_save ( "connector", note_buffer, "now" );



 strcat ( note_buffer, "\n" );

 output_print ( "string", note_buffer );

  }








/*

 the way for connecteed

*/

 else {








/*

 note connectted note

 print out

*/

/*

 output_print ( "string", "connectted close with  " );

 output_print ( "string",  gop_connection . address_ip [ i ] );

 output_print ( "string", "\n" );

*/


/*

 prepare to note

*/

 strcpy ( note_buffer,  "connectted close with " );

 strcat ( note_buffer, gop_connection . address_ip [ i ] );



/*

 save it

*/

 note_save ( "connectted", note_buffer, "now" );



 strcat ( note_buffer, "\n" );

 output_print ( "string", note_buffer );



/*

 for if about its site

*/

  }











/*

 for if its connection time

*/

  }








/*

 this round is for if it is connectting

*/

  }




















/*

 reconnect to the high speed one


 this is good

 cause connectted by several

  make this slow

  the highspeed to do this, make them connect stable

 make them faster, make it good


 faster be faster




 and

 They are high speed board i used

   do not need this for now

  may restart it in the mind of trees plan


  maybe now

*/


 if (

      strcmp ( gop_connection . how [ i ],          "Connectted" )  == 0

 &&   strcmp ( gop_connection . information [ i ],  ""           )  != 0


    )


  {




/*

 since i used information trees i used them straightly

 instead of read the information here

*/


/*

 char *  note_pointer;

 char    note_buffer [ 1024 ];


 int   note_cores;

 int   note_frequency;




 strcpy (
          note_buffer,
          strstr (
                   strstr ( gop_connection . information [ i ], "CPU CORES" ),
                   ":"
                 ) + 1
        );

 * strchr ( note_buffer, '\n') = '\0';

 note_cores = atoi ( note_buffer );




 strcpy (
          note_buffer,
          strstr (
                   strstr( gop_connection . information [ i ], "CPU FREQUENCY" ),
                   ":"
                 ) + 1
        );

 * strchr ( note_buffer, '\n' ) = '\0';

 note_frequency = atoi ( note_buffer );

*/











/*

 compare them


 at the beginning, we let them change site

 when quicker is quicker more than 2 times

  but now we let it quicker more any one little



 if the one is blank we don't need to reset it

*/



 if (

      gop_network . about . cpu . cores  *  gop_network . about . cpu . frequency

  >             gop_about . cpu . cores  *            gop_about . cpu . frequency

    )

  {




/*

 reconnect for bigger speed

*/

 clean_connection( 0, "all" );











/*

 if we connect to ourself in the configuration

 we dont let it connect to us again

 then we are going to connect them

 make a loop


 so we let it connect itself



    _________
   /         \
   |         v

   we        mate

   ^          |       ( loop )
   |__________|

*/




 char buffer_ip [ 32 ];


/*

 by default, we want it connect to what we connect

*/

 strcpy (  buffer_ip, gop_connection . address_ip [ 0 ]  );







/*

 compare it with address here

 if it is a address here, we change the plan

 and let it connect to itself

*/


 int ii;

 for (
       ii  = 1;
       ii <= gop_about . network . ip_number;
       ii ++
     )

  {


 if (

      strcmp ( note_ip, gop_about . network . ip [ ii ] [ 2 ] ) == 0

    )

  {





/*

 the connector connect  our address, don't send it

 send the address itself

*/

 strcpy ( note_ip, gop_connection . address_ip [ i ] );

 break;



/*

 this round for for

*/

  }





/*

 this round for if

*/

  }







/*

 prepare the message

*/



 char * note_print;

 int * note_print_lenth;


 note_print_lenth = malloc ( sizeof ( int ) );



 * note_print_lenth  = strlen ( "smile to bigger : " );

 * note_print_lenth += strlen ( note_ip );

 * note_print_lenth += 1;




 note_print = malloc ( * note_print_lenth );



 strcpy ( note_print, "smile to bigger : " );

 strcat ( note_print, note_ip );

 strcat ( note_print, "\n" );


 output_print ( "string", note_print );



 free ( note_print_lenth );

 free ( note_print );


/*

 output_print ( "string", "smile to bigger : " );

 output_print ( "string",  buffer_ip );

 output_print ( "string", "\n" );

*/












 char note_command [ 32 ];

 strcpy ( note_command, "Smile." );

 strcat ( note_command, "\n" );

 strcat ( note_command, note_ip );



/*

 and the port
 ...



 why we fresh the time note

*/

 gop_connection . time [ 0 ] = time ( NULL );



/*

 load the message we will send

*/


 strcpy ( gop_connection . command [ i ], note_command );





/*

 connect to this bigger

*/

 strcpy ( gop_connection . address_ip [ 0 ], gop_connection . address_ip [ i ] );





/*

 for if cpu

*/

  }






/*

 for sub-check

*/

  }



















/*

 if we let it connect some addrees

 by some way without configuration before


 this usually be a special thing

 we let it come back when it don't connect it anymore


 not for smile this relation

*/

 if (

      strcmp ( gop_connection . how [ 0 ], "Wait" )  == 0


 &&   (

        strcmp (  gop_connection . address_ip [ 0 ],  gop_hope . network . address_to  ) != 0

        ||        gop_connection . port [ 0 ]    !=   gop_hope . network . port_to
      )


    )


  {





/*

 if smiled to another, not to reset it.


 If the target ip in plan

 connectting to u


 it make a loop

  u connectting to it again



 when it break the list without that ip

 and return

*/


 for (  i = 1; i <= 3; i ++  )


  {







/*

 if it smiled before

 fresh the time note

*/

 if (

      strcmp ( gop_connection . address_ip [ i ], gop_hope . network . address_to ) == 0

 &&            gop_connection . port [ i ]   ==   gop_hope . network . port_to

    )

  {




/*

 this time we don't reset it

 fresh the time..


 time symbol used by another too

 and we should be careful to use it

*/

 gop_connection . time [ 0 ]  =  time ( NULL );




/*

 this round is for if smiled

*/

  }




/*

 this round is for for all connectted

*/

  }





















/*

 if the check time of connectting

 is in 9 seconds

  & the connector doesn't get the

 ip in the plan

    return it

*/


 if (  time_now - gop_connection . time [ 0 ]  >= 9  )

  {


 output_print( "string", "connection reset.\n" );


 strcpy ( gop_connection . address_ip [ 0 ],  gop_hope . network . address_to );

          gop_connection . port [ 0 ]     =   gop_hope .  port_to;


  }




/*

 this round is for if it connect to a ip without hope

*/

  }






/*

 this round is for a site  1 - 3

*/

  }














 else if ( i == 4 )


  {



/*

 it is for smile  and  can't recive or send

*/


 if (
      time_now  -  gop_connection . time [ i ]  >=  9

 &&   gop_connection . connection [ i ]  >  0

    )

  {


/*

 let it go

*/

 close ( gop_connection . connection [ i ] );


  }














  return 0;


  }



'''







'''

/fst/dog/check/power.c




int check_power() {



    time_t time_now      = time(NULL);

    char   that_data[128];
    char   that_path[32];

           strcpy(that_path, path_the          );
           strcat(that_path, "/"               );
           strcat(that_path, name_data         );

           strcat(that_path, "/0/power.note"   );







    if ( !is_file(that_path) ) {

        file_save(that_path, "");}





    file_get( that_path, that_data );

    note_clear( "power", "all" );

    note_save(  "power", "Check power", "now" );






    if ( strcmp(that_data,   "" )  != 0 ) {

       *strchr( that_data+2, '\n' ) = '\0';



        if ( (int)time_now - atoi(that_data + 2) > 3 ) {


            note_save("command", "Power off", that_data + 2);

            note_save("server",  "Power off", that_data + 2);

            note_save("client",  "Power off", that_data + 2);

            note_save("dog",     "Power off", that_data + 2);

            note_save("corde",   "Power off", that_data + 2);


            return 1;}}


    return 0;}



'''







'''







'''

/fst/sky/rain/dream,things,arduino,wet&hot,dht-eleven,溫濕傳感儀,溫濕感受儀





source from: https://blog.csdn.net/weixin_37272286/article/details/78016565





Arduino使用DHT11温湿度传感器获取环境温湿度

2017年09月18日







Arduino使用DHT11温湿度传感器获取环境温湿度

通过本文，可以了解到以下内容：

DHT11 温湿度传感器接线与使用DHT11 Arduino 测试程序编写DHT11 温湿度转换显示





DHT11 温湿度传感器接线与使用

DHT11 是一款温湿度传感器，可以用来测试环境温湿度，该传感器的的温度测量范围为 0 ~ 50°C,误差为 2 °C；湿度测量范围为在 0°C时为30%-90%RH，环境温度为 25°C时，湿度测量范围为20%-90%RH，在50°C时，测量范围是20%-80%。

DHT11 传感器接线方法并不复杂，DHT11封装有4个引脚，各个引脚说明如下：




 id   名称   注释
  
  1   VDD   供电 3-5.5 VDC
  
  2   DATA  串行数据，单总线
  
  3   NC    空脚
  
  4   GND   接地，电源负极
  
  
  
  
  
  一般从网上买的 Arduino 传感器套件版本的 DHT11，会有一个带 LED 的焊好的板，上面有三个接线引脚，分别是 VCC, GND, DATA，接线时，只要将 VCC 接到 Arduino 5V上，GND 接到 Arduino GND 上，DATA 引脚接 Arduino Pin8上即可。
  
  
  
  DHT11 Arduino 测试程序编写

DHT11 Arduino 的测试程序也很简单，主要分几个部分： 
- 引入 dht11 库 
- 设置端口 
- 检查 DHT11 是否正确连接 
- 获取 DHT11 测量数据

程序详细如下：



code : 

 // 引入 DHT 库文件 如果没有 先从网上下载好 在 Arduino 中导入
 
 #include <dht11.h>
 
 dht11 DHT11;
 
 // 设置 DHT 引脚 为 Pin 8
 
 #define DHT11PIN 8
 
 void setup () {
 
   Serial . begin ( 9600 );
   
   Serial . println ( "dht11 test program");
   
   Serial . print ( "library" );
   
   // 输出 DHT 库的版本号
   
   Serial . println ( DHT11LIB_VERSION );
   
   Serial . println ();
   
   }
   
   
   void loop () {
   
     Serial . println ( "\n" );
     
     int check  =  DHT11.read ( DHT11PIN );
     
     
     // 测试 DHT 是否正确连接
     
     Serial . print ( "Read sensor: " );
     
     
     switch  ( chk ) {
     
     
       case DHTLIB_OK:
       
         Serial . println ( "OK" );
         
         break;
         
         
       case DHTLIB_ERROR_CHECKSUM:
       
         Serial . println ( "checksum error" );
         
         break;
       
       
       case DHTLIB_ERROR_TIMEOUT:
         
         Serial . println ( "time out error" );
         
         break;
         
         
       default:
       
         Serial . println ( "unknown error" );
         
         break;
         
         }
         
         
         // 获取测量数据
         
         Serial . print ( "Humidity (%): ");
         
         Serial . println (  ( float ) DHT11 . humidity,  2  );
         
         Serial . print ( "Temperature °C): " );
         
         Serial . println (  ( float ) DHT11 . temperature,  2  );
         
         delay ( 2000 );
         
         
         
         
         
         
程序编写完成后，上传到 Arduino，重启 Arduino ，再在 Arduino IDE 的串口监视器中可以看到测量数据。






DHT11 温湿度测量数据单位转换

我们习惯常用的温度单位是摄氏度，湿度单位是百分比。但实际生产中，有可能需要用到其他的单位，以下是参考 arduino.cc 上提供的温度转换函数供参考。




// celsius to Fahrenheit conversion


 double Fahrenheit ( double celsius ) {
 
   return 1.8 * celsius + 32;
   
 }
 
 
 // fast integer version with rounding
 
  /*
 
 int Celcius2Fahrenheit ( int celcius )

 {
 
  return  ( celsius * 18 + 5 )  /  10  +  32;
  
 }
 
 */
 
 
 
 // Celsius to Kelvin conversion
 
  double Kelvin ( double celsius ) {
  
    return  celsius + 273.15;
    
  }
  
  
  // dewPoint function NOAA
  
  // reference (1) : http://wahiduddin.net/calc/density_algorithms.htm
  // reference (2) : http://www.colorado.edu/geography/weather_station/Geog_site/about.htm
  
  
  double dewPoint (  double celsius,  double humidity  ) {
  
  // (1) Saturation Vapor Pressure = ESGG ( T )
  
  double RATIO  =  373.15  /  ( 273.15 + celsius );
  
  double RHS    =  -7.90298 * ( RATIO - 1 );
  
         RHS   +=  5.02808 * log10 ( RATIO );
         
         RHS   +=  -1.3816e-7   *   (    pow  (  10,  ( 11.344 * ( 1 - 1 / RATIO )  )  )    -  1  ) ;
         
         RHS   +=  8.1328e-3    *   (    pow  (  10,  ( -3.49149 * ( RATIO - 1 )  )  )    - 1  ) ;
         
         RHS   +=  log10 ( 1013.246 );
         
         // factor -3 is to adjust units - Vapor Pressure SVP * humidity
        
        
   double VP  =  pow (  10,  RHS - 3  )  *  humidity;
   
   // (2) DEWPOINT = F(Vapor Pressure)
   
   double T  =  log ( VP / 0.61078 );
   
   // temp var return (241.88 * T) / (17.558 - T);
   
   }
   
   
   
   
   
   // delta max = 0.6544 wrt dewPoint()
   
   // 6.9 x faster than dewPoint()
   
   // reference: http://en.wikipedia.org/wiki/Dew_point
   
   
   
   double dewPointFast ( double celsius, double humidity ) {
   
     double a = 17.271;
     
     double b = 237.7;
     
     double temp  =  ( a * celsius ) / ( b + celsius ) + log ( humidity * 0.01 );
     
     double Td  =  ( b * temp )  /  ( a - temp );
     
     return Td;
     
   }
   
   
   
   
   上面的代码可以根据实际情况，将 DHT11 的测量数据带入函数进行转换即可。

小结

本文介绍了如果连接、使用 DHT11 温湿度传感器，并且介绍了 DHT11 的测试程序如何编写。另外，有一点自己在实验的时候遇到的一个小问题，就是我所使用的 UNO R3 Arduino 主板的 DIGITAL 引线排从小到大分别是 RX0 TX1 PIN2 ……，我开始没有认真看清楚，以为 RX0 TX1 之后是 Pin0，我最初设置使用的引脚是 Pin 2，因此我错误的把引线接到 Pin 3上，串口监视器一直没有信息，我以为是传感器坏了，后来更换 Pin 口，才发现了这个小失误，所以希望读者在接线的时候要注意，我之前也是因为接线错误导致一个 HC05 蓝牙模块损坏。

参考资料

温湿度传感器DHT11 
A DHT11 Class for Arduino. 
KY-015 TEMPERATURE AND HUMIDITY SENSOR MODULE 
数字温湿度传感器





'''







'''

/fst/sky/rain/dream,things,stm,rain,point,tim



stm32 定时器TIM时钟步骤

1）TIM3 时钟使能 。

RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIMx, ENABLE); //时钟使能

2） 初始化定时器参数,设置自动重装值， 分频系数，计数方式等。

定时器的初始化函数TIM_TimeBaseInit

voidTIM_TimeBaseInit(TIM_TypeDef*TIMx,
TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct); //前面指是哪个TIM，后面指TimeBaseInitStruct结构体指针。

 

TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;   //定义TIM初始化类型结构体变量

TIM_TimeBaseStructure.TIM_Period = 5000;   //设置自动重载计数周期值

TIM_TimeBaseStructure.TIM_Prescaler =7199;   //设置分频系数

TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1; //设置时钟分频因子

TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up; //设置为向上计数方式

TIM_TimeBaseInit(TIMx, &TIM_TimeBaseStructure);  //初始化时钟TIMx

3） 设置 TIM3_DIER 允许更新中断 。

void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)；
第一个参数是选择定时器号，这个容易理解，取值为 TIM1~TIM17。
第二个参数非常关键，是用来指明我们使能的定时器中断的类型，定时器中断的类型有很
多种，包括更新中断 TIM_IT_Update，触发中断 TIM_IT_Trigger，以及输入捕获中断等等。
第三个参数就很简单了， 就是失能还是使能 。

4） TIM3 中断优先级设置。 

 NVIC_InitStructure.NVIC_IRQChannel = TIM3_IRQn; //TIM3 中断
NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0; //先占优先级 0 级
NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3; //从优先级 3 级
NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //IRQ 通道被使能
NVIC_Init(&NVIC_InitStructure); //④初始化 NVIC 寄存器
TIM_Cmd(TIM3, ENABLE); //⑤使能 TIM3 

5） 允许 TIMx工作，也就是使能 TIMx。 

void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState) ;

6） 编写中断服务函数。 

 

在固件库函数里面， 用来读取中断状态寄存器的值判断中断类型的函数是：
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t) ;

固件库中清除中断标志位的函数是： 

 void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT) ;

 

例如：我们判断定时器3是否发生更新（溢出）中断，并清除中断标志位。

if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET) {

　　TIM_ClearITPendingBit(TIM3, TIM_IT_Update ); 

}

//定时器 3 中断服务程序⑥
void TIM3_IRQHandler(void) //TIM3 中断
{
if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET) //检查 TIM3 更新中断发生与否
{
TIM_ClearITPendingBit(TIM3, TIM_IT_Update ); //清除 TIM3 更新中断标志
LED1=!LED1;
}
} 

 





'''







'''

/fst/sky/rain/dream,things,stm,way




1: https://blog.csdn.net/qq_33559992/article/details/77676716
2: https://www.amobbs.com/thread-4480138-1-1.html
3: https://www.amobbs.com/forum.php?mod=viewthread&tid=4537050







 the second one

从固件库里修改了一个STM32读取内部FLASH的例程，用串口与电脑通讯，观察写入读出正常，但还有几个地方不太明白，请过来人指点。 
else语句中有一句Data--  请问有什么用？


/* Includes ------------------------------------------------------------------*/
#include "stm32f10x_lib.h" include "platform_config.h"
/* Private typedef -----------------------------------------------------------*/ typedef enum {FAILED = 0, PASSED = 
!FAILED} TestStatus; /* Private define ------------------------------------------------------------*/
#define StartAddr  ((u32)0x08008000) define EndAddr    ((u32)0x08008009)
u32 *p=(u32 *)0x08008000; /* Private macro -------------------------------------------------------------*/ /* Private 
variables ---------------------------------------------------------*/   u32 EraseCounter = 0x00, Address = 0x00; u32 
Data; vu32 NbrOfPage = 0x00; volatile FLASH_Status FLASHStatus; volatile TestStatus MemoryProgramStatus; ErrorStatus 
HSEStartUpStatus; /* Private function prototypes -----------------------------------------------*/ void 
NVIC_Configuration(void); void RCC_Configuration(void);      /* Private functions 
---------------------------------------------------------*/ 
/******************************************************************************* * Function Name  : main * Description  
  : Main program * Input          : None * Output         : None * Return         : None 
*******************************************************************************/ int main(void) {
#ifdef DEBUG
  debug();
#endif
  FLASHStatus = FLASH_COMPLETE;   MemoryProgramStatus = PASSED;   Data = 0x1111;      /* RCC Configuration */ 
  RCC_Configuration();    /* NVIC Configuration */   NVIC_Configuration();   /* Unlock the Flash Program Erase 
controller */   FLASH_Unlock();   /* Define the number of page to be erased */   NbrOfPage = (EndAddr - StartAddr) / 
FLASH_PAGE_SIZE;   /* Clear All pending flags */   FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP | FLASH_FLAG_PGERR | 
FLASH_FLAG_WRPRTERR);                       if((*(p+1)) != 0x1111)   {     /* Erase the FLASH pages */     
for(EraseCounter = 0; (EraseCounter <= NbrOfPage) && (FLASHStatus == FLASH_COMPLETE); EraseCounter++)      {      
 FLASHStatus = FLASH_ErasePage(StartAddr + (FLASH_PAGE_SIZE * EraseCounter));      }          /*  FLASH Word program of 
data 0x15041979 at addresses defined by StartAddr and EndAddr*/     Address = StartAddr;     while((Address < EndAddr) 
&& (FLASHStatus == FLASH_COMPLETE))     {     FLASHStatus = FLASH_ProgramWord(Address, Data);     Address = Address + 4; 
    }   }    else      {     Data=*p;  //before erase the Flash ,read out the data to Data          /* Erase the FLASH 
pages */     for(EraseCounter = 0; (EraseCounter <= NbrOfPage) && (FLASHStatus == FLASH_COMPLETE); EraseCounter++)     { 
      FLASHStatus = FLASH_ErasePage(StartAddr + (FLASH_PAGE_SIZE * EraseCounter));     }            Address = StartAddr; 
    while((Address < EndAddr) && (FLASHStatus == FLASH_COMPLETE))     {     FLASHStatus = FLASH_ProgramWord(Address, 
Data);         Data--;               Address = Address + 4;     }       }         while (1)   {   }
}



'''







'''

/fst/sky/rain/dream,lines,http,約








 When my android device
 send a http request
 returned


 GET / HTTP/1.1
 Host: 110.110.110.107:520
 Connection: keep-alive
 Accept-Language: zh-CN,zh,en-US,en
 Upgrade-Insecure-Requests: 1
 User-Agent: Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-T555C Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/6.4 Chrome/56.0.2924.87 Safari/537.36
 Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
 Accept-Encoding: gzip, deflate, sdch



 & when my orangepi device
   send a  http request
   that returned


 GET / HTTP/1.1
 Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
 User-Agent: Mozilla/5.0 (X11; Linux) AppleWebKit/537.36 (KHTML, like Gecko) QupZilla/1.1.6 Safari/537.36
 DNT: 1
 Accept-language: C
 Connection: Keep-Alive
 Accept-Encoding: gzip
 Host: 110.110.110.107:520

 t: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
 Accept-Encoding: gzip, deflate, sdch
 Accept-Language: zh-CN,zh;q=0.8






 There's some pieecs of commands in it below

 "GET / HTTP/1.1"
 "Accept: "                    (text/html...)
 "User-Agent: "                (Mozolla/5.0 (X11; Linux) ...)
 "Connection: "                (keep-alive)
 "Aceept-Encoding: "           (gzip...)
 "Host: "                      (ip:port)
 "Accept-Language: "           (zh-CN,zh,en-US,en...)

 "Upgrade-Insecure-Requests: " (1)
("DNT: ")                      (1)
("Accep-language: ")           (zh-CN,zh,en-US,en...)
("t: ")                        (text/html...)





 Let's try to send a requestion to a URL web





'''







'''

/fst/sky/rain/dream,starain,socket,url,套,址.c





// copy from
//
// https://blog.csdn.net/yangguo_2011/article/details/14106223#!/_y6jge7w272okkz9ljlw4mfgvi
//
//   ( warrning, be cared about network attack )
//
//
// ps. infact, i just wanna the dns function in the Linux





#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <netdb.h>
#include <string.h>
#include <fcntl.h>


int create_tcp_socket();
char *get_ip(char *host);
char *build_get_query(char *host,char *page);
void usage();


#define HOST "www.baidu.com"
#define PAGE "/"
#define PORT 80
#define USERAGENT "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36"
#define ACCEPTLANGUAGE "zh-CN,zh;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2"
#define ACCEPTENCODING "gzip,deflate,sdch"


int main(int argc,char **argv){
    struct sockaddr_in *remote;
    int sock;
    int tmpres;
    char *ip;
    char *get;
    char buf[BUFSIZ+1];
    char *host;
    char *page;


    if(argc==1){
        usage();
        exit(2);
    }
    host=argv[1];
    if(argc>2){
        page=argv[2];
    }else{
        page=PAGE;
    }
    fprintf(stdout,"page:%s,hostName:%s\n",page,host);

    sock=create_tcp_socket();

    ip=get_ip(host);

    fprintf(stderr,"IP is %s\n",ip);

    remote=(struct sockaddr_in *)malloc(sizeof(struct sockaddr_in*));

    remote->sin_family=AF_INET;





    tmpres=inet_pton(AF_INET,ip,(void *)(&(remote->sin_addr.s_addr)));






    if(tmpres<0){
        perror("Can't set remote->sin_addr.s_addr");
        exit(1);
    }else if(tmpres==0){
        fprintf(stderr,"%s is not a valid IP address\n",ip);
        exit(1);
    }



    remote->sin_port=htons(PORT);

    if(connect(sock,(struct sockaddr *)remote,sizeof(struct sockaddr))<0){
        perror("Could not connect!\n");
        exit(1);
    }
    get =build_get_query(host,page);


    fprintf(stdout,"<start>\n%s\n<end>\n",get);
    int sent=0;
    while(sent<strlen(get)){
        tmpres=send(sock,get+sent,strlen(get)-sent,0);
        if(tmpres==-1){
            perror("Can't send query!");
            exit(1);
        }
        sent+=tmpres;
    }
    memset(buf,0,sizeof(buf));
    int htmlstart=0;
    char *htmlcontent;
    while((tmpres=recv(sock,buf,BUFSIZ,0))>0){
printf("%s\n1\n2\n", buf);

        if(htmlstart==0){
            htmlcontent=strstr(buf,"\r\n\r\n");
            if(htmlcontent!=NULL){
                htmlstart=1;
                htmlcontent+=4;
            }
        }else{
            htmlcontent=buf;
        }
        if(htmlstart){
            fprintf(stdout,htmlcontent);
            printf("1\n");
        }
        memset(buf,0,tmpres);
       // fprintf(stdout,"\n\n\ntmpres Value:%d\n",tmpres);
    }
    fprintf(stdout,"receive data over!\n");
    if(tmpres<0){
        perror("Error receiving data!\n");
    }
    free(get);
    free(remote);
    free(ip);
    close(sock);
    return 0;
}





void usage(){
    fprintf(stderr,"USAGE:htmlget host [page]\n\thost:the website hostname. ex:www.baidu.com\n\tpage:the page to retrieve. ex:index.html,default:/\n");
}






int create_tcp_socket(){
    int sock;
    if((sock=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP))<0){
        perror("Can't create TCP socket!\n");
        exit(1);
    }
    return sock;
}







char *get_ip(char *host){
    struct hostent *hent;
    int iplen=15;
    char *ip=(char *)malloc(iplen+1);

    memset(ip,0,iplen+1);

    if((hent=gethostbyname(host))==NULL){
        perror("Can't get ip");
        exit(1);
    }
    if(inet_ntop(AF_INET,(void *)hent->h_addr_list[0],ip,iplen)==NULL){
        perror("Can't resolve host!\n");
        exit(1);
    }
    return ip;
}





char *build_get_query(char *host,char *page){
    char *query;
    char *getpage=page;
    char *tpl="GET %s HTTP/1.1\r\nHost:%s\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\nUser-Agent:%s\r\nAccept-Language:%s\r\n\r\n";//Accept-Encoding:%s\r\n
    query=(char *)malloc(strlen(host)+strlen(getpage)+strlen(USERAGENT)+strlen(tpl)+strlen(ACCEPTLANGUAGE)-5);//+strlen(ACCEPTENCODING)
    sprintf(query,tpl,getpage,host,USERAGENT,ACCEPTLANGUAGE);//ACCEPTENCODING
    return query;
}




'''







'''

/fst/sky/rain/dream,things,arduino,adc-speed




1: ?
2: https://www.arduino.cn/thread-12488-1-1.html





one


Arduino Uno 采样速度



首先测试一下普通的 Arduino UNO 的采样速度

// the setup routine runs once when you press reset:

void setup() {

  // initialize serial communication at 9600 bits per second:

  Serial.begin(9600);

  analogReference(INTERNAL); //调用板载1.1V基准源

}

 

void loop() {

  int i;

  float voltage;

  int sensorValue;

  unsigned long elsp=millis();

  for (i=0;i<10000;i++)

    {

      // read the input on analog pin 0:

      sensorValue = analogRead(A0);

    } 

  Serial.println(millis()-elsp);

  delay(10000);

}
 

运行结果是 1120 左右，就是说采样10000次用时1.12s，采样频率大约是 8928.57Hz (次/秒)。

找了一段代码【参考6】能够提高采样速度


// defines for setting and clearing register bits

#ifndef cbi

#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))

#endif

#ifndef sbi

#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

#endif
 

写个程序测试一下


// the setup routine runs once when you press reset:

void setup() {

  // initialize serial communication at 9600 bits per second:

  Serial.begin(9600);

  analogReference(INTERNAL); //调用板载1.1V基准源

 

// set prescale to 16

sbi(ADCSRA,ADPS2) ;

cbi(ADCSRA,ADPS1) ;

cbi(ADCSRA,ADPS0) ; 

}

 

 

void loop() {

  int i;

  float voltage;

  int sensorValue;

  unsigned long elsp=millis();

  for (i=0;i<10000;i++)

    {

      // read the input on analog pin 0:

      sensorValue = analogRead(A0);

       

    } 

  Serial.println(millis()-elsp);

  delay(10000);

}
 

运行输出结果在 170 左右，就是说采样10000次用时0.170s，采样频率大约是 58823.53Hz (次/秒)。




原理上来说Arduino 的 ADC 是用一种逐次逼近比较的方法来进行ADC转换的。通俗的说就是内部有一个比较器，每次内部升高一个电压和外部指定的Pin进行比较，根据大于小于来判定外部指定脚上的电压。资料说做这样一个比较大约需要10次，13个机器周期。而比较的频率是主控频率分频给出来的，有一个分频因子，默认是128，分频因子越小，比较的速度也就越快。


1 2 3 speed
0 0 0 2
0 0 1 2
0 1 0 4
...   128


这里只是简单说一下，如果想了解ADC具体的工作原理，请阅读参考中提到的文章。


多说两句批评一下《Arduino技术内幕》这本书，刚开始我是阅读这本书来学习Arduino ADC的，但是阅读的时候感觉一直在外面游荡，不知道是原作者不懂还是翻译的人不明白，反正这一章的介绍让我一头雾水。





参考：

1.	http://www.geek-workshop.com/thread-1848-1-1.html Arduino入门教程–第十七课–使用内部基准源进行ADC采样

2.	冷知识-这次讲ADC采样率-11月8号更新-上传高速率采样库-后续加入示波器库
http://www.geek-workshop.com/thread-11511-1-1.html

3.	http://apcmag.com/arduino-analog-to-digital-converter-how-it-works.htm/ 介绍 Arduino ADC 如何工作

4.	http://www.microsmart.co.za/technical/2014/03/01/advanced-arduino-adc/

5.	http://wenku.baidu.com/link?url=I3DA7sWeIOxPntLf89u_MO8V30InxZlEWzDu7BxsXPQlJtprgkzUsdQmIEiBPSOBrdq1_iccg-qxxkOh1ROvfz3C9vbt55Axy_f1JAFZJTq 基于Arduino的音乐频谱显示器方案概述

6.	http://forum.arduino.cc/index.php?topic=6549.0

7.	http://meettechniek.info/embedded/arduino-analog.html Arduino: Analog measurements

本条目发布于 2015 年 4 月 3 日 | 属于 Funny 分类，被贴了 Arduino 标签 | 作者是 ziv2013 |









two

雖然 Arduino 的 analogRead( ) 預設的sampling rate 理論值是 9600 Hz,
接近 10KHz,
但這是因為 Arduino 的 ADC 之  Prescaler 被設為 128,
所以假設 Arduino 的時脈(Clock)是 16MHz,
則 ADC clock = 16MHz / 128 = 125KHz;
一次 ADC 轉換要踢它13下, 就是要 13 clock (tick),
於是變成 125KHz/13 = 9600Hz
不過那只是理論值, 因為你的程序本身也要花時間,
如果你用一個 for Loop 全力一直做 analogRead(A0),
那一秒鐘也只能讀取大約 8925 次, 達不到理論值 9600次 !!
不過,
Prescaler是可以改的!
把 ADC 的 Prescaler 改為 16,
則理論的 Sample Rate 可達 16MHz / 16 / 13 = 76.8KHz
但是實測只有大約 58KHz
若 ADC 的 Prescaler 改為 8,
則理論的 Sample Rate 可達 153KHz, 但實測只有大約93.5KHz
可是一般不建議把 Prescaler 設在 16以下, 否則ADC轉換不太準

以下是測試用 Prescaler 16, 採樣頻率 大約 58KHz








//////
// speed up sampling rate -- by [email]tsaiwn@cs.nctu.edu.tw[/email]
const int pin = A0;
const int n = 1000;  // sample 採樣 1000 次
void setup() {
  Serial.begin(9600);
  //setP32( ); // Prescaler = 32
  //setP8( );   // Prescaler = 8
  setP16( );   // Prescaler = 16
  //setP128( ); // Prescaler = 128 = default
  for(int i=0; i< 543; i++) analogRead(A0); // 熱身 :-)
  Serial.println(String("Sample ") + n + " times, pin=" + pin);
  Serial.flush( );
  delay(568);
}
void loop( ) { // 
  long begt, runt, total;
  total = 0;  // clear before sampling
  begt = micros();
  for(int i=0; i< n; i++) {
     total += analogRead(pin);
  }
  runt = micros() - begt;  // elapsed time
  Serial.println(String("Average=") + total/n);
  Serial.print(String("Time per sample: ")+runt/1.0/n +"us");
  Serial.println(String(", Frequency: ")+1000000.0/runt*n +" Hz");
  delay(5566);
}// loop(
void setP32( ) {
  Serial.println("ADC Prescaler = 32");  // 101
  ADCSRA |=  (1 << ADPS2);  // 1
  ADCSRA &=  ~(1 << ADPS1);  // 0
  ADCSRA |=  (1 << ADPS0);  // 1
}
void setP16( ) {
  Serial.println("ADC Prescaler = 16");  // 100
  ADCSRA |=  (1 << ADPS2);  // 1
  ADCSRA &=  ~(1 << ADPS1);  // 0
  ADCSRA &=  ~(1 << ADPS0);  // 0
}
void setP8( ) {  // prescaler = 8
  Serial.println("ADC Prescaler = 8");  // 011
  ADCSRA &=  ~(1 << ADPS2);  // 0
  ADCSRA |=  (1 << ADPS1);  // 1
  ADCSRA |=  (1 << ADPS0);  // 1
}
void setP4( ) {  // prescaler = 4
  Serial.println("ADC Prescaler = 4");  // 010
  ADCSRA &=  ~(1 << ADPS2);  // 0
  ADCSRA |=  (1 << ADPS1);  // 1
  ADCSRA &=  ~(1 << ADPS0);  // 0
}
void setP128( ) { // 默認就是這樣
  Serial.println("ADC Prescaler = 128");  // 111
  ADCSRA |=  (1 << ADPS2);  // 1
  ADCSRA |=  (1 << ADPS1);  // 1
  ADCSRA |=  (1 << ADPS0);  // 1
} // setP128



'''







'''

/fst/sky/rain/dream,things,stm,light



使用36-pin的STM32输出VGA
手头上有个项目需要通过单片机来控制将图像显示在LCD上，在网上搜了一阵子，发现都是使用的FPGA做的，

开始自己对FPGA不是很熟，一直在用的也是ARM系列的，终于让我找到一份至少现在看起来还是含金量蛮高的资料，

因为是英文的，这边先将它翻译一下（原文链接）。

 

　　想到之前玩的一些老的视频游戏和街机游戏（很早之前，大概70/80年代左右），脑子里浮现出一个想法：

如果在今天，我们是不是可以使用成本比较低的微控制器来实现之前玩玩的那些游戏呢？

这些微控制器设计的初衷并不是用来干这些事情的，所以问题也就产生了：

如何在使用很少或者不使用外部组件的情况下向显示器输出视频信号呢？

　　我们选择了36-pin, 72 MHz的STM32 (STM32F103T8U6),

足够用于产生黑白视频信号和点信号，同时还使用了一些定时器和SPI（在这种方式下更新帧缓冲是自动完成的），

在400*200分辨率的显示器上VGA输出视频信号看起来还是比较可观的。

使用的材料：

　　1 STM32F103T8U6开发板一块（或者同类型的开发板）。我们使用的是AK-STM32-LKIT。

　　2 VGA母口一个（DB15）

　　

虽然帧缓冲区是400*200的，但是输出的分辨率却是800*600（56hz刷新频率），

我们采用把横着点绘制两次，竖着的点绘制三次的方法来达到扩展分辨率的目的。

我们选择800×600 @ 56Hz的原因是因为像素时钟；

输出分辨率使用36MHz像素时钟，周期是72MHz的倍数（STM32的频率），

因为我们需要使用SPI产生像素信号，可以把STM32的频率经过SPI预分频得到18MHz的像素时钟，

然后将每一个像素点绘制两次，具体方法是当在水平方向800像素点时输出一个信号像素，

SPI 的 MOSI信号保持低电平或者高电平两倍的时间（相比于之前绘制一个点的时间）。

帧缓冲区是一个52×200字节的数组。每一行有50*8=400个像素（每一个bit是一个像素），

剩下的两个字节（52-50）模拟每一行的消隐间隔。

#define VID_VSIZE 200
#define VID_HSIZE 50
 
__align(4) u8 fb[VID_VSIZE][VID_HSIZE+2];
在这一块ram中写入的数据都会被输出到屏幕，DMA被设置为自动从数据缓冲区读取数据并且输出到SPI的MOSI引脚。

 

水平同步 　　

水平同步信号（ horizontal synchronism signal）和后延时间（back porch time）由TIM1定时器产生的通道1和2产生，TIM1定时器产生的通道1连接到PA8。



H-SYNC也就是TIM1定时器的通道1将会产生水平同步信号给显示器。

H-BACKPORCH也就是TIM1定时器的通道2,计算水平同步时间的和以及后延时间，

这个定时器产生一个中断用于触发DMA开始通过SPI发送像素的请求。

帧缓冲里面的每一行都会重复这样的过程，

垂直同步
TIM2定时器用于产生垂直同步信号，但是实在从机模式下。

TIM2计算主机（TIM1）产生的H-SYNC脉冲数。



TIM2的通道2通过PA1输出V-SYNC信号。

TIM2的通道3将会触发一个中断当定时器的计数器达到V-SYNC的和垂直后沿时间。

这个中断会设置一个变量表明正在扫描一个有效帧并且DMA可以开始发送像素到屏幕了。



像素发生器
像素由SPI的MOSI（PA7）产生。

定时器TIM1的通道2产生一个中断用于使能DMA TX请求向SPI发送数据。

DMA将会从帧缓冲区读取一行并且将数据放到SPI的DR寄存器。

DMA被设置用来在一行信号被发送之后产生一个中断，行号是递增的。

因为我们将每一行发送了三次，我们在中断中将计数加1。

当三行数据被发送出去，我们将DMA指针指向下一行的帧缓冲。

当所有的行被发送出去，DMA被禁止直到下一个有效单的帧中断发生（TIM2通道3）。

连接
你只需要几根杜邦线和一个母口的VGA接口就可以完成这项工作了。

VGA标准说输出信号应该在0.7V到1V之间，所以你需要在线上进行分压（串联68欧姆和33欧姆的电阻要比47pF和68欧姆的并联），

我们已经测试了一系列的LCD寄存器在没有分压的情况下，工作起来还行。

引脚发参考AK-STM32-LKIT扩展板接插件，引脚命名对于所有的STM32都有效。

根据你自己所用的STM32的手册确定使用的引脚是否一致。

我们使用绿色（VGA的引脚2）来模拟旧的那种显示效果，你可以使用其他的色彩方案使用

RED/GREEN/BLUE DB15引脚，可以创建8种颜色组合。





 

结论
　　我们使用了一个低成本微处理器作为VGA控制器，实现这个目的的方法很多，但是这种方法不需要额外的组件除了一个VGA接口。

　　如果你使用的是更高级的STM32，你可以试着使用扩大缓冲区而且在DMA被禁止的时候写帧缓冲区以避免数据被割裂。

　　你可以下载 源码，在里面你可以找到画线描点等等的工具库。

　　下一篇日志中会通过VGA样例来实现视频游戏。 

Space Invaders for STM32
Using the previous VGA output project, we have created this Space Invaders version for STM32.

The source code is kept as a separated project, but uses the same engine of the VGA output project.

Click here to download the source code.

Connections

We have added three push-buttons to the original connections.

These push-buttons serve as a joystick.

Here are the connections for the push-buttons and the VGA connector:



 

 

THANK YOU for sharing you project with us.

Your project was a starting point to our project.

I used your logic, rewritten whole code, expanded to 2 output SPI,

sinhronized them in slave mode using two more timers.

One to be same as TIM1, to trigger 10Mhz timer for SPI CLK.

I did additional logic with input part and viola an adapter on a MCU.

https://www.youtube.com/watch?v=HGje7a6_1Jk

Best regards from Slovenia



#ifndef    __VIDEO_H
#define    __VIDEO_H

#include "gdptypes.h"

#define    VID_HSIZE        50        // Horizontal resolution (in bytes)
#define    VID_VSIZE        200        // Vertical resolution (in lines)

#define    VID_PIXELS_X    (VID_HSIZE * 8)
#define    VID_PIXELS_Y    VID_VSIZE
#define    VID_PIXELS_XR   (VID_PIXELS_X + 16)
#define    VID_HSIZE_R     (VID_HSIZE + 2)

//    Function definitions

void    vidInit(void);
void    vidClearScreen(void);

#endif    // __VIDEO_H




/***************************************************************************
 * STM32 VGA demo
 * Copyright (C) 2012 Artekit Italy
 * http://www.artekit.eu
 * Written by Ruben H. Meleca
 
### video.c
 
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

***************************************************************************/

#include "stm32f10x.h"
#include "video.h"

#define VTOTAL    52                            /* Total bytes to send through SPI */
__align(4) u8 fb[VID_VSIZE][VID_HSIZE+2];    /* Frame buffer */
static volatile u16 vline = 0;                /* The current line being drawn */
static volatile u32 vflag = 0;                /* When 1, the SPI DMA request can draw on the screen */
static volatile u32 vdraw = 0;                /* Used to increment vline every 3 drawn lines */ 

void TIMER_Configuration(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;
    NVIC_InitTypeDef nvic;
    TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;
    TIM_OCInitTypeDef TIM_OCInitStructure;
    u32 TimerPeriod = 0;
    u16 Channel1Pulse = 0, Channel2Pulse = 0, Channel3Pulse = 0;
    
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_8;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    
    /*
        SVGA 800x600 @ 56 Hz
        Vertical refresh    35.15625 kHz
        Pixel freq.            36.0 MHz
        
        1 system tick @ 72Mhz = 0,0138 us
    */
    
    /*
        Horizontal timing
        -----------------
        
        Timer 1 period = 35156 Hz
        
        Timer 1 channel 1 generates a 2 us pulse for HSYNC each 28.4 us. : D = ( 2 / 28.4 )
        28.4 us    = Visible area + Front porch + Sync pulse + Back porch.
        HSYNC is 2 us long, so the math to do is:
        2us / 0,0138us = 144 system ticks.
        
        Timer 1 channel 2 generates a pulse equal to HSYNC + back porch = 2 + 3.55 = 5.55
        This interrupt will fire the DMA request to draw on the screen if vflag == 1.
        Since firing the DMA takes more or less 800ns, we'll add some extra time.
        The math for HSYNC + back porch is:
        (2us + 3,55us - dma) / 0,0138us = +-350 system ticks
    
        Horizontal timing info 800 + 24+72+128 = 1024
        --------------------------------------------

                        Dots       us
        --------------------------------------------        
        Visible area    800        22.222222222222
        Front porch      24        0.66666666666667
        Sync pulse       72        2
        Back porch      128        3.5555555555556
        Whole line     1024        28.444444444444
    
    */

    TimerPeriod = 2048;
    Channel1Pulse = 144;        /* HSYNC */
    Channel2Pulse = 352;        /* HSYNC + BACK PORCH */
    
    TIM_TimeBaseStructure.TIM_Prescaler = 0;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseStructure.TIM_Period = TimerPeriod; // 2048
    TIM_TimeBaseStructure.TIM_ClockDivision = 0;
    TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM1, &TIM_TimeBaseStructure);

    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
    TIM_OCInitStructure.TIM_Pulse = Channel1Pulse; // 144
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Reset;
    TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Set;

    TIM_OC1Init(TIM1, &TIM_OCInitStructure); // PA8
    
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Inactive; // No Output
    TIM_OCInitStructure.TIM_Pulse = Channel2Pulse; // 352
    TIM_OC2Init(TIM1, &TIM_OCInitStructure);

    /* TIM1 counter enable and output enable */
    TIM_CtrlPWMOutputs(TIM1, ENABLE);

    /* Select TIM1 as Master */
    TIM_SelectMasterSlaveMode(TIM1, TIM_MasterSlaveMode_Enable);
    TIM_SelectOutputTrigger(TIM1, TIM_TRGOSource_Update);
    
    /*
        Vertical timing
        ---------------
        
        Polarity of vertical sync pulse is positive.

                        Lines = 600 + 1+2+22 = 625
        ------------------------------
        Visible area    600
        Front porch     1
        Sync pulse      2
        Back porch      22
        Whole frame     625
        
    */

    /* VSYNC (TIM2_CH2) and VSYNC_BACKPORCH (TIM2_CH3) */
    /* Channel 2 and 3 Configuration in PWM mode */
    TIM_SelectSlaveMode(TIM2, TIM_SlaveMode_Gated);
    TIM_SelectInputTrigger(TIM2, TIM_TS_ITR0); // TIM1
    
    TimerPeriod = 625;        /* Vertical lines */
    Channel2Pulse = 2;        /* Sync pulse */
    Channel3Pulse = 24;        /* Sync pulse + Back porch = 2 lines + 24 lines */
    TIM_TimeBaseStructure.TIM_Prescaler = 0;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseStructure.TIM_Period = TimerPeriod;
    TIM_TimeBaseStructure.TIM_ClockDivision = 0;
    TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;

    TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);

    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
    TIM_OCInitStructure.TIM_Pulse = Channel2Pulse;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Reset;
    TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Set;
    TIM_OC2Init(TIM2, &TIM_OCInitStructure);
    
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Inactive;
    TIM_OCInitStructure.TIM_Pulse = Channel3Pulse;
    TIM_OC3Init(TIM2, &TIM_OCInitStructure);

    /*    TIM2 counter enable and output enable */
    TIM_CtrlPWMOutputs(TIM2, ENABLE);

    /* Interrupt TIM2 --  Generate IRQ to restart the Frame Buffer Count */
    nvic.NVIC_IRQChannel = TIM2_IRQn;
    nvic.NVIC_IRQChannelPreemptionPriority = 1;
    nvic.NVIC_IRQChannelSubPriority = 0;
    nvic.NVIC_IRQChannelCmd = ENABLE;

    NVIC_Init(&nvic);
    TIM_ITConfig(TIM2, TIM_IT_CC3, ENABLE);

    /* Interrupt TIM1 -- Generate IRQ to start DMA1 Channel 3 */
    nvic.NVIC_IRQChannel = TIM1_CC_IRQn;
    nvic.NVIC_IRQChannelPreemptionPriority = 1;
    nvic.NVIC_IRQChannelSubPriority = 0;
    nvic.NVIC_IRQChannelCmd = ENABLE;

    NVIC_Init(&nvic);
    TIM_ITConfig(TIM1, TIM_IT_CC2, ENABLE);
    
    TIM_Cmd(TIM2, ENABLE);
    TIM_Cmd(TIM1, ENABLE);
}

void SPI_Configuration(void)
{
    NVIC_InitTypeDef nvic;
    SPI_InitTypeDef SPI_InitStructure;
    DMA_InitTypeDef    DMA_InitStructure;
    GPIO_InitTypeDef GPIO_InitStructure;
    
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_7;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    SPI_Cmd(SPI1, DISABLE);
    DMA_DeInit(DMA1_Channel3);

    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)&SPI1->DR;
    DMA_InitStructure.DMA_MemoryBaseAddr = (u32) &fb[0][0];
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
    DMA_InitStructure.DMA_BufferSize = VTOTAL;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
    DMA_InitStructure.DMA_Priority = DMA_Priority_Low;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(DMA1_Channel3, &DMA_InitStructure);

    SPI_InitStructure.SPI_Direction = SPI_Direction_1Line_Tx;
    SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
    SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
    SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;  // Mode : (0,1)
    SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
    SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
    SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4;  // 72/4=18MHz
    SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
    SPI_InitStructure.SPI_CRCPolynomial = 7;
    SPI_Init(SPI1, &SPI_InitStructure);
    
    SPI_CalculateCRC(SPI1, DISABLE);
    SPI_Cmd(SPI1, ENABLE);
    
    SPI1->CR2 |= SPI_I2S_DMAReq_Tx;
    
    nvic.NVIC_IRQChannel = DMA1_Channel3_IRQn;
    nvic.NVIC_IRQChannelPreemptionPriority = 0;
    nvic.NVIC_IRQChannelSubPriority = 0;
    nvic.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&nvic);
    
    DMA1_Channel3->CCR &= ~1;
    DMA1_Channel3->CNDTR = VTOTAL;
    DMA1_Channel3->CMAR = (u32) &fb[0][0];
    
    DMA_ITConfig(DMA1_Channel3, DMA_IT_TC, ENABLE);
}

//*****************************************************************************
//    This irq is generated at the end of the horizontal back porch.
//    Test if inside a valid vertical start frame (vflag variable), 
//    and start the DMA to output a single frame buffer line through the SPI device.
//*****************************************************************************
__irq void TIM1_CC_IRQHandler(void)
{
    if (vflag)
    {
        DMA1_Channel3->CCR = 0x93;
    }
    TIM1->SR = 0xFFFB; //~TIM_IT_CC2;
}

//*****************************************************************************
//    This irq is generated at the end of the vertical back porch.
//    Sets the 'vflag' variable to 1 (valid vertical frame).
//*****************************************************************************
__irq void TIM2_IRQHandler(void)
{
    vflag = 1;
    TIM2->SR = 0xFFF7; //~TIM_IT_CC3;
}

//*****************************************************************************
//    This interrupt is generated at the end of every line.
//    It will increment the line number and set the corresponding line pointer
//    in the DMA register.
//*****************************************************************************
__irq void DMA1_Channel3_IRQHandler(void)
{    
    DMA1->IFCR = DMA1_IT_TC3;
    DMA1_Channel3->CCR = 0x92;
    DMA1_Channel3->CNDTR = VTOTAL;
    
    vdraw++;
    
    if (vdraw == 3)
    {
        vdraw = 0;

        vline++;
        
        if (vline == VID_VSIZE)
        {
            vdraw = vline = vflag = 0;
            DMA1_Channel3->CMAR = (u32) &fb[0][0];
        } else {
            DMA1_Channel3->CMAR += VTOTAL;
        }
    }
}

void vidClearScreen(void)
{
    u16 x, y;

    for (y = 0; y < VID_VSIZE; y++)
    {
        for (x = 0; x < VTOTAL; x++)
        {
            fb[y][x] = 0;
        }
    }
}

void vidInit(void)
{
    SPI_Configuration();
    TIMER_Configuration();
    vidClearScreen();
}



'''







'''

/fst/sky/rain/dream,things,stm,shake






http://www.stmcu.org/module/forum/thread-598176-1-1.html


[讨论] STM32可以超频吗？

发表于 2014-12-19 20:03:35 




 在配置STM32的时钟的时候，像F103是72M，F429是180M，F4大部分是168M，改变时钟的配置让他超频行不行呢？是不是会不可靠？有没有人试过啊？
 等考完试了，好好地实验一下。看看F429能超到多少 。。。


 主要修改几个分频系数和倍频系数，比如说我把


  #if defined (STM32F427_437xx) || defined (STM32F429_439xx)

  #define PLL_N      400


 PLL_N改为400，把


  #if defined (STM32F427_437xx) || defined (STM32F429_439xx)

    uint32_t SystemCoreClock = 200000000;

  #endif /* STM32F427_437x || STM32F429_439xx */


  SystemCoreClock 改为200000000使用RCC_GetClocksFreq（）函数获取系统时钟可以看到  

 系统时钟变成了200MHz，所以说，超频很简单！





'''







'''

/fst/sky/light/fst/hope







seed's hope is here.




# wget   ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.5.tar.bz2

# tar   -xjf   alsa-lib-1.1.5.tar.bz2


# gcc   /opt/TxL/flower.c   (-std=c++0x)   -lm   -lpthead   (-lasound)   (-lwiringpi)   /opt/?









# where they were



 name    seed

 data    trees

 backup  river









# hopes



 main        on

 dog         on
 show        off

 connector   on
 connectted  on







# plugin by connecttted

# maybe use at some future


# could be use on sound with serial


 sound       off
 sound-show  off
 sound-save  off









# wirely connector maybe use in dream

# or just use in sound maybe



# serial plug
 








# sometimes it neeed a serial inside




# serial tty4









# maybe other kind of net






# tcp    0 connecter 0 connectted
# udp    0 connecter 0 connectted
# spi    master
# iic    master









 address-to    192.168.4.3

 port-to       520
 port-this     520


 connect-step  0.1


 update-size   1024
 update-step   1









# maybe use in listenning outside



 sound-rate      44100
 sound-channels  1

 ft-N            512




'''







'''

/fst/sky/light/fst/seed







# list if files

# we could auto got this from it soon




 box/c/Linux/that/Linux.h

 box/c/Linux/that/flags.h









# get them form a convent, maybe from network


 watchdog/about/that/that.h


# watchdog/about/that/hopes.h


 watchdog/about/that/clean.h







# dog will use


 network/that/that.h
 
 network/that/hopes.h

 network/that/check.h

 network/that/clean.h






 action_seed_append ( note_file, note_path, "/sound/build/build.h" );

 action_seed_append ( note_file, note_path, "/sound/build/hopes.h" );






/*

 put this to the last of list of head and build

 then it can use the struct of configurations to note configurations everywhere


 but if we don't have them in code, we set a head of blank to fill it

*/


 action_seed_append ( note_file, note_path, "/box/c/Linux/build/hopes.h" );















/*

 maybe someday we will use it

*/


 action_seed_append ( note_file, note_path, "/box/c/Linux/data/translate/number_word.h" );



 action_seed_append ( note_file, note_path, "/box/c/Linux/system/output/print.h" );



 action_seed_append ( note_file, note_path, "/box/c/Linux/system/file-system/dirent/is.h" );

 
 action_seed_append ( note_file, note_path, "/box/c/Linux/system/file-system/file/is.h" );

 action_seed_append ( note_file, note_path, "/box/c/Linux/system/file-system/file/get.h" );

 action_seed_append ( note_file, note_path, "/box/c/Linux/system/file-system/file/save.h" );

 action_seed_append ( note_file, note_path, "/box/c/Linux/system/file-system/file/append.h" );


 action_seed_append ( note_file, note_path, "/box/c/Linux/system/process/deamon.h" );

 action_seed_append ( note_file, note_path, "/box/c/Linux/system/commandline/shell.h" );



 action_seed_append ( note_file, note_path, "/box/c/Linux/data/secret/secret.h" );







 action_seed_append ( note_file, note_path, "/watchdog/note/save.h" );

 action_seed_append ( note_file, note_path, "/watchdog/note/clear.h" );








 action_seed_append ( note_file, note_path, "/watchdog/about/build/put.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/build/load.h" );





/*

 get them from system

*/

 action_seed_append ( note_file, note_path, "/watchdog/about/system/name.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/system/build.h" );


 action_seed_append ( note_file, note_path, "/watchdog/about/ip/build.h" );



 action_seed_append ( note_file, note_path, "/watchdog/about/cpu/rate.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/cpu/temperature.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/cpu/frequency.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/cpu/cores.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/cpu/build.h" );




 action_seed_append ( note_file, note_path, "/watchdog/about/memory/build.h" );

// action_seed_append ( note_file, note_path, "/watchdog/about/disk/build.h" );

 action_seed_append ( note_file, note_path, "/watchdog/about/sound/alsa.h" );




// action_seed_append ( note_file, note_path, "/watchdog/check/root.h" );

 action_seed_append ( note_file, note_path, "/watchdog/check/network.h" );

 action_seed_append ( note_file, note_path, "/watchdog/check/power.h" );

 action_seed_append ( note_file, note_path, "/watchdog/check/update.h" );



 action_seed_append ( note_file, note_path, "/watchdog/load/hope.h" );

 action_seed_append ( note_file, note_path, "/watchdog/load/symbol.h" );

 action_seed_append ( note_file, note_path, "/watchdog/load/listen.h" );



 action_seed_append ( note_file, note_path, "/watchdog/show/about.h" );




 action_seed_append ( note_file, note_path, "/watchdog/dog.h" );







 action_seed_append ( note_file, note_path, "/sound/ft/show.h" );

 action_seed_append ( note_file, note_path, "/sound/ft/dft.h" );

 action_seed_append ( note_file, note_path, "/sound/ft/fft.h" );

 action_seed_append ( note_file, note_path, "/sound/ft/test.h" );






/*

 add the sound code

*/

 if  (  strcmp ( that_type, "base" )  ==  0  )


  {


 action_seed_append ( note_file, note_path, "/sound/corde/blank.h" );


  }





 else if  (  strcmp ( that_type, "alsa" )  ==  0  )


  {

 action_seed_append ( note_file, note_path, "/sound/corde/alsa.h" );


  }







/*

 The data code
  is for send some data
  in the network connection


  like rain, shine ...

*/

 action_seed_append ( note_file, note_path, "/network/message/data/update/build.h" );

 action_seed_append ( note_file, note_path, "/network/message/data/update/backup.h" );

 action_seed_append ( note_file, note_path, "/network/message/data/update/append.h" );

 action_seed_append ( note_file, note_path, "/network/message/data/update/next.h" );

 action_seed_append ( note_file, note_path, "/network/message/data/update/load.h" );





/*

 Append the action codes
 it's instatic

*/

 strcpy ( note_dirent, note_path );

 strcat ( note_dirent, "/network/message/action" );



 pointer_dirent  =  opendir ( note_dirent );






 do


  {




 ent  =  readdir ( pointer_dirent );




 if  (  ent != NULL  &&  ent -> d_type == 8  )


  {



 strcpy (

          note_file_action,

          strstr ( note_dirent,  gop_configurations . name_the ) + strlen ( gop_configurations . name_the )

        );


 strcat ( note_file_action, "/" );

 strcat ( note_file_action, ent->d_name );




 action_seed_append (
                      note_file,
                      note_path,
                      note_file_action

                    );




  }


  } while ( ent != NULL );






 closedir ( pointer_dirent );








/*

 the module of judge
 means to take the words get on network

 the plan is using the trees system

*/


 action_seed_append ( note_file, note_path, "/network/message/judge/blank.h" );

 action_seed_append ( note_file, note_path, "/network/message/judge/hello.h" );

 action_seed_append ( note_file, note_path, "/network/message/judge/who.h" );

 action_seed_append ( note_file, note_path, "/network/message/judge/information.h" );

 action_seed_append ( note_file, note_path, "/network/message/judge/command.h" );






/*

 appending data to the message

*/

 action_seed_append ( note_file, note_path, "/network/message/data/build.h" );





/*

 build the network message system

*/

 action_seed_append ( note_file, note_path, "/network/message/build.h" );





/*

 the translate system of network

*/

 action_seed_append ( note_file, note_path, "/network/tcp/connectted.h" );

 action_seed_append ( note_file, note_path, "/network/tcp/connector.h" );






/*

 build the

*/

 action_seed_append(  note_file, note_path, "/build.c" );





'''







'''

/fst/sky/moon-river/One. The Eage/8.Inside.txt



　　入夜了。

　　路边枯黄的野草隐入了黑暗里，老涛沉默地开着车，好像根本不存在一样。那个年纪轻轻，还带着公鸭声的男子不知从哪里拿出了一个橘子，剥开后大口地啃起来。

　　“你哪天被我抓拍到了，我一定会发遍全宇宙的！”邓秋离在一旁咯咯地笑着。

　　吃橘子为什么不剥成片呢？韩凌枫在一旁想着。

　　“我们是要去野外的某个磁场异常区域做调查！”他像没听到似的，一只手抓着橘子，兴奋地说，“你说野外为神马会突然出现磁场异常？我看最大的一种可能就是建军这货在那里搞什么实验！他是那种一不做二不休的人啊，总是在盘算着那些我们闻所未闻的东西，说不准这次他又冲刺了，已经在搞这种大规模的实验了。我看这次我们八成会遇到他，所以到时候我们破坏了他的设备赶紧跑路吧！”

　　一旁的维克多抬起头来看了看橘子男，边拿着平板边说：“我看这次我们八成不会遇到他。要造成这个大小的磁场，怕不是他一人一时半会儿就能弄出来的，我们倒是很可能碰到些研究气象的，我们要谨慎一点才好。”

　　“而真正可能对我们造成威胁的，是这个磁场本身，强大的磁场对人的神经、内分泌系统的影响很大，虽然不会马上对我们造成伤害，对在这样的磁场中待久了可能会发生些奇奇怪怪的事情。”

　　这时除了老涛，其他人都认真地听着维克多说话，橘子男还皱着眉头思考着，很自然，好像这是这支队伍的传统。

　　韩凌枫也被这种气氛所带动了，听着听着，他就想到了一些很可怕的事。

　　“人在强大的电磁场中若是呆得太久，就会出现晕厥、恶心、呕吐甚至是看到幻觉，影响情绪。比方说，在欧洲某国家有一个中世纪的地牢，据说被关到这个地牢内的犯人一段时间后就会看到鬼魂，大喊大叫，最后疯掉。后来科学家研究了那个地牢，并在那里发现了异常的磁场存在。”

　　虽然听起来觉得没有着落，但一想到自己那天突然的晕厥，就伴随着强烈的头痛，一想到父母那天反常的样子，韩凌枫只觉得头皮发麻，手臂上都起了鸡皮疙瘩。

　　这时，他发现维克多正在看着自己，那种很坦然的眼神。

　　“……在比方说，韩凌枫前几天连续两次遭到了这种攻击。”

　　虽然完全没有直接的证据，不过这种推论似乎是很符合逻辑的，韩凌枫一点都不怀疑，建军能做出来。

　　据说建军从小就玩电器，他的物理成绩又那么好，物理老师说，这孩子将来必成大器。

　　天哪……

　　维克多继续说：“我们也许会变得暴躁，也许会看到集体幻觉，我们不能在那里呆太长的时间，橘子男带个充电宝，把你的手机示波器一直打开，你和邓秋离负责对磁场的评估；我和老涛负责做标记，确定方向。”

　　“我们在距离磁场中心约五公里的地方下车，在确保安全的情况下，以最快的速度赶到磁场中央，得出一些结论，就撤了。”

　　“我们也许会遇到有蛇的丛林，或是庄稼地，湖，霸哥他们不在，我们要充分考虑，小心行事。”

　　然后维克多又看向韩凌枫。

　　“然后明天，我们把韩凌枫送到学校，继续处理建军的事。”

　　“话说，你作业怎么办？”

　　韩凌枫正在想着磁场的事，听到维克多问他，吓了一跳，随口说道：“没、没问题……我可以去复印一份……然后很快写完！”

　　随后大家又恢复了原来的状态，天空越发地黑得深沉，月光若隐若现，韩凌枫心头很是不安。

　　橘子男从他的包里拿出了一个笔记本电脑，连接上手机后就不停地鼓捣着，看来这厮还是个技术宅；而邓秋离就像考试作弊之前的学生一样，继续戳着她的粉红色壳iPhone。

　　维克多靠在车门边上沉思，像是一根标杆。

　　“维克多？”韩凌枫小声的喊他。

　　“怎么？”

　　“我能先去睡一会儿，一会和你们一起去吗？”

　　一想到在这样一个月黑风高的夜晚，自己要一个人呆在车上，这样的荒郊野岭，就像会闹鬼一般，韩凌枫不愿意呆在车上。

　　维克多想了一下，说：“其实这样最好，不过如果是野外，可能会不安全，你一会和老涛我们一组，你要小心野生动物、昆虫……”

　　“好的。”韩凌枫说，他之前已经觉得自己霸占着床位很不好意思，所以就直接躺在沙发上，而维克多看了看他，说：“你还是去后车厢吧。”

　　“我真的挺不好意思的……”

　　“你放心，我们一会儿会泡茶，而且那两货都是中午才醒的。现在快九点十几分，大约十二点到目的地，你去睡一会儿吧。

　　于是韩凌枫还是去了车厢，躺在那手术台一般的床铺上，安静地一动不动。这似乎是很有喜感的场景，但是韩凌枫这会儿是无论如何也笑不出来了。

　　心里满满的愧疚感，掺杂着恐慌感、好奇感，此刻他觉得自己腿都快抽搐了。

　　他又拿出手机充上，尽管他有意识地省电，但是这会儿也只有不到半格的电量了。

　　忽然，韩凌枫心头一动，登陆小学时候的扣扣账号，连续试了几次密码，又改密码、解冻之后，他又登陆了那个最初的扣扣号，盯着那些乱七八糟的昵称发呆。

　　那个签名上写着“梦想比条件更重要”老扣扣，从初中开始总是被盗的扣扣号。

　　这个账号很神奇，初中时被盗，有人在上面发奇奇怪怪的东西，韩凌枫果断改密码，随即又被盗，最后只得被迫换号。韩凌枫初中毕业时曾经又把它找了回来，但随后竟然有被盗了，于是韩凌枫彻底死心了，开通vip复制了好友，再也没有登录它了。

　　直到现在。

　　韩凌枫进入小学的扣扣群，翻到了邓秋离的名字，果然还是亮的，于是加好友。

　　“我是韩凌枫！”

　　几秒钟过后，请求被同意了，韩凌枫问道：“你不是出去读书了吗？”

　　然后他进了邓秋离的空间，看到里头很空，少量的说说很小清新，赞也是满满的，似乎除了自己所有人的赞都是满满的。

　　过了一会儿拉出一个对话框：“哟，韩凌枫！好久不见。就这样跟着我们走了，不怕自己肾被取掉啊？一点防备心都没有。”

　　看到这里，韩凌枫只觉得腰部一阵发凉，鸡皮疙瘩又起了，完全没有注意到对方根本没有回答自己的问题。

　　不过那种隐隐约约的危机感，似乎好了很多。

　　“额，一会儿请多关照哦！”

　　韩凌枫想了数分钟，终于憋出了这么一句话，惆怅着对方还会不会回话，自己要不要睡去。

　　几分钟过去了，没人回话，韩凌枫这才把手机丢在一边，把烦恼也扔在一旁，像是融在了夜色里，很快就睡着了。

　　而铁皮墙的另一边，维克多满脸严肃，心里渐渐地觉得不安。

　　李巫你们根本没有去之前说好的地方，你是在躲避着这里吗？

　　夜色中公路是这样的漫长，开着车灯都没有把握，也不知过了多久，异变发生了！

　　整辆车突然开始微微颤抖，随后越来越剧烈，好像这块大铁皮都要被撕开了！

　　韩凌枫突然被惊醒了，连思考的时间都没有，脸就被一旁的台灯撞到了。

　　车祸？！

　　还是地震？？

　　随后这震动强到了不可思议的程度，韩凌枫从床上被撞到天花板上，又摔下来，头撞到墙上，晕过去了。 



'''







'''

/fst/sky/moon-river/One. The Eage/12.The Dungeon.txt



　　“我醉倒在海边，一如万年前的清晨。”

　　——《祭祀手札》第五卷，吟游诗人与海女

　　朱梓翻动书架，灰尘漫无天际地弥散开来，这是一本开本不太大的书，书名已经看不清了，纸面粗糙，泛黄，且带着手工制品的杂乱花纹，但整体来看却非常精致，作者像个父亲一样细心。

　　全书都是手写的，毛笔字很娟秀，可韩凌枫不知道它讲的是什么。

　　除开部分繁体字，大多都是韩凌枫熟悉的简体，可内容相当乱来，似梦非梦，内容也不连贯，可它散发着一种忧愁，一种像蓝宝石般黯淡的光，让人心疼，让人想要保护它。

　　“没人知道这些是在讲什么，比如这一篇…”朱梓小心地翻开一页。

　　“受难者的灵魂，

　　会与施难者的

　　相连接。

　　恶鬼由此，

　　重返人间。”

　　完全没逻辑，恶鬼什么的，是不存在的吧，你说那些个相信神话的人都在想什么？

　　“看这里！”朱梓翻到很特殊的一页，比别的都更细致，是很用心地写下的。

　　内容大概是说在天外还有一个世界，那里住着神明，他们被贬下凡间的神渐渐失去了力量，成了人。

　　书中说，神界比凡间好得太多，无忧无虑。

　　韩凌枫这种神棍的东西也看得很多，但这么古老的文字他是第一次见到。

　　仔细咀嚼着书中的每个字，可他仍不觉得这其中有什么必然的联系。

　　朱梓是认为我所来的地方就是所谓“神界”吧？可那太缥缈了，可以说有，也可以说没有。

　　朱梓看了看韩凌枫，兴奋地说到:“可这是古书《祭祀手札》啊，是圣贤道子所作。最聪明的人，只会留下些疯言疯语吗？”

　　这倒是说服了韩凌枫，这时朱梓祭司的特质就表现出来了。

　　韩凌想起刚刚回来时，看到老涛睡着了，他没什么大碍，恢复得不错，这些事情要更实在得多。

　　朱梓思考了一阵，认真地看着韩凌枫:“据说，道子先生曾经是一位神。”

　　韩凌枫想着想着忽然想通了，冷汗冒了出来。

　　试想，外界的科学发现更快，外界的人能进入这里，那么外界的人若是带着知识进入这里，就很可能会成为鹤立鸡群的人物。

　　朱梓努力回忆着，继续说到:“据记载，道子先生住在地下，他思考时所留下的痕迹也都在那里，谁能到那个地方，谁就能理解神的力量，理解这个世界的一切。”

　　韩凌枫发现这种版本自己也是听过的，但是这种感觉却很不一样，之前朱梓的思路都在那里，你不得不承认它可能存在。

　　“若是神的遗迹真的存在，并且掌握了它就能使人也过上神的生活，那么寻找这个地穴一定是很重要的事情，不亚于庞大的工程，”朱梓使劲闭着眼睛，思考着，“我知道，祭司是占卜的人，可我从未觉得占卜，真的有用，而占卜却是必须的。若是她们都在那里解读道子所留，这样就说得通了！”

　　韩凌枫发现朱梓这时候的思路真是很难跟上，怪不得聪明如她也会愁成那个样子。

　　朱梓见韩凌枫并没有明白自己的意思，激动地拉过来一大张纸，蘸了毛笔画了一个圈。

　　“这是整个村子，背面靠着坡，”她说着，把圈的上半部分涂黑了，“而下半圈是勇士的营地。”

　　“在圈内，上半部分是作坊、农户;下半部分则是武器坊、训马场、摔跤场以及，酋长的主营地。”

　　朱梓把圈内上下都涂上了淡淡的墨色，好像一潭湖水，最后，她把一滴浓墨滴在正中央。

　　“祭坛，才是村子的中心。”

　　夜里，朱梓和韩凌枫来到祭坛，韩凌枫用手机照明，光线昏暗。

　　“我这可只能照明一会儿，橘子男回来了才有办法充电，谁知道他们还不回来。”

　　和朱梓绕过几个农户，他们看到了那个建在高地上的祭坛，巨大的石板铺成台阶，庄严又神圣。

　　这里的黄昏也是橘红色，夜风凉凉的，却没有意料中那么寒冷。

　　朱梓穿着那件豹皮衣裳，显得很高挑，她不习惯，似乎很害羞。

　　手机的节能彩屏不足以照亮祭祀室，朱梓凭着记忆四处观察着。

　　“因为只有这儿才有一条河，部落的位置始终没过，地窖一定是在这里。”

　　韩凌枫看着角落里的杂物，越看越像某些奇怪的东西，不由得感到恐惧。

　　忽然想起顾小蔓，那个女孩子疯疯癫癫的，胆子也比自己大，说要去夜店也是她提出的，就像分手也是她提出的。

　　她是那种总是能找到朋友的人——除了自己别的人都能找到更好的人。

　　而如今，男孩不再回你想让他看到的说说，不再装呆发消息逗你笑，他不再给你发消息，你知道的，你们分手了。

　　顾小蔓没有人陪的时候，韩凌枫还热心地祝她生日快乐，尽管后来搞砸了。

　　朱梓对自己很友好，可他总会想起顾小蔓，一想起顾小蔓，他就只能像孤单的月亮一样傻站着。

　　“祭司们每天要进入地窖解读遗迹，又不能让别人发现，那它一定在一个没人敢去的地方。”

　　朱梓一边说，一边对着祭祀台跪了下来，找到了一个青石暗门，她使劲一扯，打开了它，密道深不见底，残缺的石台阶还很湿润。

　　祭祀台上的兽骨，在黑暗里让人毛骨悚然。

　　韩凌枫想，这和顾小蔓最后给他的感觉是一样的，像一只隐藏在黑暗里的蜘蛛，由于饥饿而嗜血。

　　刚认识的那年冬天，她穿着彩色的棉袄站在跑道边，像一颗饱满富贵的玛瑙石。

　　这样想来，顾小蔓长大后会很富贵吧，也许她会成为一个贵妇，她的妈妈在医院工作，她初一钢琴八级，他哥哥送了她一台高大上的iPad……

　　她后来若是成了权倾一方的人物，我就躲得远远的;若是她孤独终老，我就去看她，讲笑话给她听。

　　韩凌枫想，反正我自己就是个天大的笑话就是了。

　　他们走进了阴暗潮湿的地窖，朱梓兴奋得双手颤抖着。韩凌枫的手机闪光灯始终亮着光，光芒洁白又刺目。

　　墙壁是凿出来的，韩凌枫看着那些古老的纹路，忽然又想起刚遇到维克多时，被狗血地闪了一下，你看维克多也不是完美的呀，闪你妹啊，他是慌了莫非？

　　也许是让自己慌了？

　　不想了，还影响别的事。

　　韩凌枫偶尔被石壁上出现的壁虎之类吓到，在十几米深处，他们来到了一条不见尽头的长廊。

　　韩凌枫手机灯光一招，心都被揪紧了。

　　墙壁上画着怪物、烈火、盘曲的巨龙，天崩地裂，世界末日！

　　二零零五年，“洛克”中东地下堡垒。

　　一个瘦黑的平凡男孩正在吃饭，他的脸有些黑不过很平整，看上去朴实无华。

　　他的动作很小不过很到位，他面无表情，像是在嚼蜡。

　　他的周围还有别的孩子，他们整齐地坐着吃饭，几乎没人说话。

　　偶尔有女孩议论他:“说不定建军哪天会自杀呢……”

　　尽管每个人都非常骄傲，还是有很多女孩都暗地里对建军有好感，因为建军是个谜。

　　他们有的修量子力学，有的修基因工程，不过建军似乎都会;他们有的已经成为互联网上游荡的幽灵，有的善于设计能量武器，不过建军总能让他们感到不如。

　　他们都是洛克“深蓝”计划的对象，十多年前，洛克秘密进行的人类基因组计划完成后，居住于地底的科学家们提出了人脑改良项目，“深蓝”就代表使用基因手段从根本上提高人类智力。

　　此前，洛克秘密地收集了世界上高智商人群的基因，爱因斯坦、达芬奇、耶稣、黄帝……以及一些从未透露过姓名的民间智者基因，尽管很多因为年代久远已经不完整，还是最终得到了若干份基因组。

　　对于这样一个秘密的无耻的组织，人类的克隆他们早在国际法禁止之前就搞出来了，这也是洛克“永生”计划的一部分。

　　二零一三年五月四日

　　火光隐隐地摇晃着，在建军的脸上勾勒出阴影，这里有些成堆的兽骨龟甲、竹简书籍，这里是大祭司的房间。

　　“太久了。”建军说。

　　一旁的大祭司悄悄地问道:“先生？”

　　七年前，“深蓝”计划的最终实验，建军以所有成绩全优而脱颖，他的各方面都很完美，虽然话不多看上去有些孤僻，不过这看上去并不是缺点。

　　他获得了一份奖品，在那个时候，绝对的，甚至唯一的尖端技术产物。

　　奖品被放在一个盒子里，所有人都小心地对待它，看上去那里头的东西就值了半个“深蓝”计划。

　　二零一三年五月四日，朱梓韩凌枫在地窖里，眼前是一条看不到尽头的长廊，墙壁上画着末日的预言。

　　他们的心跳才正要平静下来，忽然楼梯口传来很多人的声音，朱梓连忙拉着韩凌枫朝走廊里跑去，可那黑暗中却出现了一个人影。

　　那时，有火光照亮了一切黑暗，眼前的人强壮又威严，那黑色的眼睛里带着一种强烈的敌意。

　　韩凌枫看向身后，部落的勇士们已经堵住了他们，那些强壮的身躯像是捕猎的野兽。

　　“大酋长……”朱梓喃喃。

　　恶臭袭人，老鼠在角落里乱窜，韩凌枫忽然想到络上那个鼻子被咬掉的女孩，于是颤抖着坐了起来。

　　他被关在了一个地牢，用石头堆砌成了墙，门用巨石堵着，只留下一个小窗。说来很奇怪，因为这个地牢的结构比地面的房屋更进步。不过，道子的地窖是在一块石头上生生凿出来的，比起这些，地牢在这里还算正常的。

　　韩凌枫觉得这次自己逃不掉了，他在教师办公室出生入死无数次，在医院输液打针无数次，还在高原上喘不过气来，可从未闻到过这样的血腥味。

　　他心神恍惚，双脚颤抖，内心充满了恐惧，他忽然觉得这次会不会走不出去了，他忽然很想鲜花的味道，曾经每天早晨吃的早餐都是美好的。

　　朱梓在走廊尽头嘶吼着，那种语言中的情绪气味让每个人都心碎，韩凌枫听着听着就哭了。

　　他看过了，这地牢很窄，狭长的走廊里还关很多人，他们大多都饿得半生不死的，浑身肮脏充满了排泄物的味道，安静得像不存在一样，看着韩凌枫和朱梓。

　　不知时间过了多久。

　　韩凌枫忽然想到一个主意，动画片中海尔兄弟用火灼烧巨石，又撒尿冷却它，在热胀冷缩下巨石就碎裂了。

　　这是因为石头中各种杂质热膨胀系数不同，热胀时某些点受力较大崩裂，然后冷缩时裂缝又扩大开来，这是可能实现的。

　　地牢中很多稻草可以用作燃料，可他没有火源。砸石头摩擦起火？这些石头不是火石没可能的；然后他又想到手机电池短接也许能引火，可这样又太缥缈了，没有铜线。

　　他没办法了，洞口的巨石看上去得五六个人才能勉强挪开，洞里很干净，没东西可以砸。

　　他再一次陷入了绝望。

　　不知过了多久，朱梓不再吼叫，韩凌枫呆楞在原地。

　　“你是猴子请来的救兵吗？”

　　这时他的手机竟然响了，这里可是没信号的！

　　他颤抖着拿起电话，只见屏幕上方显示信号有两格。

　　奇迹！韩凌枫接听了电话，电话里传来橘子男的声音。

　　“你在哪儿？”

　　“牢里！”

　　电话里沉默了一会儿，问道:“在哪个位置？我们怎么救你出来？”

　　韩凌枫说:“门口有个接近一吨的石头，地牢在祭坛背后！”

　　然后对方挂掉了电话，韩凌枫感到一阵心悸，不知道对方怎样了。

　　又过了不知多久，问口的守卫换了三班，忽然愣住了，然后被什么东西击中了，有个瘦削矫健的人影跑来，扶住了昏迷的部落守卫。

　　远处另一个守卫听到了，谨慎地冲了过来，看样子要攻击正半蹲下的维克多。

　　守卫很强壮的，维克多敌不过的。

　　可他手里握住了一个什么东西，随着“刺啦”一声，那守卫倒下了。

　　韩凌枫趴在洞口看着，橘子男一瘸一拐地跑了过来，把一根登山绳的一头拴在巨石上，另一头拴在对面。

　　然后他背着维克多，让他站在绳上，维克多平衡很好，竟然站住了。

　　韩凌枫会意了，这是根据平行四边形法则，借用了绳子的张力，他开始全力推石头，肚子很饿，但他想尽了一切办法增大推力。

　　橘子男拿出一根长长的铁棍子，开始撬动巨石，这是利用杠杆原理，借用了铁棍的弹力。

　　虽然很想杂技团，不过三力相加，巨石被移动了。

　　韩凌枫逃出来了，他们又救出了朱梓。

　　“按着以前的一个想法，橘子男模拟了信号塔的信号，还加大了天线的功率，这才找到你。”维克多说。

　　“不便一一细说了，我们看到建军了，他知道这里的存在，说不好是他发布任务把我们给引来的，当时我们……入不敷出了。”

　　“你们先走吧，战斗开始了，不是发泄脾气、争个对错的打架斗殴，这是用尽全力的，要去用一切能碰到的力量去打倒对方的斗争，为了生存！”

　　韩凌枫知道自己帮不上什么忙，可朱梓得知人们似乎已经听从建军的号令了，有些希望留下来。

　　后来他们还是决定躲起来，朱梓不说话，韩凌枫时不时看这些自己瘦削的手臂，看着那“恶意”。

　　因为它总在手臂上飘来飘去，韩凌枫想把它拴起来，可太挤，最后他还是没管它，看上去很神奇。

　　没有外人看到时还是常常拿出来。

　　夜幕像一潭幽幽的湖水，丛林里乱枝很多，韩凌枫很累，可却不停地跑，好像那已经不是他的脚。

　　静… 



'''







'''

/fst/sky/moon-river/One. The Eage/14.Moon River.txt



　　“我在等他跟我道歉。”

　　海伦·伊丽莎白，墓志铭

　　一

　　很多天过去了，很多天了，韩凌枫和朱梓浑身都是泥。

　　韩凌枫的良心不允许他看着朱梓就这样不行了。

　　朱梓是个很善良，很孤单的女孩子呀。

　　可是没有办法了，谁知道这个世界竟然如此冷漠。

　　这里的树很多，可完全不结果实。

　　朱梓带着韩凌枫掘出这些大树的根系，偶尔能找到土豆一般的瘤状根，朱梓在夜里没有湿气时钻木取火，将它烤熟了吃。

　　在这里钻木取火是非常困难的，因为湿气的缘故，树木都长得很柔软，常常一两天都不能成功。

　　而且他们迷路了，面对虫、泥、蝙蝠，他们再回去也不可能了。

　　饿得神智不清时，韩凌枫会想起顾小曼。

　　顾小曼也是有苦衷的吧，韩凌枫知道顾小曼也很孤单，她的说说空荡荡的，像自己一样。

　　即使她的确伤害了自己，那也没多大事儿呀。

　　世界原本残酷，温馨舒适其实是人们的心愿。

　　为此，人们努力着让生活更好。

　　只能期待维克多和橘子男找到自己了，可他们的麻烦更是不小呀。

　　需要帮助的总是自己，可同伴们遇到困难时自己什么忙也帮不上。

　　韩凌枫又想起建军。

　　自己为什么这么畏惧建军呢？

　　从一开始，他就不在乎任何人。

　　建军像只黑色的刺猬，他一双眼睛看尽你的所有，他在黑暗中袭击你。

　　然后你的所有反抗只会撞击到那些尖刺。

　　你什么都没有，血流成河。

　　韩凌枫很早就认定了，建军可以打破一切记录，可以让每个人敬畏他，但他绝不可能让自己妥协了，，绝不！

　　不过现在看来这也摇摇可危了，建军已经将触手伸向了脑科学。

　　他是男神体质，什么都能成功，他学会了知识，为了避嫌不告诉任何人。

　　…………

　　韩凌枫只觉得泪水都要涌出来了。

　　不知道几天过去了，韩凌枫忽然想起了什么。

　　“朱梓…你说道子先生是部落的先祖，生于几百年前的洪荒。”

　　“嗯。”朱梓喃喃。

　　韩凌枫欲言又止，斟酌了很久，说：“既然他是我们那边来的，也是来自很繁华的封建时代了，可手工技术一点没保留下来呀。”

　　朱梓愣住了。

　　“制造工具，毫不费力干活呀。”韩凌枫补充道。

　　朱梓愣了一下，说道：“因为在纷争中被唾弃了。”

　　“哦？”

　　“在古书中说，道子生前始终都在传播这些知识，可都失败了。”

　　韩凌枫愣了一下，然后说：“这有什么困难吗？”

　　朱梓回忆了一下，道：“我也不知道，所有古籍都没有提到这些。不过据说道子先生临终前把自己关在石头地窖里，留下了一本书，它被称为《祭司手札》的「密卷」，只有历代大祭司才知道它在哪里。”

　　“以前我不敢，不过这次我们要是活下来了，我们就把它弄出来看看吧。”朱梓笑着。

　　“好。”韩凌枫道。

　　若是活下去，还是可以有真正的生活的，那种干净每天都有热水的生活。

　　以前韩凌枫会想，生活就是你有双很漂亮白色的帆布鞋，你有件很潇洒的线衣，你想着和那个女孩擦肩而过时，你要穿着那双白色的帆布鞋，你要穿得像个干净的邻家男孩，你从阳光下走过，下过雨的灌木和花瓣上粘着晶莹的水珠。

　　你一头柔顺懒散的头发，午觉还没睡饱。

　　这就是你的计划了，她来的那天，天空都颠倒了，但是你的鞋还装着臭袜子晕倒在床下，你的衣服下肥肉露了头，你想做什么都失败了，你被挟持了，你瞬间就成为了世界上最傻冒的人。

　　生活就是这样，生活一直都是这样，就像一片地狱，它让你心痛，直到有一天你习惯了这种痛苦，你的鞋就再也洗不干净了。

　　只不过离开得太久了，韩凌枫自动把内涵都忘了。

　　回去，什么都好。韩凌枫想着。

　　二

　　后来，朱梓逮住一只兔子，那兔子惊疑不定地望着两人，朱梓蒙上它的眼睛，木然地把兔子宰杀了。

　　韩凌枫在一旁看着，忽然想起自己帮助家人宰鸡的情景。

　　朱梓看了一眼韩凌枫，叹息道：“活着，就是与痛苦作伴呀。”

　　刚下了雨，没能生火，朱梓咬开兔皮，扬起头，喝兔血。

　　忽然间韩凌枫感到头皮发麻，脖颈一阵恶寒，自己竟然和她一起饿了这么多天。

　　现在自己非常饿，竟然也有种想要充饥的感觉。

　　朱梓将那兔子递给韩凌枫，似乎在询问。

　　有寄生虫吧？不过性命都快不保了，也不算什么大碍了。

　　韩凌枫犹豫了一下，然后喝了一点，那是一种温热的腥味，又粘稠，有股生鱼身上的那种味道。

　　然后朱梓茹毛饮血般地吃下了兔肉，韩凌枫也吃下了一些，感觉这次吃的比前半辈子都多。

　　那味道像是某种充斥着温热鱼腥味的橡皮果冻。

　　第二天韩凌枫拉了一整天肚子，几乎脱水。

　　韩凌枫虚弱地躺着，觉得自己快死了。

　　“你……”朱梓无奈地看着他，她眼里的韩凌枫就像一片雪花，简直脆弱得不行。

　　“我还以为我就是全世界身体最弱的人了。”朱梓喃喃道。

　　三

　　两人就这样行尸走肉般地走着，眼前出现一条河。

　　“月亮河！”朱梓喊到：“我们竟然转回来了。”

　　“这是村子门口那条河？”韩凌枫问。

　　“是的。”朱梓说。

　　“这是这世上唯一一条河，据说她有种神奇的魔力，会让迷路的人找到她，很模糊的传说了，以前我还不信。” 



'''







'''

/fst/sky/moon-river/One. The Eage/7.Research.txt



　二零一三年五月三日，午间

　　男孩独自在车厢里，看着面前那个黑色简约的手表，它竟然悬浮在桌上，韩凌枫伸手去触碰，可是指尖一旦凑近，那没有屏幕的手表就好像在躲避着韩凌枫的手一样，漂浮着躲开了。

　　仿佛有一种斥力。

　　之前韩凌枫的第一反应是，那是他们在玩他呢，利用磁场，使一块磁铁悬浮起来，不算难度很大的事情，但是渐渐地他发现事情不是那么回事。

　　无论是什么样的东西，只要接近了“恶意”，它们就会受到相反的力量，相互排斥。

　　而且，这种力量在随着那个物体的重量增大而增大。

　　韩凌枫虽然不是最优秀的学生，但好歹也算完成了九年义务教育，这样的事若他不是亲眼看到，是绝对不会相信的。

　　韩凌枫此前从未亲眼见过这样的东西，唯一曾听说的就是UFO有反重力罩，可这样的事情怎么可能是真的？所以早就不了了之了。

　　他觉得自己头皮都麻了，之前维克多说他们都是一个叫OFU的组织成员，难不成，这两者之间有联系？

　　维克多不像骗子，虽然也不能排除这种可能，但是一群牛到没有听说过的人，又跟UFO扯上了关系，韩凌枫忽然觉得维克多多多少少与UFO有着一定的关系，而且这一车人都不太对头，总之与韩凌枫在校时看到的那三五成群的学生不同，又和那些有着正经工作的人也不同，好像他们都是外星人，要拿自己做研究似的。

　　否则，你要怎么解释邓秋离、维克多、建军这些变态会凑到一块儿？

　　莫不是，他们发现了新的科技吧？虽说现在的科技似乎已经不是那么容易就能有所突破的，但是谁知道呢？像奥斯特发现了电流磁效应，也不是偶然吗？

　　建军他们，和自己年龄差不多，甚至比自己还要小，却已经开始接触自己完全不能理解的东西了吗？

　　原来建军比自己想得还要天才，他在外面结交了一群天才朋友，他们发现了反重力效应，而今加入甚至是成立了这个即将崛起的科技公司，OFU，它在未来会像苹果、腾讯那样强大，家喻户晓。

　　是的，这是非常合乎逻辑的解释了。

　　可是自己呢？

　　在对建军有所了解之前，韩凌枫才是寝室的室长，自己的身高是最高的，那么善良没有一点恶意，虽然与室友们玩得很开，却忽略了室长的责任。

　　后来建军来了，作为新的室长。

　　建军是一个什么样的人呢？他所有的衣服、生活用品都带着单调的颜色，他从不多说一句话，他每天晚上安静得像是死了一样，只有当大家聊了一会儿后，他才会用很没有感情的语调吼着不要说话，而大家都会听话的。

　　韩凌枫一直以来觉得自己是生在一个小城市，从没想过做什么世界上独一无二的人。什么十四岁就创业的人好像不过是外国的特产。

　　可是突然很失落，像是胸膛里一朵鲜花破碎了，让人很心疼。

　　怎么可以这样，自己不是经常看到很多充满信心的东西吗？

　　不是说什么梦想不设限，不是说什么上帝会为你打开另一扇窗，不是说什么我们平等地站在上帝面前？

　　自己为什么会这样弱小，好像一只瘸了腿的羊羔。

　　看着面前转着圈的“恶意”，韩凌枫忽然很想砸了它。

　　这时传来了沉稳的脚步声，有人踏进了车门，维克多走了进来。

　　“怎么样，它很神奇吧？我忽然觉得跟你很合适呢。”

　　“恶意是建军我们以前偶然得到的，经过了严格的分析却得不到结论，好像它内部就是普通的铁。”

　　“后来我们拿它没办法了，于是就做成了手表，我叫它‘恶意’，是很有纪念意义的东西，暂时送给你吧。”

　　观察着那黑色塑胶表带的样子，韩凌枫戴上了那手表，表带很舒适，很酷，而且他曾经就把网名改成过“恶意”，有一种亲切感，真的很好。

　　没有重量，就像一滴水，还会在手腕上滑来滑去。

　　“我想了一下，决定告诉你更多的事。”维克多坐下，看了看韩凌枫，然后从包里拿出了一个ipad。

　　对韩凌枫来说，苹果是高级的东西，几年前就听说了，也偶尔会看到，但是他从来没曾想自己会这么近距离地接触它。

　　“真的不希望我们之间有任何误解，所以还是要你看看这个。”

　　维克多打开浏览器，输入了一个网址，打开的时候，屏幕上好像有个果冻在蹦跶。

　　这是一个很简洁的网站，标题上写着“OFU”几个懒散的字母，整个内容似乎是一张还未完成的图画，像是丛林深处的一片小空地。

　　哈？这什么意思？这是个美术小组？

　　维克多看了看韩凌枫，说：“这是一个隐秘组织，其成员散布在世界各地，虽说寥寥数万，可他们全都是高精尖的人才，如果你有很多奇思妙想，来这里找帮手就对了。”

　　“具有一定声誉的用户可以发布任务，如果具有一定的能力和信用，也许就能成为专职的成员。”

　　“访客不能注册账号，每个人都是在机缘巧合下才成为了会员。”

　　维克多点了点图上那些树，然后打开了一个全新的页面，像是一个论坛，有很多帖子的那种。

　　韩凌枫看着那些帖子的标题，其内容让人头皮发麻。

　　“【悬赏】X州车站骗子清理。”

　　“【招募】细胞化学，分析师。”

　　“【招募】中山路眼线。”

　　“【出售】手制型运载无人机。”

　　…………

　　维克多快速地点进了一个界面，那里有一条消息，屏幕上显示着未读。

　　“【招募整队】江城天气异常调查（新）。”

　　点开它，其中有一条简短的消息，一份地图和一些表格。

　　“任务分配，调查江城郊外的磁场异常，并写一份详尽的报告。”

　　韩凌枫觉得那真心不像是开玩笑的，那份地图非常详细，就是江城附近的地图，表格的目录上大部分是些他还看不懂的符号，而且最近天气确实很反常甚至完全不像教科书中描述的那样。

　　韩凌枫开始真正相信维克多所说的话了。

　　“有时某些公司，或者单位，他们的人手不够，就会试着在这个网站上雇佣某些够资历的人，通常老鸟不会愿意和他们打交道，因为难度较大。不过由于他们有完整的资料，而且有时甚至能得到那个组织的一些内部资料，还是有人会铤而走险。”

　　韩凌枫眼睛不觉得瞪得很大，看着屏幕：“我玩游戏这么多年从不知道还有这样的网站……”

　　“这事儿你最好别说出去，”维克多幽幽地说：“毕竟我们也不是干坏事的。”

　　“而且网络，并不是OFU存在的主要形式。他们能看出你是否知道自己的秘密。”

　　“怎么会？”

　　“比方说我一提到OFU你就会做出这种表情……”

　　下午了，所有人出发了，那个叫“老涛”的中年人在开车，那个年轻男子站在他身后，互相调戏着。

　　而维克多站在一旁，只有邓秋离坐在座位上。

　　邓秋离和韩凌枫搭了一两句话，就开始弄手机，邓秋离拿着粉红色外壳的iphone，戳来戳去，维克多则沉默地看着前车窗。

　　韩凌枫不知道自己要干什么。

　　忽然，维克多的手机响了，传来清脆的铃声，他拿出一款白色的三星手机，看了看。

　　“咋了？“邓秋离问。

　　“没事。”维克多说，他顿了顿，又说，“青洒的生日。”

　　然后所有人都沉默了，韩凌枫很好奇这个青洒是谁。

　　维克多说今晚就能到那个磁场异常的地区，应该明天就能完事儿。

　　于是韩凌枫就听着音乐，看着窗外的天空越来越暗，最后漆黑一片，只有一轮皎洁的明月，高高地挂在天空中。 



'''







'''

/fst/sky/moon-river/One. The Eage/11.The Girl.txt



　　当天亮起来的时候，温度也升高了，寒气开始褪去，天空渐渐变成了蓝色。

　　朱梓告诉韩凌枫和维克多两人，说妈妈为他们准备了食物，于是他们要去叫上正在房间里进行生产活动的橘子男，以及已经在等他们的邓秋离。

　　这是一间建得很细心的木屋，房间里堆了好几个箱子，全都打开着，全是零件，工具，还有一些小型设备，围成了个圈。这些是昨天累死累活才搬来的，橘子男正顶着一头油亮的头发，盘坐在那扇形中间，叼着一袋咖啡粉，神采奕奕地盯着他们。

　　“奇迹啊，喂我告诉你们我干了个通宵，我们穿越了…”橘子男指着他面前那台笔记本电脑，睁大眼睛盯着他们，激动得几乎手舞足蹈。

　　他们走过去，看到橘子男的电脑上显示着数个镜头，看上去是他遥控的飞行物。

　　韩凌枫被吓住了，他此前亲眼见过的顶多也只是熬了一晚游戏就像腌了一样的人，而这时橘子男看上去是打了鸡血，马上要蹦起来了。

　　“去吃饭。”维克多一脸严肃地看着他。

　　“额…”橘子男一看似是觉得这货态度极硬，便转向了韩凌枫，“这是我的机器人大军噢，无线电通讯，有太阳能补给的航母，运载机，半自动侦察机，工人机器人，可以连接到我的手机和电脑哦，未来拓展到智能眼镜上也不是不可能哟！”

　　韩凌枫很想回避他们在哪儿的问题，可觉得自己给朱梓一家带来了很多麻烦，于是还是问起这事儿来，后来对未知事物的神秘感觉完全把他吸引住了。

　　维克多却在一旁陷入了回忆，这是橘子男从高中时就开始设计的东西，从零件到芯片全是他自己弄的，橘子男在一旁用显微镜尝试雕刻芯片，维克多就在一旁优雅地恶心他，说橘子男的机械太丑，要设计成人形的才好。而工人机器人的设计就是来自这里。

　　后来他们认识了邓秋离，邓秋离就一直吵着要把机器人做成球形的云云。

　　维克多叫住了橘子男，朱梓她们还在等。另外，他们现在该关心这村子的情况了。

　　在曙光下的村子有一种细致而错杂的美感，看上去有近千人的样子，这些建筑都围绕着一个更高的山坡，那山坡上建这一座颇为原始又大气的巨石建筑，是祭祀用的。

　　这些东西虽然美，却带着一种恐惧感，因为它们完全不像是现实世界的。

　　朱梓笑笑，说她的妈妈就是那里的祭司。

　　食物是一只烤羊大腿，水果，泉水和一些面饼，都是手工收集的。盛放食物的是木板、瓷碗，陶瓷上画着很细致的彩画，有的是成群结伙的人，有的是花鸟、动物。虽说那画工已经超过原始社会的陶彩，而接近于青花瓷一类，从而趋近于现代的风格了，不过看那手工制作的精细，很明显这是一个处于半原始半封建的，与世隔绝的社会。

　　这是一件相当恐怖的事请，直让一行人头皮发麻，后背起鸡皮疙瘩，韩凌枫甚至手脚都有些发抖。不过现在明显不是讨论这事儿的时候，大家也只是沉默了。

　　朱梓与众人聊了一会天，朱梓说母亲很少在家，他还有几个婆婆，但她们住在河对岸，祭坛的另一端，平时很少见面的。

　　这些，就是朱梓的全部亲人了。

　　而他们的到来，也被部族的王、长老们知晓了，他们要见众人。

　　通过朱梓的介绍，大家渐渐对这个部族有了些了解，这里最重要的三个势力就是酋长、长老会和祭司们。祭司主要涉及文化方面的事情，长老会与酋长是作政治决定的人，比如决定扩张、移民，不过长老会才是真正着手处理的人，酋长的形象更多则是战士们的精神领袖，所有的男人们都从听他的号令。

　　这样看来的话，政治水平是比最初的封建社会强上不少的…维克多想着。

　　最后，一个成年男子带维克多三人去见长老，韩凌枫和朱梓回去照顾受伤较重的老潘。

　　路过一片空地时，韩凌枫看到几个精干的男生还狠狠地瞪了他一眼，这让韩凌枫感到不舒服。

　　“那人，最讨厌了。”朱梓说。

　　又回到了朱梓的家，朱梓向韩凌枫介绍了满屋的乐器、书籍，韩凌枫一时说不出话来，朱梓想了想，说：“我家的书是村子里最多的哦！”

　　“虽然大多都很无聊…”看到韩凌枫已经愣住了，朱梓嘟囔道。

　　过了好一会儿，韩凌枫忽然觉得朱梓的生活似乎少了些什么，他才问：“那你和你朋友们，平时玩些什么呢？”

　　“…”朱梓呆了好一会儿，然后说，“领居家有只长不大的小狗狗，白色的，我会经常喂它，它是我的好朋友。”

　　“可妈妈说，这样的狗永远比不得人，它们只知道趴在你身边，但有一天你若是走了，它会很可怜的。”

　　朱梓继续说着，声音越来越小。

　　不能同行，乃人生一大悲剧。

　　韩凌枫看着这个女孩，他之前所有的伤痛、疏远感、危险感全都消失了，这使他感到如此亲近。

　　“我们是从别处来的，我们那儿的人什么都能做出来，吃饱穿暖更是不成问题，我可以带你们去的。”韩凌枫忽然说。

　　可是他又感到如此弱小，他自己在城市里又算哪根葱呢？

　　“外面的人！”朱梓却忽然有些激动，起身在书柜里翻找着，“有一本古书里记载过，如果那是真的…”

　　朱梓从书柜里翻出一本老旧得发黄的线装书，看上去是用某种植物的细根装订的。

　　“虽然是抄本，但也是几十年前的了。”朱梓把那本书放在桌上，韩凌枫却已经陷入忧伤之中。 



'''







'''

/fst/sky/moon-river/One. The Eage/9.Soil.txt



　　韩凌枫或许是个自卑的人。

　　韩凌枫有很多梦想，他喜欢每一件看起来很棒的事情。

　　韩凌枫小学的时候喜欢某个内地明星，喜欢他美好的造型，羡慕他完美的帅气。韩凌枫听他的歌，自己跟着唱，把歌词歪歪扭扭地抄写在小纸条上，在音乐课上唱。

　　喉咙里发出的声音却像只跌跌撞撞的小鸭子，如此难听。

　　可是全班的同学都在看着自己啊，高傲又潇洒的男生们，漂亮可爱的女生们……

　　然后韩凌枫就逃跑似的窜下了讲台。

　　自己是个又黑又邋遢，什么事情都做不好的小男孩啊。

　　小时候同班的同学会钢琴、会吉他、会画画、会书法，、成绩超级好、去外地城市读书……自己却什么都没有，自己的一切都是弱小与怯懦。

　　后来去学了一点美术，韩凌枫觉得自己是个累赘，换了几个老师，却总是那种失望的眼神，好像是在打发自己，而自己总是只能画出一些烂东西，无丝毫美感。

　　学了一点音乐，却无论如何也做不好。

　　所以就慢慢地放弃了。

　　韩凌枫觉得，自己是不行的，只是享受着吹吹风，听听歌，就很好了。

　　只是苟且地来这世上活着罢了。

　　人间是泥潭，时间是烈焰，熏烤着魂。

　　韩凌枫觉得眼前一片黑，浑身沾满了灰尘，头晕、头疼，手边是一些杂物和散落的几块碎板子。

　　全身都在痛，脖子动不了。身体好像被一些杂物压住了，铁架床、塑料板……还好不是那些有着棱角的箱子。

　　韩凌枫努力地睁开了眼睛，一束阳光照射下来，照亮了眼前的碎屑和树叶。

　　一缕光尘在空中弥漫、飞扬。

　　韩凌枫一会儿醒来，一会儿又昏睡过去。

　　不知过了多久，隐约听到有人在叫喊，那声音有时小得像隔了墙，一会又大得刺耳。

　　过了一会儿，韩凌枫感到有声音传来了，头顶的灰尘和树叶落了下来，阳光烧得更旺了，烧得眼睛很疼。

　　半个小时后，维克多、邓秋离和橘子男把韩凌枫从车厢里拉了出来，韩凌枫的身上受了很多伤，几乎无法直视，但还好没有重物直接砸到他。

　　颈椎似乎受了挫伤，一动就痛得好像断掉一样，整个躯体像是要散架了，不知道胸膛里发生了什么事情，一动或是一说话就很疼，像是有骨头卡着。

　　韩凌枫的意识平静下来后，随即就被周围的景象给震住了。他们身在一片高大的树林里，那是一种以前从未见过的树，有着宽大的叶片，还有密密的气根。那辆大车就倒在一棵树下面，车身的铝皮都弯曲了很多。满地都是折断的枝叶，覆盖着同样茂密的杂草，看上去寸步难行。

　　像是他们摔下了山崖。

　　可当韩凌枫抬头一看，哪里有什么高速公路，四周俨然是一片原始森林，而这时他才明显地感到呼吸的空气，确实与之前也不同了。

　　自己躺在一块泥地上，这是他们刚刚清理出来的。

　　维克多半蹲在一旁，很娴熟地摆弄着酒精、棉布，看上去衣衫不整，有点狼狈，不过依然很细致。

　　身边似乎躺了个人，那是老涛，他还活着，只是整个上身被绷带和夹板包得很奇异，看上去伤得不轻。

　　“这是哪里？”韩凌枫觉得胸口有什么堵着，小心翼翼地挤着字。

　　“不知道。”维克多正从袋子里拿出棉签，准备给韩凌枫消毒。

　　韩凌枫觉得快崩溃了，很害怕，很担忧，好像什么东西在揪着。

　　真的是想死的心都有了。

　　躺在地上，那天空是蓝色的，有些奇异。

　　消完了毒，韩凌枫全身都在颤抖。而这次他隐隐也感觉到了什么不同。那种痛苦虽然强烈，却带着一种让人清爽的力量，就像是经历了脱胎换骨，迎来了新生。

　　当韩凌枫的意识清晰了一些之后，维克多收拾起一个帆布制的挎包，什么也不说，他又看了看老涛的状况，这才起身走到那辆侧翻的车旁。

　　橘子男正斜坐在车旁，从后车厢掏出了一些箱子，和其他完好的东西。维克多过去接过了这件事，并且费力地先掏出了几个看上去很结实的箱子，给了橘子男。

　　“不知道怎么回事，手机没有信号，看上去不妙，我们还是先保证安全吧。”维克多说，“然后，我们再想怎么回去，希望这鬼事儿不会影响到我们正常的生活。”

　　橘子男听到这话神经质地笑了笑，说：“我没意见的哦，只要我们几个不分开就没什么问题！”

　　“额…怎么说呢…你知道食人族的笑话没有？就是那种去自助旅游被抓住的，我看到过三四个了，有被打鞭子的有吞水果的还有上帝坑人的。”

　　“…”

　　“现在城市附近的野外应该已经没有大型野兽了，但是这世上荒唐的事情这么多，我们也不是没遇到过，谁也不知道会发生什么。总之我们可别遇到熊什么的就集体玩儿完了。”

　　“不过重要的东西大多没摔坏。有熊敢来我们就电翻！”橘子男看上去一点也不担心，反而又神经质地激动了，大声喊着。

　　不过他确实能做到，几十分钟后韩凌枫能半躺着了，就看到橘子男弄出了一些电路板和线路，有摄像头，还有一些黑塑料盒子一样的元件，韩凌枫不知道那是什么。

　　橘子男用那台似乎一点没事的笔记本弄着什么，似乎是在调试着那些东西。

　　“还是那个频段，维克多你的手机可以直接接收到信号！”橘子男吼着，维克多远远地应着知道了。

　　“韩凌枫你好像条死鱼…”在周围转了一圈回来的邓秋离调戏着韩凌枫。

　　“……”

　　“你真的好无趣噢！”

　　半个小时后，橘子男已经弄好了数个摄像头，红外感应器，他和邓秋离讨论了最佳的安放地点，完成了这个简直超出了韩凌枫想象的东西。而一旁那台笔记本电脑似乎自动监控着周围的反应。

　　维克多四处找信号，不过还是没头绪。心里想着为什么事情又砸了。

　　此前老涛醒过来了，和韩凌枫聊了会天。和中年人聊天总是你问我答莫名其妙的对方就不高兴了，不过这时候韩凌枫也根本不在意了。

　　老涛是受伤最重的，他整个撞在了方向盘上，七荤八醋的。

　　随后中午了，维克多拿出了一种和果冻一模一样的糖给大家，只不过味道酸酸的。

　　此前一切顺利，但没人觉得心放松下来了。

　　“刚刚邓秋离在周围转了一圈，但发现周围一百多米竟然一点都没有高速公路的影子。而且根据示波器卫星信号，3g信号什么的，什么都没有，反而充斥着一种一种杂乱而莫名其妙的微弱波动。”

　　“我真的不知道我们在什么地方，看这树，就像是YN而最大的问题是，我们的食物不多了，那些是紧急情况用的，我从没想过长期在丛林里生活。

　　韩凌枫觉得仿佛被一只巨大的手抓住似的，自己的学习一直都一般，偶尔也会想到被赶出校门的那一天，不过没想到它来得这样快，这样突然。

　　韩凌枫说了一声就走到周围转了转，一直到看不到他们，听不到他们的声音为止了。突然心里就有一种冲动，干脆一走了之吧，就这样远离所有会说话的东西，一直走，饿了随便塞点什么树叶，吃也好，饿着也好，能吃也好，生病了也好，活着也好，死了也没什么。

　　可就在这时，突然有声音传来。

　　一个女孩站在不远处，穿着豹皮的裹胸，手里拿着一把石矛，眼睛里满是好奇。

　　那一刻，穿过密叶的无数阳光，在她身旁盛开了。 



'''







'''

/fst/sky/moon-river/One. The Eage/17.The End.txt



　　一

　　轰鸣声预示着大难临头，撕裂一切的狂风席卷了整个世界！

　　韩凌枫被埋到土里，泥土在他的呼吸道内燃烧，卷起的湖泊将他包裹，他感到自己快死了，他头脑一片空白，躯体反而不受控制地疯狂挣扎着，散发着巨大的的活力。

　　雷声震耳欲聋，闪电夹杂在天地间。

　　躯体在被撞击，刮伤，韩凌枫慌了，难以想象这场灾难过后会怎样。

　　心脏不遗余力地跳动着，像是要从胸膛而出。

　　不知过了多久，头脑清醒了些，他这才发现风暴早就停止了，只是自己一直在眩晕。

　　他直接吐了出来，然后被呛到，他挣扎了几下，竟然挣脱了。

　　他正倒插在泥土里，全身都是淤泥、碎土。

　　全身酥软，脖子一动就疼，他跪在地上，用手把沾满淤泥的头抬了起来。

　　四周一片狼藉，简直是天灾的景象，所见尽是黄土、碎石，掩埋着倒塌的树木，一片绝望。

　　几分钟过去了，韩凌枫清醒一些了，看向四周，寻找事件的中心。

　　就在这时，大地剧烈震动，巨大的撞击声传来，韩凌枫摔倒在地。

　　他只看到在远方的天边，破碎的巨石诡异地悬浮着。

　　它们旋转，相互挤压，轰隆声仿佛暴雷。

　　天空变了色，整个世界笼罩在极端非自然的紫白色光芒里，仿佛末日来临。

　　韩凌枫歪歪倒倒地努力站起来，擦干净眼睛环顾四周。周围一片狼藉，他又看向那异变的中心，那团奇异旋转石头似乎稳定下来了，不再发出尖啸声。

　　韩凌枫呆住了，现在怎么办？

　　一双手拉住韩凌枫，那是浑身狼藉的维克多，他一条腿瘸了。

　　他仿佛要说什么，可就在这时，巨大的闪电一片惨白，爆炸声几乎要将人耳震聋。

　　仿佛一颗迫击炮在韩凌枫身后爆炸，世界一片白昼，仿佛神话中的永恒。

　　二

　　仿佛什么东西爆炸了，冲击波将阿龙震飞，撞倒在一片废墟上边，半截木桩与他擦身而过，五脏六腑一阵剧痛。

　　他慢慢站起身来，观察周围。

　　这是一间被震倒的屋子，木桩断裂，到处都是。

　　这是酋长大营的废墟。

　　纵火犯被压在一根巨大的木头下面，他呻吟着。

　　阿龙跑过去，奋力将纵火犯拉了出来。

　　阿龙虽然看上去比较清醒，可性情极端，他想要建军的承诺，他会做到底；而纵火犯是个很奇怪的人，有时对财富不屑一顾，有时却为了一点小事捅出天大的篓子。

　　他们之间的感情还是可以的。

　　“建军呢？”阿龙问。

　　“他当时离那颗手雷太近了，估计凶多吉少。”

　　阿龙一摇一晃地过去翻开废墟，最终他看到了建军的身体。

　　那句身体极其可怖，多处要害被弹片击中，内脏被震碎，多处骨折，看上去已经是不活了。

　　阿龙正灰心，忽然建军的鼻孔里钻出了一团灰色的物质，它似乎是某种活体。

　　阿龙不知道怎么办才好，这时他的手机忽然响了，很大声。

　　阿龙疑惑地拿出电话，他一般都是把电话调成静音或者振动的。

　　上边显示着未知号码，然后电话自动接听了，且调整到扬声器模式。

　　“我没事，把我带走……”电话里传来建军的声音。

　　阿龙呆住了，这时，建军尸体的鼻孔忽然钻出了白色的东西，奇异地蠕动着。

　　阿龙感到一阵恶寒，仿佛夜都变凉了。

　　“记得你的承诺……”阿龙颤抖地说。

　　此时，另一边。

　　“我们走！”维克多说。

　　韩凌枫跟着维克多，可总觉得少了什么。

　　“朱梓他们呢？”

　　“不知道，我们管不了那么多了。”维克多说。

　　朱梓怎么办呢？他们自己又怎么办呢？

　　剧烈的地震从身后传来，每几分钟就会响一声，仿佛摩天大楼在身后追赶他们。

　　“那是什么？”韩凌枫颤抖地问道。

　　“不知道。”维克多回答地很干脆。

　　不知多久过去了，两人遇到了橘子男，他看上去裤子都要吓尿了，怪叫不停。

　　韩凌枫正担心着，忽然“啪”的一声，他后颈一疼，晕了过去。

　　“你这是？”维克多问站在韩凌枫身后的霸哥。

　　霸哥一边看着那地震的来源，一边背起韩凌枫：“别看我，老大说让我弄昏他。”

　　几人来到了一片空地，身后的地震频率越来越快，仿佛摩天大楼奔跑起来了。

　　一名留着刘海的少年站在那里看着手机，他身后站着两名少女，一人短发，一人长发披肩。

　　地上是一堆白色宇航服。

　　“尼玛的，你不会是想要……”橘子男嚷嚷着。

　　“嗯，我给韩凌枫带了一件。”少年头也不抬。

　　终

　　高中毕业了，韩凌枫穿着一身黑色短袖，牛仔裤，看上去也是个成长了的少年了。

　　他万万没想到，毕业典礼上，讲话的竟然是回家乡考试的邓秋离。

　　她也留级了。

　　她竟然没有戴眼镜，没有扎马尾，穿着一身苏格兰格子衬衣，长发披肩。

　　她讲话。

　　“同学们，在人生的路上我们会遇到许多困难。

　　“其中有一些，会在一开始就令你措手不及。

　　“但不要放弃。

　　“学习是人的本能，人们无时不刻不在学习。

　　“也许头几次你会感到失望，头十几遍你会感到失意。你甚至不能告诉别人。

　　“但当你几十次遇到它呢？你可能会有些绝望。上百次呢？

　　“只要你还活着，你便是在克服困难。

　　“别放弃啊，只要你始终活着，你便能克服所有困难！

　　“…………”

　　讲毕，台下掌声响起。

　　韩凌枫听到这里，忽然很感动，十三年了。

　　可又一阵忧伤。

　　朱梓说过，人总是经历痛苦，才能变得顽强。

　　痛苦是生命的宿命。

　　一辈子要经历数不清的痛苦……

　　可他又想起邓秋离飘逸的长发，自己在梦中，吻过她呢。

　　秋风很清凉，芦苇远看像麦浪。 



'''







'''

/fst/sky/moon-river/One. The Eage/15.The Rebel.txt



 



'''







'''

/fst/sky/moon-river/One. The Eage/6.Malice.txt



　　醒来的时候，这世界都是疲倦的。

　　韩凌枫是个非常爱睡懒觉的人，常常一觉醒来就已经是大中午了，韩凌枫的妈妈说他什么也做不成。

　　不过韩凌枫倒是经常想，绞尽脑汁给雇主打工，拿微薄的薪水，如果一生就是这样，那么也无所谓了，倒不如浑浑噩噩地活着，似乎差不多。

　　自己本就是个平凡的人，如果非得说自己有什么独特之处的话，那就是怂，至少韩凌枫几乎没看到过比自己还怂的人。

　　无所谓。

　　不过今天很特殊，他身在一个陌生的环境，充满着好奇与警觉，在这种情况下，就一点也不困了。

　　可是韩凌枫感到自己昏昏沉沉的，好像被蒙上了一顶头盔。

　　随即另一种感觉又相继而来了。

　　果然又头疼了，还比较严重，真的是看来今天不好过。

　　韩凌枫经常会头疼，天一凉就容易头疼，不过他也不太在意。

　　看着玻璃窗外透进来的日光，似乎已经是中午了，只是光线比较暗，光线比较白。

　　韩凌枫刚一拉开被子，一股凉气就窜近了被子，冷得他感冒直竖。

　　这是……冬天么？现在不是五月份？

　　不过韩凌枫也没太在意，自己又不是什么大人物，不知道的事情还多，也又是某种气候现象吧。

　　小心翼翼地把胳膊探出去，韩凌枫把外衣拉住穿上，又赶紧把裤子也穿上。

　　韩凌枫头疼得把脑袋都歪了过去，好像是右边脑袋被人揪住了摔来摔去。

　　韩凌枫小时候肚子也疼，半夜的时候疼到蜷缩成一团，但是从没告诉过别人。

　　不过也许是因为这是小时候养成的习惯，韩凌枫对于这种头疼有着异乎常人的抵抗能力，而且无视痛苦，就像一只被绳子拴着的老母鸡，从小到大总是被绳子绕住了抬着一只腿跳……

　　其实早就习以为常了。

　　不过想到这里韩凌枫又觉得自己很傻，这种被绳子绕住一辈子的自豪感是哪里来的？！

　　穿好了衣服，韩凌枫把手机和借的充电器取了下来，放好。

　　韩凌枫像是变了一个人似的，安静地整理好被子，棉的质地有些硬，像是那种批发的，但是很干净。

　　昨天夜里韩凌枫很晚才睡着，反复地回想之前的遭遇，觉得事情很诡异。

　　母亲生气的样子很歇斯底里，父亲很极端，虽然不是很明显的奇怪，不过这是韩凌枫第一次见到这种样子的父母。

　　韩凌枫很不安，觉得父母应该是发生了什么事情，在这种情况下，自己真的能把他们就在家里么？

　　虽然还未打定主意，不过韩凌枫觉得自己有些想回家了，况且明天就要回学校了，韩凌枫今天肯定是要做一个决定的，是回趟家还是直接去学校。

　　还是直接回学校吧，书本、饭钱什么的，这周先借着，下周再做打算，回趟家把银行卡拿出来，这样的话打工什么的也能坚持一段时间。

　　只是心里稍微有些不安。

　　理了理自己的鸡窝头，似乎不那么乱了，可是肚子有些空，昨天吃了面包和几口啤酒，现在上的零钱都已经花得七七八八的。

　　但是自己是不能厚着脸皮找才认识的维克多借钱的。

　　韩凌枫是不情愿因为自己的缘故给别人造成麻烦的，昨天听说维克多要睡在驾驶座，韩凌枫想都没想就直接拒绝了，怎么能因为自己的缘故委屈车主呢？

　　不过维克多表示自己平常也睡驾驶室，而且他还懂得怎么保护自己的颈椎，这样，韩凌枫才觉得自己没有理由再拒绝了。

　　这当然是理所当然的事情，不用思考，也不需要去解释什么。

　　车的角落里摆着一些箱子，看上去很整齐，不过它们出现在这里是很正常的事情，韩凌枫随意瞟了一眼，打开门，走到了外边。

　　我晕，这是哪里？

　　韩凌枫只看到车窗外是一片荒凉，只有稀稀落落的几棵树，杂草丛生。

　　这是在高速公路？韩凌枫觉得自己眼镜快掉下来了。

　　自己不会真的被拐买了吧？原来人贩子这么面善？

　　下了车，韩凌枫发现自己是在高速公路的一个未建成的休息点，这里空空荡荡的，本该有休息处楼房的地方空无一物。

　　韩凌枫还处于呆滞状态，本能地找去维克多，绕着车走了一圈，发现不远处维克多正和另外三个人围着一口锅，正在边煮着东西边吹牛。

　　那三人两男一女，男的一个大概二十岁左右，白白胖胖的，戴着眼镜，动作一板一眼的；另一人看上去年龄稍大，皮肤很黑，很面善。

　　女孩子扎着干净利落的细马尾辫，戴着眼镜，皮肤很白很可爱。

　　随即维克多就看到了韩凌枫，笑着走了过来。

　　“你醒啦。快来吃东西。”

　　韩凌枫呆滞了，这到底是哪儿啊，自己是被拐卖了么？但是总觉得不像……

　　随即几人都看着他，其中那个女孩子的眼神有些怪，看上去很淡很熟悉，却又不太认识。

　　“邓秋离？”

　　这个女生是韩凌枫的小学同学，学习一直很好，初中毕业后她就去了省会城市读书，学习好人缘好，一直让韩凌枫心里很是羡慕。

　　六年的同学使得这个人已经深深地存在于韩凌枫的心中。

　　那时的她是一只活泼的小老虎，而现在多了沉默和空灵。

　　“来我给你拿碗筷。”年龄大一些的男子很随和，很热情地站起来，出现在一旁的简易桌附近。

　　简易桌……这帮人是倒斗的么？

　　“哎呦，变帅咯！”邓秋离打趣地说，这让韩凌枫不知所措。

　　“知道你有很多疑问，不过还是吃过了再告诉你。”邓秋离一只手斜托着下巴，说。

　　这种情况韩凌枫从没遇到过，但是身在高速公路上这一事实对他的冲击实在太大，试问有谁遇到过这样的事？

　　韩凌枫心里有小小的奇怪，于是微微举起手中的碗，指着一块煮鸡肉说:“该不会有蒙汗药什么的吧？”

　　邓秋离则满脸黑线地看着他:“你当我们是来旅游的，我们是来打工的！当然有自己的事了！”

　　邓秋离还是很可爱，韩凌枫虽然觉得有些不习惯，却还是很高兴的。

　　但是心里似乎有什么东西堵住了似的，这一顿饭吃的很难受。

　　那个中年人叫老潘，特长是做饭，眼镜男很单纯，大家都叫他橘男。

　　然后只剩下韩凌枫最后吃完，桌边也只有维克多在那里，其他人则是收拾东西去了。

　　韩凌枫说：“那你们还要去哪里？我今天要回学校。”

　　“韩凌枫，听我说，你今天恐怕回不了学校了。”维克多看着韩凌枫的眼睛。

　　“为什么？”韩凌枫感到莫名其妙。

　　“其实如果我们早一点认识，那么你可以看到建军在这里。”维克多拿起自己的手机，点开了一个视频，“我们是一个团队。”

　　“OFU工作室。”

　　韩凌枫看着那手机屏幕，是一个人拿着手机悄悄地走进一个昏暗房间，然后房间里坐着一个矮瘦黑的成熟男孩，那是建军。他面前开着一面显示器，上面有一些奇怪的波段。

　　“什么情况？”

　　“韩凌枫，我要告诉你一件事，”维克多幽幽地盯着韩凌枫，“那是脑电波的图段，有关人的感情。”

　　“建军在做用电磁波袭击人类大脑，从而控制人们情绪的实验。”

　　怎么可能？韩凌枫呆住了。

　　“我们一直都低估建军了，这小子真不知道是怎么回事。”

　　“而且我们可以肯定，建军袭击的你的父母，使用无线电阵列。”

　　“总之，你不能随便回家，不过没关系，你应该不会有事。而且，你只有这一个选择。”

　　“为了表达歉意，我把它送给你，它的名字叫‘恶意’。反重力的哦。”

　　维克多突然就起身走了，只丢下一个黑色的手环样的东西，竟然飘浮在地面上。 



'''







'''

/fst/sky/moon-river/One. The Eage/16.The Crack.txt



 



'''







'''

/fst/sky/moon-river/One. The Eage/2.blessing.txt



 　　“你就这样活着吧！”黑暗中有人竭力嘶吼。

　　像是本呆在鞘里的剑被人猛地抽出，刺眼的白光充斥着每一寸角落，灼烧着他的眼睛。

　　男孩的眼睛猛地闭上了，他虚弱地惨叫了一声，用双手把眼睛蒙了起来。

　　“别乱动，你的脑袋还有些晕吧。”光线暗了一下，韩凌枫的眼睛眯开了一条缝，一丝笑容浮现面前这张年轻男人的脸上。

　　韩凌枫真的安静下来了，手也不再抖，开始屏住呼吸。几分钟后，他克服了恐惧，耳、鼻、触觉、还有闭上的眼睛开始以他此生从未有过的高效率进行着工作——精神已经紧绷到了最大程度。在陌生的环境下，肾上腺素被以超快的速度分泌，流遍全身，所有感官都在尽最大可能地收集着周围的信息。

　　自己正穿着一件粗糙的衣服，这是廉价批量生产的，就像医院里的那种一次性病号服。

　　真是奇怪，那个男人的声音里明明是一种淡然、僵硬的陌生，却又是那么的有道理，好像他说的话就是对的，是为了你好。

　　“呼”。

　　眼看躺在手术室里的少年已然安静了下来，维克多才安静地呼了口气，双手铁爪松了下来。

　　“你昏迷了，我们要对你进行一些检查。”平静的语气好像是水。

　　“检查？……你不是医生！”韩凌枫的反应很快，面前是一个很干净的年轻男人，整齐的头发，黑色的休闲西装。

　　维克多此时有些犯难了，不好解释不好解释不好解释……

　　“我们是……私人医护组织。”维克多说，语气很平淡，他本来就是私人医护人员，或者医学爱好者什么的，也就是说，如果韩凌枫的身体出了问题他可能还得承担法律责任。

　　韩凌枫这才安静下来，但是此刻他的脑袋里只觉茫然一片。

　　私人医护组织，那是什么？自己为什么会晕倒？自己……现在在哪里？

　　总是觉得奇奇怪怪的，不过维克多的检查都是很专业的样子，而且还让让他听得明明白白，维克多的能力，倒是令韩凌枫不自觉地相信了他的话。

　　韩凌枫能动自己的手了，他发现身上没有任何管子电极什么的之后松了一口气，揉着自己的太阳穴，从手术台上坐了起来。

　　眼前的男人很眼熟，就像是电视剧中经常出现的那种男人。

　　优质、干净、穿衣服有品位的人竟然真的出现了！

　　韩凌枫看了看四周，他现在正在一个狭小而且很暗的空间里，手术台旁的柜子上放着一盏台灯是唯一的光源。

　　两旁都堆着一些箱子，角落里还有一些金属器具反射着一块块的光点。看上去这个房间在正常情况下是用来放置杂物和器具的。

　　“这里是哪里？”韩凌枫提高了警惕。

　　“这里是救助车，你的大脑受到强电磁波的影响，暂停了工作，不过很快就恢复了。”

　　电磁波？

　　救助车？

　　“你是誰？为什么我没有在医院里？你们没有把我送进医院里么？”

　　其实韩凌枫想问一句，自己的衣服是不是他们帮自己换的，因为他现在正穿着一件白色的粗布衣服。

　　但是这个念头一冒出来就被他自己否定了。这个问题不是废话么？这样感觉自己就像“被救的小姑娘”什么的……

　　这是什么鬼主意……韩凌枫“唰”的就把这个念头抛在脑后了。

　　“我叫维克多，他们也都叫我维克多。”

　　维克多拿出了口袋里的一则证件，上面的“姓名”一栏里写着“维克多”。

　　“维先生？你不是姓维吧！”那眼睛真是瞪得有汤圆那么大。

　　“是的。”

　　“哼哈哈哈哈哈哈！”韩凌枫觉得胸口有股气不受控制地被挤了出来，顿时笑得像猪似的。

　　“我能出去看看么？”韩凌枫觉得不知道怎么回事，他觉得面前的这个人有些奇怪，小声地问道。

　　“恩？”维克多眼角闪过一丝厉色，挺拔地立在黑暗中，活像一个魔神。

　　吓一跳。



'''







'''

/fst/sky/moon-river/One. The Eage/10.Sky.txt



　　未知地点，车祸第二天。

　　一阵冷冷的风吹来，冻醒了蜷缩着的韩凌枫，他使劲裹着一床单薄的硬被子，全身散发着稻草的味道。

　　寒气逼人，过了好一会儿，他挣扎着从床上爬了起来。

　　这是一个介于古代宅院与部落山寨的房间，周围的一些木制家具摆得很紧凑，到处都是书，韩凌枫借着床前窗外的银白月光，寻找能御寒的东西。

　　最后他在一个精致的木衣柜里找到了很多被子，把自己裹得严严实实的，才开始暖和起来。

　　停止颤抖后，韩凌枫开始回忆起之前的事情。

　　路很远，昨天夜里他睡着了。

　　这个略窄的房子有些乱，不过里面的东西都很精致，看上去不太像韩凌枫所见过的村子，完全不像。

　　然后韩凌枫开始发呆，他最擅长发呆了。

　　很长时间过去了，有光穿过窗纱，那是诡异的血红色，投影到房间里，成了一块红斑。

　　像是地狱的风景。

　　这一幕把韩凌枫吓坏了，他听见自己的心跳像是敲鼓声，几乎挣破胸膛跳了出来。

　　当他感觉自己又能动了，就撩开了那手织的芦苇窗纱。

　　看着窗外的景象，他呆住了。

　　那是一片血红色的天空，万里无云。远方地平线上露出半个圆，穿过万里长空的金色光芒像一个巨大的瞳孔。窗外是斜坡，坡下错落着一大片木屋，全用茅草盖着顶，再远方有茂密的森林，在红光下成了墨一般的颜色。

　　这是一个极其美丽的村子，很多屋子旁摆放着各种器具。村中有河流过，临近的房屋装有水车，远处被河流分成两边，一边是树林，一边是农田。

　　韩凌枫难以置信地望着窗外的景色，好像那窗子里只是装着一个瑰丽的红宝石。

　　良久，他一点都不困了，打开一扇木门走了出去。

　　这小屋落在一片不高的山坡上，草地上参差地长着野花、蒲公英、土拨鼠的洞，还有一条窄石板路，而一条河就从韩凌枫不远处流过去。

　　它们在血红色的清晨里显得很魔幻。

　　空气好像水洗过的，充满了活力，风会流过你的身体，牵你的头发，因为风是另一片海。

　　韩凌枫的腰还有些疼，他情不自禁地坐到那山坡顶，看着这个村子。

　　这真的是个村子，完全不加规矩，看不到一点深色的工业时代的产物，韩凌枫有种错觉，他是不是走进了一部电影？

　　那金色的瞳孔好像又睁大了，天空中的红色在渐渐消褪。这时有笛声传来，韩凌枫看到那个少女坐在不远处的草垛上，一旁还有一只白色的小狗。

　　朱梓拿着一支竹制的笛子，在清晨吹长笛，狗四处嗅着，时不时望向遥远的地方。

　　音乐声在风里流淌着，就好像她其实是在风里吹笛，那个身影只不过是个背景。

　　韩凌枫琢磨着自己是不是该走近，最终还是停在原地。

　　过了一会儿维克多从山坡下走来了，他眼眶发黑，看上去很虚弱，昨晚怕是一夜没睡。

　　“很抱歉啊，你旷课了，这下不好说了，我们现在在哪里都是个问题。”维克多说。

　　“噢。”

　　韩凌枫啥也不想干，他本就不想回去，他无所谓的，可维克多正看着他，于是他只好又开始摆弄维克多的手环。“恶意”啥的叫出名字来太傻，于是韩凌枫直接称它为“手环”，这样好多了。

　　手环在手臂上滑来滑去，虽然有重量，却感觉不到摩擦，就好像很神奇，好像这是一种并不存在的东西。

　　维克多本来有很多话想说，想说他对红色清晨的一些猜测，他还想起了那个女神一般无暇的女孩青洒，想起了曾经迷茫的自己，他想说不够好是因为没人爱。

　　可却说不出口，于是维克多也放弃了，和韩凌枫安安静静地吹风，听朱梓吹笛子。 



'''







'''

/fst/sky/moon-river/One. The Eage/3.Home.txt



　　夜幕漆黑，星空稀稀落落的，隐约可见树影。

　　韩凌枫觉得自己本来就不聪明，这样一弄说不准还会影响以后的智力发育。

　　诶，真是什么奇怪的事都有，倒霉真是没下线的……

　　“你没事吧?”一旁的维克多关心地问道，“是不是有点冷？”

　　“没有！”韩凌枫反应过来，几乎想举起双手作投降状，心说你都那么牛了还不给人点空间啊！

　　韩凌枫和维克多两人正站在市运动场旁，之前韩凌枫昏迷了五个多小时。

　　那辆干净的白车停在路旁，车牌上写着“XHNN361”，韩凌枫不经联想起一群黑的黄的白的猛男穿着各大名厂赞助的战袍在高档的运动场内打球，场边有欢呼的球迷、皱着眉头的球迷、安静紧张的教练、一脸没表情的新闻工作者……一时间浮想联翩。

　　但是很难想象这辆车里是一个储物室兼小型急救室，之前自己就是在那里被救了，韩凌枫不知道维克多为什么会救自己，真是一头雾水。

　　现在人家还要把自己送回去，还让韩凌枫回去后最好去医院脑科做个核磁共振……

　　“你知道圣诞节是什么时候么？”维克多忽地问到，像他这样板着一张脸的帅哥穿厚了就像快冻住一样，表情更加凝滞了。

　　“额，十二月份吧……”韩凌枫倒是被问住了，据说这世上节日挺多，像情人节都是每个月都有，还是不同颜色的，还有不同的象征意义。只可惜韩凌枫这样的男子无福消受。

　　到不是说韩凌枫不该得到平等的待遇，只是似乎这世上有些人便是这样，永远都是最平凡的那一个。

　　那是人家的节日，不是自己的。韩凌枫从小学起就天天有听到那些可爱的女生在聊各种节日，什么光棍节、白色情人节愚人节各种节不管是社会承认的还是网友自命的，都与自己无关罢了，鬼知道为什么那些漂亮的女生就能享受它们，天知道！

　　在韩凌枫的记忆里，邓秋离便是这其中最活跃的一个。

　　那个自小便被公认的小美女，似乎没有人真正夸过她漂亮，似乎也没有女生因为她的美貌而嫉妒她，大家只是根深蒂固地承认了这个事实。就好像每个人只有把自己最好的一面展示给她，把祝福都给她，宁愿默默地欣赏她的美也不愿去触碰，好像她就是女神，她该漂亮该好。

　　在韩凌枫的记忆里，唯一有人对邓秋离做过的最过分的事情，也就是那个又帅又开朗的男生趁她不在时偷穿她的衣服，还笑着给人家看。

　　当时很美很可爱的邓秋离笑了，露出两颗小虎牙，皮肤白皙得好像玉石一般，三下两下就把自己的衣服从那个娘娘腔身上扒了下来，不再理他。

　　但是自始至终，邓秋离都是笑着的，给人的印象便是真善美！仔细一想还是真善美！

　　还记得顾小蔓在狂热状态时，总是拉着韩凌枫做一些他以前不知道的游戏，比如真心话大冒险啦，写小说啦什么的。

　　顾小蔓和女闺蜜在某街吃串串烧，紧急召唤韩凌枫，韩凌枫在半小时内就屁颠屁颠地出现了，整个行动没有任何亮点，成功贯彻了“万事低调”的原则！

　　整个游戏过程依然保持低调和一种原始的神秘感！韩凌枫觉得自己像是一条狗，在女主人及其好友或者是及其同伙的指使下开心地完成了一系列不礼貌的“犯罪活动”，然后悠然逃离现场。

　　但是在独自回家的路上，韩凌枫觉得自己始终是个局外人，但是没有什么不对头。

　　顾小蔓在这种场合举止大方自然，就好像是生长在其中的一棵树，享受着适宜的生存环境和新鲜的空气。那是别人的大冒险，是顾小蔓的。

　　那时天很黑，风吹着很冷，韩凌枫穿得很厚。

　　“怎么突然问这个？”韩凌枫注意到维克多还在看着自己，马上回过神来。和别人交谈时走神是不礼貌的。

　　维克多淡淡地笑了：“可能看到戴圣诞帽的兔子哦。”

　　“额，什么……”韩凌枫真心没想过这个问题，想着这人帅爆了。

　　维克多没有再说话，韩凌枫的脑子里却是像炸开了锅，自己会说话吗？这样别人怎么说话啊！

　　韩凌枫难得这么认真地说话，他觉得自己应该做些个什么动作丰富下肢体语言，比如搓手什么的，不过总感觉这样就有些虚假的样子了，于是干脆站着没动，倒像个灯光下的小木偶。

　　“你不知道，这是异常天气。之前我的手机收到气象预警了，是冷空气袭击江城，之后两大个多小时气温就开始下降。”维克多的表情更少了，整个人像是座冰雕，“反常天气。”

　　这下韩凌枫是真的无话可说了，不知道怎么办，他觉得自己该说一句“我的手机没电了啊”，但是想来想去觉得太牢骚而且不礼貌，于是便只得盯着维克多看。

　　几分钟过去了，维克多转身走向那辆加大型的白色救助车，说：“走吧，我送你回去。”

　　深夜里的江城是安静而空旷的，在橘黄色的光线尽头，树影像犬牙一般交错，像是韩凌枫本子上缭乱的笔画。

　　“恩恩我家就在那前边……多谢了！”韩凌枫从副驾驶座上站了起来，尽量让自己表现出感激和高兴的感情，其实他自己心里确实是感激、高兴，但是脸上却是没有表情。

　　也许感激之类这些东西放在心里就好吧？这样反而有些做作，不过韩凌枫觉得不作任何表示也不太好，于是就尽量让自己动作语气自然些。

　　“你白天的时候最好去医院脑科做个检查。”

　　临走时，维克多深深地看了韩凌枫一眼。

　　“谢谢啦！”韩凌枫说着，裹紧了那件维克多赠送的粗制病号服，下了车，回头招了招手。

　　白色大车闪了闪车灯，安静地开走了，转过路口，只有黄白色光柱穿行在黑夜里。

　　韩凌枫独自走在家门口，那条不知走过千百遍的小径上，那盏年龄比他还要大的路灯，把光打在他的背上，韩凌枫第一次欣赏这里的夜景。

　　还好吧，四周安静极了，是那种童话里的小妖精会出现的场景啊！夜幕下的小排楼像是带着中山帽的老头，韩凌枫的心情从未有过的舒畅。

　　漫步走过门口的小花园，比夜幕更发黑暗的树枝在地面生长。

　　韩凌枫想起小的时候若是回家晚了，夜幕下的小树林在韩凌枫眼里便是可怕的，像是有什么怪物藏在树叶间沙沙作响，或是在你身后尾随着你。

　　所以小时候的韩凌枫每次都是心惊肉跳地用自己最快的速度跑过这里。

　　走上楼道，楼梯的扶手上全是灰尘，在月光下潜伏着。

　　少年时代的韩凌枫总是背着大书包走路回家，而这节楼梯便是他长途跋涉的最后一段路程，极其的锻炼身体，但是走过这段路程，也终于回到了家。

　　韩凌枫来到家门口，门掩着没关，韩凌枫轻手轻脚地溜进去，摸到自己的房间，便直挺挺地倒在床上，心累啊！

　　这一天，太扯了。 



'''







'''

/fst/sky/moon-river/One. The Eage/5.Night.txt



　时值二零一三年年五月二日晚。

　　夜晚街道上很多车，人很少，行道树很多，在夜色里张牙舞爪的。

　　黑暗里点缀了无数光影，那是炽白色街灯和一些不关门的店家，比方说韩凌枫之前呆的那家网吧。

　　韩凌枫不知道自己该不该说话，与父母吵架离家出走，却是被刚刚认识的神秘哥子“抓”到，这怎么说也像是神转折啊，而且这几天发生的事都像是神转折。

　　虽说这世上那么多未知的事情，可是对一个普通人来说，哪有一天之内就遇到这么多稀有的事情？这什么情况？自己莫不是被什么人盯上了吧？

　　话说人类的感知其实还是十分强大的，至少有些时候遇到恶意，即使你没反应过来，但还是会感到有些奇怪。

　　当然，很多时候我们即使感到了奇怪，却还是没能找到怪异感的来源，这也是很多悲剧发生的原因吧。

　　韩凌枫在这方面感到无能为力，他还很小的时候也很调皮，喜欢从背后偷偷蒙住好朋友的眼睛、趁爸爸睡觉时悄悄地走进去看着他什么的，但是别人经常能一下就发现自己，而且制止住了自己，韩凌枫确实没有这个能力，常常遭殃。

　　所以韩凌枫也默认了，自己没有这方面的能力。

　　夜幕下的天空黑的像是一面镜子，你因好奇而在半夜去看的那种镜子，像黑色的大理石，深邃又神秘。

　　而韩凌枫就像这巨大夜空下的一只小蚂蚁、没头苍蝇什么的，燃烧着忧愁的火焰。

　　我应该说些什么吧？应该找些什么来聊吧？维克多这家伙，沉默了……聊啥呢？

　　自己刚刚莫名其妙地被从网吧抓出来，还是被一个只有一面之缘的家伙，他就像从青春偶像剧中跑出来的人物……是的，青春偶像剧里跑出来的，这家伙……

　　韩凌枫想着，一身不自在。

　　想到后来韩凌枫觉得自己就像是把难题都推到维克多身上了一样，像是那种因为自己的条件没有别人强就把错误乱推的……行为一样。

　　于是韩凌枫就不想了，开始学企鹅走路，想着它走起路来一摇一晃的样子。

　　这也是一种信息交流吧，韩凌枫这样想。

　　身旁的维克多穿着针织衫，外套某种白色动物毛制成的背心，围着黑白格子围巾，黑色的头发几乎挡住了他的黑色眼睛，彩色方框眼镜把他的瘦削脸颊衬托得很完美，脸白得像是某种玉雕，表情无可挑剔。

　　维克多带着韩凌枫穿过空荡的马路，拐了个弯，路口边停着一辆白色的大车，比韩凌枫看到过的医院的救护车还要大一点，停在在快掉色的停车线内。

　　维克多走到车边，凌厉地用钥匙打开车门。

　　韩凌枫从白天起就有一种感觉，好像维克多的说话方式、动作习惯和平常的人不太一样，带着某种规范，好像曾经对每一个动作都有练习一般，而这种感觉似乎只有在军人身上才普遍存在。

　　据说西点军校的军人们连吃饭用叉的动作都是规范了的，什么手臂与手肘的角度啦，右手持餐刀切了牛排之后左手持叉的旋转啦，如果不合标准，会受到惩罚。

　　可以想象西点军校出来的军人身上每一个动作都是经过长年累月的训练的，而维克多走路的姿势、拿文件纸的姿势，熟练的开门动作，就给人这种经过打磨的军人气息，恍若一个铁人。

　　韩凌枫不知道自己与这样一位男神能沾什么边。

　　小时候妈妈总是对韩凌枫说，你看别人家的孩子才多大一点，钢琴就十级了，多厉害，直接就可以当钢琴老师了，一堂课一小时收两百……

　　而韩凌枫知道，钢琴跟天赋有关，不说什么乐感、节奏感、“从娃娃抓起”啥的，如果小孩子的手指天生不直，那敲琴键是没有力度的，而这样都还不放弃钢琴，唯一的办法就是把那只手指的指骨敲断重新接上。

　　诸如此类还有很多。

　　厉害的人就是厉害，闪闪发光。

　　其实韩凌枫也学过几个月的吉他，韩凌枫也从来没有怀疑过自己的天赋，韩凌枫知道，天才都是百分之九十九的汗水加上百分之一的灵感才能被称之为天才，那些在某方面著名的人，都是比任何人都要勤奋。

　　韩凌枫从来没有觉得自己比别人差，所以他的妈妈和朋友——一个音乐老师来家里作客时，韩凌枫就被夸“手指肉垫好肥”、“适合弹钢琴”云云，然后询问韩凌枫要不要测试一下节奏感。

　　韩凌枫答应了，他从没练过什么节奏感，只是大概知道是什么样的意思，但是那是专业术语，专业术语啊！听起来就好专业的好不好！

　　此音乐老师出了三道节奏，韩凌枫惊呆了，他没想到节奏这么长，而且一道比一道长，于是全败。

　　于是“节奏”一词从此再没被韩凌枫说出口，这个效果贯穿他的童年。

　　韩凌枫觉得，自己是没有音乐天赋的那种人，但是和之前一样喜欢听歌，乐器什么的，自己能弹给自己听就行了吧。

　　此时，维克多已经上车，然后喊着韩凌枫。

　　“你为什么来找我？……你是怎么找到我的？我跟你不熟！”韩凌枫猛然回过神来，大声地问维克多，此时，雪亮的前车灯被车内蓄电池的电流点亮了，四周一片明亮，一些铝合金卷帘门上反射出银白的光芒。

　　这灯光在漆黑的大楼房，黑色的树包围的街道上，像是一把火炬在流转跳跃。

　　韩凌枫觉得根据自己的性格，半夜跟着一个今天才认识的人在街道上有些不大可能，但是此刻这事情就是发生了，维克多的身上带着某种正义的气息，那种优秀的孩子身上带着的那种气息，那种军人的气息，你一眼就看出来他不是坏人，因为你习惯了，这样的人都是很好很优秀的人，他的行为也无可挑剔。

　　维克多的声音从车里传出来，还是那样的没有感情，但是给人一种平实的亲和力，这是韩凌枫听到过的维克多的最大的声音。

　　“我们就是来找你的。我和你的室友，建军……我们很熟。”

　　韩凌枫怔了一下，他没想到自己沉默寡言的室长居然会和别人交流，真是闻所未闻。

　　变形金刚一样的人会和别人交流吗？一个在一年里话都不说一句天都不聊只是像机械一样重复学校规定的人，会这么隐蔽地和外人有如此感情？还让维克多这样的人在夜里到处跑？不过话说回来维克多到底是怎么找到自己的啊……

　　这么说来这事儿是与建军这个妖人有关了？韩凌枫心里打下了无数的大大的问号。

　　建军是一个什么样的人呢？又瘦又小，面无表情，年龄比韩凌枫小，实在初中同学里最让韩凌枫信服的人，而且是韩凌枫的室长。

　　在班里，建军不太有存在感，但是他是那种你打心底里佩服，不愿去冒犯的那种人，也是韩凌枫的室友，一个不冷不热的人，一个班主任一提到就满脸是放心的人，一个班级里幽灵一样的人……

　　这些加起来，就诠释了形容一类人的词语：“学霸”、“学神”、“男神”、“某神”，每一个用在他的身上都是那么合适。

　　建军是韩凌枫所认识的人中，唯一可能比维克多还要优秀的人，对韩凌枫来说，建军和维克多这两个名字，意味着的是优等生的世界，一个突如其来的，充满未知的，光明的世界。

　　人或者飞蛾，诸如此类，终究是要循着光明而去的。

　　这时维克多也愣住了，车前窗里的那张脸在黑暗中模糊不清。

　　他有些犹豫地说：“额……这里有些事和你有关，只是想和你说清楚，来龙去脉。邓秋离在，还有……顾小曼的事。”，那声音很自然，是在说一件正经事的语气，就像是电视剧里的一句话。

　　韩凌枫小时候和爸爸妈妈一起看电视剧，觉得很喜欢其中的人物说话的方式，但是自己每次去模仿，总是感觉自己很卑微、或是有人拆台什么的，慢慢地他也承认了自己学不像……没人学得像，韩凌枫后来便不再模仿电视剧里的人说话了。

　　此刻，维克多的声音很清晰，没有一点异样，简直是完美无缺！

　　“喂，一起走吧。”

　　韩凌枫忽然感到一种正面的力量，他觉得自己也将有机会变得很好。

　　韩凌枫再一次登上了这辆车，轻微的点火声响起来，维克多开的私人医护车启动了，它在微微颤抖，快速地从车位里移了出来，开入了交织的城市街道，开入了茫茫的黑夜。

　　看着窗外巨大的阴影和自己的模样重叠起来，韩凌枫有一种自己正在踏入黑暗中的感觉。

　　不过也没什么关系了，自己……本就是半只脚踏入黑暗中的人。

　　韩凌枫沉默了。

　　很久了，韩凌枫躺在狭小的床铺上，手机屏幕温和地发着光。

　　此时此刻，那些微小的声音，车声、说话声、孩子的哭声都像挤海绵一样一点点地消失了，所有的东西都像是打上了黑色的漆。

　　夜已深了，韩凌枫心里的不安奇怪地都消失了——任何东西都是可以用时间和黑夜洗净的。

　　韩凌枫小时候白天在外疯玩，说话不经大脑思考，晚上睡觉时想起那些白天的片段，觉得自己做了好多好多的错事，把头都埋在枕头下面懊悔。

　　初中时韩凌枫觉得自己应该可以去离家不远的小教堂忏悔一下什么的，那里经常空空荡荡的一个人都没，又会在周末传来大声地唱诗声，不过后来因为被哪里的一个阿姨吓到，他就再也没去过，这个想法像是在他的脑子里凭空地消失了一般。

　　这应该不算是懦弱吧，自己是个懦弱的人吗？有时韩凌枫会这样想。

　　如果韩凌枫还有谁是他永不离弃，永不怀疑的好朋友的话，那便是这无边的夜色了。

　　大大方方的手机屏幕此刻染上了一层黑暗，韩凌枫把屏幕亮度调到了最低，那电池凭借30%多的电量也支撑不了多久了。

　　他躺在房车后的简易床上找不到事情做，车好像停了，维克多不知道在哪里睡觉。

　　之前心里有种预感怂恿着他把《应急外伤处理》快速地翻了一遍，然后就是完全找不到事情可做了。

　　他习惯性地打开抠抠，翻了那些狗血的说说。

　　“……以后我们要做完所有的姿势……”

　　“某某某生日快乐，多的就不说了哈，今天是一起走过的第X年……”

　　“24h秒赞平台……”

　　…………

　　跟自己一点关系都没有，韩凌枫看也不看，直接翻过去了，然后又无聊地打开联系人看了一遍，试着想想有什么思路。

　　但是一点思路都没有，会帮他忙的那几个人不在他的好友列表里，早就把韩凌枫给删掉了，或者是被韩凌枫自己给删掉了。

　　曾经也是在这样的深夜，韩凌枫迎着雪白的显示器，默默地把顾小曼的说说从头到尾翻了一遍，从小学到初中毕业，像是跨越时间地去看望她。

　　又是在这样的一个深夜，韩凌枫纠结地发了当天的第一条也是唯一一条“顾小曼生日快乐”，还全好友地求赞，但是最后看着那条苍白又乏力的孤单的说说只收到了可怜的三四个赞，又是怕顾小曼会生气，想要删掉，人家不是更会生气？

　　顾小曼自始至终没有提到过这件事，鬼知道她在想什么。

　　有时韩凌枫会发疯般地在朋友圈里找一个人，然后点掉“清除访客记录”有时他会翻出几年前的一篇帖子，一个一个地思考每一个出现的ID，即使当时它瞬间就石沉大海，有时韩凌枫把一个人几年的说说从头到尾地翻一遍，像是陪她走过了漫长的岁月。

　　有些东西很小却很重要，对你而言。

　　手机屏幕上弹出了电量不足的提示，韩凌枫再也找不到事情做了。

　　他的手机上只存有父母的手机号，而如今发生了这么奇怪的事情，韩凌枫的心里总是像有一个小小的声音在说：“不要给他们打电话……他们是多么危险啊……”

　　韩凌枫关了手机，四周的黑暗像雾一样又笼罩了整辆车，两米多的车顶此刻像是摔在土里的白面馍一样。

　　这两天发生的事情都太怪异了……无法解释的眩晕、陌生人、医疗爱好者、那恐怖的无名火……如果都加起来……不像是正常人会遇到的事啊！

　　那种不安又渐渐地占据了韩凌枫的身体，让他无法入睡。

　　夜晚，时间飞速地流淌，以那种不为人知的方式快速地溜走，气温在持续地降低，霜花沿着窗边在攀爬。

　　当你醒着时可能察觉不到气温的变化，但在你熟睡时，时间就像个会变戏法的家伙，它的魔力使你惊叹。

　　韩凌枫已经睡着了，不过就在几十分钟前，他还醒着的时候，突然很想有个熟悉的人在身边。

　　无论那个人是谁。

　　顾小曼也会有这种感觉的，是的，顾小曼是个女花痴，一有帅哥招呼她她就会头也不回地走掉，还把韩凌枫的故事当做笑话来讲，把她拍到的韩凌枫的尴尬画面和聊天记录拿出来秀的……

　　夜也沉沉地睡去了，整个车厢里只有韩凌枫的手机屏幕上绿色的LED灯间歇地亮着，带着颗粒感的绿色光芒在四处反射，像是有精灵在轻声唱着安眠的歌。 



'''







'''

/fst/sky/moon-river/One. The Eage/13.The Island.txt



　　一

　　天空破碎了，狂风席卷了暗淡的海面。成群的海鸟飞过天边，这座岛屿快被吹散了。

　　韩凌枫在岛上，岛上有座旧公园。

　　公园废弃很久了，栏杆已经生锈，枯叶满地。

　　天空黑下来了，夜风刮着残叶，像是灾难后的废墟。

　　韩凌枫来到一棵树下，那里有个女孩。女孩扎着利落的马尾，斜刘海，脸庞洁白又空灵，她是邓秋离。

　　没有人说话，她抱住了他，女孩的身体很柔软。

　　她吻了他，感觉就像是温暖湿润的果冻。

　　静。

　　韩凌枫醒来时，天空微微泛红，朱梓在营地对面睡着了，很安静。

　　梦里的吻算是初吻吗？

　　我又怎么会梦到邓秋离呢？那是个很厉害的女孩子，她很可爱，可你能感觉到她眼睛里的淡漠，她的情绪不像是真的，即使她也很孤单。

　　翻来覆去睡不着。

　　他也发短信说过要吻顾小曼，而且说得很英伦风，然后顾小曼把他甩了。

　　想来很奇怪，不过顾小曼是个疯婆子，这就很正常了。

　　天空慢慢地亮了起来，其实他已经不想再逃了，再逃能逃到哪里去？一路上他们已经看到几座通信塔，甚至还有自动修建的供电站，无人驾驶的运载机来来回回，机械手臂有条不紊地运行着。

　　它们色彩暗淡，结构简洁有力，是建军的风格。

　　当时他的心脏几乎停跳了，这些已经超过想象太多。

　　建军的逆天程度总在刷新，想想几年前还只是跳远跳了五米。

　　后来天亮了，朱梓和韩凌枫继续漫无目的地逃亡，时不时绝望，时不时担心着维克多他们。

　　黎明到来了，地面有水蒸气蒸腾出来，所见一片白茫茫，这是很奇异的景象。

　　后来他们看到一个大裂口，隐约可见一座残破的塔，斜靠在裂口边缘，半截埋在土里。

　　看上去很诡异，他们不敢进去，于是走开了。

　　朱梓又哭了，她说着害怕，可韩凌枫一点办法也没有。

　　二

　　越狱两天了，两人深陷在一片汪洋的泥地里。

　　韩凌枫有些恍惚，他已经不太感到饿，只是满身伤和污泥，而且很冷。

　　有时觉得饿着挺好的，能忘掉很多事。

　　比如现在。

　　比如你喜欢的女孩拿你当备胎。

　　比如那女孩亲吻过的男孩们就在那座城市里，踏着你每天走过的大街。

　　他们晒着暖暖的太阳，他们发短信聊衣服什么的。

　　你烤着篝火，他们也在夜里相拥。

　　泥泞，韩凌枫想起贝爷的大冒险，也许试试嚼嚼虫子什么的也不错。

　　过了不知多久，韩凌枫忽然觉得没什么了，只是死掉那没什么。

　　单纯的死亡已经不能使你畏惧，只是消失了，那没什么。

　　“忽然很担心我的好朋友，那白色的小猎犬。”朱梓忽然说。

　　“它很弱小的，什么都抢不到，捉不到。除了我没人给它食物，它会很可怜的。”

　　韩凌枫忽然心里发酸。

　　“我们去那塔里看看吧。”朱梓说。

　　这是一座巨大的的圆柱形的塔，它的周围还有一些毁坏的小塔。

　　时至今日，仍散发着威严的气息。

　　塔的正面有一条触目惊心的大裂口。

　　他们走进裂缝，进入环形楼梯。

　　借着石缝微光，两人刚好能看清四周。

　　塔里到处是碎石，很多都长满了青苔，墙壁上也满是青苔。

　　它的下半截深埋在地底，楼梯往下通向一片未知的黑暗，两人朝上走去。

　　这里很多蜘蛛之类的生物，之前看到一只乳白色的大蜈蚣从他们头顶经过，韩凌枫吓得几乎要跑回去。

　　“没事。”朱梓抱紧了韩凌枫，把他的头埋在自己胸口。

　　温暖。

　　韩凌枫愣住了。

　　他的心砰砰直跳，没有那么害怕了。

　　朱梓说：“那个是有毒的，母亲拿它入药。”

　　“走吧！”她放开了韩凌枫。

　　韩凌枫像个木头一样呆愣在原地，然后连忙跟了上去，心里暖暖的。

　　到了顶层，有个几乎被巨石堵住的门，门后是一个大房间。

　　这里半个顶都塌了，废墟一般布满蜘蛛网。

　　隐约可见的六级台阶之后，靠墙有一把石椅，石椅上端坐着一具钢铁铠甲。

　　简直帝王规格。

　　光线穿透石缝，尘土漫天地飞扬起来，那具铠甲还带着斑斑的锈迹。

　　朱梓看到韩凌枫的手机时那表情像是看到天神下凡一样，韩凌枫心里爽歪歪，此刻她也是这种表情。

　　韩凌枫忽然想到不锈钢什么的，不过他一点不觉得好笑，这具铠甲出现在这个时代简直可以被尊为神，他可以拿来保命啥的。

　　可以看到铠甲上镌刻着某些文字，像是英文。

　　“Dancia“

　　韩凌枫晕了，这好像是个女孩的名字。

　　没太在意。

　　他想着也许会看到一具骷髅，可就在这时，铠甲竟然动了！

　　灰尘弥漫开来，铠甲转过头来看着两人。

　　韩凌枫的腿直哆嗦，他突然发现这样自己根本跑不动。

　　铠甲里传来沉重的喘息声，不知多久后，那里传来人声。

　　“你看到我丈夫了吗？”

　　那是个很老的女人，老得像干枯的木头。

　　两人吓坏了，韩凌枫挣扎着沿着原路逃走了。

　　韩凌枫忽然想起他们在破碎的楼梯里看到了一句句的骸骨。

　　那是他的丈夫吧？

　　她再也见不到自己的丈夫了，真的让人很难过。 



'''







'''

/fst/sky/moon-river/One. The Eage/0.At First.txt



所有有关灵魂的，都不是一句两句的事。 



'''







'''

/fst/sky/moon-river/One. The Eage/1.Maple.txt



时值二零一三年五月一日

　　夏日的阳光把地面烤得金黄，树叶的阴影像一个个张牙舞爪的小鬼，大家都躲在开着空调的小屋里或者公交车上，江林大道上空空荡荡的。

　　韩凌枫脚上一双夹脚鞋坐在路边玩手机，他那一身黑色背心花短裤的造型已经足以吓跑小孩子了吧，韩凌枫想到这儿笑了笑。

　　韩凌枫刚刚结束了他美好的十七岁，但却有些颓废，想一想也是，一个一年成绩掉了两百多分的人，能不颓废？或者是一年掉了两百多分这事，能不让人颓废么？

　　其实这也不能怪自己吧？韩凌枫这样想。

　　韩凌枫在手机上玩游戏，名字叫《口袋妖怪》。它最吸引人的就是你不知道下一刻会遇到什么东西。

　　他还小时同学们就在任天堂游戏机上玩这游戏了，韩凌枫没有游戏机，只能干巴巴地看。

　　“嘟！”手机里传来快没电的警告声，韩凌枫的手机只有2%的电了，叹了口气，他只得将手机塞回包里。

　　从有记忆起，韩凌枫的暑假便是这么过的，没有可爱的妹妹陪去逛个街，没有兄弟伙一起出去环个湖，自己躲家里玩一整天的游戏，也不觉得无聊，倒是挺舒适的。

　　天太热了，地面的水蒸气被大量地蒸发，远处看起来像是扭曲的，在空气中飘晃着。

　　其实这种慢节奏不费脑筋的游戏他挺喜欢玩的，一边玩可以一边发发呆，时间就这样过去了。

　　自己在别人眼中是什么样子的呢？是很傻很天真的，偶尔有人找你搭个讪你一脸惨白半句话都挤不出来的那种人吧？从来都不是是那种很吊的走到哪里都会有朋友帮忙的人吧？

　　韩凌枫初中时有一个很是要好的同学，最初他们是那种用一张卡吃饭的朋友，但是后来不怎么联系了，韩凌枫还在因为作业拼死拼活挤时间，偶尔看到他的电话了，打一个电话过去，这位老同学电话接得很快，说我在某某某呢，朋友在这儿的网吧工作，自己也去那儿打工，还不错。韩凌枫想说，你怎么老是在朋友那儿打工，吃住都不愁的，不由得觉得很是自卑。

　　想想自己还穿着脏脏的衣服和鞋子拼命想扶起试卷上那点可怜的分，好容易捞到个女朋友，如今跟人家吵架到现在她找上门来你还不敢去跟人家说话，自己还……不想了，这点事多影响心情啊。

　　地上有小孩随手扔的冰激凌棍子，融化的部分在绿化带上留下了一圈淡绿色。

　　远处一条大黄狗安静地躺在水泥地上睡着了，韩凌枫有时跺跺脚，那狗的耳朵会动一下。

　　自己从来都不是人群的中心，你很把朋友当做一回事，因为你本身朋友很少，你也不需要太多的朋友，而人家朋友到处都是，兄弟满街跑，人家也根本不把你当回事。

　　韩凌枫音乐的启蒙老师是初中时的班长兄。班长要去参加比赛啦，他很高兴地把电吉他拿到寝室里，虽然我们都觉得他本人没那把吉他好看，但是几个好基友都觉得挺不错的。

　　由于没有带电箱，他扫起弦来猫声猫气的，看他那吉他比人都重的样子觉得挺搞笑的。时候窗外的阳光很明亮，长长的走廊里安静极了。

　　“你是猴子请来的救兵么？”

　　韩凌枫手机铃声响了，传来红孩儿的喊叫声，他正准备吃唐僧肉呢。

　　韩凌枫觉得奇怪，自己是那种挂着手机十天半个月也没有人找的那种人啊，突然来个电话怪吓人的。

　　韩凌枫想起跟爸妈要买电话的时候自己拍着胸脯对饭卡发誓要好好对这个电话的，如今就像个砖头一样，只是没事还可以消磨时间。

　　他犹豫了一下，屏幕上显示着未知来电，总觉得如果接了这个电话生活会发生天翻地覆的变化，但是这种生活其实挺不错的，看喜欢的小说对喜欢的人发发花痴。

　　“……你是猴子请来的救兵么？”

　　挺坚持不懈的，看来不是闪电话的骗子，韩凌枫看着自己的手机。

　　初三毕业那年有一个女生到他家里来找他，韩凌枫帮她复印卷子。

　　说来也巧，她到的时候已经八点半，天也不早了，可韩凌枫才刚刚睡醒，爸妈都不在家，开门看到是个女生的时候韩凌枫吃了一惊，没好意思让人家到自己家里来，韩凌枫家是属于那种光都照不进去的一楼，来家里做客的人也少得可怜，自然也乱的慌。

　　那女生直接就被他的表情吓了一跳，脸红红的……后来的事也不用多说了。

　　有时候韩凌枫会想到自己一头乱糟糟的样子露着毛腿趴在床上捧着一个没人打电话的手机玩单机游戏，这个样子要是没被人看到……

　　“你是猴子请来的救兵么！”

　　韩凌枫不再想了，他按下了接听键。

　　电话里没有传来什么怪叔叔或者怪阿姨的声音，电话那头什么声音也没有，但是韩凌枫也没有挂电话，这样子持续了大概有二十秒，但是双方都没有挂电话，也许电话那头的人只是意外拨出了他的号码。

　　十三亿人，在这样一大群人里有个人这么就遇到你了，还是挺不容易的。

　　电话里还是没有声音，韩凌枫觉得自己应该挂电话，任何一个正常的人遇到这种情况都会挂电话，但他的手有点不听使唤，他没有动。

　　韩凌枫觉得这个性能还不错的小小的智能手机就像一个黑洞一样诡异，没有打电话的人，没有理由，电话里没有声音。

　　但是他总觉得电话那头有什么东西在观察着他，在世界的某一个角落里。

　　他疑惑了。

　　韩凌枫小时候喜欢翻爸爸妈妈的大书柜，里面有很多杂志。

　　有一本求上说有些人天生的直觉力就很强，这种能力会表现在很多方面，比如别人还未说话你就能知道别人想要说什么，再比如拥有预知电话铃响的能力什么的。

　　韩凌枫觉得自己天生就是这种直觉力很强的人。

　　初中的时候韩凌枫遇到了同学顾小蔓。后来有一天韩凌枫正在努力地拉大条，接到顾小曼的提议，说干脆在一起吧，简直天上掉下个林妹妹啊！

　　然后韩凌枫说好主意，于是韩凌枫恋爱了，时间长达一个月。

　　那时候韩凌枫拿着玩的还是个充话费送的小手机，话费消耗量从一个月不到十块猛然增加到一个星期四十块，险些被发现。

　　韩凌枫家里信号不好，晚上收发短信的时候得用手一直举着才能有一格信号，于是他就这么举着手机陪顾小蔓聊天一直到十二点多。

　　韩凌枫不敢开声音，于是就总是把手机放在自己能看得到的地方，几分钟去看一次，大多数时候，他总能接到短信。

　　有时对方愣了一下，好像很疑惑的样子。

　　其实韩凌枫自己也不知道为什么，他总是突然想起自己有一会儿没注意是不是有短信来了的时候拿起手机，短信便刚好来了，韩凌枫觉得，这是一种缘分。

　　那现在这个电话会不会是顾小蔓打来的呢？

　　韩凌枫想象过很多次这样的场景，顾小蔓还会给自己打电话么，如果真的有一天她又打电话给自己了，他一定会很冷很酷地抛下一句“我不认识你”，就挂了电话。而现在跟与她在一起的感觉就很像。

　　那自己会抛下一句很冷的话了吧？

　　“喂？”韩凌枫忍不住开口了，他发现自己的语调很软，到像是犯了错一般。

　　然后他就晕了过去。

　　黑暗中仿佛有聚光灯闪了一下，又似乎没有，眼前有黑影在摇晃，钝痛麻痹和窒息的感觉相继传来，耳边有凌乱的嗡嗡声，又像是一片寂静。

　　韩凌枫觉得这仿佛沉没在泥泞中无法挣脱的感觉难受得快要发疯一般。

　　不知过了多久，他终于感觉到自己躺在什么地方，地面很硬，很冰冷，不像是他所熟悉的床铺，倒很像是……手术台。

　　阴冷的寒意从脊椎很快地蔓延开来，韩凌枫觉得他的整个后背都像是沉在水中一般，随着时间的推移，四肢的知觉才慢慢地回到韩凌枫的身上，意识沿着四肢百骸蔓延开来。

　　不知过了多久，韩凌枫慢慢地睁开了双眼，映入眼帘的，却是明亮清新有着活力的白色车顶。

　　韩凌枫尝试着抬了抬手，沉重无比，索性韩凌枫什么也不做，脑袋一片空白，就这么躺着。

　　晕倒、陌生的地方、不能动弹，而现在这些条件都碰到一起了，韩凌枫知道自己十有八九是被绑架了。

　　这歹徒倒也是奇怪，自己家境一般，也不是什么大富人家，而他们偏偏会找上自己呢。

　　强烈的刺痛感和眩晕感如梨花带雨一般来临，耳鸣声像清脆的风铃在尖叫，韩凌枫脑海里只有蔚蓝的海面上白浪翻涌。四肢无力，意识像是散架了一样，感觉不到时间的流逝。现在他觉得自己就像是一只在海面上盘旋的水鸟。

　　意识要被……带离身体了，韩凌枫感到四周的地面在旋转。

　　他的思绪被打乱了，想起那个秋天，落叶铺了满街，金黄色。

　　那时的自己挥霍着时间，无知地一路走来，现在他什么也没有。

　　韩凌枫觉得过去的自己是一棵树，过去的时间把记忆的种子撒开，很久以后，思念才将它们催生发芽。

　　天地在快速地旋转，韩凌枫，感到什么东西要从喉头挣扎着出来。快吐了。

　　很多时候，韩凌枫承认自己是个没有远大志向的人，不过所有伟人的远大志向也不就是从无到有而树立起来的么？

　　韩凌枫这辈子想得最好的一件事就是定期到医院做全面的体检，每个月一次的各种体检。

　　健康地活着就好，这样哪天自己还可以去找找顾小曼……聊天什么的。

　　韩凌枫吐了，胃液混合着白色的尚未消化的食物被吐了出来，有那么一瞬间他意识到了现代医学可怕的一面。

　　黑暗中穿着带彩色可爱棉衣的女孩子抱臂而立……顾小曼常任性地说她就是那种刀子嘴豆腐心的人，她不知道的是，她的嘴比她说得还要毒。

　　“就这样活着吧？”顾小曼说。 



'''







'''

/fst/sky/moon-river/One. The Eage/4.Circle.txt





　　“将军！派去东三城的斥候已超过了时间。怕是城已破。”是个没有名字，没有表情的斥候，房间里只有一个视角，但凭借豪华的木质结构的房间，主子暗蓝色带花纹的和服，便已经能看出这是战国时代的日本。只是哪一家势力，就真的看不出了。若是战国时期著名的织田信长、明智光秀等人，那都是各有特点，在任何电影游戏里都是着重强调出来的，你一眼就能看到他。

　　但在眼前这样重要的场景里，眼前的将军的确只是一位名儿让你记不住的不见经传的小人物，大众脸、光头，但貌似是个武力强悍的狠角色。

　　将军在泡茶。

　　“将军！入夜了！我们今天已经无法返回。”又是一名斥候，黑色身影稳健地单脚跪在门口，声音里没有语气，报完稍等了一会指示，便退下了。

　　冰冷的夜里，烧热的开水蒸腾出袅袅的白烟。跪在茶具前的身影，不动如山！

　　“之前侦查异样的东三郎副将，在夕阳将落的时候，消失在海边了，”远处隐隐传来那个又矮眼睛又小的贵族奸诈狡猾的声音，“一点音讯都没有，大名派遣我们前来调查，但是如今我们连敌人的影儿都没见到，东三郎大人已经……”

　　（大名：大名是日本古时封建制度对领主的称呼。）

　　天色越来越暗淡，东二城和东三城位于两座岛之间，临海，水体里保存的温度正化作暖暖缓缓的海风流向陆地，竹叶被海风吹动，传来轻微的沙沙声，听上去就像是恶鬼在嘶笑，瘆人心魄。

　　城上火光点点，城外大雾弥漫。

　　“之前驻守这里的夜五郎将军，也是莫名地消失了，只留下老百姓在城里，一觉起来城里的兵都没了，被吓得够呛。当地人说，事发前几天，城里的士兵就跟着了魔一样，禁止所有人上城楼，并且在夜晚还不点灯。这个季节，整夜都有大雾，不点灯，就像座鬼城……”贵族刻意压低了自己的声音，继续说。

　　“照你这么说，夜将军可是扰乱民心的大魔头啦？……”和他对答的，是一个军官的声音，勇猛又喑哑。

　　“哼！”原本正坐在凉席上的将军起身走了出来，浓雾都在风中被打乱，散尽了。

　　侍从赶紧为将军加裘衣，将军头也不回，径直走上城楼。

　　“随我上城。”将军站定了一下，背对着属下说，随后上了城楼。

　　“是！”

　　雾如墨，夜风疾！

　　将军在火光中眺望云海，顿时这座城就像在浓雾弥漫的大海中航行的超级大船一般，若有万钧之势。

　　可就在这时，异变出现了。

　　“雾里有人！”一名眼好使的士兵喊了出来，随后大家也都看到了那个在雾中出现的影子。

　　天呐。那是怎样的一个“人”啊，庞大的身影像是扛着某种古遗迹上的巨柱。这样算起来，这个家伙的个头得有十来米高，按常规的作战方式，士兵根本无法拿它怎么样。

　　“还有……一个……两个……天！数不清！”黑暗里有人吞着口水。

　　整座城都被巨大的黑影围住了，将军愣了有半刻，“熄灭火把。”

　　“熄灭火把！”命令被传了下去，再这样背水一战的时刻，这支军队表现出一种纪律性和效率。

　　整座城上的火把都灭了，一片黑暗，将军说不出话，他的眼里看到了难以置信的东西。乘着最后的霞光，那些巨大的身影下，密密麻麻的数不清的细小身影缓缓地从雾中走了出来。

　　从海底爬出来的怪物，以巨大的锁链为武器，极为难缠。如果你遭遇了它们，即使拥有良田万丈，兵车千乘也无济于事；即使你拥有这世上最快的马，也无法逃脱。

　　时值二零一三年五月二日

　　当太阳已经高过头顶韩凌枫终于是醒了，他很高兴因为昨天晚上做了个很刺激的梦。

　　不过刚刚躺了十分钟，再回想起这个梦便觉得真的是有够无聊的：做梦都能梦到玩游戏。

　　把手伸出来正准备翻手机，韩凌枫突然一凛！气温……凉飕飕的感觉！

　　这根本就是天气转凉啊！什么鬼天气，若是放到古代，肯定又是哪个大魔头崛起了，天现异象啥的，想像蒲松龄这类奇葩人物根本是忙都忙不过来，定是会找人喝茶喝酒，聊说鬼神去的。

　　不过韩凌枫也就是个心怀迷茫的平凡少年，今天是劳动节，学校里放假，他也就在家过着放假休息加写一大堆卷子的生活。

　　挣扎着从床上爬起来，换好衣服，拔了正充电的手机，韩凌枫走到客厅里去了，父亲正在客厅里看电视。

　　父亲面无表情地坐在沙发上，看着某部以剿匪为主题的电视剧，母亲在阳台上浇花。

　　“又冷又不下雨，窗上都是霜。鬼天气！”母亲一边弯腰给花浇水，一边道。

　　“咦？小枫你在家的啊，昨晚哪儿玩去了？电话也关机，给你说过几百遍，有些地方你一人去我们怎么好放心？你宋阿姨家王哥哥就是在晚上被人家伤了脚啊。”妈妈的身影隔着结着冰花的玻璃门，有些恍惚。

　　她做完了自己的事情，从玻璃门外走进来，看着自己的儿子。很难讲她的脸上是什么表情，严肃又好像那本没有表情。

　　愣了一下，韩凌枫才说:“我是去同学家了，还是他爸爸送我回来的。”

　　撒了个谎。韩凌枫觉得像这样的事跟爸妈很难解释，说清楚了，事情就变得复杂了。他觉得这样的事情他能应付。

　　一想起昨天的事，特别是晕倒，韩凌枫就觉得奇怪，怎么自己一年轻健康的少年就突然晕倒了呢？

　　想到这儿，韩凌枫一个激灵：该不会是自己充着电玩手机引起的吧？哎呀这事儿可说不准啊。

　　边想着这种开脑洞的难以有个结果的问题，韩凌枫边陪着父母看了一会儿电视剧。

　　“小枫，你可得好好学，把你那点分给提上来啊，才刚刚上高中，你还有这个可能的。”妈妈一边用手机上网一边说，“你爸爸像你这么大的时候，成绩可是全校最好的，现在你爸爸去开同学会，这也是大家公认的事实。”

　　正在看电视的爸爸拉动了下嘴角，老脸上做了个略带尴尬的表情。

　　这已经是韩凌枫不知道多少次听妈妈讲这句话了，这是在鼓励他韩凌枫，要打个兔子翻身仗。

　　可是韩凌枫觉得这有些可笑，父亲学生时代成绩是有多么好啊，可是现在说实话，并不是过得有多好——当然跟很多人比起来，也是过得不错了——可是从小到大，韩凌枫没有敢向家里要钱买过什么稍微贵一点的东西。

　　韩凌枫上小学的时候同学间很流行悠悠球，那时候韩凌枫每天的零花钱是一块钱，够买两袋那种最便宜的面筋做的袋装零食或者两串烤饵块，那时候韩凌枫通常玩的都是五块钱的塑料悠悠球，中心转动的轴大部分也都是塑料做的，可以说是非常经济实惠，只能大概让你知道什么是悠悠球，这东西的原理是什么，但是和真正的悠悠球不是一个概念，无论是什么爱好都是需要你去投入些什么的。

　　那时韩凌枫天天下课玩着这样的悠悠球，和同学交流自己是怎么玩的。

　　眼看着大家都换成了入门级的悠悠球了，可是小韩凌枫还是玩着自己的球，一种渴望在雨水的灌溉下渐渐长大。

　　后来的有一天，小韩凌枫终于鼓起勇气向妈妈提出要求说自己想买一个二十块钱的悠悠球，这是悠悠球的电视剧中主人公得到的第二个悠悠球，并且和它战胜了对手，距离全国冠军又近了一步时的，那个悠悠球，橙色的，精致又漂亮。

　　韩凌枫的妈妈同意了，韩凌枫很开心。这是韩凌枫买的最贵的一个悠悠球，在韩凌枫很开心地拿去和同学看时，同学拿出了个一样的，并且指出了这种悠悠球的缺点:绳连接轴时与两边的距离太近，不好上线而且容易产生摩擦，而小韩凌枫呆呆地练习上线。

　　事实上，直到现在，韩凌枫也不知道“泼冷水”是什么意思。

　　“韩凌枫是个好孩子。”大人们很少花很多语言去评价一个孩子，而熟识的婆婆们对韩凌枫的印象都很好。

　　那个悠悠球在一个星期之后就莫明地失踪了，但是韩凌枫没有没有哭，也没有在意过，他只是跟妈妈说他把悠悠球弄掉了，妈妈也没说什么。只是从此以后韩凌枫再也没有跟妈妈提起过要买什么玩具。

　　韩凌枫默默地坐在沙发边看了一会儿电视，就走进书房。

　　打开电脑，登QQ，韩凌枫在空间里写下一条说说。

　　“这世上有些人总是习惯性地穿得很乱，而有的人按习惯穿衣服就能穿得很合身很时尚。我觉得遇到你时我是第一种人，与你打交道后我变成了第二种。”

　　其下还附了一张网上搜罗来的衣着时尚的帅哥的图片，一看真是像极了那种转发率很多的高品质说说。

　　实际上没人转。

　　韩凌枫说的这段话其实是在讽刺初中时的某个同学，不过他们现在不是好友，所以他看不到，别人看到这条说说也根本不知道他在说谁，也算是没拉仇恨啦。

　　然后韩凌枫登陆游戏玩了一把，就开始放着动漫边写作业。

　　自从刚刚开了电脑，韩凌枫便觉得压力都排泄掉了似的。

　　其实韩凌枫不敢承认的是，他现在根本没朋友，他唯一的朋友就是这台老电脑。

　　韩凌枫整天都坐在电脑前。

　　这么久了，夜深人静时，是它陪你玩，放电影动漫韩剧给你看，陪你聊天，帮你找朋友，帮你找资料帮你想问题……

　　很久以来，韩凌枫觉得是这台老电脑在陪自己玩，很久以后他想通了，陪自己玩的，是做游戏的人。

　　笔尖在写题，像小鸡啄米。

　　午后被挡在在云层和水蒸气后的光照得这个世界发白，韩凌枫做题好像有了效率，速度很快。

　　韩凌枫把游戏继续下载了，一边写作业一边乱想，也许自己就是个无爱少年吧。

　　不争气的少年，尘世中呆了十多年，连吐槽都不会，成绩一塌糊涂。

　　又不会玩儿成绩又不好，韩凌枫奇怪自己这些年都是在干什么？

　　不知过了多久，客厅里一直很安静，只有电视剧中的人物对白的声音，都是拉兄弟啊，当土匪啊打县令啊……

　　“啪”！门开了，妈妈走进来。

　　“累不累啊？”妈妈说，表情有些奇怪，瘆得慌。

　　“……”

　　“我看你写了多少作业……”妈妈看向韩凌枫的本子，韩凌枫也看向自己的本子，上面只有半张是写了歪歪扭扭的题。

　　韩凌枫的妈妈很漂亮，染过的扎起的头发上有丝丝的白纹。也是因为韩凌枫的妈妈，他的长相还耐看，精心打扮后还是邻家男孩的风格。

　　有那么一瞬间，没有人说话，空气里的声音像是都消失了，韩凌枫觉得空气里的声音都消失了。

　　耳边，韩凌枫从未听到过的语气：“你就做了这么点？”

　　入坠冰窖。

　　“不是，我是在看例题……”韩凌枫下意识地说。他确实是在看例题。

　　“你知不知道为了你上初中高中你爸爸跑了多少地方？我们本来期望你有一点点的改变！”韩凌枫的妈妈满腔怒吼地说。

　　心里一凉，韩凌枫几乎要失去思考的能力。与男同学吵架，那是激动地手脚颤抖，但是与妈妈吵架，韩凌枫觉得就像是把自己扔在冰窟里的感觉，每一寸汗毛都要倒立起来。

　　在有所想法之前，韩凌枫已经推开椅子起身，走向书房外。

　　不对劲！

　　刚刚走到书房门口，只见附近正站在那里，二话不说就抬起手向韩凌枫脸上挥去！

　　“啪”！清脆的一声在房间里回响，韩凌枫的左边侧脸上像是撒了辣椒粉一样，火辣辣的。

　　韩凌枫呆滞了。

　　这什么情况？！

　　眼角余光一扫，父亲手上正拿着年轻时打鸟用的气枪。

　　它本是父亲的收藏品，平时就静静的放在角落里。

　　韩凌枫的父亲年轻时还打猎。

　　“妈呀！”韩凌枫立即做出了枪战片里明星的动作，猫着腰就向大门外跑去。

　　“嘭！”突然一声轻轻的枪响发出来，韩凌枫只觉得右腰的衣服传来一阵风，吓得连忙快速向楼下跑去。

　　楼道里静悄悄的，被韩凌枫推开的门迟迟没有动静，整个居民楼里静得像阴间一般。

　　自己的脚都因为激动不受控制地颤抖着，右腰的衣服破了一个大洞，见鬼了今天！

　　韩凌枫一直跑到楼下，才慢了下来，走出小区大门，他还属于呆滞状态。

　　这不是正常人该遇到的事儿啊，韩凌枫一辈子都没听说过这样的事情，父母……可是生养了自己的人啊，你的每一个动作都是父母教会的，你的每一个思想都是父母言传身教啊！

　　据说所谓艺术家穷尽一生仅仅只是在为另一位艺术家的作品写简介，她就是母亲，儿子是母亲唯一的作品。

　　韩凌枫觉得自己身边的事怪怪的，父母亲其实是爱自己的吧？应该是爱自己的吧？今天的事情怎么回事？这世界怎么了？

　　当你发现自己与世界不太一样了，那是不是说明他自己与世界不太一样了？

　　根本没有地方可去，自己随意而去的方向，是书店还有网吧。讽刺的是，书店和网吧居然在一个方向。

　　韩凌枫读初中时留过级，已经18岁，是可以进网吧的。

　　他在网吧里找了个位置坐下。

　　那是一个靠窗的位置，韩凌枫在里头坐下，过了一会儿了心不那么慌了。

　　瞟了瞟旁边那人，是一个青年男子，短碎发映衬着洗得很白的皮肤，胡渣也几乎看不见，是个有正当工作的那种人。

　　男子正在玩一款名叫《英勇战联》的游戏。这是目前网络上最流行的竞技游戏，一直是各种年龄段的用户都爱玩的游戏，男子的手法很是老练。

　　韩凌枫自己也点开《英勇战联》，玩自己的。

　　不知过了多久，下午了，旁边的男子已经不见，韩凌枫想起今天的事情，不由得叹了口气。

　　自己是从什么时候开始玩游戏的？好像是自己还很小的时候，观摩爸爸在一台同样是小小的旧旧的电脑上玩游戏开始的吧？自从自己大一点之后爸爸很少玩这么久的游戏了，可是韩凌枫玩的游戏越来越大。

　　对韩凌枫这般年纪的少年来说，父母就是……给你一切的那个人啊。

　　不得不说，韩凌枫这十几年的人生很是窝囊，被小妹妹欺负什么的，当时他并不在意，可是这时那些无害的记忆好像又翻滚着跑了出来，燃烧着。

　　身上的钱差不多只够通宵，银行卡里的压岁钱倒是多，但是放在哪里他自己根本不知道，出来的时候忘了带，又要怎么取出来？

　　明天又要怎么办？去哪里？就算带了银行卡，自己又能用多久？

　　每个离家出走的孩子都是要跑回家的，自己又要怎么回去？韩凌枫想不到，于是暂时不想了。

　　旁边坐下一个女子，韩凌枫趁队友换防时瞟了瞟，是个姐姐，看上去二十出头的样子，皮肤好，干练，有亲和力。

　　她正在玩《英勇战联》里一个女警角色，在游戏里蹦跶。

　　这个角色配合她现实里的样子，那烫染过的发质很好的中长栗色头发，很可爱的。

　　女玩家还戴着耳机一边玩一边小声地叫队友。

　　“这个辅助是笨蛋，居然带引燃……”

　　可爱的女子，让人想起顾小曼。

　　韩凌枫坐在靠窗的座位上，手臂都冻僵了。

　　他什么都没有做，他什么事也不想惹动也不动一下，继续玩自己的游戏。

　　天渐渐黑了下来，傍边的座位上一个人也没有了。

　　韩凌枫还是比较认同那个姐姐，话说人怎会比电脑好呢？

　　天渐渐黑了，韩凌枫关了游戏，玩得很艰难，接下来他不知道自己要去哪里，独自在这样的地方过夜其实不安全。

　　每一次到无路可走的时候，韩凌枫总是想象会有奇迹发生，突然穿越到游戏世界什么的，但是事实上，这样的事情从没发生过。

　　渐渐地，发现自己也不想这样的事了，没有人会注意你会珍惜你的，你没有值得让别人珍惜你的……东西。

　　忽然眼角扫到一个人，无声地站在他的身旁，一身白衣有些熟悉。

　　韩凌枫侧脸一看，居然是维克多。

　　维克多没有说话，还是一如既往地让人看不透的样子，一脸“终于找到你了”，疲倦的表情。 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/210.txt



2016年5月10日 10:07
2016年5月10日 10:07



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/211.txt



2016年5月10日 10:05
狂风暴雨

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/212.txt



2016年5月9日 17:06
没有系统的教程！
	
Raspbian ( Raspberry Pi Debian）连接蓝牙设备 
Raspbian ( Raspberry Pi Debian）连接蓝牙设备 【分享自树莓派吧】 Raspbian ( Raspberry Pi Debian）装
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/213.txt



2016年5月9日 10:03
好看易传染！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/214.txt



2016年5月8日 23:33
好心疼，中药都忘了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1200



2013年5月31日 07:49
节操掉了一地啊有木有！！！下线呢？下线看到了，在地底啊MDGJ負好几十米啊啊啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1201



我有一种极其不详的预感。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1202



有些事情不是不相信。只是输不起。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1207



为神马木有前者咧。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1208



好讨厌的感觉！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1209



神马意思啊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1210



没在说你啊ZXY. QAQ.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1211



子曰习惯成自然。走过所有的路。走着走着，就不累了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1212



额



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1213



这是什么先入为主的想法呢。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1214



房间弄好了麻麻。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1215



我真的不知道我居然还有这样的自动回复！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1216



终于弄到个能上网的手机了。。。妈妈我错了。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1217



黑色：娘, 节日快乐
2013年5月12日 07:20转发(2)评论

来自Android评论转发删除

我也说一句
月光
POLICEMAN。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1218



额我错了真的错了我辜负了党和国家对我的淳淳教诲我以后一定改革从宽抗拒从严好好努力重新做人服从组织领导认清政治局势为组织着想为国家着想做一个好公民努力做到优秀为主席和各位领导服务为国家添砖加瓦…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1219



转发：AP盖伦？不科学啊，，
森罗万象：四川省新都一中学高一生贺晨航，迷恋LOL多年，对德玛西亚情有独钟，但在420大地震发生以后学校放假，他在家里撸，面对5.6级大余震的来临，为了不坑队友，大吼一声“AP盖伦冲啊！”当天花板上的一大块水泥板砸中头部还不忘说一句”人在塔在。”当救援队发现他的时候他还紧握鼠标。享年16岁

2013年4月23日 19:13转发(1389)评论(9)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1220



转发：…
罗叔叔：叼暴了………？…

2013年4月26日 01:34转发(0)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1221



诚。正如你说的，你这次逆天了？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1222



小时候觉得走自己的路神马的最帅最有爱了，现在仍然觉得很帅不过很悲哀。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1223



魏晨，2013新歌抢先听!：-　　　　　　　　　　　　　　　　 　　　　　 　　　　　　　　　　　　　 　　　　 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 　　　　　　 　　　　 别在意那些在你背后说三道四的人，那只不过说明你走在了他们的前面。　　　　　　　　　　　　　　　　 　　　　　 　　　　　　　　　　　　　 　　　　 　　　　　　　　

2013年4月16日 22:09转发(0)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1224



“你不是可以把烟吐在我的脸上，跟我谈你爷爷父亲是怎样撑起一个家，谈做过的事情就要去承担么？当时你跷着腿，眼睛没有看我。 现在呢？像个贼一样，死不认帐么？”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1225



我看着你的眼睛，终于我们的眼睛都变成了黑色。像黑夜，像幽潭。淹没了里面那个孩子。会为了找到一枚石子而惊喜不已的孩子。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1226



Transatlanticism °：他违反动物天性进行规定动作训练，他依据巴甫洛夫原理让动物条件反射，他用教鞭、糖果奖励或处罚，听话的得好处，不听话的被淘汰。这些程序化训练终于产生作用，它们乖巧握手、钻圈，以各种装萌成绩讨观众欢心。这对野外谋生并无用处，它们是场子里的宠儿，森林的弃儿…我说的不是马戏团，是中国教育。

2013年4月3日 19:58转发(0)评论(1)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1227



QQ音乐：很多事，唯有当距离渐远时，才能回首看清它。

2013年4月12日 12:00转发(11729)评论(239)

来自Android评论转发删除

我也说一句
月光
尼玛阿信神马时候长成这个样子滴。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1228



你和人们的不同 ， 就看你怎么活。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1229



傻逼好，傻逼不乱跑！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1230



现在姥爷这里有电了，再烧张卡过去。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1231



吴尊弟弟Q：7O'OO'O4 超帅男：　　　　　　　　　有很多女生喜欢和男生玩 　　　　　　　　　　　　　　不是因为她们骚 　　　　　　　　　　　　　　　　　　　　　是因为她们觉得跟男生相处比跟女生相处容易 　　　　　　　　　　　　　　　　因为男生不会记仇耍心机不会小气勾心斗角！ 　　　　　　　　　　　　　　　　1、 女生穿男生的衣服叫帅气，男生穿女生的衣服叫变态。 　　　　　　　　　　　　　　　　　　　　　　　　 2、女生发脾气叫可爱，男生发脾气叫可恶。 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 3、女生流眼泪叫柔弱，男生流眼泪叫懦弱。 　　　　　　　　　　　　　　　　　　 4、女生花男生钱是天经地义，男生花女生钱是天理不容。 　　　　　　　　　　　　　　　　 5、女生打男生是撒娇，男生打女生是混蛋。。。同意的转!!!!

2013年3月29日 20:45转发(25418)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1232



童鞋们不要误会了哈＝＝



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1233



　 　向司令 ゅ　 　 　：　　　　　　　　　　 　　　　　　　　　　　 　　　　　　　　　　　　 　　　　　　　　　　　 　　　　　　爱或者不爱一个人 有时候也许只是一瞬间的感觉 一直以为是爱 就在某个瞬间觉得不爱了 真的不爱你 也可以没有你 可是 在下一个瞬间 突然又觉得 原来还是很爱你

2013年1月1日 17:54转发(867)评论(5)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1234



时差。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1235



这两天霉翻了，冲了一下午的电结果最后百分十都没了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1236



一整晚的雨。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1237



这几天啊。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1238



转发：毁我三观的图啊
大电光：还记得那年生物课本上的少年吗

2013年3月20日 10:26转发(10622)评论(3)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1239



生命如川流不息，世界如刚岩不灭。逝去的亲人呵，你们的灵魂圣洁，在主的披肩上轻轻流淌。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1240



碉堡了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1241



好吧好吧。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1242



《30 Minutes》这首晚上放会吓死人的歌专辑封面就是百合的典范！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1243



我越来越相信星座了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1244



转发：这这这这。。。
友：世界已经阻止不了杜甫了

2013年3月15日 11:10转发(88165)评论(4)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1245



ゆうの葉丶：Happy birthday
2013年3月23日 15:14转发(1)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1246



我长眼袋罗。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1247



以后不再任性了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1248



手机着收鸟



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1249



人们一个个从这座桥上过去，于是你觉得你也可以。但当你上桥时，桥断了。原来这个世界并不公平。于是你翻越大山过去，于是你翻越大山过去。一路上花了许多时间受了许多伤流了许多血。但没关系，伤口上会长出茧子保护你。吮吸过你鲜血的土地会开出鲜花。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1250



完了，现在醒来第一件事就是摸手机耍会儿。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1251



会像血燕小心地守护TA们用心血筑在悬崖上的血巢。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1252



这十年来，猫和屋都没变过。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1253



这是花生中的大哥哥吧~




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1254



#亡灵序曲（魔兽世界）# http://url.cn/3YO1Sw 超级好听啊有木有。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1255



夹脚鞋可以蹲街也可以走遍世界。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1256



转发：嗯嗯啦啦
ACh：你不是阳光学校第一届即将毕业的初三生，你永远不会知道星期五按时放学回家是什么感觉！！！
2013年3月7日 21:47转发(14)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1257



转载你不会是吧？的日志LOL里的感人台词
1.只有飞速的旋转，才可以止住我的泪水，忘记你的模样。 -----不祥之刃
2.他们都说我是穿着东方盔甲的奇怪人，但我只想顶在最前面，用我的长枪保护我的朋友。-----德邦总管
3.一曲终了、繁花散尽、伊人已逝...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1258



转发：英雄啊啊啊
一.目夂 懋：这是阳光的一大壮举,本来这次阳光九年级三八不放假,由于今天第八节课,六班女生舍弃历史课去校长办公室与严校谈判,在六班女生不懈努力下,严校最后摆桌决定：好！我同意了！ so九年级的孩纸们明天中午12点背着书包回家吧！
2013年3月7日 21:49转发(0)评论(6)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1259



跨越种族的友谊。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1260



POH：明天上午要学这个，好难的样子

2013年2月25日 00:48转发(0)评论(2)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1261



尼玛这是如来神掌？小行星撞地球吧。。。= =




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1262



爸妈做了很丰盛的饭，但是…为毛那么像生离死别。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1263



我，突，然，就，，，，，，，，，，，，，，，，，，，，，，，，，，，，，，，，



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1264



听说在吧啦吧啦国里（记不到了额额＝＝），男人们都称呼他们的妻子为 My God .



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1265



觅食中…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1266



有没有晚上通宵的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1267



怎么在今天这种关键时刻一打才发现一个二个都停机了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1268



2013年2月25日 22:40
好像整个世界都停电了

 上传1张照片到《巴拉巴拉》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1269



好像整个世界都停电了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1270



腾讯越来越奇葩了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1271



2013年2月25日 18:11
2013年2月25日 18:11



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1272



哈哈哈哈




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1273



哦火



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1274



小时候觉得外国人都长一个样子，现在我能分辨欧洲人了，但还是觉得非洲人都长一张脸。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1275



我发现有时我能预测电话或者短信…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1276



尼玛。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1277



My God



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1278



转发：哈哈
渐离：分享图片一!二!三!戳

2013年2月23日 20:13转发(1)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1279



誒？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1280



同志们，作为阳光学校的第一届学生，我们一定要上进！我们要留下一个传说给学弟妹们！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1281



转发：嗨皮宝儿斯嘚
清臣：沁峰，生日快乐
2013年2月23日 08:58转发(2)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1282



额



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1283



：张宇恒，生日快乐哈。
2013年2月23日 00:09转发(2)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1284



坑爹啊！这种题我怎么抄下来做？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1285



转发：我们也要！！张淑丽神马时候潮一点啦！
孤灯清酒：碉堡，班主任淡定的找同学借了张内存卡，淡定的放歌。。。
2013年2月22日 21:32转发(1)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1286



转发：王chua chua ,哈哈哈哈
+魏晨Q:Б54O1Б看流星雨4：　　　　　　　 　　　　　 　　　　　　　　　 　　　　　 　　 你身边有木有一个姓王的人？家人？亲戚？恋人？朋友？同学？知己？蓝颜…… 如果有就为他（她）而转下吧。　　　　　　　　 　　　　　　　　　　　　 　愿姓王的在2013年一生平安、姓王的本人更要转哦

2013年1月2日 20:01转发(125557)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1287



为什么当时我会去剪平头。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1288



我想从今以后剪平头或者光头。一直。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1289



我必须买双帆布鞋 ＝0＝！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1290



转发：哈哈哈
-：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　笑了就转吧

2013年2月21日 16:36转发(0)评论(3)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1291



我小时候印象中的爱尔兰是草原、蓝天、森林和乡村，后来才知道，爱尔兰也是有城市的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1292



转发：好想来一次
QAQ：老师合照的一瞬间~学生团结就 是力量

2013年2月11日 23:00转发(0)评论(48)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1293



2月22号。。。真2呢



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1294



原来安卓也有安全模式。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1295



吃烧烤去罗



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1296



我在海岸线上写下长诗，却没有阅读天它的勇气



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1297



二十七啊哦呵呵洗白啦啊哈哈哈



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1298



完了，报名是哪天。？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1299



转发：精辟啊
我们爱讲冷笑话：周一上学路上就像《行屍走肉》 周五放学路上则是。。。

2013年2月4日 12:11转发(19059)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1300



转发：哈哈哈哈
₯㎕Smile：这个有意思。

2012年10月6日 11:36转发(2339073)评论(18)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1301



晚上我就枕这玩意儿睡，，




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1302



要一口洋芋一口可乐。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1303



今天早上。。。不会是老友吧，，那发型。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1304



转发：。
MenofgodGeisha：年度灾难巨片即将上映，无数学子含泪倾情出演！！！

2012年1月28日 20:04转发(146771)评论(11)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1305



本来是边听歌边写作业，后来变成了纯听歌。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1306



转发：。
長风： 打dota的男人都是好男人，第一：他们不去酒吧，不去夜店，不去把妹子，省钱。不用担心会脚踏两只船第二：打辅助的有一颗帮助人，保护人的心。打后期的有一颗努力挣钱，拯救世界的责任心。打酱油的有一颗热爱和平，与世无争的平淡的心。坑爹的有一颗坚韧不拔，淡然面对的心。

2013年2月15日 18:43转发(5)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1307



我不会告诉你们我从下午睡到现在。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1308



天蓝得不可思议，高速公路上呆呆的汽车些像成群的公野马冲过去，哈哈。和风像是温暖的海浪扑打在身上。我的乡村情人节哈。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1309



有孩子叫我叔叔就算了吧，老大爷是神马意思？搞笑么？那么小的娃儿就如此有恶搞精神。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1310



时间是种慢性麻醉



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1311



那个。。别想多哈，没说那个。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1312



我傻了。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1313



你在说什么啊。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1314



并不是梁祝的故事证明了爱的强大，而是因为爱太脆弱，所以梁祝的故事才令人感动



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1315



转载 ， 。 的日志你被小学课本忽悠了多少年？
《爱迪生救妈妈》
课文：爱迪生的妈妈得了急性阑尾炎。医生苦于房内只有几盏油灯，无法进行手术。刚满7岁的爱迪生，利用镜子的反光原理，让医生在明亮的反光下，为妈妈成功进行了手术。
疑问：医学史上对于...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1316



额



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1317



永远有多远



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1318



晚安，All。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1319



新年不要在厕所中玩鞭炮。因为厕所中聚集了大量沼气，沼气的主要成分是甲烷。甲烷易燃，在狭小空间如下水道中快速燃烧的结果就是引起爆炸。所以 ， 厕所很危险。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1320



为毛一选辅就没ADC！！！！！猪么都是！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1321



鞭炮声好吵



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1322



花的种子抛洒开来，在漆黑的夜空中肆意盛开.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1323



-：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　爱这个系列糖的孩子立即转

2013年2月9日 08:58转发(0)评论(5)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1324



哇咔咔，我妈要给我做倒膜……神马情况~!



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1325



#Daily Growing# http://url.cn/C3Y3tN 树在长高，叶在变绿，许多次我看到他的可爱




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1326



囧兔兔：【十万个冷笑话——十万个语言版】各种方言版本的，绝对戳中你笑点！
　视频缩略图
2013年2月8日 19:05转发(1049)评论(85)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1327



转发：这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这……
Arms.：这张图送给我媳妇，不要说英雄联盟没有浪漫时刻。

2013年2月3日 13:30转发(184742)评论(295)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1328



转载简 简 单 单的日志面试中你必须要知道的语言陷阱（很好，怕再找不到了）
如：“你经历太单纯，而我们需要的是社会经验丰富的人”，“你性格过于内向，这恐怕与我们的职业不合适”，“我们需要名牌院校的毕业生，你并非毕业于名牌院校”，“你的专业怎么与所申请的职位不对口？”...


共有4张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1329



转发：NICE
﹢袁姗姗p:4277’94看男友照：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 现在好好学习是为了将来我儿子在学校打了人家一个耳光, 对方要一万块, 我可以掏出两万说, 儿子再打一个 , 　　　　　　　　　　　　　　　　　

2013年2月7日 07:55转发(8295)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1330




评论转发删除

我也说一句
月光




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1331




评论转发删除

我也说一句
评论转发删除

我也说一句
月光

月光




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/215.txt



2016年5月8日 08:30
哇哈哈哈哈




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/216.txt



2016年5月8日 08:27
国产……

 上传1张照片到《the weapon》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/217.txt



2016年5月7日 06:10
欧拉公式的证明过程




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/218.txt



2016年5月6日 18:17
一小于二。这个道理是固定的(？)，它与别的恒成立的道理造成的事也是恒成立的。 这可以作为武器。武器嘛，能用于毁灭一个人的都是武器。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/219.txt



2016年5月6日 13:24
粑粑麻麻上班喽，只有你在家里头




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/220.txt



2016年5月6日 03:26
因为她是我想要的，因为那是她想要的。 人太傻，在黑暗里找不到方向。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/221.txt



2016年5月5日 08:43
	
你是我胸口永远的痛 (Live)

歌手：蔡依林/五月天

所属专辑：《你是我胸口永远的痛 (Live)》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/222.txt



2016年5月4日 23:25
	
后来的我们

歌手：萧亚轩

所属专辑：《1087》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/223.txt



2016年5月4日 12:02
我姥爷来自外地，所以单单的我头发很少可我想留长




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/224.txt



2016年5月3日 20:30
当我走完时我都绝望了，不过最后我活着回去端盘子了。
所以帮助他人所带来的，不是一点点




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/225.txt



2016年5月3日 14:42
2016年5月3日 14:42



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/226.txt



2016年5月3日 05:19
Formula Euler : ∫±∞ f(t)e^(-iωt) dx
=∫±∞ f(t)·1／(cos(ωt)+isin(ωt)) dx



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/227.txt



2016年5月2日 20:25
！！！   




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/228.txt



2016年5月1日 23:34
若是能永恒，一首歌就够了
	
偏爱

歌手：张芸京

所属专辑：《破天荒》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/229.txt



2016年5月1日 23:30
	
Complicated

歌手：Avril Lavigne

所属专辑：《Let Go》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/230.txt



2016年4月30日 00:06
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/231.txt



2016年4月28日 00:17
	
七里香

歌手：周杰伦

所属专辑：《七里香》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/232.txt



2016年4月27日 23:50
	
童话 (Live)

歌手：萧敬腾

所属专辑：《洛克先生Mr.Rock演唱会Live纪实》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/233.txt



2016年4月27日 01:26
我们在这个故事里爱着某人，在那个故事里被某人爱着。 你当然可以为了自己就随便干些什么事情，因为我不希望这样也是为了自己好。 所以要证明自己的价值。 我曾以为喜欢是对每个人都好的，但事实人与人之间是如此矛盾。 人可以让自己以为某件事是对的，但事实是有些鸿沟是我们还不能逾越。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/234.txt



2016年4月26日 01:54
2016年4月26日 01:54



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/235.txt



2016年4月23日 17:59
如果你能根据生存本能 改变人们的意图，你就会始终把它们调整到对自己好的状态。 。 我想，我会黑得像是石油…

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/236.txt



2016年4月23日 00:11
我被告知我所看到的已经有人看到，有人预知了我的行为。我想我也会爱上别人的呀，我们总在变化，那么婚姻结的是什么
	
DAYBREAK'S BELL (破晓之钟)

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《DAYBREAK'S BELL》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/237.txt



2016年4月22日 23:51
花重要所以花开了，花不重要所以它又谢了。我们看到时间，然后感到难过。
	
DAYBREAK'S BELL (破晓之钟)

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《DAYBREAK'S BELL》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/238.txt



2016年4月22日 23:40
然后我知道了，危险的尽头人类还看不到， 但你应该化解所能看到的危险




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/239.txt



2016年4月22日 20:47
我想说的是，善良被用来纠正错误，黑暗面被用来刺激懒惰，学习能力用于考试和虚拟环境，选择被用于改变其自身属性， 人类确实能被短期控制和提供改变的力量…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/240.txt



2016年4月21日 22:26
这个世界好简单，就是白水洒在葱花上




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/241.txt



2016年4月21日 01:36
有时作成一件事需要找到一条狭窄的路，
需要在所有性质里找到一小片范围。
有时却很简单，
只需要一个性质的差异。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/242.txt



2016年4月19日 23:38
人只能做对自己好的事， 做好事前要三思。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/243.txt



2016年4月18日 18:25
	
偏爱

歌手：张芸京

所属专辑：《破天荒》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/244.txt



2016年4月17日 22:41
	
爱笑的眼睛 (Live)

歌手：林俊杰

所属专辑：《I AM 世界巡回演唱会》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/245.txt



2016年4月17日 16:38
2016年4月17日 16:38



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/246.txt



2016年4月17日 00:00
你把那根不均匀的时间线以三维的方式贮存在脑海里了。 你随时可以回到过去， 你随时可以让那些雨点停在夜空里

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/247.txt



2016年4月16日 23:46
善良并不是别人告诉我的那样，总是对大家都好。 因为善良是一个承诺，承诺本身是没有好坏之分的。 因而善良是一份盟约。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/248.txt



2016年4月15日 13:38
如果所谓意识是一种幻觉， 活这么久 又有什么意义。 只是一棵复杂的石头。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/249.txt



2016年4月15日 00:13
	
世界有多大，永远有多远？ 
我在用ME免费制作自己的H5页面，超多动态模板，你也来试试吧！
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/250.txt



2016年4月14日 23:39
2016年4月14日 23:39



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/251.txt



2016年4月14日 23:28
再见吧，常常死机的老爹珍藏版xp




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/252.txt



2016年4月14日 02:06
对于某件对自己好但是大脑始终认为不好的事，你不能知道这事儿是什么。想一下都会被影响。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/253.txt



2016年4月13日 23:06
一个小于等于1的数不可能大于1。 这意味着，作为一个人类 你永远无法理解自己是什么。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/254.txt



2016年4月12日 21:16
这人物亮了！

 上传2张照片/视频到《the weapon》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/255.txt



2016年4月12日 11:38
2016年4月12日 11:38



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/256.txt



2016年4月11日 23:53
以后我窗外的景色

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/257.txt



2016年4月11日 23:52
将来我房间的颜色

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/258.txt



2016年4月11日 22:55
“我能给的，我都给你了。”

 上传2张照片/视频到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/259.txt



2016年4月11日 22:47
闲来无事，用简单的图形画了个人头，后来我就看到了…闪电侠？！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/0.txt



卿松
513401199704160216
2017-8-?:四川托普信息职业技术学院.军训
2013-8-?:西昌一中.军训
2010-9-1:西昌阳光学校.军训
2009-9-1:西昌一中俊波外国语学校.军训



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1.txt



07:13
从一开始，就没打算回头



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/260.txt



2016年4月10日 21:35
仔细想了想之后呢，决定看看自己什么时候能饿死。毕竟我还没饿死过。 除了这事儿就只能发呆了，我可能已经发了十多年呆，不好玩。顺便看看能不能梦到所想的东西吧…

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/2.txt



2017年12月27日 21:56
私は思いませんでした，
あなたのためにこんなに狂ってくれるように。
ときめきは少しも大事じゃない。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/261.txt



2016年4月10日 13:39
2016年4月10日 13:39



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/3.txt



2017年12月23日 23:29
人生之痛苦，莫过于同时爱上两个不该爱的人。
究其一生，最多只能向一个告别，然后哭得一塌糊涂。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/262.txt



2016年4月10日 13:39
	
分身情人

歌手：魏晨

所属专辑：《一起来看流星雨 电视剧原声带》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/4.txt



2017年12月23日 22:44
一个人可以孤单 也可以不孤单
人多了可以孤单 也可以不孤单
孤单是你纯粹的无奈，
无法逃离，不明所以
寻求帮助



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/263.txt



2016年4月10日 01:27
烙印和尾巷

 上传2张照片/视频到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/5.txt



2017年12月23日 18:54
莫斯科没有冬天
像久冻的湖不懂誓言
飞鸟划过永恒的终点
和单调的天边



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/264.txt



2016年4月9日 13:53
我穿黑色朋克，我也折星星。 我唱摇滚，我也养花。

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/6.txt



2017年12月23日 10:54
你我正如蜉蝣



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/265.txt



2016年4月6日 13:40
这红色可不吉利




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/7.txt



2017年12月21日 18:48
像利剑穿越繁华。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/266.txt



2016年4月6日 12:43
人类团体的力量不能完全发挥是因为我们不知道别的与我们相同的个体在干啥，再加上进化所需的自利本能，使人们防范着随时可能发生的矛盾。
这种混乱的动态集体可能稳定存在吗？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/8.txt



2017年12月21日 12:56
那么久了，那些承诺……
若是你也想回来，我又……
何德何能




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/267.txt



2016年4月2日 23:57
2016年4月2日 23:57



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/9.txt



2017年12月21日 10:02
三皇五帝可能只是小部落，可那就是我们当时的全部了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/268.txt



2016年4月2日 23:53
2016年4月2日 23:53



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/269.txt



2016年4月2日 22:45
生活是短板木桶，少了哪样都缺氧
	
In Your Eyes

歌手：Danny Saucedo

所属专辑：《In The Club》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/270.txt



2016年4月2日 21:00
周五妈妈弄的饭太好吃了，减肥计划彻底破产，今天回老家过清明，睡了一整天觉，还错过了一场电影

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/271.txt



2016年4月2日 02:59
鱼跃的时候总想空翻，也许快了

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/272.txt



2016年4月2日 02:39
2016年4月2日 02:39



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/273.txt



2016年4月1日 13:51
2016年4月1日 13:51



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/274.txt



2016年4月1日 13:04
妈妈说张国荣是拍电影太入戏了，当时老电影还在成长

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/275.txt



2016年3月31日 13:05
TFBOYS家族 ：北冥有鱼，其名为鲲， 此场景转换得美腻，转发走大运。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/276.txt



2016年3月31日 00:52
2016年3月31日 00:52



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/277.txt



2016年3月30日 22:10
Everything is Changing...

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/278.txt



2016年3月30日 00:22
我发现我能自己走很黑的夜路，
我告诉那个女孩永远在一起的方法是作一个她的备份。
她没有听到，靠着椅子低着头，睡着了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/279.txt



2016年3月29日 12:25
看海的意义在于它比较好—有时一片海会比一个人好，如果那对你意义不大。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/280.txt



2016年3月27日 16:20
我的眼睛就是藏不住秘密




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/281.txt



2016年3月26日 21:54
2016年3月26日 21:54



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/282.txt



2016年3月26日 18:16
还有活人吗




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/283.txt



2016年3月25日 10:39
也许我正是多变的人，但人们本就是多变的，不可能知道那么多的事，所以一生都在赌博




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/284.txt



2016年3月23日 23:09
Dance like nobody's watching; love like you've never been hurt Sing like nobody's listening Work like you don't need the money live like it's heaven on earth.

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/285.txt



2016年3月23日 23:09
Dance like nobody's watching; love like you've never been hurt Sing like nobody's listening Work like you don't need the money live like it's heaven on earth.

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/286.txt



2016年3月20日 00:40
脚下的土地，挥发着你的汗水和梦想 长安烟雨迷茫，神太忙了，只会把心分给在意的人 而这些，才是你。

 上传9张照片/视频到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/287.txt



2016年3月19日 16:49
他们从母亲怀中长大，可我连名字都不记得



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/288.txt



2016年3月19日 16:47
像得了厌食症
	
In Your Eyes

歌手：Danny Saucedo

所属专辑：《In The Club》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/289.txt



2016年3月13日 00:16
Sleeping well



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/290.txt



2016年3月12日 14:20
熬夜久了，人都分不清楚白天黑夜




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/291.txt



2016年3月12日 12:40
孔子说，世间万物都存在对立的两面，所以你的决定在于你看到了哪一面。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/292.txt



2016年3月11日 17:04
我觉得我再不需要任何东西了， 你耳边有匹骏马，可以带你到 任何地方

 上传4张照片/视频到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/293.txt



2016年3月6日 13:32
我想以后可能不会这样悠闲了，
现在，就很好




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/294.txt



2016年3月5日 22:59
之所以怀旧，是因为无所顾忌，
是因为无论怎样的火焰，都要踏过去。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/295.txt



2016年3月5日 14:01
女的！
活的！
细心的！
安全的！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/296.txt



2016年3月4日 19:10
这世上，有些人， 本就是活在现实与梦想之间的。 那些燃烧的心，也永不会熄灭。 猫式，平静又宽阔的灵魂。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/297.txt



2016年2月28日 00:00
这样的夜晚，要怎么唱歌
聚光灯从未刺瞎我的双眼，
它未必真的亮如白昼。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/298.txt



2016年2月27日 11:41
机床和他的半个电源。
心肝儿啊，送人吗？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/299.txt



2016年2月23日 00:39
人会把回答放在心里



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/300.txt



2016年2月22日 23:22
	
DAYBREAK'S BELL (破晓之钟)

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《DAYBREAK'S BELL》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/301.txt



2016年2月22日 23:05
沉入湖底

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/302.txt



2016年2月22日 00:49
飞美国都不用倒时差的说@漓  碉堡了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/303.txt



2016年2月21日 23:51
When you have a chat with partner,
it's important to care about
his mind.
Including hormone levels.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/304.txt



2016年2月21日 01:06
它绕着他转圈圈，好像这样会有用。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/305.txt



2016年2月19日 23:40
2016年2月19日 23:40



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/306.txt



2016年2月19日 23:38
	
Everybody Hurts

歌手：Avril Lavigne

所属专辑：《Goodbye Lullaby (Deluxe Edition)》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/307.txt



2016年2月19日 23:19
逝者的灵，随风而去，又变成雨。
油纸伞沾魂，鲜血循着小溪而去。
三月的夜，凉薄的风。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/308.txt



2016年2月19日 16:18
2016年2月19日 16:18



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/309.txt



2016年2月18日 00:16
"Xiaoqiu,I like your songs!" "Ugly!" "...... What happened?" 
	
我们都一样 (Live)

歌手：棉花糖

所属专辑：《幸运儿 2012 TICC演唱会纪实》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/310.txt



2016年2月18日 00:06
2016年2月18日 00:06



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/311.txt



2016年2月18日 00:04
2016年2月18日 00:04



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/312.txt



2016年2月17日 23:13
	
Always Online

歌手：林俊杰

所属专辑：《JJ陆》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/313.txt



2016年2月17日 23:10
	
As Long As You Love Me

歌手：Backstreet Boys

所属专辑：《Backstreet's Back》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/314.txt



2016年2月17日 23:06
你是没有脚的鸟，从遥远的东方飞来，从不停止脚步。

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/315.txt



2016年2月17日 19:50
Just waitting for that time
Shining like sun
So you are the fish
to wait.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/316.txt



2016年2月17日 11:24
老外只用个盘子裝食物是为了方便刷把…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/317.txt



2016年2月17日 10:49
2016年2月17日 10:49



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/318.txt



2016年2月17日 02:53
天空是片海，人在水面漂着。

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/319.txt



2016年2月17日 02:32
2016年2月17日 02:32



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/320.txt



2016年2月16日 23:19
中文好难写…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/321.txt



2016年2月16日 23:18
	
余秋雨：生命，是一树花开 
生命，是一树花开，或安静或热烈，或寂寞或璀璨。
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/322.txt



2016年2月16日 19:54
Don't be sad for this, No way to use.
	
Castle of Glass

歌手：Linkin Park

所属专辑：《Castle of Glass - EP》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/323.txt



2016年2月15日 22:17
多年以来，你的破布披风，从未离身。
三月以后，焰火撒满天空，我乘船离开江夏。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/324.txt



2016年2月15日 17:51
只是做饭…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/325.txt



2016年2月15日 13:57
2016年2月15日 13:57



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/326.txt



2016年2月14日 22:59
…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/327.txt



2016年2月14日 13:50
我所理解的教育，是让人类幼崽（？）将本能的维护自我利益发展到维护共同利益（我认为的），并使之形成一个有机系统。但是人类作出的决定，通常就是以维护自我利益为主的。（否则人类怎么活下来的）

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/328.txt



2016年2月13日 23:00
那段时间，她每天用蒸腾的热水敷脸；那天午后她化了很美的妆，长发搭在肩上。
那天她伤得很深，独自坐在窗前，喝着冷咖啡。街上行人如潮，恰巧有个披着乱头发的少年给了她一张特写。
那个夏天她红遍大江南北。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/329.txt



2016年2月13日 22:57
那段时间，她每天用五十度的热水敷脸；那天午后她化了很美的妆，长发搭在肩上。
那天她伤得很深，独自坐在窗前，喝着冷咖啡。街上行人如潮，恰巧有个披着乱头发的少年给了她一张特写。
那个夏天她的照片红遍大江南北。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/330.txt



2016年2月13日 18:10
俩小家伙破坏力超强




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/331.txt



2016年2月13日 00:17
热水烫皮好舒服～早上就想说了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/332.txt



2016年2月12日 15:34
life come life go…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/333.txt



2016年2月12日 14:55
2016年2月12日 14:55



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/334.txt



2016年2月12日 01:06
听雨，看花，就很好啊，昌没有飞雪，昌没有流樱。
然后我就可以再不剪发，用竹竿作舟，忘却离子的火焰，只在月下喝喝酒。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/335.txt



2016年2月12日 00:53
三年前，我只是浪子，
三年后，我是个稳定的浪子



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/336.txt



2016年2月11日 15:51
十八岁的感觉是灵活的大脑和旺盛的荷尔蒙




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/337.txt



2016年2月10日 22:30
他不再回你想让他看到的说说，不再装呆发消息逗你笑，他不再给你发消息，你知到的，你们分手了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/338.txt



2016年2月8日 21:52
就目前来讲，人应该只能做对自己好的事，如果他做了对自己不好的事，那是因为他相信这事儿最终会对他好。
(敬所有喵和汪！)




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/339.txt



2016年2月8日 19:29
“人们花半辈子的时间去等一个完美的人，当遇到一个不太完美的人，却又一挥手把剩下半辈子都送走了，最后你什么都不剩。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/340.txt



2016年2月7日 21:11
乳酸（IUPAC学名：2-羟基丙酸）是一种化合物，它在多种生物化学过程中起作用。它是一种羧酸，分子式是C3H6O3。它是一个含有羟基的羧酸，因此是一个α-羟酸（AHA）。在水溶液中它的羧基释放出一个质子，而产生乳酸根离子CH3CHOHCOO−。在发酵过程中乳酸脱氢酶将丙酮酸转换为左旋乳酸。在一般的新陈代谢和 展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/341.txt



2016年2月7日 10:28
熊熊裹成个球了
深呼吸 上传4张照片到相册  微观风景 
到营山晒太阳还不错





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/342.txt



2016年2月6日 00:28
人是个系统。
这个系统总是在做着对自己好的选择，
所以在有限的资源中存活下来了。
自我意识，是在进化出
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/343.txt



2016年2月5日 20:16
人是高于肉体的，自我意识，记忆与人格的总和…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/344.txt



2016年2月4日 00:10
元利孔福，神所子畜。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/345.txt



2016年2月2日 15:06
目测发射的是等离子体@虔♛尘  求教电池




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/346.txt



2016年2月1日 23:53
2016年2月1日 23:53



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/347.txt



2016年2月1日 13:12
微醉

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/348.txt



2016年1月31日 22:43
And I dress a smoky eyes,
I take it ,
To the grave.
You're happy cause you made this.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/349.txt



2016年1月30日 17:47
谁吃谁知道！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/350.txt



2016年1月30日 00:23
让漂过地中海的花瓣，系上黎明最璀璨的珍珠。
我醉倒在海边，一切一如一万年前的清晨。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/351.txt



2016年1月29日 21:42
In The Tiger Sniffs The Rose.
,
People do choosing
By reason and key.
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/352.txt



2016年1月29日 02:02
你身边有六十亿台超级计算机， 它们昼夜不停地运算着， 都在做着对自己好的选择。

 上传1张照片到《白雨》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/353.txt



2016年1月29日 00:43
原来心疼也会风干，
当你走过那些小巷，
能看到人们把它
挂在屋檐下。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/354.txt



2016年1月29日 00:36
	
你的力量

歌手：棉花糖

所属专辑：《2375》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/355.txt



2016年1月29日 00:33
谁叫你把它放在心里的，心爱的东西丢了，就只能一直寻找。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/356.txt



2016年1月28日 02:32
明明那么漂亮的花，可就是长不大。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/357.txt



2016年1月27日 23:07
大开眼界
英文版《琅琊榜》预告片 Up主：莱可传媒 来自 AcFun -剧集 
Acfun

视频缩略图



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/358.txt



2016年1月27日 02:49
月光正好，愿我只留下侧影。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/359.txt



2016年1月26日 23:25
古典油画让我们看到画家画的是什么，国画不告诉你他画的是啥，不过它能给你一个实物。 后来就比较融合了。

 上传6张照片/视频到《白雨》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/360.txt



2016年1月25日 23:29
曾经的感动会变成痛苦，好奇会变成枯燥。 时间是歌，岁月是酒。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/361.txt



2016年1月24日 22:30
往前走了一步，发现成了工人阶级…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/362.txt



2016年1月24日 21:27
愿他们依旧健在。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/363.txt



2016年1月24日 01:11
香农理论认为信息传递，是在一个点上复制另一个点的全部。
那么只要你在宏观世界传递信息，它就一定可以被截获。
而你从生到死，都没能真正守住自己的秘密。
永远有多远，永远就是一辈子。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/364.txt



2016年1月23日 00:09
哈利马上就要去对付那条最凶恶的树峰龙，可他是队伍里年龄最小的…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/365.txt



2016年1月22日 23:43
找不着家的孩子…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/366.txt



2016年1月22日 00:01
类似纹身的原理，应该可以慢慢去掉这些疤…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/367.txt



2016年1月21日 13:39
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/368.txt



2016年1月20日 00:11
这是电脑的神经元，我相信人类已经创造出了一种新生命…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/369.txt



2016年1月18日 18:11
节食的结果就是，我才吃了一碗！一碗啊啊啊！！！！！！胀死了！！！！！胃变小了？！！！要分娩样的！！！！！！！！！！！！！！胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/370.txt



2016年1月18日 00:55
it s there , never change.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/371.txt



2016年1月17日 21:59
让孩子们远离什么事？也就是说尽管十多二十年了，我们都还只是在成长，我们准备好之后，人生才刚刚开始？那样我就必须忘掉之前的事情了吗？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/372.txt



2016年1月17日 20:19
让自己开心不难，可让别人不开心也不难。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/373.txt



2016年1月17日 20:15
“Kill everyone who catch others."



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/374.txt



2016年1月17日 19:59
我发现在过去把自己记录下来，而今再与其吵架，你就可以和自己吵架。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/375.txt



2016年1月17日 17:54
事实往往是，女孩们大多畏惧战争，于是就连坑带拐，
月光 ：这么多年了，还是只能看着她乘车走远。
除非你立下生命的誓言。
保护她，无论是战火，白骨。
一瞬间只觉这世上空无一人，英雄们都死了，他们的后代还在红旗下成长着。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/376.txt



2016年1月16日 23:55
是的，RPG火箭筒，自从遇到那女孩我就产生了一种杀马特的审美观




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/377.txt



2016年1月16日 21:57
若是以后学车了，就每天晚上开车出去，让昏黄的街灯在我脸上投下浓重的阴影，有女孩过马路时我就从容地从她们面前过去。
（请自动无视右下角logo）
（人格已被胡渣入侵）




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/378.txt



2016年1月15日 23:56
也许这真是小破孩水平吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/379.txt



2016年1月15日 21:55
饿！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/380.txt



2016年1月15日 19:44
落雪和蜡梅，吹走了你的思绪。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/381.txt



2016年1月14日 18:26
在家与在大学不同的是你得先见父母，否则你就是个强盗。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/382.txt



2016年1月14日 00:47
夜又来了，他沉浸在漆黑的河里，瞳孔发着光。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/383.txt



2016年1月13日 23:52
祭奠过去，
鲜花也凋零。
没说出口的话，
永远幽幽的
悄悄走来。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/384.txt



2016年1月12日 22:46
她写的剧本还在默默地走着，尽管没人去看了。
我深知这是她撒的网，因为我知道自己写剧本是什么感受。
所以我站得很远，好让自己比较安全。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/385.txt



2016年1月12日 13:01
这么多年了，还是只能看着她乘车走远。
除非你立下生命的誓言。
保护她，无论是战火，白骨。
一瞬间只觉这世上空无一人，英雄们都死了，他们的后代还在红旗下成长着。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/386.txt



2016年1月12日 12:46
老去的本质是无奈和失去，容易被具有相似性质的伤痛唤起畏惧感。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/387.txt



2016年1月11日 22:51
	
一千个世纪 (Live)

歌手：五月天

所属专辑：《诺亚方舟 世界巡回演唱会》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/388.txt



2016年1月11日 05:02
你会和清晨一起醒来，
被黎明的梦唤醒。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/389.txt



2016年1月10日 01:35
Just with the one you love,
You can not be tired,
You don't sleep,
Until she comes back,
Or you die.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/390.txt



2016年1月10日 00:12
7TM people in the world，go around and you will get a kind beautiful girl . But your soul and heart ,they are gone,and
Never come back .
The question is you can't forget.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/391.txt



2016年1月9日 23:56
或许是你本该伤心的事已经过去了，你却认为你变坚强了
月光 ：事实上伤心到一定程度你就很难再伤心了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/392.txt



2016年1月9日 23:47
事实上伤心到一定程度你就很难再伤心了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1000.txt



2014年3月7日 23:07
<世界>人的生命需要的不多，光、空气、水、食物。人的一生需要的不多，懒懒散散足矣。人的灵魂需要的不多，自己不觉痛苦就足够了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/393.txt



2016年1月8日 00:49
以前一直以为出现有首都，正常运作系统的敌对国家只是传说中的事，但现在世上就真出现了一块20万平方的一露头就会死的地方……这种地方也不找老大？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1001.txt



2014年3月6日 20:38
<世界>厨师们在厨房忙着做饭，爆炒的声音，汤被煮开的声音，肉汤的味道，墩子有节奏地切菜。白衣，油，汗。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/394.txt



2016年1月7日 05:04
令人费解的沉默



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1002.txt



2014年3月5日 23:29
<世界>人们在亮着灯的房子里聚会，开香槟喝啤酒，满地的彩条，有人在唱德华的冰雨，音乐声，喧嚣声，欢呼声。呆呆窗户被各种颜色的光映照成彩色。14/3/5晚



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/395.txt



2016年1月7日 02:50
白天里开着黑夜的灯。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1003.txt



2014年3月5日 23:09
因为我是很纯洁的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/396.txt



2016年1月1日 19:56
沉思，绝食，rushcity，freefly， 快二十岁了，能超脱吗

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1004.txt



2014年3月5日 22:39
山岳飘雪，桑田成海

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/397.txt



2016年1月1日 00:42
我像往常一样，饥饿着，喝了那一点RIO。
我好像回到了从前，独自走着，而且不愿睡去。
我看着镜子里那张熟悉的脸，你能笑得更柔和了，
你学会了思考，而且永远不会再难过。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1005.txt



2014年3月4日 22:39
多么令人震撼的一局




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/398.txt



2015年12月31日 23:44
河流经过草原，在天上相遇



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1006.txt



2014年3月3日 17:34
哥哥励志高二考驾照，开车只开二十码



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/399.txt



2015年12月27日 12:39
你可以飙车，可以坠崖。
你可以高空速降，可以高空跳水。
你可以以酒精掩盖痛苦，你还可以创造你的梦境。
但这些都是你的恐惧，
神早就死了，从此我们无所畏惧。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1007.txt



2014年3月3日 17:21
你今天坐哪路车回家啦，你背的什么颜色的包你看什么样的书你的头发上淡淡的酒红很好看……从某种角度来说，喜欢你的人和憎恨你的人是一样的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1008.txt



2014年3月2日 16:25
哥哥我高二就满十八啦！就可以耍朋友啦！敢不敢让哥再留一级哥高一就忙耍朋友去啦！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1009.txt



2014年3月2日 16:18
<奥德赛>经典如此的游戏为什么就没人玩呢，求组队



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1010.txt



2014年3月2日 08:58
慎独 ：【小沈阳和金秀贤竟是失散多年兄弟】近日，韩国著名基因整形医师崔成杰在看到俩人照片后，直接断言他们有着不出三代的血缘关系。后经网友深扒，果然俩人是同一曾祖父，当年战乱，沈家一族逃往高丽改姓金。目前，赵本山有意收下金秀贤当弟子，传授其二人转。更有导演准备拍摄《来自莲花乡池水沟的你》




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1011.txt



2014年2月28日 18:25
“或许你和这世界有一点点的不一样”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1012.txt



2014年2月27日 21:32
爸，冰箱门掉下来了 拿门把它抵到



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1013.txt



2014年2月27日 12:55
青春是多么伟大，也不过是终结在擦身的一瞬间

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1014.txt



2014年2月26日 13:33
青春是一场永志的劫数，谨以此献祭于这场终将失去的美。 ──此间的少年



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1015.txt



2014年2月24日 22:42
来自 美图秀秀Android版

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1016.txt



2014年2月24日 16:00
他们的名字真棒




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1017.txt



2014年2月23日 17:09
“怒放的生命”

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1018.txt



2014年2月23日 14:50
吧腊八啦

 上传1张照片到《世人 介不无辜》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/400.txt



2015年12月26日 21:43
最近为何如此吓人

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1019.txt



2014年2月23日 10:09
啦啦啦




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/401.txt



2015年12月26日 06:25
因为我真的是不想离开家，我还不想动




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/402.txt



2015年12月25日 13:19
该忘的你还是会忘掉，然后你又学会了奔跑



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1020.txt



2014年2月23日 07:53
狗狗吐黄水了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/403.txt



2015年12月24日 12:42
他是王侯，天生就是摆弄权术的人，剥削是他生存的技能，而我是穷人家，即使到了现在，看到别人受欺负我也会陷入悲痛当中。
我们天生是矛盾的，若我和他同在世上，我就不可能开心;而他生来就被教导不把命交给任何人，即使是父母，他始终只能是个剥削者。
所以我想了个办法，我颠覆了这个王朝，然后把短剑的剑柄交给了他……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1021.txt



2014年2月22日 08:30
“你的生命是个口袋，因为你有的东西而变得珍贵，当你什么都木有了，你的生命也只是个口袋，所以要庆幸自己还有这么多” 来自 美图秀秀Android版

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/404.txt



2015年12月24日 12:35
我们对自己还不够了解？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1022.txt



2014年2月21日 18:49
哥哥是文艺小清新，一直都是

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/405.txt



2015年12月24日 12:33
不够好是因为没人爱



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1023.txt



2014年2月21日 09:07
化悲痛为饭量，宁静而悲伤



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/406.txt



2015年12月20日 01:49
超人也会孤单




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1024.txt



2014年2月21日 09:03
噗～

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/407.txt



2015年12月20日 01:45
由于引擎失灵，我的飞船坠毁了，于是我来到了一个陌生的星系。
我失去了所有的行动能力，只能简单地维持生命，这对我来说就好像身体残疾了。
可是那颗恒星很温暖，很漂亮，我还年轻，对我来说宇宙的时间太漫长。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1025.txt



2014年2月15日 10:08
“憎恨就像思念一样，是没有解药”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/408.txt



2015年12月19日 05:00
师大侠。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1026.txt



2014年2月11日 12:48
内分泌失调的女性是很吓人的说



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/409.txt



2015年12月19日 04:58
女超人她哥@The Island  ，图再大点就完美了，神同步




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1027.txt



2014年2月10日 20:51
记忆深埋在时光之沙，因为它永远在那里，有些东西是埋不掉的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1028.txt



2014年2月10日 20:45
寡言，非主流，下雨不打伞雨天不出门。。奇怪的人是不是都有缺陷



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/410.txt



2015年12月19日 04:57
这是女超人@小栖栖 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1029.txt



2014年2月10日 20:22
充实就好。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/411.txt



2015年12月13日 23:09
可现在漂亮的女生也很多了，有些东西不是一时半会儿能拼来的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/412.txt



2015年12月12日 23:57
	
La Valse D'Amelie

歌手：Yann Tiersen

所属专辑：《Montmartre, mon amour》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1030.txt



2014年2月10日 18:50
周周 ：世界上最好的东西往往都是免费的.
照片中有  - 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/413.txt



2015年12月12日 21:25
人类的躯体是个巨大的工程，数不清的血脉在那里跳动着。
我们还是以模拟信号为语言吧，用抽象的形式进行交流。
将灵魂上升到新的境地，可以暂时忘却伤痛。
所以我们嘴边说的，再不是心里想的。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1031.txt



2014年2月10日 15:09
是的是的
野鬼ق 〃 ：超过五条就是一辈子的好朋友
睡过同一张床
相识至少3至5年
穿过对方的衣服，用过对方的物品
展开全文
照片中有  沈三废 、 贝拉尽有我 、 甩衰帅。 、  、 江湖人称妲己 、 始终 、 肆意 、 用右眼掩饰精致的忧伤あ 、 肆壹玖 、 匿名五年 、 9  、 世 子 、 北城以北か半度微凉 、 東莞通緝犯，——@AAA 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/414.txt



2015年12月8日 18:28
也不小了，说到孩子…
如果我将来有个孩子，他只是像我一样看着父母打麻将，只是像我一样被失去平衡的摩托砸伤，只是像我一样拖着血回家，只是像我一样不知道怎样写信，写好了又撕掉…
那我是宁愿不要孩子的…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1032.txt



2014年2月10日 14:21
初中被寝室的睡过一遍了
野鬼ق 〃 ：超过五条就是一辈子的好朋友
睡过同一张床
相识至少3至5年
穿过对方的衣服，用过对方的物品
展开全文
照片中有  沈三废 、 贝拉尽有我 、 甩衰帅。 、  、 江湖人称妲己 、 始终 、 肆意 、 用右眼掩饰精致的忧伤あ 、 肆壹玖 、 匿名五年 、 9  、 世 子 、 北城以北か半度微凉 、 東莞通緝犯，——@AAA 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/415.txt



2015年12月8日 07:04
太阳升起来的时候，你却不知道。
夕阳将落的时候，你却如此留恋。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1033.txt



2014年2月10日 14:20
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/416.txt



2015年12月5日 23:59
	
安静

歌手：周杰伦

所属专辑：《范特西》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1034.txt



2014年2月10日 14:06
初中吧寝室睡过一遍了
野鬼ق 〃 ：超过五条就是一辈子的好朋友
睡过同一张床
相识至少3至5年
穿过对方的衣服，用过对方的物品
展开全文
照片中有  沈三废 、 贝拉尽有我 、 甩衰帅。 、  、 江湖人称妲己 、 始终 、 肆意 、 用右眼掩饰精致的忧伤あ 、 肆壹玖 、 匿名五年 、 9  、 世 子 、 北城以北か半度微凉 、 東莞通緝犯，——@AAA 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/417.txt



2015年12月5日 23:59
以前哪，在因斯粉了一个韩国留学的姐姐，她上传了自学的韩文，在韩国的照片。
如果不是遇到她我可能也不会觉得外国文化这么有趣，三年过去了，再找到老熟人几乎已经不可能了，但偶尔还是会很想她。
但就是因为这样一个小小的理由，我似乎觉得，韩文是一门我必须去抽时间学会的语言吖。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1035.txt



2014年2月9日 13:49
雅安负三度，有木有寂静岭的感觉？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/418.txt



2015年12月5日 23:59
	
你的力量

歌手：棉花糖

所属专辑：《2375》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1036.txt



2014年2月9日 13:09
你又去冲了扣币，于是你的扣扣头像又能乱动了，真聪明。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/419.txt



2015年12月5日 06:58
You can never turn the clock back.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1037.txt



2014年2月8日 16:48
你扣扣头像不会再乱动，因为你的扣扣会员已经到期了。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1038.txt



2014年2月7日 17:34
这辈子生成人，就不可能变成神或者其他什么鬼东西



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/420.txt



2015年12月5日 06:55
喜欢一个人
你不可能真正忘掉TA。
这是一个规律。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1039.txt



2014年2月7日 16:45
原来人总是会成功



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/421.txt



2015年12月1日 23:07
这个厉害@虔♛尘 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/422.txt



2015年12月1日 13:37
我们在做出影响的同时，
也是在受到影响，
我们在讨论过去的同时，
也在创造历史



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1040.txt



2014年2月7日 16:36
因为我会成功，因为你希望我成为那个样子，而我依然会成功。_firefly



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/423.txt



2015年11月30日 07:23
那是初春的惊雷，
清晨的飞鸟，
坠落的夕阳，
在一瞬间照亮你的脸。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1041.txt



2014年2月7日 13:49
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/424.txt



2015年11月28日 22:00
但是现在凌乱极了

 上传1张照片到《PASITAS》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1042.txt



2014年2月7日 12:02
你的凉粉我的心



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/425.txt



2015年11月28日 21:56
色调好些了，但是路还很长啊

 上传1张照片到《白雨》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1043.txt



2014年2月7日 12:02
有时候会有一点小小的内疚



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/426.txt



2015年11月28日 18:15
清洒 ：最开始，我们在不了解词语含义的情况下仍能做出反应，所以大脑的语言系统可能最开始是比较死板的，就像河道，走不通就走下一条。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1044.txt



2014年2月6日 13:01
TMD 谁在跟我说哪个的这坨长得像那个人的那块就斩了! 会不像到哪里去!会长出好多眼睛么！会长成苍蝇么狗么无极剑圣么！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/427.txt



2015年11月28日 18:13
是哒
深呼吸 ：发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1045.txt



2014年2月5日 23:15
可能生病是我因得滴



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/428.txt



2015年11月26日 13:40
你做出的行为，被他人所接受，他人做出反应。
你未知他人所受的其他影响，所以可以认为他人对你的反应是随机的。
造成了一连串的，人与人之间的随机影响。
但是人与人之间的随机影响可以被或多或少地，定向影响。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1046.txt



2014年2月5日 23:11
像屎一样的青春被冲进马桶里了 可能就找球不回来了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/429.txt



2015年11月26日 11:15
2015年11月26日 11:15



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1047.txt



2014年2月5日 23:04
过去的事永远不会过去 只是被时光深深地 深深地掩埋了 终有一天你要清理时光的灰尘 你会发现他们的光芒依旧刺眼 灿烂如金



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1048.txt



2014年2月2日 20:33
短发妹呀 ：得不到就要毁掉怎么可以如此极品！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/430.txt



2015年11月26日 02:30
	
洋葱 (2013新录制作品)-五月天 
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1049.txt



2014年2月2日 00:22
濯三千弱水，为寻找你滴落池间的一笑



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/431.txt



2015年11月26日 02:23
他踏着夜幕下的狂风，
唱着梦境里的夕阳。
好多年了，
吉他还是不响。
你开车到山颠，站在暴风雪里，
在碎云下遇到了女孩，她在月光下美得不真实。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/432.txt



2015年11月25日 22:00
所以在已知与未知，是否忽略的不同情况下，什么样的事情都会发生
清洒 ：猜想人总会凭借其已知条件选择最佳行动。
而在某些情况下会忽略掉某些条件，从而形成了各种不同的形势……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1050.txt



2014年2月2日 00:20
原来一生中做出选择的机会并不多



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/433.txt



2015年11月25日 21:40
思维就像向量，是由多组数据决定的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1051.txt



2014年2月1日 23:33
“别鸟我！”……“你真的不鸟我啊？”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/434.txt



2015年11月25日 20:34
除了骨头骨膜肌肉血管皮还有啥。。。
清洒 上传1张照片到相册  刷题预燃装置 
目测是腰部的……跌打损伤？总之应该有一些组织被压坏了，毛细血管神经纤维什么的……可能有轻微的骨裂。 最近我快分成两只了。。





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1052.txt



2014年2月1日 23:31
彪悍女撒娇是什么感觉。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/435.txt



2015年11月24日 01:44
	
When You Told Me You Loved Me

歌手：Jessica Simpson

所属专辑：《世界上最动听的歌超级天籁系列合集 上》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1053.txt



2014年1月27日 13:52
这车晚点晚的太离谱了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/436.txt



2015年11月24日 01:43
对有些人来说啊，她的一生都不值钱。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1054.txt



2014年1月26日 20:09
这个看起来不错
徐社长 ：经常写作业竟然容易致癌！求转发求扩散！花几KB流量传播正能量



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/437.txt



2015年11月24日 00:48
可男孩总有一天是要给女孩介绍说，那个穿黑西装的人就是我老板。
对于高傲的男孩子来说，这就是说那人比我好比我帅比我有钱，能找到他那样的就把我丢了吧云云



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1055.txt



2014年1月26日 17:44
花期越来越近。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/438.txt



2015年11月23日 23:26
她家有熊，你家也有熊。
她夏天时穿白裙子，
你冬天时戴红帽子。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1056.txt



2014年1月25日 22:57
2013最火谜语 ，一头牛为农场主打工，有天农场主告诉这牛加班发加班费，牛就跑去加班，农场主把挤出的牛奶拿出三分之一做成奶酪发给牛，牛高兴地走了，是为绩效工资



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/439.txt



2015年11月23日 23:21
如果都不清楚自己是什么
又怎能了解自己在做的事



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1057.txt



2014年1月25日 20:05
其实我这十六年来一直在观察，最终得出的结论是女孩子是富二代的几率似乎比男孩大，所以我决定好好培养我的爹妈，这样一来，我就能成为一个富二代，毕竟我是他们一把屎一把尿塞大的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1058.txt



2014年1月24日 20:35
原来是时光太老了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/440.txt



2015年11月23日 13:35
你曾经一无所有，如今有了珍惜的东西，还敢飞车吗？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1059.txt



2014年1月24日 00:14
哪位大神讲解下这是什么效果。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/441.txt



2015年11月22日 21:01
回家啦 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/442.txt



2015年11月22日 07:41
疑似赤铁矿，专业人士(？)看一看@虔♛尘 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1060.txt



2014年1月22日 21:17
旧时代二逼青年骂了人拍了屁股走人



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/443.txt



2015年11月21日 22:06
很久之后你摔掉了那双翅膀，发誓再也不飞翔。你发现自己既不想要翅膀，也不想要飞翔，你想要的只是与女孩一起的时光。
清洒 ：从此你渴望有一双翅膀。
但有了翅膀你还是不会快乐，
因为你要的不是翅膀，
你要的是飞翔。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1061.txt



2014年1月22日 21:00
我嘞个去，爆照就无罪么？！再丑一点啊？！
  ： 臭婊子， 你是想火是不？老子让你火。 能转的都转 她的话如果你没生气就别转了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/444.txt



2015年11月20日 19:10
明天会有什么




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1062.txt



2014年1月22日 20:23
若是喜欢一个人，时光就像胶水把你们的灵魂粘在一起了，当塌走掉时，撕开你的一层皮



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/445.txt



2015年11月19日 23:39
酒无锋芒，却能断肠。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1063.txt



2014年1月22日 16:28
简单有效。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/446.txt



2015年11月19日 23:37
酒无锋芒，却能断肠。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1064.txt



2014年1月20日 00:12
好多年了，好多好多年了，记忆被时光无限的拉长，断开了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/447.txt



2015年11月19日 22:52
那天云都碎了，夕阳散落着，公园里没有人。
其实时光也是会老的，一这年头过去了那些记忆只剩下场景。
人影快速地穿梭着，黎明一直不肯到来。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1065.txt



2014年1月19日 16:56
我不会告诉你们我玩了一个学期的电脑我不会告诉你们我连续挂机两天玩烂了强悍的大耳笔记本电脑



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/448.txt



2015年11月19日 21:03
我觉得彼此之间
隔着命运，
可现实往往比所想
更可怕。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1066.txt



2014年1月17日 19:42
喵 ：哈哈 我要给我儿子买这衣服穿!




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/449.txt



2015年11月18日 21:41
穿过
密林与高山，
狂风和暴雨。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1067.txt



2014年1月10日 14:26
欧麦雷迪嘎嘎！我在成都看到了什么？？？阳光学校校服！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1068.txt



2014年1月4日 19:31
超级无聊的时候拍得照片都是黑摸摸的啊，祝一切平安

 上传2张照片/视频到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/450.txt



2015年11月17日 17:30
这个近似我的脸型，女孩的那张烟熏妆很棒，

 上传1张照片到《白雨》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1069.txt



2014年1月2日 15:19
有点怀念那些年一中的老解剖室和和闹鬼的逸夫楼啊哈哈这是什么邪恶的想法。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/451.txt



2015年11月17日 17:28
斯图尔特

 上传1张照片到《白雨》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/452.txt



2015年11月16日 23:27
2015年11月16日 23:27



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1070.txt



2014年1月1日 22:42
名牌电脑最新机型预装系统WIN98。。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/453.txt



2015年11月16日 22:17
海上钢琴师，正看得令人切腹，又想起“你们已经成年了，要为祖国生下强壮的后代噢”之类吐槽，顿时无语了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1071.txt



2013年12月31日 20:02
决定好的事情就应该赶快去做，因为在下一秒，你就会改变主意。

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/454.txt



2015年11月16日 08:05
It's strange ,
That name have not be that meaning
Any more.
It has a new meaning.
Even it was important to you.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1072.txt



2013年12月31日 09:36
。。。  

 上传1张照片到《世人 介不无辜》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/455.txt



2015年11月16日 07:48
If you don't love her
She won't be good.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1073.txt



2013年12月31日 09:31
无良老爹居然要我去做高尔夫球童。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/456.txt



2015年11月14日 15:35
Black Eyeliner
Giver me firm.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1074.txt



2013年12月30日 00:20
caonidaye
8090这些事 ：用一个词或一个字总结你的2013：________




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/457.txt



2015年11月14日 12:38
2015年11月14日 12:38



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1075.txt



2013年12月28日 20:06
饲子饿而食。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/458.txt



2015年11月13日 20:42
	
环岛旅行

歌手：熊宝贝乐团

所属专辑：《3:53》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1076.txt



2013年12月27日 19:42
打毛线戒网瘾。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/459.txt



2015年11月12日 22:06
人老的很快的，胡须忽然就出现咯，身体也开始出毛病，这时候你喜欢的女孩子才来，然后女孩就会笑你是个又老又穷的怪蜀黍
	
ここにいるよ (在你身边)

歌手：SoulJa/青山テルマ (青山黛玛)

所属专辑：《ここにいるよ Feat 青山テルマ EP (我在这里)》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1077.txt



2013年12月27日 00:17
在那个战火纷飞的年呆，毛老爷子这么说过。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1078.txt



2013年12月22日 13:13
啊啊啊
Truth. ：我决定了我要在床上弄一个！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/460.txt



2015年11月10日 13:52
	
The Rose

歌手：手嶌葵

所属专辑：《The Rose ～I Love Cinemas～》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1079.txt



2013年12月21日 14:29
我现在的状态就是天天赖床，混吃等死



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/461.txt



2015年11月7日 00:14
“事实上，你比你想得还要天才得多！”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/462.txt



2015年11月5日 17:54
“多放可可粉哦，我要低脂的那种。”
手工制作也不错。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1080.txt



2013年12月20日 11:34
想逮一只小的回去养，没逮到，啊啊啊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/463.txt



2015年11月4日 13:04
说起来真的是，
只要你能被杀死，
就有被杀死的可能。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1081.txt



2013年12月18日 18:20
！！！
Mars. ：有一种感情叫。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/464.txt



2015年11月3日 13:25
女孩子…就是这么奇怪啊，她偏偏要你放弃好看的劲凉小帅去选择长得像她的烈焰甜心，她偏偏要你去叫那个身体不好的少年去开摩托…说好了不笑你还是笑得像狗一样。
女孩子就是这么奇怪啊，她在你身边可你总是不开心，因为你想要的东西回不来了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1082.txt



2013年12月18日 16:01
化雪比下雪还冷啊哈哈哈土耳其毛驴都结冰啦！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/465.txt



2015年11月1日 14:38
这是调整自身状态，使之达到最强功能。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1083.txt



2013年12月16日 22:52
“他活在你的身体里，你的脑海里。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/466.txt



2015年11月1日 14:33
说起来很可笑，这时代似乎没有纷乱的必要，可如果不会有效行动，真的会被别人毁灭掉。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1084.txt



2013年12月16日 00:24
2013年12月16日 00:24



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/467.txt



2015年11月1日 14:18
不能理解人类自身的行为，就不能完成计划。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1085.txt



2013年12月15日 17:02
卧云桥上卧云飘，万条垂下碧丝绦。不知细叶谁裁出，卧云桥上有剪刀



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/468.txt



2015年10月31日 23:51
写出来有发展不够好，是你惹的祸啊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1086.txt



2013年12月14日 00:23
　　Yl。 ：今天这个图片貌似传疯了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/469.txt



2015年10月31日 23:26
killed one,
last year.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1087.txt



2013年12月8日 16:47
战斗机群
很久很久很久之前 ：小朋友们根本把持不住好么！！！！(T_T)我刚吃好啊..




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1088.txt



2013年12月8日 16:36
拿破仑？！
夏小白 ：我承认我比你矮,但如果你因此来嘲笑我,我会砍掉你的头来削平我们之间的差距.——拿破仑




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/470.txt



2015年10月31日 00:14
那女孩亲吻过的男孩们就在你居住的城市里，踏着你每天走过的大街，晒着太阳给她发短信聊衣服，女孩一边哄着一无所知的你，一边还...
	
ここにいるよ (在你身边)

歌手：SoulJa/青山テルマ (青山黛玛)

所属专辑：《ここにいるよ Feat 青山テルマ EP (我在这里)》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1089.txt



2013年12月7日 19:53
Here.now.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/471.txt



2015年10月25日 00:18
最近神叨叨的

 上传3张照片/视频到《白雨》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/472.txt



2015年10月24日 22:15
15/10/24.信仰光




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1090.txt



2013年12月7日 17:37
人民拦路




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/473.txt



2015年10月24日 22:13
15/10/24.信仰光




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1091.txt



2013年12月7日 15:14
经过我的观察，男生才是这个星球上集美丽与智慧于一体的生物



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/474.txt



2015年10月23日 22:48
地狱是口深井，
它能看到你，
你却一无所获。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1092.txt



2013年12月6日 00:48
提小莫

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/475.txt



2015年10月23日 22:42
再见面时，我已经完全不同了。
我知道你也是，而你又是选择了一条什么样的路呢。
它们是你的刀剑，还是你冬天里的蜡烛。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1093.txt



2013年12月5日 16:13
我以后不能长成这样子啊。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/476.txt



2015年10月18日 00:00
I am anyone
£Just with you.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1094.txt



2013年12月4日 10:06
我还是喜欢男生算了

 上传5张照片/视频到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/477.txt



2015年10月17日 23:53
Dark black
£Long river.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1095.txt



2013年12月1日 18:45http://user.qzone.qq.com/1519597080
2013年12月1日 18:45



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/478.txt



2015年10月16日 23:17
It with
A kind of
Magic.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1096.txt



2013年11月30日 23:05
这真是极好的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/479.txt



2015年10月16日 16:41
你太聪明了，
当你走了，
我们都一无所有了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1097.txt



2013年11月28日 22:37
可爱滴扁桃体

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1098.txt



2013年11月27日 15:06
我次奥你老木！！变态！！丑陋！！脸上长痔疮！！滚动回城！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/480.txt



2015年10月11日 17:13
肾上腺素使人上瘾啊。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1099.txt



2013年11月26日 22:47
帅是与生俱来的，我也木球得\办法

 上传2张照片/视频到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/481.txt



2015年10月11日 01:07
你的心被什么锁住了，
你找来找去，
发现门外挂着一把空锁。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/482.txt



2015年10月11日 00:56
时间就这样过去了，有时候你会想很多的白日梦。
你渐渐发现这房子里好像还有另一个人，你寻找他，注意到他的性格和小习惯，但是你见不到他。
你找累了就打开窗，窗外却又是另一个世界了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/483.txt



2015年10月10日 19:56
再越一步，
将失去所有。
同时也无所畏惧。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/484.txt



2015年10月8日 01:00
我是矗立的槐树，
是一袭白衣在窗口，
可少年的心也很苍白。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/485.txt



2015年10月7日 21:50
Something beautiful but too thin
Something simple but ..
No what.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/486.txt



2015年10月7日 21:46
后来发现脑袋歪了

 上传1张照片到《the weapon》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/487.txt



2015年10月4日 23:14
一件事改变了一些东西。
它可能造成结果，
会是那个人做这件事的初衷...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/488.txt



2015年10月4日 22:53
It's just your night.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/489.txt



2015年10月4日 22:49
	
牙关

歌手：五月天

所属专辑：《知足 最真杰作选》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/490.txt



2015年10月3日 12:32
Sympathy is
Put others'
Pain on you .




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/491.txt



2015年10月3日 00:17
thats nice ，try it Again

 上传1张照片到《the weapon》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/492.txt



2015年10月2日 22:25
心里那股火一烧，也许我就真把专业填成佛学，神学啥的了。然后你们也许就能在某个小教堂看到我了……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1100.txt



2013年11月26日 20:49
姬野和阿苏勒相遇的时候他十四岁，猛虎之牙初见锋芒，二十年后拔剑相向。所谓朋友，就是你知道他的存在，却执著于不与他相遇（？）。
九州·缥缈录




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/493.txt



2015年10月1日 14:06
清洒 ：恐惧 自由 贪欲 仇恨。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1101.txt



2013年11月26日 20:43
恰同学少年




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/494.txt



2015年10月1日 12:48
最大的殊荣就是给什么东西取个有意义的名字。
比如我种出了一朵独特的花。
很多年以后我都不在了，人们也会记住它的名字。
即使只有少数人听说过那些故事。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1102.txt



2013年11月26日 20:35
你会沉睡在一泓湖泊里 等待多年之后的访客 还要一些年 我会死在一争天下的战场上 你教我种的花 都已枯萎




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/495.txt



2015年9月30日 16:53
就是很对味！
	
心雨

歌手：周杰伦

所属专辑：《依然范特西》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1103.txt



2013年11月26日 19:58
哈哈我发的说说太帅了是不是很有作家份儿啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/496.txt



2015年9月30日 16:49
生命如此苍白，
生命如此嫣红。
你的沼泽没有来者，
你的荒野开满了玫瑰。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1104.txt



2013年10月27日 19:13
“你们没有人悲伤么？” “悲伤的人都死光啦，于是我们就这样坚强地活了下来



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/497.txt



2015年9月25日 13:59
如果他真的那么好，那为什么不去喜欢他呢？还是自己不太优秀吧。
是你陪我去游乐园啊，是你陪我看白色的烟火。所以我才会那么喜欢呆呆傻傻又认真的你吧。
有人说命运总是不可琢磨，不如意是十有八九。
所以本质上我们都是一无所有的赌徒，不赢到心爱的东西，决不撒手。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1105.txt



2013年10月27日 19:05
看到一个特殊的人偶尔会想起那苍白的童年




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/498.txt



2015年9月13日 14:13
2015年9月13日 14:13



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1106.txt



2013年10月26日 19:52
放屁



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/499.txt



2015年9月13日 14:12
2015年9月13日 14:12



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1107.txt



2013年10月26日 17:49
郎个里个郎。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1108.txt



2013年10月19日 05:35
"听着,马克思我需要一个全新的机器人……" "你把我卖了？！！"



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1109.txt



2013年10月19日 04:22
我是你穿越时间爱的人。现在，过去@协奏曲  ，以及未来



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1110.txt



2013年10月18日 06:50
为毛我这几天老是梦到盗墓有关的 和闷油瓶一起念书啥的。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1111.txt



2013年10月15日 21:20
神啊!!赐给我一个彪悍的姐吧!!



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1112.txt



2013年10月15日 21:19
篮板哥 我迟到了 生日快乐 你们哪天带到我High三！
StrangeKiller ：生日快乐      好不容易抽时间给你发了条感人的说说 不多说你都懂得撒 丑逼你老了        过开心@关于你的我、 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1113.txt



2013年10月14日 23:08
对毁我青春的两杂种一笑而过~



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1114.txt



2013年10月14日 21:06
 http://url.cn/N3E45Q 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1115.txt



2013年10月14日 20:26
宵夜，是承诺，是十六年来的坚守。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1116.txt



2013年10月14日 16:04
刚买的蓝牙耳机里语音提示居然带口音。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1117.txt



2013年10月14日 14:38
神了！！
MONSTER ：这就是高数，想等于几就等于几。尼玛啊。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1118.txt



2013年10月14日 08:03
深呼吸 ：世界的模样，取决于你凝视它的目光。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/500.txt



2015年9月11日 17:06
我要在整个沿海买下一大片土地，种满那种最酸的果树。
秋天的时候果子都掉在地上烂掉了，风一吹整个城市都是酸的。
然后我就唱歌。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1119.txt



2013年10月13日 00:23
当发现爹妈是贱货一直当你是傻逼的时候才发现朋友是多么重要



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/501.txt



2015年9月7日 18:18
可我觉得啊，偶尔炸个地球也没什么的……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/502.txt



2015年9月4日 00:47
我往夜里一站，就成了一棵树。
我不觉得饿，我也不知道自己
死了没有。
我乐于此，
而且执着地活下去。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1120.txt



2013年10月12日 23:40
雄起！！
阿冉 ：阳光足球队嘞，拿出你们的霸气，这次正漏，不要侧漏，我们全部是你们的后援团！！你们加油！！！把俊波干死，为阳光争脸，我们永远爱你们，永远支持你们，你们全是大神！！！加油阳光足球队的队员们，你们是国足的希望！！！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/503.txt



2015年9月4日 00:38
我他妈的欠别人很多东西，
连别人的名字都没记住。
不过ta也没说要我干啥啊，
话说你知道你知道自己想要的是什么吗？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1121.txt



2013年10月12日 19:20
所以我饭卡掉了好多次- -



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/504.txt



2015年9月4日 00:13
在这样的夜晚，胭脂都落寞了。
凉风要绕过几道弯，才能找到我啊。
这样的月光，沉重得让人窒息。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1122.txt



2013年10月12日 15:41
如果 我是说如果哪天我突然就死求了 你们会不会有一些难过呢



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/505.txt



2015年9月2日 22:29
年轻男子在角落里坐下来，也不管满身的积雪。
斗笠遮不住俊美的容貌。
他握着一把古旧的长剑，看上去是连萝卜都切不动。
小二从他身旁经过时，被叫住了。
他问能否找个房间别告诉任何人。
他被轰了出去。
于是他又继续跋涉，在小巷里缩成一团。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1123.txt



2013年10月12日 14:07
多年以前 猫和大狗相遇在血雨交加的晚上 多年以后 狗把猫当耗子抓了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/506.txt



2015年8月29日 23:01
如今在我的世界观中又多了一种人。
所以我开了第九个分组，踏焰者。
For They who
Fight with fire and darkness
话说第八个分组被隔离了。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1124.txt



2013年10月12日 14:02
+Q327775看污话,小说,视频 ：这个社会，有多少昧着良心的人？老人在廉江市场用二只鸡，六斤香蕉换来二张百元假钞，本来满心欢喜，老人拿着假钞，放声痛哭，心酸呀、希望那个该死的人有一天能看到，良心受到谴责，为了老人转了，如果你怕脏了你空间就当没看到吧！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/507.txt



2015年8月28日 22:13
我想要一个
足以照亮世界的
奇迹



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1125.txt



2013年10月12日 13:11
老婆啊 你会在哪里出现捏



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/508.txt



2015年8月28日 00:34
如果结合目前的状况来看的话，我认为从某段时间开始，周围人的说话习惯与我的习惯产生了差异。
但是一种刻意的味道似乎可以感觉到。所以说我觉得应该有一部分人是明白这样的差异，所产生的原因。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1126.txt



2013年10月12日 13:09
小伙子，你姨妈巾掉了～ ：各种神走位。。。小伙伴和我都惊呆了。。。求转



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/509.txt



2015年8月28日 00:17
我敏锐地感到有什么不太一样了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1127.txt



2013年10月11日 21:56
记忆中没有你的存在



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1128.txt



2013年10月11日 21:56
周末有谁去看电影么 不要剧情的 科幻的超能力的大型灾难片512那种最好



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/510.txt



2015年8月28日 00:03
枯萎，
或是新生。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1129.txt



2013年10月11日 19:17
从来没有希望我过的好过不是么



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/511.txt



2015年8月27日 22:37
2015年8月27日 22:37



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/512.txt



2015年8月27日 22:36
2015年8月27日 22:36



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1130.txt



2013年10月10日 21:42
为毛



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/513.txt



2015年8月27日 13:57
八月二十七日小节
既然“情绪”
已经能在一定程度上被观察到了。
那么将这个抽象的事物引入意识里，
保持观察。
就能获得更多的相关信息。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1131.txt



2013年10月10日 20:33
救我！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/514.txt



2015年8月27日 13:47
2015年8月27日 13:47



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1132.txt



2013年10月9日 03:03
你的爱像沙滩从未离开 我的爱像潮汐从未悔改



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/515.txt



2015年8月27日 13:45
那片天空中有光在闪动



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1133.txt



2013年10月8日 17:12
JOY ： 这个年头不抽烟的男生难找，不抽的请转发！！！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/516.txt



2015年8月26日 23:05
大型灾难片
开学
即将上映。
敬请期待。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1134.txt



2013年10月7日 19:32
让我想起了几个猥琐
Stay With Me ：-哈哈。真理~



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/517.txt



2015年8月26日 23:03
偶尔对着湖沉思，
无尽地坠入了
意识深处。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1135.txt



2013年10月7日 18:49
你们都是坏人



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/518.txt



2015年8月26日 20:12
黑夜望着大地，
大地望着天空。
像宝石上有裂痕。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1136.txt



2013年10月7日 18:17
渐渐的在他身上看到了别人的影子渐渐的他变成另一个人渐渐我开始怀疑这个人是否真的存在过



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/519.txt



2015年8月26日 09:41
生物是最恶心的学科了
清洒 ：器官所需要的，不过是适宜的养分和化学环境。
如此一来，我们给了它这些，它就可以像正常情况一样地工作。
而这些养分当然最好是另外的器官来提供。
受精卵也并不是只能在人体内发育，只要一个健康的器官就好了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1137.txt



2013年10月7日 03:38
早上忘了带双翅膀出门



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1138.txt



2013年10月6日 15:40
刘姝生日嗨皮骚瑞骚瑞上次来西昌我没去成好好的 作为你大哥我啥都没给你准备真抱歉



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/520.txt



2015年8月25日 23:37
如果在进行验证的同时也会隐秘地改变所要探究的东西，这样一来事情就复杂了
清洒 ：这样想来的话，因为未知的原因，从两年前开始，我的朋友必须具备一定的逻辑沟通能力，
至于为神马会发生这样的事，我还得再想想



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1139.txt



2013年10月3日 18:06
攀枝花的呱呱，辣!




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/521.txt



2015年8月24日 23:03
话说我第一次想要表白，
居然是用电子邮件的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/522.txt



2015年8月24日 22:35
似乎很容易

 上传1张照片到《morning pigaso》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1140.txt



2013年10月3日 15:58
刚才把脚崴了在路边坐了会，居然有人给我扔了五十块钱不许赞！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/523.txt



2015年8月24日 22:34
你哭得太累了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1141.txt



2013年10月3日 12:47
499277 ：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 　　 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 　　　我喜欢早上起床看到信息或者 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/524.txt



2015年8月23日 15:27
清洒 ：换个风格




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1142.txt



2013年10月3日 12:22
尽善尽美




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/525.txt



2015年8月22日 23:08
这个句子不是很奇怪吗？主谓结构？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1143.txt



2013年10月3日 11:30
清洒 ：天气好，l心情逗好！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/526.txt



2015年8月22日 11:52
小熊熊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1144.txt



2013年10月2日 23:14
怎么办，月经不调




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/527.txt



2015年8月22日 01:54
不能同行，乃人生一大悲剧。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1145.txt



2013年10月2日 22:57
如果能早点打通任督二脉的话那我也不是现在这样罗




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/528.txt



2015年8月22日 01:51
He is young ,
one day he'll
be gone



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1146.txt



2013年10月2日 17:13
感觉这个世界疯掉了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/529.txt



2015年8月22日 00:20
水煮的青春，我是死不了的鱼。
黛青色的河，打湿的袖角。
可惜的是回不去了，
所有一切，
都像没发生过一样。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1147.txt



2013年10月2日 16:34
你们这些人呢 说话不说清楚 简直是对我智商的侮辱



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1148.txt



2013年10月1日 15:32
2013年10月1日 15:32



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/530.txt



2015年8月20日 16:45
我感觉……一切都通畅了！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1149.txt



2013年9月30日 19:54
开 开开开开什么玩笑 锤子 我是多么英俊潇洒 风流倜傥 帅气动人 哒
清洒 ：@月光  中间这个像你！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/531.txt



2015年8月20日 13:14
所以，疯狂一次吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/532.txt



2015年8月20日 13:09
在日本这种防腐剂已经被禁止使用了，所以丢了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1150.txt



2013年9月30日 15:02
睡到3点打鸡血的节奏没去上课 哥们儿今儿要是活下来了 得好好耍个朋友！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/533.txt



2015年8月19日 11:51
这奇幻瑰丽的人生，不过才刚刚开始。
什么都没有，所以不害怕失去。
随时准备着，浪迹天涯。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1151.txt



2013年9月30日 14:55
多久 ：丶 、　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　祝初中那群傻逼中秋快乐-　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/534.txt



2015年8月18日 16:02
使用杀虫剂吗不用吗……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1152.txt



2013年9月30日 07:53
不管娃儿啦？？！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/535.txt



2015年8月17日 22:06
人生总是充满了绽放的光华，
只是后来都落寞了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1153.txt



2013年9月29日 19:54
好恐怖
视频缩略图



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/536.txt



2015年8月17日 21:55
虽然并不严谨
清洒 ：【八月十七日小节】情绪也能在很大程度上影响我们做的事，说的话。
在某些时候，情绪能带来负面影响，因而创造此条件就可能造成负面影响。
可能的解决方案：1.把情绪作为考虑的因素，维持自己的情绪，可能会花精力去注意。
2.坚毅性格的人，情绪对他的影响很小。
3.做事讲原则，这样即使情绪不好也能做正确的事。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1154.txt



2013年9月27日 15:50
救命啊 吃撑了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/537.txt



2015年8月16日 23:13
我随身一壶酒，
但我不会喝。
我把烧刀子
慢慢地浇在她的坟头，
绿草上吐着气泡，
洒着月光，
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1155.txt



2013年9月20日 00:45
！！！
能打的小新疆。 ：老夫聊发少年狂，左根号，右平方。主将从现，as必倒装。万物生长靠太阳，叶绿素，能制氧。氯化亚铁不稳定，加铜粉，变棕黄。大气环流，开厂挨市场。形而上学辩证法，动滑轮，电磁场。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/538.txt



2015年8月16日 16:20
我把整整一瓶烧刀子
倒在她坟上，
我不喝酒的。
我只是想带着一瓶酒。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1156.txt



2013年9月19日 00:19
2013年9月19日 00:19



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/539.txt



2015年8月16日 16:05
先储存起来，有时间的时候可以模拟一个人工胃，在其中加盐酸以达到胃酸的PH啥的
Mr. boring ：留着以后杀舍友。
1、柿子+啤酒=中毒
2、感冒药+可乐=中毒
3、鸡蛋忌糖精┄┄同食中毒、死亡
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1157.txt



2013年9月19日 00:13
温羲的中秋夜

 上传1张照片到《0% sugar !》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1158.txt



2013年9月18日 23:47
我的世界观再一次崩坏！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/540.txt



2015年8月15日 23:16
十八年，有过多少生命的危险。
十八年，踏着浪，吹着风。
一路走来，如此不易。
人生本该如烟火，绚烂着盛开。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1159.txt



2013年9月18日 21:50
我觉得我开始变尾缩了怎么办



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/541.txt



2015年8月15日 18:22
是不是忘了什么？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/542.txt



2015年8月15日 15:17
2015年8月15日 15:17



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1160.txt



2013年9月18日 21:33
=-=跪了
浅笑 ：荆轲，请你阐述一下你刺杀秦王的价值，是否存在商品交换？你的刀位移是多少？加速度多大？可否看成质点？刀的摩尔质量是多少？刺杀秦王是否存在着加强大一统统治和削弱相权？是否存在历史意义？当时太阳高度是多少？时区是什么？日期及时间是什么？太阳直射点在哪？你刺死了多少活细胞？秦王是否说了英 展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/543.txt



2015年8月15日 13:00
谁要……守住谁。
first in 2015 ,second in 2013.
something null
was happenning.
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1161.txt



2013年9月18日 21:29
大前天梦到溺水 昨天梦到阳光学校



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/544.txt



2015年8月14日 20:46
主说，要有范儿

 上传2张照片/视频到《指挥官》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1162.txt



2013年9月18日 15:18
不想上课不想上课不想上课



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/545.txt



2015年8月14日 13:19
有人在看风景，有人在聊天。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1163.txt



2013年9月17日 21:41
是的
磊王 ：是的童鞋们 你们看这帮老魂淡就是这么做售后的！！ http://url.cn/Q02M



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/546.txt



2015年8月13日 22:39
可这些牛肉巴巴，就是她的一生……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1164.txt



2013年9月17日 21:34
磊王 ：是的童鞋们 你们看这帮老魂淡就是这么做售后的！！ http://url.cn/Q02M



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/547.txt



2015年8月12日 13:31
时间，要你命……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1165.txt



2013年9月16日 17:47
蛋蛋又哭了？？！！
清洒 ：当时蛋蛋哭了！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/548.txt



2015年8月11日 15:16
一条河，要承载多少故事呢。
氧化的金属，是否在这大山深处。
有一天他踏遍这世界，又要到哪里去呢。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1166.txt



2013年9月16日 15:33
你这是穿越吧= =
清洒 ：意外地卷入到某个很大很大的世界里了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/549.txt



2015年8月10日 08:40
一件事情所带来的效果也是多方面的，每一个方面所可能带来的推动力都可能是事件发出者的目标。
清洒 ：说起来的话，扣扣上确实是发生了一些怪事，当然密码可以通过多种方式泄漏，也可以登录空间不留下痕迹吧。
不过谁知道我这样说会发生怎样的事情呢。
我清楚的事情是说和做虽然是两件事情，不过都有其自身的意义。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1167.txt



2013年9月15日 16:24
去扒山了。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1168.txt



2013年9月15日 15:15
毛闷爆了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/550.txt



2015年8月9日 20:26
迷茫的高速公路，渺茫的歌声。
翻腾的云海，斑驳的火光，
巨龙的脊背，勇士的心。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1169.txt



2013年9月14日 15:48
时尚美淘淘 ：如果你有一个很棒的妈妈，你很爱她，请转发......




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/551.txt



2015年8月9日 14:23
这东西挺重要的。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/552.txt



2015年8月9日 02:43
清洒 ：“坐在大街边的玻璃房子里喝着几十块的咖啡，可心里还是老想着天上的星星‘’



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1170.txt



2013年9月10日 22:04
丑啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/553.txt



2015年8月9日 02:14
指甲油又称“指甲漆”。它主要成分为70%-80%的挥发性溶剂，15%左右的硝化纤维素，少量的油性溶剂、樟脑、钛白粉以及油溶颜料等。
——“我个人比较相信有机化学。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1171.txt



2013年8月27日 23:30
王萌萌 ：- 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　有叫别人别熬夜，自己却睡得很晚的，默默举手。 　　　　　　　　　　　　　　　　　　　　　



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/554.txt



2015年8月9日 01:46
坦然接受吧
清洒 ：不要跟我提肉的事……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1172.txt



2013年8月22日 22:44
0＾0
清洒 ：对不起对不起对不起对不起对不起对不起对不起我是傻逼我是傻逼体谅一下



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/555.txt



2015年8月8日 14:24
炸弹邮包的最大杀伤力应该是这样，反物质湮灭炸弹不大可能……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1173.txt



2013年8月18日 22:27
我不能理解的事
念安- ：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　再牛逼的女汉子也会败给痛经,　　　　　　　　　　　　　　　　　　　　　　　　　　　　　




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/556.txt



2015年8月8日 08:20
以生活现象发展出一个全新的猜想:当我们处在某个情绪状态下时，如果发生了可能引发这种情绪的事件，那么两者可能联通起来。
似乎心理越不成熟的人，越容易把两者混为一谈。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1174.txt



2013年8月15日 16:01
。。。
清洒 ：为什么你总要做到最好 让一步会死掉？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/557.txt



2015年8月7日 23:40
墨洒的骏马，一生不过是草原与云之间……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1175.txt



2013年8月15日 00:22
。。。-=-



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/558.txt



2015年8月7日 22:36
草原上很多的土拨鼠……很多很多！此位置路边千米有个牧羊人营地，帐篷边开满了紫色的小花。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1176.txt



2013年8月14日 19:32
你太棒了！！
LOL粉丝网 ：当《英雄联盟》遇上《小时代》，我和我的小伙伴们都惊呆了。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/559.txt



2015年8月7日 13:09
2015年8月7日 13:09



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1177.txt



2013年8月13日 22:51
- -



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1178.txt



2013年8月12日 15:56
- -
清洒 ：放你的屁



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/560.txt



2015年8月7日 13:07
说梦话的时候，人脑是个神马状态……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1179.txt



2013年8月11日 13:41
两块五毛的罐装饮料 一些海报 书
清洒 ：你还拥有什么



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/561.txt



2015年8月6日 08:23
那每天就吃这些东西吧
清洒 ：营养素
每日推荐摄入量（标红的数据为适宜摄入量）
蛋白质
75g
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/562.txt



2015年8月5日 22:29
那么多被小心守护着的梦，像烟火一样灿烂……
清洒 ：这世上那么多漂亮的女孩子，她们每天细心地妆点自己，或是白白的皮肤，或是精心梳的麻花辫，或是水汪汪的眼睛……我怎么越看越觉得像是在地狱里嘶吼呢。
那么多被小心守护着的梦，像烟火一样灿烂。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1180.txt



2013年8月11日 11:36
中枪一半
鹿晗。一些小秘密 ：传说中的十大堕落表现，您占了几条？ 中枪的转




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/563.txt



2015年8月5日 18:55
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1181.txt



2013年8月10日 21:41
- -
清洒 ：如果有幸用神的眼睛俯瞰大地 那么人们一定是挺可爱的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/564.txt



2015年8月5日 06:59
把所有影响情绪的东西作为自变量。先用物理的方法，寻找可能的比例关系，再用数字表示出来。
清洒 ：此前一直认为，把诸如情绪的虚无缥缈的东西引入计算是不可能的。
情绪就像色彩，充满了变数。
不过色彩都是可以用数字表示的，情绪应该也可以。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1182.txt



2013年8月8日 22:37
我爱吹海风
苏诺哥。 ：　　 　　　　　　　　　　　　　　 　　　　　　　　　　　　　　 　　　　　　　　　　一人说一句谎话。必须是假的。传下去。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/565.txt



2015年8月4日 22:20
梦里窗外事，？？？ 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1183.txt



2013年8月7日 18:38
箫声里 连绵雨



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/566.txt



2015年8月4日 10:40
敦煌，能看到壁画

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1184.txt



2013年8月7日 18:06
人才啊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/567.txt



2015年8月4日 06:42
安息吧，我的梦。
就埋在千里的黄沙之下。
我的人生会是这样吗？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1185.txt



2013年8月7日 15:17
全中！！我倒是挺会自娱自乐的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/568.txt



2015年8月3日 20:59
2015年8月3日 20:59



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1186.txt



2013年8月7日 15:06
总是没有含着眼泪的人这么说 我也算一个
美图控 腾讯认证 关注 越有故事的人越沉静简单，越肤浅单薄的人越浮躁不安。真正的强者，不是没有眼泪的人，而是含着眼泪依然奔跑的人。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/569.txt



2015年8月3日 20:39
可是夜幕像冰冷的太阳，
我又要如何寻找光芒。
月光满地，弯着腰拾捡回忆。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1187.txt



2013年7月16日 08:39
。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1188.txt



2013年7月15日 22:46
其实我最想知道一中运动场积水湿地系统食物链



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/570.txt



2015年8月3日 20:33
时光酒，火焰花。
你不是鹅毛，你是闪电。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1189.txt



2013年7月15日 22:26
你说我二我就二了？？我二又咋个了？？二不好么？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/571.txt



2015年8月2日 22:55
清洒 ：我们来这世上，喝着冰啤酒，唱着歌，爱着某个人。是否在夜里玩游戏，翻空间，是否细心地打点自己，守护着一颗暖暖的心。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/572.txt



2015年8月2日 22:50
静悄悄地来过

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1190.txt



2013年7月15日 22:25
。。。无聊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/573.txt



2015年8月1日 17:53
云雨…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1191.txt



2013年7月15日 06:10
。。。
清洒 ：不要看扁了那些少年，俗话说得好，少年穷则国穷，少年猥琐则国猥琐。我们的责任重大。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/574.txt



2015年8月1日 17:51
虽然只是一场雨
却又穿越了时间




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1192.txt



2013年7月15日 04:04
芯芯你真的越来越帅了啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/575.txt



2015年8月1日 10:46
You never saw this world
Happy birthday ,boy@漓 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1193.txt



2013年7月9日 14:07
！！
小小酥 ：十年少



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/576.txt



2015年7月29日 22:24
若把人际交往方面的推动力定量地进行计算，那么造成某个方向的推动是要付出一定的思考和注意力的……就像“原材料”一样。
同时，也有一定的“废物排放”，也就是说，在人们进入更深层次的思考时就会产生难以预知的后果。
以无理由的拒绝而造成情绪推动力的方式我将其称之为“我不能池”，会对人造成一定的情绪推动;同时，别人会对你产生一定的看法，不好避免，也就是“废物排放”量较大。
当解决了“废物排放”的问题，“我不能池 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1194.txt



2013年7月5日 09:03
我决定去和我的男神(女神)表白，是朋友的给我赞一下



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/577.txt



2015年7月29日 15:40
无论是炎热的大地， 还是古典烟熏妆。 只不过又是， 一座空落落的城市罢了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1195.txt



2013年6月6日 16:28
浸食。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/578.txt



2015年7月28日 22:12
有一种花，生来就带着诅咒
她造成了两次震惊世界的战争
她熏干了无数人的血肉
我们必须
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1196.txt



2013年6月6日 13:27
告诉我你在哪个车站会死？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/579.txt



2015年7月28日 21:57
似乎自制蒸馏工具并不难，然后我就作为一个采花贼，把花瓣放进盆子里，蒸馏出精油……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1197.txt



2013年6月4日 06:40
每个人一生会遇到一个如彩虹般绚丽的人，你会觉得看到Ta的那刻起其他人都暗淡无光了。我只是遗憾我做不了那个人。 HJ



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1198.txt



2013年6月2日 18:23
空山新雨后，自挂东南枝。欲穷千里目，自挂东南枝。爷娘闻子来，自挂东南枝。天生我才必有用，各种自挂东南枝。人生在世不称意，不如自挂东南枝。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/580.txt



2015年7月27日 20:26
2015年7月27日 20:26



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1199.txt



2013年5月31日 07:49
节操掉了一地啊有木有！！！下线呢？下线看到了，在地底啊MDGJ負好几十米啊啊啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/581.txt



2015年7月27日 20:20
肾上腺素的分子较大， 我突发奇想也许它可以通过 肺泡 呼吸膜 但是我怎么可以去买只猪肺呢……

 上传1张照片到《我还不想离开》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/582.txt



2015年7月27日 00:56
晨曦的披肩
我把主的话
轻系在胸膛。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/583.txt



2015年7月26日 20:40
通常违法
豆荚 ：汽配店啥的酷毙了！只要一个稳定的发动机、四个轮子和框架、一些零件就能弄一辆四驱车开着走了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/584.txt



2015年7月26日 08:48
pretty strong

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/585.txt



2015年7月26日 06:11
在事态的情况
被说明，
以及给出解决方法
的条件下。
观察听者的反应，
可以得出一定的结论。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/586.txt



2015年7月26日 05:40
豆荚 ：钛合金！熔了作为喷火手环加大版的主要材料……微型助推火箭！……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/587.txt



2015年7月25日 19:07
我还不知道它是怎样产生的，
不过
它很有用。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/588.txt



2015年7月25日 18:58
2015年7月25日 18:58



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/589.txt



2015年7月25日 18:36
如无突发情况，
七十平方的水稻，
就可以养活我。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/590.txt



2015年7月25日 01:26
2015年7月25日 01:26



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/591.txt



2015年7月25日 01:20
就把我的一腔热血泼洒在黄土之上，
掩埋了谁的秋花秋月，
潇洒悲伤。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/592.txt



2015年7月25日 00:41
“那么多人的不是吗？他们都……去哪儿了？”
“这个很重要，他们为什么停下来了?”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1200.txt



2013年5月31日 07:49
节操掉了一地啊有木有！！！下线呢？下线看到了，在地底啊MDGJ負好几十米啊啊啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/593.txt



2015年7月23日 21:37
令人困惑的不过是，
他明明可以小心一些。
就坚持下来。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1201.txt




我也说一句
月光




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/594.txt



2015年7月23日 18:09
据我所知呢
人们说的话
甚至是心里所想
并不是事情的直接原因



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1202.txt



转发：英雄啊啊啊
一.目夂 懋：这是阳光的一大壮举,本来这次阳光九年级三八不放假,由于今天第八节课,六班女生舍弃历史课去校长办公室与严校谈判,在六班女生不懈努力下,严校最后摆桌决定：好！我同意了！ so九年级的孩纸们明天中午12点背着书包回家吧！
2013年3月7日 21:49转发(0)评论(6)

评论转发删除



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/595.txt



2015年7月23日 08:53
how i know～



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1203.txt



考个好高中才是重要的吧？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/596.txt



2015年7月23日 07:16
虽然每个人大脑的运算速率不同，
不过它需要时间这一点是肯定了的。
你也不能同时在高强度运算下自如地控制面部肌肉。
你的表情很怪，
我此生从未遇到。
所以告诉我你在想什么。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1204.txt



你们太神奇了五月天，变出那么多神奇的歌。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/597.txt



2015年7月22日 09:46
哈哈哈哈哈哈真的是很强悍呢




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1205.txt



哇我好想吃奥利奥啊真的好想！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/598.txt



2015年7月22日 09:45
这就是你的人生，
就背上刀，
不要害怕。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1206.txt



我擦。我有一种强烈的被耍的感觉，而且还不止一次…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/599.txt



2015年7月21日 23:23
心是蔚蓝的！

 上传1张照片到《壁纸》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1207.txt



为神马木有前者咧。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1208.txt



好讨厌的感觉！！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1209.txt



神马意思啊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1210.txt



没在说你啊ZXY. QAQ.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1211.txt



子曰习惯成自然。走过所有的路。走着走着，就不累了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1212.txt



额



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1213.txt



这是什么先入为主的想法呢。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1214.txt



房间弄好了麻麻。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1215.txt



我真的不知道我居然还有这样的自动回复！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1216.txt



终于弄到个能上网的手机了。。。妈妈我错了。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1217.txt



黑色：娘, 节日快乐
2013年5月12日 07:20转发(2)评论

来自Android评论转发删除

我也说一句
月光
POLICEMAN。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1218.txt



额我错了真的错了我辜负了党和国家对我的淳淳教诲我以后一定改革从宽抗拒从严好好努力重新做人服从组织领导认清政治局势为组织着想为国家着想做一个好公民努力做到优秀为主席和各位领导服务为国家添砖加瓦…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/600.txt



2015年7月21日 23:18
knock it off…
豆荚 ：准备转职！到时在运费上省一省也许可以控制在百元以内！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1219.txt



转发：AP盖伦？不科学啊，，
森罗万象：四川省新都一中学高一生贺晨航，迷恋LOL多年，对德玛西亚情有独钟，但在420大地震发生以后学校放假，他在家里撸，面对5.6级大余震的来临，为了不坑队友，大吼一声“AP盖伦冲啊！”当天花板上的一大块水泥板砸中头部还不忘说一句”人在塔在。”当救援队发现他的时候他还紧握鼠标。享年16岁

2013年4月23日 19:13转发(1389)评论(9)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/601.txt



2015年7月21日 20:41
清洒 ：这样就可以做更深一步的观察了，只是不知道1600倍是个什么状况。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/602.txt



2015年7月21日 11:24
似乎我的小小邪恶计划已经露出小尾巴了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1220.txt



转发：…
罗叔叔：叼暴了………？…

2013年4月26日 01:34转发(0)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/603.txt



2015年7月20日 21:34
彼若为花，随风飘扬



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1221.txt



诚。正如你说的，你这次逆天了？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/604.txt



2015年7月20日 00:44
小行星采矿公司……有这种东西？！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1222.txt



小时候觉得走自己的路神马的最帅最有爱了，现在仍然觉得很帅不过很悲哀。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/605.txt



2015年7月19日 23:47
开始试种辣椒，果实使用有机溶剂浸泡，增加其辣椒素的浓度……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1223.txt



魏晨，2013新歌抢先听!：-　　　　　　　　　　　　　　　　 　　　　　 　　　　　　　　　　　　　 　　　　 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 　　　　　　 　　　　 别在意那些在你背后说三道四的人，那只不过说明你走在了他们的前面。　　　　　　　　　　　　　　　　 　　　　　 　　　　　　　　　　　　　 　　　　 　　　　　　　　

2013年4月16日 22:09转发(0)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/606.txt



2015年7月18日 23:50
电视里的，是真的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1224.txt



“你不是可以把烟吐在我的脸上，跟我谈你爷爷父亲是怎样撑起一个家，谈做过的事情就要去承担么？当时你跷着腿，眼睛没有看我。 现在呢？像个贼一样，死不认帐么？”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/607.txt



2015年7月18日 23:46
好大的世界




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1225.txt



我看着你的眼睛，终于我们的眼睛都变成了黑色。像黑夜，像幽潭。淹没了里面那个孩子。会为了找到一枚石子而惊喜不已的孩子。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/608.txt



2015年7月18日 19:35
仿佛之间，流风也安详了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1226.txt



Transatlanticism °：他违反动物天性进行规定动作训练，他依据巴甫洛夫原理让动物条件反射，他用教鞭、糖果奖励或处罚，听话的得好处，不听话的被淘汰。这些程序化训练终于产生作用，它们乖巧握手、钻圈，以各种装萌成绩讨观众欢心。这对野外谋生并无用处，它们是场子里的宠儿，森林的弃儿…我说的不是马戏团，是中国教育。

2013年4月3日 19:58转发(0)评论(1)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/609.txt



2015年7月17日 23:10
父母给了我们名字，我们守着他们的信念活着。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1227.txt



QQ音乐：很多事，唯有当距离渐远时，才能回首看清它。

2013年4月12日 12:00转发(11729)评论(239)

来自Android评论转发删除

我也说一句
月光
尼玛阿信神马时候长成这个样子滴。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1228.txt



你和人们的不同 ， 就看你怎么活。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/610.txt



2015年7月17日 21:24
哈哈哈哈！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1229.txt



傻逼好，傻逼不乱跑！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/611.txt



2015年7月17日 20:16
因为在所有记忆里，都是如此。
清洒 ：对我来说，
自己的故事，
才是历史啊。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/612.txt



2015年7月17日 17:26
2015年7月17日 17:26



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1230.txt



现在姥爷这里有电了，再烧张卡过去。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/613.txt



2015年7月17日 15:57
……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1231.txt



吴尊弟弟Q：7O'OO'O4 超帅男：　　　　　　　　　有很多女生喜欢和男生玩 　　　　　　　　　　　　　　不是因为她们骚 　　　　　　　　　　　　　　　　　　　　　是因为她们觉得跟男生相处比跟女生相处容易 　　　　　　　　　　　　　　　　因为男生不会记仇耍心机不会小气勾心斗角！ 　　　　　　　　　　　　　　　　1、 女生穿男生的衣服叫帅气，男生穿女生的衣服叫变态。 　　　　　　　　　　　　　　　　　　　　　　　　 2、女生发脾气叫可爱，男生发脾气叫可恶。 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 3、女生流眼泪叫柔弱，男生流眼泪叫懦弱。 　　　　　　　　　　　　　　　　　　 4、女生花男生钱是天经地义，男生花女生钱是天理不容。 　　　　　　　　　　　　　　　　 5、女生打男生是撒娇，男生打女生是混蛋。。。同意的转!!!!

2013年3月29日 20:45转发(25418)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/614.txt



2015年7月17日 14:37
看不见的东西，并不代表不存在。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1232.txt



童鞋们不要误会了哈＝＝



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/615.txt



2015年7月16日 22:47
我也许应该报“涂机读卡”专业



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1233.txt



　 　向司令 ゅ　 　 　：　　　　　　　　　　 　　　　　　　　　　　 　　　　　　　　　　　　 　　　　　　　　　　　 　　　　　　爱或者不爱一个人 有时候也许只是一瞬间的感觉 一直以为是爱 就在某个瞬间觉得不爱了 真的不爱你 也可以没有你 可是 在下一个瞬间 突然又觉得 原来还是很爱你

2013年1月1日 17:54转发(867)评论(5)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/616.txt



2015年7月16日 09:09
2015年7月16日 09:09



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1234.txt



时差。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/617.txt



2015年7月16日 08:06
人们所看到的，往往只是冰山一角。
世界很大，远超你的想象。
为什么要停下脚步，
不再往前。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1235.txt



这两天霉翻了，冲了一下午的电结果最后百分十都没了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/618.txt



2015年7月15日 21:17
只是表达一种心情…

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1236.txt



一整晚的雨。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/619.txt



2015年7月15日 21:11
谁要守住谁
清洒 ：原来所谓刷脸的意思就是，别人一看你表情都不会怀疑你…固化效果吗……可是这并不是我想要的呀，没人会希望自己是一个失败者，无论在谁看来。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1237.txt



这几天啊。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1238.txt



转发：毁我三观的图啊
大电光：还记得那年生物课本上的少年吗

2013年3月20日 10:26转发(10622)评论(3)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/620.txt



2015年7月15日 21:11
“祝你平安。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1239.txt



生命如川流不息，世界如刚岩不灭。逝去的亲人呵，你们的灵魂圣洁，在主的披肩上轻轻流淌。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/621.txt



2015年7月15日 18:42
生日是一个孤单的日子，每年循环一次，而每次我都要唱这首。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/622.txt



2015年7月15日 00:34
从时间维度来看，我们总是在改变。过去的我与现在的我，是不同的。
清洒 ：全天下，只此一人。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1240.txt



碉堡了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/623.txt



2015年7月14日 15:49
“你的事我至今，仍在思念着 ，不论时光如何流逝，我永远在你身边。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1241.txt



好吧好吧。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/624.txt



2015年7月14日 14:48
他喜欢玩火，却从来不会烧伤，我会说，你只要失败一次就够了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1242.txt



《30 Minutes》这首晚上放会吓死人的歌专辑封面就是百合的典范！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/625.txt



2015年7月13日 19:22
清洒 ：你不爱她，她也不会变好。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1243.txt



我越来越相信星座了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/626.txt



2015年7月12日 10:16
一旁的手机和水似乎已经出卖了我……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1244.txt



转发：这这这这。。。
友：世界已经阻止不了杜甫了

2013年3月15日 11:10转发(88165)评论(4)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/627.txt



2015年7月11日 21:02
那是一座铅灰色的城市，建筑又高又空。很多黑影在那里游荡，不知道它们长什么样子，也不想进去看一看。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1245.txt



ゆうの葉丶：Happy birthday
2013年3月23日 15:14转发(1)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/628.txt



2015年7月11日 18:26
不仅文理科的书都要看，连音乐鉴赏也要修完，这才是大满贯！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1246.txt



我长眼袋罗。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/629.txt



2015年7月11日 18:22
清洒 ：考试时差点闹肚子，不知道结果怎样



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1247.txt



以后不再任性了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1248.txt



手机着收鸟



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/630.txt



2015年7月11日 12:13
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1249.txt



人们一个个从这座桥上过去，于是你觉得你也可以。但当你上桥时，桥断了。原来这个世界并不公平。于是你翻越大山过去，于是你翻越大山过去。一路上花了许多时间受了许多伤流了许多血。但没关系，伤口上会长出茧子保护你。吮吸过你鲜血的土地会开出鲜花。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/631.txt



2015年7月10日 19:28
也抬头看看天空吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/632.txt



2015年7月10日 16:16
这是模仿达芬奇的作法，能泡让我看起来更专业，能使整个图更匀称




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1250.txt



完了，现在醒来第一件事就是摸手机耍会儿。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/633.txt



2015年7月9日 22:00
毕竟我什么事都做不好，有一天我真的会死掉。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1251.txt



会像血燕小心地守护TA们用心血筑在悬崖上的血巢。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/634.txt



2015年7月9日 17:21
痘痘里的那些大颗粒固体，据说是油，油能溶于脂质的话，那么我应该可以用消毒针扎一个小孔，然后用牛奶洗去，应该不会留下疤痕。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1252.txt



这十年来，猫和屋都没变过。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/635.txt



2015年7月9日 05:33
我真的不是变态！

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1253.txt



这是花生中的大哥哥吧~




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/636.txt



2015年7月9日 02:13
听那些声音！那是弹性系数比较大的薄塑料在雨点下振动、共振、减速，它们的速度减到一定程度又再次被冲击。
其实没有人会喜欢你的，你始终只是个傻男人，在空寂的下午唱摇滚，或是在雨夜里精心构筑自己的小小幻想，细心地和自己玩却还是难免孤单。
你说你有两个肾，你要守护它们中的任何一个。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1254.txt



#亡灵序曲（魔兽世界）# http://url.cn/3YO1Sw 超级好听啊有木有。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/637.txt



2015年7月9日 01:59
生物钟已被成功调整，现在我要面对的只是漫漫长夜了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1255.txt



夹脚鞋可以蹲街也可以走遍世界。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/638.txt



2015年7月8日 15:36
总而言之，我的最大变化就是爱上吃甜食，特别是果酱，那是最理想的了……肉太恶心了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1256.txt



转发：嗯嗯啦啦
ACh：你不是阳光学校第一届即将毕业的初三生，你永远不会知道星期五按时放学回家是什么感觉！！！
2013年3月7日 21:47转发(14)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/639.txt



2015年7月8日 15:19
“Need you to be alive.”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1257.txt



转载你不会是吧？的日志LOL里的感人台词
1.只有飞速的旋转，才可以止住我的泪水，忘记你的模样。 -----不祥之刃
2.他们都说我是穿着东方盔甲的奇怪人，但我只想顶在最前面，用我的长枪保护我的朋友。-----德邦总管
3.一曲终了、繁花散尽、伊人已逝...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1258.txt



转发：英雄啊啊啊
一.目夂 懋：这是阳光的一大壮举,本来这次阳光九年级三八不放假,由于今天第八节课,六班女生舍弃历史课去校长办公室与严校谈判,在六班女生不懈努力下,严校最后摆桌决定：好！我同意了！ so九年级的孩纸们明天中午12点背着书包回家吧！
2013年3月7日 21:49转发(0)评论(6)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/640.txt



2015年7月8日 11:18
这部片子有一点神农氏的感觉，这代表了什么？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1259.txt



跨越种族的友谊。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/641.txt



2015年7月7日 16:19
放声歌唱的灵魂



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/642.txt



2015年7月7日 16:18
没有星星的夜空
花和清风
说很寂寞。
青春很懵懂
但你在身边就
无所畏惧



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1260.txt



POH：明天上午要学这个，好难的样子

2013年2月25日 00:48转发(0)评论(2)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/643.txt



2015年7月7日 16:15
愿你的灵魂/与青羽翱翔
你的梦/与暗夜长眠



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1261.txt



尼玛这是如来神掌？小行星撞地球吧。。。= =




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/644.txt



2015年7月6日 12:21
这样就万无一失了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1262.txt



爸妈做了很丰盛的饭，但是…为毛那么像生离死别。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/645.txt



2015年7月5日 18:28
“解放你的痛苦。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1263.txt



我，突，然，就，，，，，，，，，，，，，，，，，，，，，，，，，，，，，，，，



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/646.txt



2015年7月4日 17:57
这个要好一些，但也许它不是简单的聚合反应。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1264.txt



听说在吧啦吧啦国里（记不到了额额＝＝），男人们都称呼他们的妻子为 My God .



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/647.txt



2015年7月4日 13:30
不知道用高压锅能不能弄出来




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1265.txt



觅食中…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/648.txt



2015年7月4日 12:30
这个倒是很神奇




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1266.txt



有没有晚上通宵的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/649.txt



2015年7月4日 00:44
这夜空想着暗蓝色的河，而我想起了那年的夜空如洗。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1267.txt



怎么在今天这种关键时刻一打才发现一个二个都停机了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1268.txt



2013年2月25日 22:40
好像整个世界都停电了

 上传1张照片到《巴拉巴拉》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/650.txt



2015年7月4日 00:06
“I'll be the special one,
More than
You can imagine."



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1269.txt



好像整个世界都停电了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/651.txt



2015年7月4日 00:04
2015年7月4日 00:04



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/652.txt



2015年7月3日 22:39
肺是人体的呼吸器官，位于胸腔，左右各一，覆盖于心之上。肺有分叶，左二右三，共五叶。肺经肺系（指气管、支气管等）与喉、鼻相连，故称喉为肺之门户，鼻为肺之外窍。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1270.txt



腾讯越来越奇葩了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/653.txt



2015年7月3日 17:01
“无论什么样的风景，都不重要了。
这世界好拥挤，
快点回家吧，或者
永远不要走到尽头。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1271.txt



2013年2月25日 18:11
2013年2月25日 18:11



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/654.txt



2015年7月2日 23:12
一看就是学霸……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1272.txt



哈哈哈哈




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/655.txt



2015年7月2日 18:14
下过雨的天空，云都是湿的
空气好安静，白昼很亮



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1273.txt



哦火



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/656.txt



2015年7月2日 18:08
不要忘了我
稻草人还在金色麦田里
风在唱歌
理好你的衣领 不要忘了我
生命中有过太多失去
但是记忆是最美的
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1274.txt



小时候觉得外国人都长一个样子，现在我能分辨欧洲人了，但还是觉得非洲人都长一张脸。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/657.txt



2015年7月2日 08:34
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1275.txt



我发现有时我能预测电话或者短信…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/658.txt



2015年7月1日 23:00
"No drowing
And singing.
Even a
PictureGuy
For my lover."



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1276.txt



尼玛。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/659.txt



2015年7月1日 13:19
语文是妈妈，物理是叔叔，一旁黑板上晾着的是爸爸……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1277.txt



My God



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1278.txt



转发：哈哈
渐离：分享图片一!二!三!戳

2013年2月23日 20:13转发(1)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/660.txt



2015年7月1日 13:09
“你为什么偷偷买酒精？”
“你为什么觉得那是我买的？”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1279.txt



誒？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/661.txt



2015年6月30日 23:14
in a time just seconds.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/662.txt



2015年6月30日 23:12
“嘿！你怎么老是一个人？”
“我看到她和我买一样的东西，所以我觉得我们之间可能有很多共同点。
但是我打完招呼她就走掉了。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1280.txt



誒？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/663.txt



2015年6月29日 13:43
If i Were A Girl ,
Do Not Smile To Me



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1281.txt



誒？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/664.txt



2015年6月28日 13:20
神啊，来个学霸帮帮忙吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1282.txt



同志们，作为阳光学校的第一届学生，我们一定要上进！我们要留下一个传说给学弟妹们！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/665.txt



2015年6月28日 08:19
“时间一到，我们都翘辫子。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1283.txt



转发：嗨皮宝儿斯嘚
清臣：沁峰，生日快乐
2013年2月23日 08:58转发(2)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/666.txt



2015年6月27日 21:11
从力学上看，我不认为有人能仅用脚尖倒吊。
反正是因为自己认为不可能，所以当这样的人出现的时候，自己才会措不及防。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1284.txt



额



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/667.txt



2015年6月27日 20:54
“最后我觉得，只有我一人拥有高达是不够的。
但是毕竟高达是一种具有威胁的武装。
我遇到的每个人都像烂泥一样地活着，渐渐的我产生唾弃的情绪。
但是万物之灵真的如此容易就变成烂泥了么？
能打败高达的人，才会成为众人眼中的焦点吧。
真好，原本还是烂泥，如此就退化成翔了。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1285.txt



：张宇恒，生日快乐哈。
2013年2月23日 00:09转发(2)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/668.txt



2015年6月27日 11:47
三七为界，苦草断肠。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1286.txt



坑爹啊！这种题我怎么抄下来做？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/669.txt



2015年6月27日 11:46
2015年6月27日 11:46



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1287.txt



转发：我们也要！！张淑丽神马时候潮一点啦！
孤灯清酒：碉堡，班主任淡定的找同学借了张内存卡，淡定的放歌。。。
2013年2月22日 21:32转发(1)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1288.txt



转发：王chua chua ,哈哈哈哈
+魏晨Q:Б54O1Б看流星雨4：　　　　　　　 　　　　　 　　　　　　　　　 　　　　　 　　 你身边有木有一个姓王的人？家人？亲戚？恋人？朋友？同学？知己？蓝颜…… 如果有就为他（她）而转下吧。　　　　　　　　 　　　　　　　　　　　　 　愿姓王的在2013年一生平安、姓王的本人更要转哦

2013年1月2日 20:01转发(125557)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/670.txt



2015年6月26日 17:27
化1.1.1化学物质大致可分为纯净物和混合物。纯净物只由一种化合物组成，混合物是两种或两种以上的物质混合而成。单质是纯净物的一种，表示只有一种元素的纯净物。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1289.txt



为什么当时我会去剪平头。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/671.txt



2015年6月26日 12:42
船、河、雨、伞。
偶尔下雨的时候还是会回忆过去，
你挎着枣红色的骏马，它在粗声地喘着气。
我让雨淋湿了我的油纸伞，
于是你又踏入夜色中。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/672.txt



2015年6月26日 12:36
2015年6月26日 12:36



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1290.txt



我想从今以后剪平头或者光头。一直。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/673.txt



2015年6月26日 12:35
我们在回忆过去的同时，也在创造历史。
纯白的灵魂，不会纠结。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1291.txt



我必须买双帆布鞋 ＝0＝！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/674.txt



2015年6月25日 11:10
愿我是清晨之鸟，拉开黎明之帘，所到之处光芒盛开。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1292.txt



转发：哈哈哈
-：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　笑了就转吧

2013年2月21日 16:36转发(0)评论(3)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/675.txt



2015年6月23日 23:34
挪威驯鹿学院？！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1293.txt



我小时候印象中的爱尔兰是草原、蓝天、森林和乡村，后来才知道，爱尔兰也是有城市的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/676.txt



2015年6月23日 13:52
不过我觉得我会快就老了，身体枯成木，皮肤皱成纸……然后我就还是会觉得无能为力




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1294.txt



转发：好想来一次
QAQ：老师合照的一瞬间~学生团结就 是力量

2013年2月11日 23:00转发(0)评论(48)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/677.txt



2015年6月23日 12:43
当自己在遭遇无明显意图的信息之后作出了反应（情绪反应、认知反应），那么就存在着一种可能，你在接受信息后作出的反应就是这些无意图行为的目的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1295.txt



2月22号。。。真2呢



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/678.txt



2015年6月23日 12:31
我不是很开心，不过从逻辑上分析是有发生什么事情了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1296.txt



17:51
原来安卓也有安全模式。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/679.txt



2015年6月22日 14:00
又是个颠覆我化学观的玩意儿




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1297.txt



吃烧烤去罗



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1298.txt



我在海岸线上写下长诗，却没有阅读天它的勇气



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/680.txt



2015年6月22日 11:18
当你发现生活出现了某些问题，只需要逆流而上。
因为生活本就是没有问题的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1299.txt



二十七啊哦呵呵洗白啦啊哈哈哈



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/681.txt



2015年6月22日 09:57
我是风从你身边经过，唱着歌。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/682.txt



2015年6月21日 23:28
今天遇到些神奇的人，然后我变神奇了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/683.txt



2015年6月21日 11:53
原来地质学是用来探矿的，原来唱歌是用来哄人的，我现在想去湖上荡舟，原来我是用来荡舟的。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/684.txt



2015年6月21日 09:10
还是拿出些什么东西来分享吧！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/686.txt



2015年6月21日 01:02
巨大的光束将我们的影子投在地面上，风浪席卷了我的头发，我看到黑影，那是——仿制型阿帕奇直升机！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/687.txt



2015年6月20日 19:51
水分子中的两个氢原子均被烃基取代的化合物称为醚。醚类化合物都含有醚键。醚是由一个氧原子连接两个烷基或芳基所形成，醚的通式为：R–O–R。它还可看作是醇或酚羟基上的氢被烃基所取代的化合物。醚类中最典型的化合物是乙醚，它常用于有机溶剂与医用麻醉剂。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/688.txt



2015年6月20日 13:48
apple是想象力，那么oppo是脆弱



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/689.txt



2015年6月20日 08:55
那个时候要柔和一些




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/690.txt



2015年6月19日 21:15
"You do nothing wrong , be happy." 是不是只有让我自己难受别人才会高兴起来。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/691.txt



2015年6月19日 21:14
有点弄不下去了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/692.txt



2015年6月18日 23:28
花还是在开，下雨天的时候屋檐下还是有雨线，飞鸟在歌唱光里的美好。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1300.txt



完了，报名是哪天。？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/693.txt



2015年6月18日 23:14
额，最近有人用小号加我好友，此人拒绝透露身份，并于我有一位共同好友的关系，为避免造成信息方面的威胁…我还是发一下



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1301.txt



FINAL HONE



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/694.txt



2015年6月18日 00:26
你觉得自己一定能写出最好的小说，只是你自己觉得。你只是个喜欢抱着花的傻孩子，却不是园丁。
如果我们班真有谁能成为那种散发着美好味道的诗人，这人也是有着披肩长发的青洒，不是你。
你叫建军，你只是一块灰头土脸的石头。
——《The Dawn》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1302.txt



转发：精辟啊
我们爱讲冷笑话：周一上学路上就像《行屍走肉》 周五放学路上则是。。。

2013年2月4日 12:11转发(19059)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/695.txt



2015年6月18日 00:18
冰与火之夜，风与梦之歌。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1303.txt



转发：哈哈哈哈
₯㎕Smile：这个有意思。

2012年10月6日 11:36转发(2339073)评论(18)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/696.txt



2015年6月18日 00:16
正中下怀！转了！
穿山丙。 ：我奔赴你曾停歇的院门，看不见你，
我等在你曾必经的路口，看不见你。
我挣脱束缚，
追寻你的归路，
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1304.txt



晚上我就枕这玩意儿睡，，




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/697.txt



2015年6月16日 13:22
“我有个朋友，难过的时候会哭，开心的时候也哭；开心的时候会笑，难过的时候也会笑。”
—“你慢慢去想吧。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1305.txt



要一口洋芋一口可乐。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/698.txt



2015年6月16日 12:48
水在油里气化，压强变大，超过了油的表面张力（？）所能承受，撕开了一道口子，被挤了出来。
月光 ：水在油里迅速汽化，密度变小，在浮力的作用下冲出液面。温度越高则汽化的程度越高，油面越高则脱出速度就越快。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1306.txt



今天早上。。。不会是老友吧，，那发型。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/699.txt



2015年6月15日 13:17
水在油里迅速汽化，密度变小，在浮力的作用下冲出液面。温度越高则汽化的程度越高，油面越高则脱出速度就越快。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1307.txt



转发：。
MenofgodGeisha：年度灾难巨片即将上映，无数学子含泪倾情出演！！！

2012年1月28日 20:04转发(146771)评论(11)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1308.txt



本来是边听歌边写作业，后来变成了纯听歌。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1309.txt



转发：。
長风： 打dota的男人都是好男人，第一：他们不去酒吧，不去夜店，不去把妹子，省钱。不用担心会脚踏两只船第二：打辅助的有一颗帮助人，保护人的心。打后期的有一颗努力挣钱，拯救世界的责任心。打酱油的有一颗热爱和平，与世无争的平淡的心。坑爹的有一颗坚韧不拔，淡然面对的心。

2013年2月15日 18:43转发(5)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1310.txt



我不会告诉你们我从下午睡到现在。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1311.txt



天蓝得不可思议，高速公路上呆呆的汽车些像成群的公野马冲过去，哈哈。和风像是温暖的海浪扑打在身上。我的乡村情人节哈。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1312.txt



有孩子叫我叔叔就算了吧，老大爷是神马意思？搞笑么？那么小的娃儿就如此有恶搞精神。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1313.txt



时间是种慢性麻醉



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1314.txt



那个。。别想多哈，没说那个。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1315.txt



我傻了。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1316.txt



你在说什么啊。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1317.txt



并不是梁祝的故事证明了爱的强大，而是因为爱太脆弱，所以梁祝的故事才令人感动



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1318.txt



转载 ， 。 的日志你被小学课本忽悠了多少年？
《爱迪生救妈妈》
课文：爱迪生的妈妈得了急性阑尾炎。医生苦于房内只有几盏油灯，无法进行手术。刚满7岁的爱迪生，利用镜子的反光原理，让医生在明亮的反光下，为妈妈成功进行了手术。
疑问：医学史上对于...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/700.txt



2015年6月13日 22:38
我觉得我就是那种会做出某种惊世骇俗事情的人，但是每次尝试的结果都不堪入目，被我清理掉了；你觉得你是那种平平常常忙碌一生的人，可做出来的事总是惊世骇俗。
这样才公平不是吗？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/10.txt



2017年12月20日 12:44
	
Battle Symphony

歌手：Linkin Park

所属专辑：《One More Light》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1319.txt



额



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/701.txt



2015年6月13日 22:34
惨白的太阳与你的黑眼圈相照应，不朽的是青春，疲倦的是时光。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/11.txt



2017年12月20日 10:39
人一生总是要遇到好多好多的人
遇到对的人，人们就相爱，
遇到错的人，人们就离开。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/702.txt



2015年6月13日 22:32
Be a poem , or a song .




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/12.txt



2017年12月20日 10:39
他们说你会找到你真正爱的人
可若是你在身边
你就是我最爱的人



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1320.txt



永远有多远



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/703.txt



2015年6月12日 22:58
晚二下课后回教室，跑得快的情况下为了稳住重心用了盲僧的姿势。不远处的小伙伴惊呆了都



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/13.txt



2017年12月17日 19:50
岁月静好，孤独终老~



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1321.txt



晚安，All。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/704.txt



2015年6月12日 13:36
由此完成了对一个事件的思考，得出了可能发生的事件，列出网状格。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/14.txt



2017年12月17日 17:39
我们约好
要射下太阳
要填满大海
要一直奔跑
到世界的尽头



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1322.txt



新年不要在厕所中玩鞭炮。因为厕所中聚集了大量沼气，沼气的主要成分是甲烷。甲烷易燃，在狭小空间如下水道中快速燃烧的结果就是引起爆炸。所以 ， 厕所很危险。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/705.txt



2015年6月12日 13:34
第零定律最终版，任何时候你的行为都是在外界影响下完成的，故你的行为在任何时候都可能是在主动的影响下产生的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/15.txt



2017年12月17日 10:05
风起年月，岁守边陲
不知何年何月
何地栽培




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1323.txt



为毛一选辅就没ADC！！！！！猪么都是！！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/706.txt



2015年6月12日 13:23
事实上，当你怀揣着秘密，你的表情会变得僵硬，不太符合当前的话题。以此类推。
当你在怀揣问题时，通常会顾及不到表达信息。
当你在深入思考和突破问题时会感到满足感和强大感。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/16.txt



2017年12月17日 07:52
彼若为鸟，何惧其扰
彼若为斯，何畏其恼？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1324.txt



鞭炮声好吵



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/707.txt



2015年6月11日 23:05
“你已经暴露了，费利克斯。这里有装脑波分析仪。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/17.txt



2017年12月17日 07:51
落花随流水，不往不可悲
三分天下势，不枉此轮回



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1325.txt



花的种子抛洒开来，在漆黑的夜空中肆意盛开.



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/708.txt



2015年6月11日 13:47
如果人的生活变得很空，就会觉得生命很短暂。
我要买一台电子显微镜。
总有一天人是会死的，然后就再也看不到你爱的人的脸。
关于细胞衰老有很多种说法，
端粒学说、氧化、不能及时排出生成物…
有一个原因。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/18.txt



2017年12月17日 07:51
我这种人比较傻，有时候喜欢些东西，那就是全部了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1326.txt



-：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　爱这个系列糖的孩子立即转

2013年2月9日 08:58转发(0)评论(5)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/709.txt



2015年6月9日 16:59
在一些信息的影响下产生了危机感，似乎要将催泪弹提上日程了…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/19.txt



2017年12月17日 07:50
泰山之威，何为可畏？ 巍哉巍哉，不以枉然。 若为人伦，汝辈岂在？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1327.txt



哇咔咔，我妈要给我做倒膜……神马情况~!



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1328.txt



#Daily Growing# http://url.cn/C3Y3tN 树在长高，叶在变绿，许多次我看到他的可爱




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/710.txt



2015年6月8日 23:19
女孩会长大，全记录




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/20.txt



2017年12月17日 07:50
最重要的，是什么？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1329.txt



囧兔兔：【十万个冷笑话——十万个语言版】各种方言版本的，绝对戳中你笑点！
　视频缩略图
2013年2月8日 19:05转发(1049)评论(85)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/711.txt



2015年6月8日 20:43
最后人类的女孩嫁给了机器人




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/21.txt



2017年12月14日 18:38
我太帅了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/712.txt



2015年6月7日 18:40
电话复活了！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/22.txt



2017年12月12日 10:00
彼はこいびとの手にころすされた
ざんねんと思わない




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1330.txt



转发：这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这这……
Arms.：这张图送给我媳妇，不要说英雄联盟没有浪漫时刻。

2013年2月3日 13:30转发(184742)评论(295)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/713.txt



2015年6月7日 18:37
这么一来就解释得通了，三月是因为身材不好被四月嘲笑，所以注射了这玩意儿。
这一生若是从事一个不能吐槽的职业，我大概会被憋死吧。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/23.txt



2017年12月11日 22:57
2017年12月11日 22:57



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1331.txt



转载简 简 单 单的日志面试中你必须要知道的语言陷阱（很好，怕再找不到了）
如：“你经历太单纯，而我们需要的是社会经验丰富的人”，“你性格过于内向，这恐怕与我们的职业不合适”，“我们需要名牌院校的毕业生，你并非毕业于名牌院校”，“你的专业怎么与所申请的职位不对口？”...


共有4张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/714.txt



2015年6月6日 22:34
不要回头



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/24.txt



2017年12月11日 10:42
战争已死，无须起誓。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1332.txt



转发：NICE
﹢袁姗姗p:4277’94看男友照：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 现在好好学习是为了将来我儿子在学校打了人家一个耳光, 对方要一万块, 我可以掏出两万说, 儿子再打一个 , 　　　　　　　　　　　　　　　　　

2013年2月7日 07:55转发(8295)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/715.txt



2015年6月6日 17:36
在某些情况下我们获得了优势，这种优势 不过是副产品。无论是心理上的，还是物质上的。由于我没有违背过本心，所以无所牵挂。
天空有云，耳边有风。世界很大，你很美。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/25.txt



2017年12月9日 19:26
作为一个帅哥，我们都很淡泊
找不到富婆，人生就很落魄
人生像条长河，不如就此别过




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1333.txt



转发：。。
差不多先生、：等待毕业那天我们也来这么一次吧！赞同的转走！！！

2012年11月19日 20:53转发(1004227)评论(1866)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/716.txt



2015年6月6日 16:09
辣椒素溶于油脂，牛奶中含有油脂，故喝牛奶可以解辣。此外，适量醋也可以解辣



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/26.txt



2017年12月9日 13:30
若我所愿，都是窃来，那我宁愿不要




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1334.txt



剪头发的哥们儿太给力了，现在我头发像钢丝球一样



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/717.txt



2015年6月6日 13:35
这简直是他妈的福音




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/27.txt



2017年12月5日 08:26
仲夏夜里燃起的篝火，风还清澈，我们却沉默
“然后呢”。我竟无言以对



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1335.txt



六倍就六倍，就算我用一万倍的时间也要去学会



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/718.txt



2015年6月6日 13:24
梦想、自由……到目前为止，看到的都是副产品。

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/28.txt



2017年12月4日 00:57
长发及腰，风落膝边草



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1336.txt



转发：。。我要看
娱记天下：阿信去洗脚，结果被吴宗宪他们算计！！！！全程高频笑点，，，我都快笑断气了，阿信你也太淡定了吧。。。
　视频缩略图
2013年2月5日 19:32转发(464)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/719.txt



2015年6月6日 01:26
明天大概会觉得光线都像夜里一样吧



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/29.txt



2017年3月29日 01:19
2017年3月29日 01:19



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1337.txt



转发：。。。。
死鱼眼，：宿舍里这么干过的举手~

2013年2月1日 14:43转发(27587)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1338.txt



转载一句话经典的日志盘点那些校园神级PS 求P需谨慎啊！~
内伤了 ！如果你想让大神帮你P图，那你要做好思想准备，因为，大神可能给你P成以下这个样子，P图有风险，求P需谨慎啊！！~这些PS大神太扯了有木有！！！
【美女勤练体操，求大神P出意境】
大神回复：
【黑...



共有38张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/720.txt



2015年6月6日 01:24
也许我驻守在这里，不离开比较好



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/30.txt



2017年2月27日 05:06
挣钱，买酒



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1339.txt



提莫平均每天死650万次=每秒75次。。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/721.txt



2015年6月6日 01:23
栽一束花，花瓣落了满地。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/31.txt



2017年2月11日 01:30
大家都知道如来是佛教大佬，不知元始天尊是道教大佬，上面还有鸿钧 看封神榜吧，能把你看走火入魔




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/722.txt



2015年6月4日 23:41
预计每代繁殖二至三倍数量狗口，毛产量为约每年xxx克每只，植物消耗为约三十块每只每年，阳台上种了洋芋，未来准备扩建为三层加阳光折射，自主灌溉。上天无路，花开无缺。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/32.txt



2017年1月27日 20:23
越千山兮 野茫茫 野茫茫兮 过大江 过大江兮 绝天海 与子征战兮 路漫长 收我白骨兮 瀛海旁 挽我旧弓兮 射天狼




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1340.txt



我可以么？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/723.txt



2015年6月4日 13:15
机器才是人类的奴隶啊，那么我就可以称为皇帝了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/33.txt



2017年1月23日 18:18
我有昆吾剑，贺郎山中锻； 我有明月铠，匣内霜月寒。 与子战河东，以甲蔽子身； 与子战河西，仗剑复子仇。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1341.txt



转发：。。
迁就：还是这个最金典。。我开始害怕派大星咯

2013年2月4日 12:52转发(0)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/724.txt



2015年6月4日 13:11
山海阳光 ：【每日语文知识】官职人物常用词语　　　　1、表官职的　　　　（1）宰相：总揽政务的大官。宰，主持，相，辅佐。　　　　（2）御史大夫：其权力仅次丞相。　　　　（3）六部：吏、户、礼、兵、刑、工。　　　　（4）三司：太尉，司徒、司空。　　　　（5）中书省：中央行政机要机关。　　　　（6）尚书：六部最高行政长官。　　　　（7）太尉：军事首脑。　　　　（8）郎中：尚书属下部员。　　　　（9）宦官：宫廷内侍，又称太监 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/34.txt



2017年1月17日 05:04
2017年1月17日 05:04



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1342.txt



中午阳光都懒懒的。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/725.txt



2015年5月31日 17:21
正常人类是会根据所接收到的信息做出相应的行为，至少这是正常的，若是为了自己的利益行事，则是肮脏的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/35.txt



2017年1月17日 05:02
感谢每天为你批改作业的班主任




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1343.txt



“你阻止不了的。放弃吧，盖伦。这是诺克萨斯的阴影，魔神将从阴影中降临。诺克萨斯将会崛起，粉碎整个卢恩特拉大陆。就算是那个传说中的嘉文一世当真还活着，也无法阻止血腥的魔神！”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/726.txt



2015年5月30日 16:27
是时候表演真正的技术了

 上传1张照片到《指挥官》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/36.txt



2017年1月11日 04:25
2017年1月11日 04:25



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1344.txt



如果两个人的天堂 像是温馨的墙 我的羽翼不该伴随玫瑰 听从凋零的时光



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/727.txt



2015年5月28日 10:44
是歌声托起尘埃，梦里满是落叶



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/37.txt



2017年1月4日 17:30
2017年1月4日 17:30



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1345.txt



搞笑排行榜：有多少人见过刺猬的正面，真的是好卡哇伊啊！好萌～～

2012年10月26日 13:01转发(1414)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/728.txt



2015年5月28日 10:36
我还记得那巷尾，蒲公英飘落得满是尘土，那些孩子和我一般大，却又和我不太一样。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/38.txt



2016年12月30日 01:08
有人愿意为你工作，起早贪黑。
你总是幸运的，可你也能感受到他人的悲哀。
这世上总是有人悲哀，因为他人很悲哀，所以你很坏
ua bad cause za sad




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1346.txt



转发：。。。
偶久网：女生和女生手拉手逛街没事，男生和男生就是搞基；女生和女生亲一下没事，男生和男生就是搞基；女生和女生叫老公或老婆没事，男生和男生就是搞基；女生和女生睡一张床没事，男生和男生就是搞基。总结起来，现在这个世界，只要俩男人一块出现，就是搞基……

2011年8月23日 15:52转发(93062)评论(29)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/729.txt



2015年5月24日 14:42
梦想太过远大了，以至于穷尽一生努力都可能达不到。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/39.txt



2016年12月22日 01:46
还是发个图吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1347.txt



转载The Wonder.的信纸日志【致高中生】所谓梦想，是永不停息的疯狂(转自厦门大学吧)
1.
初中第一次月考，我是全班倒数第五名。
老师把卷子甩到我脸上，一个耳光跟上来。
“走关系的废物。”
——————————————————
中考前一天晚上。...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1348.txt



路明非，路鸣泽，老板都是同一个人吧



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/730.txt



2015年5月24日 13:09
下一个问题是，我所做出的行为是否是在某人的影响下达到的，亦或者是自然产生的。（看到花自然就会觉得美）
我所作出的行为是否与我自己的益害关系无关，只是在他人有意的影响下所产生的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/40.txt



2016年12月16日 05:55
萌宠 腾讯认证 关注 钓鱼一只狗去，会有这样的发生!





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1349.txt



基友到最后会进化成为基佬



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/731.txt



2015年5月24日 13:03
传递信息的方式多种多样，可以通过单个个体，多个个体完成，肢体语言完成，数学语言完成（如摩尔斯的电码），问题是这些串联起来的信息只是巧合产生的，亦或者是某种直接的or间接的目的行为。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/41.txt



2016年12月8日 23:55
找到工作了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/732.txt



2015年5月24日 12:56
从行为上判断一个人的想法，是不准确的，因为有一些重要条件是不可测量的。不过人的行为通常有两个功能，一是达成某种目的，二是表达情绪，传递信息。从目的性的强弱可以大概估计某人的某个行为所行使（？）的功能。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/42.txt



2016年12月7日 03:36
我要去锯移动电源了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1350.txt



第六集是怎么回事?尼玛福禄小金刚是神马玩意儿?结局是很美满啦，但为毛那么楼啊



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/733.txt



2015年5月24日 12:47
行为的指向性过于明显，从联想上很可能产生某种潜在联系。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/43.txt



2016年12月5日 13:03
这个我一定要买




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1351.txt



转发：!!
925644： 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　老师都下意识暗自鼓励学生鄙视成绩差的，原因是拉了班级的后腿。每次听见这个我都觉得很可笑，班级又不是狗，还分前腿后腿的。 ——韩寒 　　　　　　　　　　　　　　　　　　　　　　　　　　　　

2013年1月28日 18:12转发(23174)评论(1)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/734.txt



2015年5月24日 12:45
那是一个很明显的恶意行为



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/44.txt



2016年11月21日 03:49
就价格而言，已经完爆edison 天然的智能手表主板




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1352.txt



去打点滴啊。你操小伙子哦



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/735.txt



2015年5月24日 11:24
微量肾上腺素+高达设计题，刷题再也停不下来



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/45.txt



2016年11月10日 23:51
双十一买了假发和斗篷，，但这是一个激进的行为 因为我还没有解决舆论问题 对一些人来说，没有舆论，才是欺骗手段

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1353.txt



转发：确实
楼：lol..国服的ID已经逆天了.

2013年1月25日 22:46转发(0)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/736.txt



2015年5月24日 00:04
当这个世界上悲伤的人达到一定的百分比，会直接影响到社会的稳定。无实际意义的行为增多，发生冲突，链式反应。
是为“悲伤核弹”。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/46.txt



2016年11月5日 05:38
2016年11月5日 05:38



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1354.txt



Anyone



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/737.txt



2015年5月23日 23:52
连写作业这样狗血的事都要靠肾上腺素



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/47.txt



2016年10月26日 05:55
c是一种古老的语言，它的速度比Python快了一千倍




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1355.txt



#It’s Christmas Time Again# http://url.cn/6Vipxv anyone




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/738.txt



2015年5月23日 14:24
有时候，疯狂地翻某个人的照片。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/48.txt



2016年10月5日 00:50
萌宠 腾讯认证 关注 哈士奇养多了，竟然还有这样的用处.......





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1356.txt



转发：我能
小杰瑞ღ：能够灵敏辨识爸妈下班回家的脚步声并且5秒内关掉电视冲进房间写作业的人，，请默默转发。。

2013年1月22日 00:41转发(28309)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/739.txt



2015年5月23日 13:57
也许我适合一头金发，卷卷地搭在脸前。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/49.txt



2016年10月5日 00:29
	
Innocence

歌手：Avril Lavigne

所属专辑：《The Best Damn Thing/Under My Skin》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1357.txt



转载豆豆和小灰的牵引绳的日志手机里的16个惊人大秘密，你知道几个？
引导语：用手机这么久了，不管的大人还是小孩还是老人基本谁都有手机 ！！高档的抵挡的都有……但是您知道手机里不可告人的秘密吗？手机里惊人的16个天大秘密，听说99%的人肯定都不知道……
1、不要赶着正...


共有5张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1358.txt



̶X̶i̶a̶o̶帅。：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　-　　　　　　　　　　　　　　　　　　 在你想要放弃的那一刻、想想为什么当初坚持走到了这里、

2012年5月29日 21:50转发(262162)评论(181)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/740.txt



2015年5月23日 13:53
小腿肌肉似乎开始变得更加有活性，跳跃高度比以往增加了百分之十以上。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/50.txt



2016年10月3日 03:18
Colorful lights, beautiful autum.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1359.txt



so sorry



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/741.txt



2015年4月24日 19:30
你是飞鸟，生来就是要跨越茫茫的人海。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/51.txt



2016年10月2日 04:44
TA从未说过TA是什么样的人呀， 是你多心了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/742.txt



2015年4月24日 19:15
十八岁了，明天就可以去领证了，反正我没有一丁点财产，反正我没有翅膀，我什么都没有，除了时间和一颗燃烧的心。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/52.txt



2016年10月1日 08:48
某天这城市又从海底漂浮着冒出来了，
我惊讶地发现这秋天是灰白的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1360.txt



We had joy we had fun. we had seasons in the sun. but the wine and the song, like the season has all gone



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/743.txt



2015年4月19日 06:23
金色的光的花瓣撒落在地上，铺成一片，过了许久又暗淡下去。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/53.txt



2016年9月28日 23:08
很多年了，栀子花每年都开 很多年了，那只是转着圈圈




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1361.txt



没那么想的，没有没有没有……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/744.txt



2015年4月16日 02:27
	
4月16日是月光 的生日，赶紧送礼物祝他生日快乐吧！
赠送礼物

月光
2015年4月11日 22:59
you can be




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/54.txt



2016年9月27日 18:30
我要将这锅肉汤炖上七天七夜，这就是传说中的佛跳墙

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1362.txt



我没说不做朋友啊，前面加一个字又不会怀孕是不



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/745.txt



2015年4月7日 20:41
“毕竟我喜欢的人不在这里，那么我断不可能在这儿偶遇他，那么我又怎么能静下心来在这座孤单的城市瞎晃？”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/55.txt



2016年9月26日 14:44
一个cos大神必然是集文艺青年、动漫宅、ps大神、摄影师、模特于一体的

 上传2张照片/视频到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1363.txt



亲爱的，你是最重要的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/746.txt



2015年4月7日 10:32
任何事情之间都是有逻辑关联的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/56.txt



2016年9月25日 23:06
2016年9月25日 23:06



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1364.txt



如果是误会那你发泄吧



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/747.txt



2015年4月6日 21:49
“嘿，这画师真不错！”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/57.txt



2016年9月25日 23:05
男女身材是天生哒

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1365.txt



好了你成功报复了，真的成功了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/748.txt



2015年4月6日 21:49
j




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/58.txt



2016年9月25日 22:55
2016年9月25日 22:55



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1366.txt



全城爆笑：#搞笑#晚上睡觉害怕的时候，只要把被子两侧向里折进来，再抬脚一下把底部的被子折进来，肩膀两处塞塞紧，顿时安全感爆棚！！。。。。。有这样做的童鞋默默转发吧！

2013年1月28日 19:57转发(11408)评论



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/749.txt



2015年4月6日 15:16
变成夜莺吧
清洒 ：你会在银行柜台前看到他，会在宾馆的前台看到他，会在街上偶遇他，这世上有太多和他一样发型一样表情一样脸型的人了，你会渐渐开始想，他以后也会变成这样平平常常的人吧？这样你就可以随时找到他，你就可以大声地跟他说话而他只是埋着头……你不知道这世界有多广阔。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/59.txt



2016年9月18日 02:25
傅立叶，也是够老了

 上传1张照片到《手机相册》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1367.txt



为什么你以那么决然的姿态闯入我的生活，带走了我的心，只留下你的发香，却又以那么决然的姿态捏碎了它。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1368.txt



我说我不来。大概一个小时了你没有回，然后我告诉自己你哥说你在补课，要一个 多 小时 ，15:58 我短信问你 你来了么 。 16:20+ 我妈妈说她正在回来问我要吃东西么带我吃点小吃我说我不想去，然后她很奇怪。 16:37 你打电话给我，我用最快的速度接了下来，你给我甩了一句狠话挂了 通话时间不超过10秒



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/750.txt



2015年4月5日 15:39
Meeting，若英



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/60.txt



2016年9月18日 02:03
天很蓝， 鸽子飞过。 黄昏快到了， 我们是熄灭了火炬， 还是沉到海底？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1369.txt



喂你放我鸽子的好么？我等了他妈的两个小时想和你说一句话，我怎么说怎么做你都要生气呢？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/751.txt



2015年4月5日 15:36
矮油，锋利哦




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/61.txt



2016年9月10日 04:28
很可爱的小个子




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/752.txt



2015年3月29日 03:25
我感到自己的脑域有限，脑域这个东西，扩充什么的不要想了，自然状态下那需要以千年甚至万年为单位的时间吧



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/62.txt



2016年9月6日 01:56
意识就是你想找什么， 就可以看到它。 有时你找不到路了， 回想一下相关的， 也能找到它




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1370.txt



那你要我说什么嘛



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/753.txt



2015年3月29日 00:33
王巧玲说，初恋最让人难忘的夕阳下的拥抱。我就想啊，夕阳下哪里有什么拥抱哟，夕阳下……夕阳下是你背着大大的书包，踏着沉重的脚步；夕阳下是你和一群不认识的小孩围在路边摊；夕阳下是你孤孤单单地在空荡的操场上瞎晃，带着耳机听摇滚……你的生命还没升起，就落下了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/63.txt



2016年9月4日 00:32
树莓派如今还能用，但是速度很慢，原本已经调整好的，也不能再用了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1371.txt



转发：帅气
你笑了吗--应用认证空间：如果我能在有生之年看到这个就死而无憾了！同感的童鞋果断的转个！！

2012年9月29日 17:54转发(132487)评论(134)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/754.txt



2015年3月22日 01:35
清洒 ：神秘是我的Tshi，睿智是我的外衣，孤独是我的面妆，关心是我那破了洞的牛仔裤～



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/64.txt



2016年9月2日 01:45
夜里开始刮风，街道沉到了海底。 我觉得我的身体很厚实， 可那风穿过 我心里的地窖， 我的过去， 直到灵魂的尽头。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1372.txt



我错了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/755.txt



2015年3月22日 01:22
你是夜之子，在黑暗里你的生命显得悠长又寂寥。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/65.txt



2016年9月1日 04:06
标准四个线只能接三个，
瞬间秀逗给它接上了，
结果树莓派就壮烈了…
原来周立功的调试串口，短接不会烧，树莓派常规串口，短接杯具




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1373.txt



Henry：这张图片越看越乐~

2012年11月25日 21:09转发(146872)评论(296)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/756.txt



2015年3月22日 01:18
他在摆弄着那颗“骑士”，脸庞在月光下显得透明。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/66.txt



2016年8月30日 04:32
那些花瓣飘过街道，变成了一道风。
席卷了你的曾经，你的灵魂。
这里开始下雨，你的身体很单薄，长夜是条河，我沉睡在海底。
我是雾里的雕像，怀璧其罪。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1374.txt



浅浅灬点点：这是我看过的最牛叉的机读卡……哈哈哈……欢迎转载（看后不转下次考试不及格）………

2011年10月15日 17:11转发(49590)评论(7)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/757.txt



2015年3月7日 02:30
“梦想还是梦想！”解析：由于主语前面没有形容词，我们认为这个“梦想”即指说话者自己的梦想或者泛指所有梦想（通常情况下不会强调某第三人称）。则句子的意思是梦想并没有改变，由此引出了几个问题：一梦想原来是什么样？二梦想为什么会改变？三梦想会变成什么样？第一个问题，最初的梦想即是童年时期无忧无虑的猜想……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/67.txt



2016年8月29日 13:31
2016年8月29日 13:31



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1375.txt



额，感觉我还是被玩儿了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/758.txt



2015年3月6日 16:44
我们可以试图根据语言的逻辑性和连贯性，在一定程度上预测对话的走向。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/68.txt



2016年8月27日 15:57
周立功到货！ 接下来准备把他和树莓派连接起来

 上传1张照片到《屋顶》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1376.txt



《搏击俱乐部》奇葩级的悬疑片神作！！尼玛这就是外国神经病啊！！跟泰勒相比，神马路明非芬格尔神马装备部副校长都是渣啊！！！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/759.txt



2015年2月25日 22:58
你准备好了吗？不，你还没有准备好，你的身体激素水平还不够，你的肌肉缺血，细微操作时难免发抖……我的推论是正确的么？激素调节很重要，比实力重要么？比勤奋重要么？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/69.txt



2016年8月25日 22:10
这次是正解
清洒  发表日志  傅里叶级数 
时域→频域F(ω)= ∫±∞ f(t)e^(-iωt) dt（傅立叶变换）= ∫±∞ f(t)*(cos(ωt)-isin(ωt))dt（formula euler)......





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1377.txt



“我要去芝加哥我要去芝加哥！有人愿意陪我去芝加哥么？”诺诺说。然后凯撒就从3楼跳下去了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1378.txt



Watermelon。：二中期末新标语。感觉又要亮了。

2013年1月16日 22:39转发(154188)评论(239)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/760.txt



2015年2月25日 22:41
我可以指着爱派的字体说这说那随意评价，但是如果爱派没有这样的字体呢？我还能够这样去“炫耀”吗？我的话里带了炫耀的一丝意思吗？如果我没钱买爱派呢？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/70.txt



2016年8月25日 13:59
尽管人们只做对自己好的事，可以试图让你心情不好发些东西，势头不对把我剖了都可能，毕竟对自己好嘛可以理解 除开这些，世界上还是有许许多多happy的事情呢




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1379.txt



未闻夏至：【云南教育厅厅长：读初三高三是浪费时间】云南省教育厅厅长4日演讲称,初三,高三都在备考,浪费了太多时间.反反复复地复习,把学生的思维都搞得变形了.他认为,要取消全国高考,"一张试卷把同学16年的学习评价了,公平么?教育如果不能使人幸福,就没有必要存在。"【大伙快转起来！！！！】

2012年5月6日 08:46转发(185290)评论(187)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/761.txt



2015年2月24日 07:48
大野一雄——我不喜欢说神经病这样的词语，我只觉得此人的内心太诡异了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/71.txt



2016年8月19日 01:35
终于安对了，声音小多了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/762.txt



2015年2月22日 23:40
概率不是你的眼睛，概率只是一扇窗，可以透过窗看到窗外的世界。概率是一双只接受特定波段的眼睛。小行星撞上地球的概率是几百几千分之一，我们知道这个世界上没什么是不可能的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/72.txt



2016年8月16日 13:09
有些东西，从未结束过，就算结束了，也会留下一些痕迹…他们尽全力去留下一点东西




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1380.txt



Joker：考数学前必拜祖冲之。30秒内不转，必挂。

2013年1月9日 18:34转发(0)评论(8)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/763.txt



2015年2月22日 23:33
pm8:00，车窗外的世界被霓虹灯渲染成了彩色，旁边车道上的三轮车声与车内的摇滚达到了同一音调，和谐地共鸣着…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/73.txt



2016年8月14日 03:21
这世道变了啊……

 上传1张照片到《屋顶》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1381.txt



妈的这种感觉。。真遇劫了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/764.txt



2015年2月14日 18:49
近期准备临摹一张海岛风景的图片，届时可能需要拥有相关特长的朋友，以及，你们的帮助。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/74.txt



2016年8月12日 06:46
我们也诞生， 也欢乐过 也痛苦过。 我们也终将下地狱，就像日落了，群鸟归巢。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1382.txt



A life in zhe world ,each death,in order to be back!



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/765.txt



2015年2月12日 23:22
图灵测试，它暗示我们，要完成它还有另外一种方法—让人类学习机器的思考模式…但是我们能这样吗？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/75.txt



2016年8月10日 23:43
i look at her , straightly, cause i don wanna forget her, any more.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1383.txt



命运这东西，生来就是要被踏于足下的，如果你还未有力量反抗它，只需怀着勇气等待。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/766.txt



2015年2月7日 22:25
光啊，基督的脸庞，人的心，照亮。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/76.txt



2016年8月10日 04:57
“我盯着她，我要确保我永远不会忘掉她的样子。 后来我就再也没能忘了那一幕。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1384.txt



诶呀妈呀



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/767.txt



2015年2月7日 22:24
我想把你们都装进一个小小的木盒子里。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/77.txt



2016年8月9日 16:41
2016年8月9日 16:41



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1385.txt



妈妈 我将变成萤火虫



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/768.txt



2015年1月2日 03:22
一星空像黑色的大理石，幽深的海底。我化身为月亮。
二我很自信，但是我没有在看任何人，过去的时间回不去了。
三只要一分钟，我就可以变成你的样子。
四你的微笑苍白的像是雕塑，你的魂魄是耐心的雕塑师，干枯的手和它动人心魄的作品。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/78.txt



2016年8月9日 00:23
栀子花又开了，太阳很亮。 很多年后那个男孩还是变不成蝴蝶




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1386.txt



转发：啊哈哈哈哈哈
苦力帕帕〆：看到此贴并十秒内转发者，关二爷保你考试不挂科…

2013年1月3日 23:52转发(98203)评论(29)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/769.txt



2014年12月26日 18:16
爱上汽车和夜晚吧，火红漆的跑车和泼墨的黑夜！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/79.txt



2016年8月8日 01:49http://user.qzone.qq.com/1776177662
2016年8月8日 01:49



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1387.txt



麦包包：你对在意的人，也会这样吗？

2013年1月6日 13:08转发(0)评论(21)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1388.txt



161：真的猛士，敢于面对淋漓的月考，敢于面对惨淡的半期。考题，已使我目不忍视了。听力，犹使我耳不忍闻。我还有什么可说呢？我懂得期末学生之所以跪求及格的缘由了。期末呵，期末呵，不在期末考试中爆发，就在期末考试中灭亡。

2012年12月16日 11:44转发(585)评论(1)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/770.txt



2014年12月20日 02:55
你能感觉到的，思路越来越清晰，身体越来越敏锐，踏着葬礼的钢琴声而来，“青年时期”来到树下，窗外的栀子花开了又谢，为青春驯养，为青春殉葬。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/80.txt



2016年8月7日 20:49
2016年8月7日 20:49



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1389.txt



转发：啊哈哈哈哈哈哈
傈子：老板估计是盖伦....

2012年12月29日 11:13转发(0)评论(1)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/771.txt



2014年12月20日 02:47
石头里禁锢着的触不到的温暖，之前没有感受到，今后也不会有！！！大声地喊吧，“我爱着一个本就不打算给我温暖的人！”我的声音传到隐秘的地牢，那被囚禁的战士。 露水和尘土 打湿了睫毛！！！！！梭伦、盲眼诗人、马车、尘土飞扬的街道，亘古不变的太阳。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/81.txt



2016年8月7日 19:43
	
在Linux下用虚拟机跑Windows-InfoHunter-ChinaUnix博客 
我在浏览【在Linux下用虚拟机跑Windows-InfoHunter-ChinaUnix博客】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/772.txt



2014年12月14日 13:27
Music Catch The Past TIME



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/82.txt



2016年8月6日 01:03
2016: 人是人 ， 真理是真理。 人们自利。 任何事。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1390.txt



转发：尼玛出快点啊。。。。。。
空间游戏：#动漫热播#【#十万个冷笑话#】福禄篇第2集继续爆笑恶搞。福禄娃们继续和陛下哦不，是女王大人激战！北斗神拳、港漫、圣斗士……喂喂！穿越得太刺激啦！什么？你说你看到了传说中的六～～娃？http://url.cn/Dlz29i

2013年1月11日 21:55转发(944)评论(303)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/773.txt



2014年12月14日 11:04
我摊开手，但是我发觉面前没有人。断断续续的节奏，普照大地的阳光。门后的阴影里藏着一只吸血鬼，我养大的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/83.txt



2016年8月5日 19:42
小胡子都留起来了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1391.txt



我不识何等为君子，但每事吃了亏的便是；我不识何等为小人，但每事占了便宜的便是。——弘一法师



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/774.txt



2014年12月12日 21:33
为这个冬天默哀。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/84.txt



2016年8月5日 05:07
川普会怎么想
	
美国发现甲骨文：印第安人是中国人后裔 
我在浏览【美国发现甲骨文：印第安人是中国人后裔】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1392.txt



哇啊啊啊啊阿信啊阿信啊噢麦雷迪嘎嘎




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/775.txt



2014年12月12日 20:08
“没有人会留在身边的，还是不要去改变，他人的命运。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/85.txt



2016年8月5日 00:35
明月倒映在海面。
——没有危险，就已经很美了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1393.txt



突然想开始学吉他，想在街道上弹，前面放个盆子，想在夜里弹，忘掉一切



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/776.txt



2014年12月6日 21:18
为什么要思考说出的一句话的感觉？“我的意识在你的身上发芽了。”很恶心么？不恶心么？我想那是……你开始以另一个人的感官来感受世界。时间太久了，仅仅是两个字，你都可以感觉到面前的这个人是不是你最在意的人




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/86.txt



2016年8月4日 05:03
搞不好死一大堆的节奏
	
换血使人返老还童？一个将要进行的“吸血鬼”实验 
我在浏览【换血使人返老还童？一个将要进行的“吸血鬼”实验】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1394.txt



突然想开始学吉他，想在街道上弹，前面放个盆子，想在夜里弹，忘掉一切



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/777.txt



2014年12月6日 19:00
“侧面有车！”“爬升！”“……”夜幕似火。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/87.txt



2016年8月4日 00:48
这是机械…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1395.txt



我也爱过林俊杰的歌



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/778.txt



2014年12月6日 10:58
无可抗拒，长波辐射透过树叶被切成薄片。记忆是所有，悲伤的东西。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/88.txt



2016年8月3日 17:04
说话时产生的连带信息
可以作为某种语法指代任何东西，也会使人产生不同的联想。
也许这是某种…这样活着的生物…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1396.txt



人性本恶。聪明的人用善欺骗别人，不聪明的人用善欺骗自己



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/779.txt



2014年12月5日 21:32
毕竟妖孽不觉得自己是妖孽。如果你们都妖孽了的话，那么我也成为妖孽吧。毕竟我始终觉得自己是一个很正常的人，但是近来觉得不论是从心灵上还是身体上亦或是意识上都要脱离原本的轨道而改变了。据说有一种鸟会衔着木条越过大洋，那么我是这样的鸟了，我是音速鸟我要飞到很远的地方，我也不知道有多远的 展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/89.txt



2016年8月2日 14:12
现在的你不是过去的你了，
TA也不完全是过去的你。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1397.txt



中国节目的特点就是后面总有一群傻逼在做出各种神奇的动作，这样看起来就会很热闹




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1398.txt



青春要求我们抉择,是选择生存还是生活



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/780.txt



2014年12月5日 18:23
如果有一天我真的是死了，组织开始分解，身体内出现尸胺，意识开始消散……如果是我身边没有我熟悉的人，有美的风景即好；如果是没有美的风景，我曾立过丰功伟业即好；如果是我也没有什么事情做得很伟大，那么我要去干什么呢。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/90.txt



2016年8月2日 03:58
	
Kiss The Rain

歌手：The Best Of Piano

所属专辑：《The Best Of Piano》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1399.txt



“世界上有一种生命，它的每一次死亡，都是为了归来！” 2013元月上旬，《龙族3》全国上市！！！！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/781.txt



2014年11月30日 00:43
“诸如魔鬼之类，不过缥缈之物。它使你进入梦乡，在你熟睡时偷吻你。若带其吻痕气息，必招厄运缠身。即以圣水沐浴，七天禁言。”
魔鬼的吻是一个咧开的笑脸。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/91.txt



2016年8月2日 01:31
玫瑰和十字， 鸦群，猩红之月。 战争之火从东方燃到西方。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/782.txt



2014年11月30日 00:28
“要以整个种群为单位考虑事情。”也许笨一点会发展地快呢，笨的人把自己大把的青春奉献给人类。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/92.txt



2016年8月2日 01:30
姥爷老汉儿都肾结石。。我真滴鸭梨山大




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/783.txt



2014年11月25日 21:42
<一句话到了嘴边说不出来的感觉就像炸膛一样>一个人能变成什么样子是命运所致的话，一颗卒能达到什么程度？
即使你不是住在繁华的城区也没有关系，因为你的童年不如别人，而坠入深渊也没有关系，我们……本就是在深渊的不同位置。你知道有男孩和女孩在宽敞明亮的教室里学习俄语和法语，有人在空旷的荒野 展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/93.txt



2016年7月31日 01:24
犯二总被破坏；
空闲的时间被挤走或是搅乱了，
没有什么安闲的时候。
-
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/784.txt



2014年11月22日 21:54
"这些都可以商量。"



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/94.txt



2016年7月29日 20:38
清洒 ：树莓派集群，或者说树莓派超级计算机。
这样应该行吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/785.txt



2014年11月21日 20:44
如果梦想是个女孩，那她是有着可爱的脸下残缺不堪的身体。要为了守护心中的梦想而努力啊！f(梦想→现实).




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/95.txt



2016年7月28日 04:06
2016年7月28日 04:06



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/786.txt



2014年11月17日 11:28
“因为你被我抓住啦，所以你是我的，你要听我的话，而以后我会把你卖给别人，以换取优势。”猎手说。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/96.txt



2016年7月27日 17:24
LFS,它能改变太多  https://linux.cn/lfs/LFS-BOOK-7.7-systemd/index.html#fromapp 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/787.txt



2014年11月15日 21:17
“头疼吃薄荷糖是没有用的，薄荷糖只是有镇痛的作用，还会增加你的血糖浓度，”我提醒他，“你太老了，这么老了还这么爱吃糖。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/97.txt



2016年7月26日 18:49
它只是从这世上消失掉了，再也没存在过



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/788.txt



2014年11月15日 13:50
你在冬天去看她，她穿着红色的戴帽子的外套，笑靥如花。To find her in the winter,her smile in red like flower.




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/98.txt



2016年7月26日 01:41
目前为止，我们都是为自己好。 所以别说是为我好，也别随随便便影响什么东西。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/789.txt



2014年11月15日 13:38
我在空间里发你照片是为了有人在扣扣列表里偶然不知道我是谁时就可以看到我是谁。你把命留着，是要有一天把它卖给某人，或者送给某人。“我从未想过我会为谁而死为谁而受伤”，“但当这一天真的无可避免地到来时，我将无所畏惧，因为你在我的身边”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/99.txt



2016年7月25日 09:05
夕阳染红海面，照亮了我的脸



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/790.txt



2014年11月7日 20:54
我相信命运，我也相信我自己，我相信执剑能斩断宿命；我相信梦想是沉睡在海岸线上的沙，我相信梦想与青春会交织出焰火，绚烂夜空；我相信寒冬的积雪会融化，我相信旅人会在海边看到春暖花开；我相信女人之美杀人无形；我相信飞鸟会问候辛勤的园丁，新月会与我共叙吉檀迦利；我相信你比许多人都好，我相 展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/791.txt



2014年11月1日 09:08
忘记学习的形式
学习是你与生俱来的本能，
就像呼吸一样简单
而你是无与伦比的。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/792.txt



2014年11月1日 09:08
忘记学习的形式
学习是你与生俱来的本能，
就像呼吸一样简单
而你是无与伦比的。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1400.txt



........



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/793.txt



2014年11月1日 09:07
忘记学习的形式
学习是你与生俱来的本能，
就像呼吸一样简单
而你是无与伦比的。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1401.txt



不信算球
转发评论删除

我也说一句
月光
……我又咋个了……毛闷
转发评论删除

我也说一句
月光
青春是永恒的劫数，她的华美和残忍



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/794.txt



2014年10月24日 23:38
忽然间一种奇怪的想法——地铁什么的造在那么又黑又深的地下就是为了让那些个什么奇奇怪怪的不明生物跑进去然后被火车的动能消灭掉的吧？？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1402.txt



i am that "i"



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/795.txt



2014年10月19日 10:52
“花和树都老了，但是我还在这里”——第七分组{Tree & Flowers}



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1403.txt



我…



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/796.txt



2014年10月17日 10:46
那是大地上的事了，但是大地上的事太多了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1404.txt



我勒个去。。表乱想啊。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/797.txt



2014年10月17日 10:39
筑书为墙，也挡不住时间的剥削；你将堕落。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1405.txt



转发：....
-MiaKo：一个美国人连续玩了48小时的Temple Run 到终点时截的图。。竟然真的回城市了

2012年10月12日 20:48转发(0)评论(1)



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/798.txt



2014年10月11日 23:41
时间带来的创伤，只有科学才能弥补么？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1406.txt



我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了我错了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/799.txt



2014年10月11日 23:39
曾是一泓湖泊




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1407.txt



4月16日生日，收到生日礼物：水果季节
“香甜可口的水果蛋糕送给你，希望你的生活每天都包裹着甜甜的味道！”

共收到8份生日礼物

删除

月光
4月16日生日，快送上祝福吧！
删除

月光
发表日志通篇只有一个字的古文
我`我不说什么了``就是突然好想打一个大大的CAO字~!啊不`仅仅一个CAO怎能抒发我的心情``
1、赵元任《施氏食狮史》
石室诗士施氏，嗜狮，誓食十狮。施氏时时适市视狮。十时，适十狮适市。是时，适施氏适市。...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1408.txt



发表日志为君拔刀（二）
|五|刺 杀
旧俗会在冬至吃饺子，我请了个厨子，帮我做一桌饺子。我告诉他饺子要摆在开封城外一个农舍里，那天晚上会有四个客人，摆四双筷子，其中一个是小女孩儿...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1409.txt



发表日志为君拔刀（一）
前言
你永远都在旁观别人的悲剧，像是一个带着恶意的观众。
悲伤就对了，世界就是那么悲伤的。
失去就对了，你不可能一直拥有。
但是不必流泪，你懂得了这世界的...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1410.txt



发表日志= = 人。。。。

共有3张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1411.txt



修改信纸日志小船
□江南
“人无法两次踏进同一条河流。”
曾经我有一个朋友，他从西域来，骑一匹汗血宝马，佩一柄弯月般的刀。这话是他告诉我的，据说是个伟大哲人说的，那哲人伟大得如同夫子庙中的至圣先师。 。b55ec28c5...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1412.txt



发表信纸日志Daily Growing ——《龙族2》中楚子航听的那首爱尔兰民歌
[音乐]
http://www.onlylz.com/postcache/b-iqrggb/page-9.html
龙族2 悼亡者之瞳 片段
…… ……
楚子航的脑海里一片空白，机械地驾着车飞奔在雨中，车内音响不...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1413.txt



转载深呼吸的日志狗狗大全(送给喜欢狗的人）
拉布拉多幼犬。
忠实、沉着、聪明、和小孩一起让人放心，永远自足快乐，对侵入者戒心强，适合郊区生活。
原先是当搬运工的，现在是红得发紫啊。拉布拉多猎犬的嗅...

共有49张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1414.txt



转载深呼吸的日志世界上最诡异的九把刀[图]
图1死神之手
图2馼刃
图3黯刃
图4眼镜蛇
图5虫豸刃
图6恶魔之吻...

共有9张图片



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1415.txt



转载深呼吸的日志国际音标发音，只要一点击就能发音的
这里为你提供一个英语国际音标的教学平台，你只要在你想知道的音标上轻轻一点击就能发出这个 音标的声音，请有兴趣的同学试试看看，多多来学习以后就能记住音标...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1416.txt



转载雾氵青透伦敦的日志12星座的爱值多少钱？
第12名：天秤座=500元。
第11名：射手座=3万
第10名：巨蟹座=10万
第9名：双鱼座=30万
第8名：金牛座=50万
第7名：水瓶座=70万...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1417.txt



发表信纸日志【九州志】蔷薇之卷（4）
八柱国
白胤很念旧，对毕止城中的老兄弟们非常信赖。他把赖以起家，也就是和他一起造反的班底一直带到了朝堂之上，这些人最后都成为了公
卿。但是探究他们原来的...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1418.txt



发表信纸日志【九州志】蔷薇之卷（3）
Chapter2.火之男
白胤，胤朝开国皇帝，被尊称为【蔷薇皇帝】的男子，此时在毕止城里当一个小军官。弑神、血洗圣堂、天启易主这些天下大事根本和他
扯不上关系。...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/800.txt



2014年9月12日 11:05
时光是你脸庞上的皱纹，你侧下脸，撒了满地
月光 ：时光是你脸庞上的皱纹，你侧下脸，撒了一地




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1419.txt



发表信纸日志【九州志】蔷薇之卷（2）
这是教义中的一个巨大的黑洞，人们可以借这条教义来颠覆宗主会。但是这是根本教义之一，无法动摇。
启示之君的降临带着神的威势。他直接驾临战场，身穿闪耀着光...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/801.txt



2014年9月12日 11:04
时光是你脸庞上的皱纹，你侧下脸，撒了一地




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/802.txt



2014年9月8日 21:39
时值两千零四年九月八日，中午正欣赏毛老爷子诗词，忽然鼻头一凉，口吐鲜血，半筐不止，顿觉头晕恶心天昏地暗四肢发凉。生物电压过低？红。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1420.txt



发表信纸日志【九州志】蔷薇之卷（1）
那一日，神死了，
于是神所庇护的皇朝也坍塌；
火焰般的男人高举蔷薇的旗帜踏破了帝都的门，
从此龙一般的皇朝“胤”统治世界的东方。
Chapter1.神之殇
没有人想...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/803.txt



2014年8月25日 22:31
巨量的数据流在上百万的逻辑单元里流转闪动，每一个线程都在后台进行着繁杂的运算。一切都已准备妥当，每一个程序随时都可以开始全功率运行，但是他们没有动，因为没有人给它们指令。主程序弹出了一个小小的窗口，“Try”，只要我按下这个按钮



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1421.txt



转载 雨¤托起§思念的日志请好好珍惜身边有点疯的朋友
如果你的朋友有点疯，请好好珍惜！
有点疯的人性格很奇怪,有时候超爱说话,有时候可以一天不说话的时候,会拼命的说话,不高兴的时候,一句话也不说；
有点疯的人不...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/804.txt



2014年8月20日 23:33
飞碟飞碟飞碟飞碟飞碟飞碟啊有木有！！麻麻，快来看上帝！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1422.txt



月光
转载寒蝉の娜的日志其实仙五的结局前是有隐藏对话的
（正版结局）
太武：夜叉族虽退，但魔界通道大开。为防其他七族蠢动，以保人界太平，必须修复神魔之墙。 太武：此事祖师爷已预作万全准备。将蜀山沉下封堵神魔之...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/805.txt



2014年8月19日 18:37
连玩带打一个小时，出了个死亡空间甲 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/1423.txt



发表日志《龙族》江南 插图诗
1
花的种子在天空中四散
在黑暗中肆意盛开
紫色的太阳般的蒲公英
下坠的青色吊篮
红色和金色交织成的玫瑰...



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/806.txt



2014年8月17日 03:52
个体A受先天条件及后天因素相互影响，建立了较稳定的道德观念O，当A感受到外部发生的事件α并根据自身精神状态k做出反应或者思考出自己的看法，A对这件事的看法及根据k值处理事件后的结果方向我叫它β，而这件事对A的生活及思想造成的影响或者说后果我称它为l(小写L),l的值很大那么说明这件事很可能会持续地对A造成心理或生活上的影响，影响的大小为s。而这件事最终会以在A的道德观念O的水平面上以角度α和高度β、距离s处的点P上。 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/807.txt



2014年8月15日 22:41
从夜里一直下到白天中午，这场面我还用什么词语来形容呢？只能是……壮观吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/808.txt



2014年8月15日 06:55
我勒个神    




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/809.txt



2014年8月14日 20:24
我的小呀小苹果号，尾灯闪到爆




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/810.txt



2014年8月13日 00:53
往事就像我的被子，总是折了又折掀了又掀，冷了又暖翻来覆去




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/811.txt



2014年8月13日 00:49
2014年8月13日 00:49



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/812.txt



2014年8月10日 23:24
我要在最高的地方修建一座房子，云雾缭绕；我要在最美的地方修建一座亭子，看潮起潮落；我要在世界上最遥远的孤岛上细数我无尽的生命，忘却我的忧桑




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/813.txt



2014年8月10日 22:48
这个瑞兽位于灵山寺新建的最高层藏经院(？)门口，貌似是麒麟……？




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/814.txt



2014年8月10日 14:25
美少年の筋肉化絶滅




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/815.txt



2014年8月8日 16:23
“军队向前进 生产多一寸 加强纪律性 革命无不胜”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/816.txt



2014年8月7日 13:15
Giraffe,长颈鹿，又名麒麟，地球上现存最高的陆生生物




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/817.txt



2014年8月6日 21:41
年轻的国王，年老的国王，银餐具，黄金的宫殿，巨大的水晶吊顶……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/818.txt



2014年8月6日 13:04
昨天梦到许嵩，厚嘴唇开演唱会，丢到人群里找不到的造型。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/819.txt



2014年8月5日 21:35
我想我终于知道笔记本的魅力所在了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/820.txt



2014年8月5日 12:22
“没牌子，定做的。”他妈的这才是最拽最酷的一句话好么？为了这句话走遍大街小巷去找个能帮我做衣服的店子有什么问题么？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/821.txt



2014年8月5日 09:29
进军！星际争霸2，艰苦被虐的生活又开始了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/822.txt



2014年8月4日 17:24
夜晚，爷爷的房间有隐约的光，一直以来是那么神秘，有一天你循光而去，却发现那里什么光和声音也没有，只有一台笔记本，静静地躺在桌子上。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/823.txt



2014年8月4日 09:32
整整十二个人在禁区里诶，很奇怪这球是怎么进的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/824.txt



2014年8月3日 00:51
那时候我不大，没有把黑客帝国三看完，时间定格在那个男人咆哮着操纵重机枪扫射的那画面……一群男人在几万米深的城市里提着重机枪嘶吼，乌贼像海水一样涌进城市里……想到这里总是胸膛发酸



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/825.txt



2014年8月1日 22:22
我有充分的理由相信，喜欢听蔡健雅歌的女孩都是会穿高跟鞋的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/826.txt



2014年8月1日 22:09
常见外伤应急手册




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/827.txt



2014年8月1日 17:50
这世界越来越脆弱



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/828.txt



2014年8月1日 14:57
医院外湿漉漉的，空气闷热又潮湿，像是可以滴出水来，昨天临时买的鞋子已经走烂。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/829.txt



2014年7月31日 15:19
你的心里有一方麦田，麦穗在微风中摇曳~



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/830.txt



2014年7月30日 22:43
深呼吸 ：发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/831.txt



2014年7月30日 21:33
戴了鸭舌帽一个人走在外面会很像那种做了X疗的女孩子吧？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/832.txt



2014年7月30日 20:31
2014年7月30日 20:31



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/833.txt



2014年7月29日 15:47
2014年7月29日 15:47



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/834.txt



2014年7月27日 20:57
天黑的时候不过是人们要去一个安全、舒适的地方休息，人们在熄了灯的房间里嚼淡淡的薄荷糖，人们在广阔的草原上喝68%酒精的白酒，人们和心爱的狗狗睡在一起，一个人睡在高架床上，或是铺在地上睡。世界很大。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/835.txt



2014年7月27日 06:49
2014年7月27日 06:49



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/836.txt



2014年7月27日 06:45
2014年7月27日 06:45



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/837.txt



2014年7月25日 02:15
一路上各种动物在过马路，鸟牛羊土拨鼠不明生物




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/838.txt



2014年7月25日 02:07
草原上满地都是土拨鼠




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/839.txt



2014年7月22日 19:17
英国斗牛犬。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/840.txt



2014年7月22日 13:02
“她在台上旋转，镜中人抬臂、下腰，瀑布样的黑色头发垂下来，衣饰上流转的光芒恍若星辰。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/841.txt



2014年7月21日 22:05
在我十五岁左右的时候，我也有好好记住那些MV里舞蹈的一些动作，小心翼翼地把它们串起来什么的……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/842.txt



2014年7月21日 11:54
“……听了他的话我突然觉得在这个世界上应该有一种很棒的职业叫做足球运动员，他们了可以去这个世界上的大部分地方踢球而不用担心语言的问题——可以不需要使用语言，他们会很好的保护自己不轻易受伤……”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/843.txt



2014年7月21日 11:46
快到内蒙古了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/844.txt



2014年7月18日 23:56
the elder scroll ONLINE



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/845.txt



2014年7月18日 23:54
“女孩，大晚上的在外面瞎跑什么。”——致七月十八晚街旁路过girl



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/846.txt



2014年7月18日 14:13
穿过陕西，穿过重庆。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/847.txt



2014年7月18日 14:12
太猛了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/848.txt



2014年7月18日 09:39
“面色潮红，是为气勇；面色苍白，是为骨勇，但是这些都不是真正的勇敢，”从属疑惑，督军曰，“大战将至而面不改色者，是为神勇！”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/849.txt



2014年7月17日 10:39
2014年7月17日 10:39



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/850.txt



2014年7月17日 10:11
剑门天险，古蜀战场




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/851.txt



2014年7月15日 21:04
手持式低压轨道电磁炮
深巷的猫 ：请配词




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/852.txt



2014年7月15日 19:04
手持式短波发射器
爱动漫 ：重口小清新丧尸短片，看哭了！僵尸粑粑的爱！！被僵尸妻子咬伤、明白自己即将尸化的男子，如何保护自己背上的婴儿？
视频缩略图



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/853.txt



2014年7月15日 18:49
集束热能炮，发射！
深巷的猫 ：请配词




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/854.txt



2014年7月14日 22:37
一个好的名字改变的不是他人，是自己的内心。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/855.txt



2014年7月14日 20:41
2014年7月14日 20:41



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/856.txt



2014年7月13日 14:05
对他而言，“爱情”不过是个词语，听起来就像是玻璃杯里热水把杯壁上都蒙上了一层雾，气泡慢慢地冒出来。“喜欢”像三千公里外的海岸线。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/857.txt



2014年7月12日 07:41
这个世界上有20000个人是你一遇见就会爱上的。 ——《上海堡垒》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/858.txt



2014年7月13日 14:05
对他而言，“爱情”不过是个词语，听起来就像是玻璃杯里热水把杯壁上都蒙上了一层雾，气泡慢慢地冒出来。“喜欢”像三千公里外的海岸线。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/859.txt



2014年7月12日 07:41
这个世界上有20000个人是你一遇见就会爱上的。 ——《上海堡垒》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/860.txt



2014年7月12日 07:39
人们在自己原来的地方待着，到了预定的时间，又各自到某个地方去



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/861.txt



2014年7月9日 18:19
今晚的夜色是一壶水，在月光下泛着柔波。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/862.txt



2014年7月7日 13:29
你在你漫长的时光里，看星屑慢慢地飘下来。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/863.txt



2014年7月6日 00:42
饿肚子踢球时，是否会因为腹腔内空间狭小而隔肌收缩舒张太过剧烈导致气压过低，伤害到肋骨呢？肚子有点痛。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/864.txt



2014年7月3日 23:35
“我带你去看梦想的火花，绚烂了整个夜空。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/865.txt



2014年6月28日 13:20
昨天晚上梦到你在你在山顶坐着，而我在整齐的人群里。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/866.txt



2014年6月22日 14:09
脚踝受伤



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/867.txt



2014年6月20日 00:19
如果我连好好洗个脸的想法都没有了，那么我大概会变成一个很坏很坏的男生吧？怎样发个短信都能想半天。在干嘛？这样讲会很像那种猥琐的大叔吧“你是个男生啊。”一条短信而已没什么大不了的。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/868.txt



2014年6月19日 23:54
2014年6月19日 23:54



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/869.txt



2014年6月19日 13:18
三原色激光笔的购买一万支，在云层上投影出我的样子给你看



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/870.txt



2014年6月19日 13:07
将两块透镜在西昌上空定锚，并达到天文望远镜的放大级别，然后找到你。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/871.txt



2014年6月16日 22:13
即使做不了题，我在考场上为同学们加油鼓劲，想必也是极好的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/872.txt



2014年6月16日 06:11
梦里是灰色的幽默



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/873.txt



2014年6月15日 08:30
锻炼空间想象力的方法。1.吃一个橘子，然后开始静静地想象它的内部，它的构造，从外到内，从内到外，每一个部分。2.盯着一张图片一分钟以上（眼睛别隔太近了），然后闭上眼，在脑海中观察它在你视神经上留下的残影，并让它尽量清晰，保持尽量久的时间，多练习几次会越来越好。3.每只手上各拿一支笔的尾端，笔尖往外，让双手之间的夹角大于九十度，闭上双眼，让两只手慢慢靠近，想象笔尖的位置，尽量让两只笔的笔尖接触。（注意前方 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/874.txt



2014年6月15日 08:09
只争朝夕



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/875.txt



2014年6月14日 16:46
提莫被人家家的狗上了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/876.txt



2014年6月14日 10:25
呵呵，卡西掉了五个球？！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/877.txt



2014年6月14日 10:25
呵呵，卡西掉了五个球？！http://user.qzone.qq.com/1290746140
呵呵，卡西掉了五个球？！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/878.txt



2014年6月13日 11:54
内马尔！！
Ronaldo→7 ：北京时间6月13日凌晨4点，2014年巴西世界杯揭幕战在圣保罗竞技场展开，东道主巴西迎接克罗地亚的挑战，作为夺冠热门的巴西队能否延续过去19届东道主首战不败的定律，本届大赛首球谁属，内马尔与莫德里奇世界杯版的国家德比谁占上风，都是值得我们关注的焦点。

来自 OPPO 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/879.txt



2014年6月12日 23:30
这这这
虔♛尘 ：世界杯倒计时




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/880.txt



2014年6月12日 13:13
狗狗就是这样的呀，本能地把心爱的东西藏在身后



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/881.txt



2014年6月5日 23:07
鸡棕的微型运载火箭实验型，净容积0.5∽1.0派立方厘米，化学燃料动力，今年秋冬季节面世



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/882.txt



2014年6月1日 16:19
2014年6月1日 16:19



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/883.txt



2014年5月31日 23:53
短期目标是做到覆盖全部角度的卖萌



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/884.txt



2014年5月31日 23:15
2014年5月31日 23:15



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/885.txt



2014年5月31日 17:59
真神诶，狗是从脚底出汗的诶



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/886.txt



2014年5月31日 13:43
你是我卡在牙齿的牛肉粒



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/887.txt



2014年5月30日 13:37
不用做什么的吧，就像你终于要去见那个女孩子啦，但是你最好看的那双帆布鞋子还没有洗，你最喜欢的衬衫还是皱皱巴巴的，但是你还是要去见她啊，，，，？。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/888.txt



2014年5月28日 13:52
酒不醉人人自醉



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/889.txt



2014年5月24日 09:02
根据爱因斯坦质能方程E=mc^2 ,人体炸弹可以炸掉地球



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/890.txt



2014年5月21日 13:37
发型力学修正版。发型的作用1.会对周围人对你的映象产生推力，它是一个相互作用力，也会对你自己的心理产生影响，由于人与人之间情感的距离，答应对你自己的影响大于它对别人的影响。2.在你与朋友之间发生不良事件时，发型会对这个不良事件带来的反向推力有一定的抵消，甚至完全转化为其他形式的影响，它做功的快慢是取决于你发型的功率大小



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/891.txt



2014年5月19日 14:14
人们总是鄙弃酒肉朋友，事实上，在你孤单和难过的时候，也只有酒和肉陪着你，从某种意义上说，酒和肉才是你永远的好朋友。--- 江南



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/892.txt



2014年5月18日 18:23
海带 ：这个世界很复杂，请不要和学医的人走太近。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/893.txt



2014年5月16日 21:56
“无论经过地狱之门多少遍，无论听到兽族士兵的咆哮声多少遍”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/894.txt



2014年5月13日 18:46
“假如有一天只我一人走在茫茫的人海中，会不会有人愿意来找我，担心我有没有吃饭。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/895.txt



2014年5月11日 23:58
月光里的爱人



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/896.txt



2014年5月8日 16:57
LOL粉丝网 ：ADC风骚走位。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/897.txt



2014年5月8日 13:24
"因为你思考问题的时候回用左手弄头发，嘚瑟的时候会用右手弄"



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/898.txt



2014年5月7日 00:56
那些故事都被人们遗忘了，被深深地沉在暖暖的海水里，埋在泥沙里了，那些灿烂的烟火，盛开的大丽菊。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/899.txt



2014年5月5日 23:14
发型应力与类似的力的合力应该是呈现一种类似弧线的增函数图象，并且如果它含有冷艳和邻家之类的多态性，则应该可以画出它的三维函数图象



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/900.txt



2014年5月3日 22:30
锈蚀天使



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/901.txt



2014年5月3日 17:41
根据爱因斯坦相对论，当你以光速行驶时，你就可以瘦下来！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/902.txt



2014年5月3日 10:35
AP蛮子闪瞎狗眼

 上传1张照片到《GAME!》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/903.txt



2014年5月2日 23:34
脑袋很疼啊罗纪山（误）有木有这么冷



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/904.txt



2014年5月2日 22:16
世界就像千百年前一样美丽



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/905.txt



2014年5月2日 22:16
在我看来



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/906.txt



2014年5月2日 22:15
把书页往后翻，是一种错误么



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/907.txt



2014年5月2日 22:14
这世界应该被火和光所清洗



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/908.txt



2014年5月1日 22:42
“在过个十年八年可能我就没地方可以带你去玩儿了”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/909.txt



2014年5月1日 22:35
还在烧稻谷




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/910.txt



2014年5月1日 15:41
　 ：　　　　 　　　　　　　　　　　　　　　　 　　　　　　　　　真的不能让男人带孩子　　　　　　　　　　　　 　　　　　　　　　　　　　　　　 　　　　　　　　　　　　　　　　　　　　　　　　　　　 　　　　　　　　　　　　　　　　 　　　　　　　　　　　　　　　　　　　　　




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/911.txt



2014年5月1日 14:51
sad

 上传1张照片到《0% sugar !》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/912.txt



2014年5月1日 14:11
VERY HOT!

 上传1张照片到《0% sugar !》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/913.txt



2014年5月1日 09:40
2014年5月1日 09:40



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/914.txt



2014年5月1日 09:39
啊哈，世界杯呐，上届世界杯的时候呢，我是多么支持巴西，然后巴西败了，我转而支持阿根廷，然后阿根廷就败了，然后我开始支持西班牙，西班牙又败了……



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/915.txt



2014年4月30日 23:31
拿破仑的故事告诉我们，矮子是很恐怖的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/916.txt



2014年4月30日 23:18
2014年4月30日 23:18



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/917.txt



2014年4月30日 23:17
2014年4月30日 23:17



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/918.txt



2014年4月30日 22:30
2014年4月30日 22:30



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/919.txt



2014年4月30日 20:55
 （转）（游戏）EVE四针扫描教程 
技能要求
1.Science III (科学)
2.astrometrics III （太空测量学）
...查看全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/920.txt



2014年4月30日 20:18
2014年4月30日 20:18



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/921.txt



2014年4月30日 19:03
那大家有木有在马路边捡到一分钱呢~~

 上传2张照片/视频到《0% sugar !》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/922.txt



2014年4月30日 15:54
2014年4月30日 15:54



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/923.txt



2014年4月30日 12:22
TheWayIGoToTheDay

 上传1张照片到《0% sugar !》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/924.txt



2014年4月30日 12:21
我勒个去，EVE因为宇宙膨胀地图变大了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/925.txt



2014年4月29日 20:16
。。。。
Calpernia ：如何正确地拍多人合照！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/926.txt



2014年4月29日 18:38
2014年4月29日 18:38



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/927.txt



2014年4月29日 13:22
2014年4月29日 13:22



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/928.txt



2014年4月26日 18:38
锈蚀天使。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/929.txt



2014年4月26日 14:44
MC这张官方图根本就是骗人的说




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/930.txt



2014年4月26日 14:21
2014年4月26日 14:21



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/931.txt



2014年4月25日 13:19
大学生成长网 ：不要踩着别人的脚印，找自己的路。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/932.txt



2014年4月22日 16:19
“他是电，他是光，他是唯一的神话，他就是他妈的Superstar!”笑抽了都



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/933.txt



2014年4月22日 15:40
哈哈哈哈哈哈哈
返还网 ：去你妹的个怂货！搞得我还以为是很威猛的冲出去！！是哪位大虾发明的！！ http://cnrdn.com/oSmD 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/934.txt



2014年4月22日 15:39
下载一部游戏的时间可以看一部书，这样的话钱还够花么



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/935.txt



2014年4月22日 15:27
你会被一个故事所感动，然后用剩下的时间静候它的降临



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/936.txt



2014年4月22日 15:17
你身边的东西就是你的分身吧



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/937.txt



2014年4月22日 09:25
2014年4月22日 09:25



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/938.txt



2014年4月21日 13:37
是你把自己藏起来了？还是我把你藏起来吧。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/939.txt



2014年4月20日 20:43
国足需要啊波
阿虎凉山好汉 ：踢了三个多小时足球 洗了一个冷水澡.....怎么感觉回到了学生时代




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/940.txt



2014年4月20日 11:13
百度上有轨道炮的原理图，当我爱的人和别人结婚的时候，我就用它去轰暴他们婚车的车轴！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/941.txt



2014年4月20日 10:55
春风又绿江南岸，明月何须照我还



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/942.txt



2014年4月20日 07:40
我总是会提前醒来，时间好像静止了一般，慢慢地活了起来。昨天夜里的时候我是否做了什么样的梦，我觉得我是这个世界上最悲伤的人。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/943.txt



2014年4月19日 13:08
我勒个克，发型焦虑症么？



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/944.txt



我勒个克，发型焦虑症么？

评论

月光
2014年4月18日 21:12




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/945.txt



2014年4月19日 13:06
我们将发型对周围人对你的印象的影响定义为发型产生的应力，则可以认为你的发型拥有发型势能。头发越长，你的发型所产生的力的功率的绝对值就越大，它的正负取决于你发型的好看程度。光头所产生的发型功率无限接近于零。当你的头发长度达到某个常数k时，发型对于你的发型应力大小影响非常大，且可能呈某种函数关系，待测定。所以我将k称为发型常数，单位为cm。k的值大小因人而异，就像每个星球的g都不一样，但是偏差应该不大。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/946.txt



2014年4月18日 21:12
岁月是把杀猪刀




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/947.txt



2014年4月18日 21:07
四年之前，哥哥我还英姿飒爽




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/948.txt



2014年4月16日 07:41
就是穿得大



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/949.txt



2014年4月16日 03:43
	
4月16日是月光 的生日，赶紧送礼物祝他生日快乐吧！
赠送礼物

月光
2014年4月14日 14:30
“后来我们再次相遇的时候，没有谁再拉着谁去游乐园玩啦，旋转飞车和鬼屋我也忘了它们的位置，那天我坐在地面的长椅上，她坐在空中的椅子上，她叫我哥哥。很多年后的今天，她坐在圆桌的这头而我在那头，我的注意力主要是在菜和手机上面。。而我感觉他们都跑远啦，总是我被落在原地
”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/950.txt



2014年4月9日 22:08
2014年4月9日 22:08



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/951.txt



2014年4月5日 16:16
我以鸡枞大帝的明义正式册封提摩为男爵




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/952.txt



2014年4月5日 11:45
“……她用一根绳子慢慢地勒死了自己，原本我以为人是不能把自己勒死的……” ---《葵花白发抄》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/953.txt



2014年4月4日 21:49
“那老叫花子，去年给了他一碗饭今年还在吃”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/954.txt



2014年4月4日 21:47
人已死有事烧纸



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/955.txt



2014年4月3日 17:18
我想我大概不是为此而生的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/956.txt



2014年4月2日 20:11
大量的实践证明，投马桶是可以穿越的



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/957.txt



2014年4月2日 17:13
哦呵呵




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/958.txt



2014年4月1日 18:43
“下一次遇到我的时候，看到我的美丽"



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/959.txt



2014年4月1日 13:18
啊哦快乐魔法！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/960.txt



2014年3月29日 08:26
马航，变形！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/961.txt



2014年3月27日 08:41
大半夜的听到提莫在吃饼干



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/962.txt



2014年3月25日 13:59
据说下一届不考英语也不分文理科



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/963.txt



2014年3月25日 13:07
哇哈哈哈我真他妈是个天才



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/964.txt



2014年3月24日 13:37
他奶奶的熊！四川手机报四川凉山手机报



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/965.txt



2014年3月22日 18:23
妈的，连石头都是假冒伪劣产品




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/966.txt



2014年3月21日 22:16
女孩子就应该多出去玩儿，否则很容易爱上旁边的男生！ --<致同学们的一句话>



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/967.txt



2014年3月21日 22:07
真棒
我爱z菇凉 ：中国西昌，你值得旅游 ，火灾都那么美……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/968.txt



2014年3月21日 22:06
狗认人，猫认屋。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/969.txt



2014年3月20日 01:04
开始慢慢喜欢吃水果，开始慢慢习惯整天蹦蹦跳跳，开始身无分文，开始享受毛闷。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/970.txt



2014年3月18日 23:29
那游乐园渐渐被雨水侵蚀了，散乱的巨大身影，倒塌的影子。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/971.txt



2014年3月17日 18:10
山的那边海的旁边有一片黑森林，里面住着个大将军~还有两个坨坨兵~啊可爱的坨坨兵~



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/972.txt



2014年3月17日 18:03
铁甲，依然在



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/973.txt



2014年3月16日 14:55
在你的灵魂深处，有你想象不到的东西



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/974.txt



2014年3月16日 14:51
化作一尺湖水墨染你的发丝化作黑色的蔷薇



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/975.txt



2014年3月16日 14:47
有人的手机铃声是忐忑有人的手机铃声是奇怪的英文歌有人的手机铃声是猴子请来的救兵么现在我终于发现了勇敢的少年快去创造奇迹这种神奇的手机铃声



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/976.txt



2014年3月15日 21:50
劳资是文艺小清新



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/977.txt



2014年3月15日 21:42
Bye bye Black Bird



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/978.txt



2014年3月15日 21:15
缘分是最不可捉摸的奇妙的东西，那种感觉很奇妙，就像十多年来你看电影时某人刚好坐在你的身边，你在深夜看小说，某人也在寂静深夜默默地看同样的小说，这么久了某人一直在你的身边，而你们的缘分只是终结在无言的擦肩。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/979.txt



2014年3月15日 20:50
好像看他抱起个娃儿的样子
cocoa ：终于知道最强的人类是谁了、、
身長:208cm
体重:206kg
体脂肪率:7%
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/980.txt



2014年3月15日 20:47
＜世界＞当你有了孩子，你就会丢掉你的肌肉，你的慢跑鞋，你爱的衣服，你就会安静下来。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/981.txt



2014年3月15日 19:15
"你好我是神奇哥，你可以叫我神奇哥，我们学校到处都是飞禽走兽，绝对是休闲度假的绝佳场所。"
别逗 腾讯认证 关注 如何面对陌生人的错误短信，及教育她怎样看淡爱情。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/982.txt



2014年3月14日 23:46
明天一早我会拉开窗帘，我的天空依旧纯净



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/983.txt



2014年3月14日 20:57
“会挽雕弓如满月，无法解脱的羁绊，层层嵌套的命运”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/984.txt



2014年3月13日 22:10
以前我抱着破烂的音响听命运交响曲，如今我坐在镀金的马桶上便秘



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/985.txt



2014年3月13日 22:07
你将堕落。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/986.txt



2014年3月13日 12:53
“唱歌吧，就像没有人去倾听一样。跳舞吧，就像没有人去欣赏。生活吧，就像明天是世界末日一样。”



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/987.txt



2014年3月12日 19:37
一矿井深45M，在井口每隔一定时间落下一小球，当第七个小球从井口下落时，第一个小球恰好落至井底，取g=10m/s平方。求两个小球下落的时间间隔。答案上写的1/2*g=45m，这个是哪里来的。。。我缺了半学期课。。。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/988.txt



2014年3月11日 12:20
！！！
半生缘 ：【2014国际马拉松比赛将于11月9日来赛】
西昌2014年将承办环邛海湿地国际马拉松赛，中国田协2014年计划新增西昌邛海湿地国际马拉松赛，西昌成为四川省第一个举办国际马拉松的地方




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/989.txt



2014年3月11日 12:19
AP小炮！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/990.txt



2014年3月10日 21:34
<世界>我们把痛苦当成了财富，还是把财富当成了痛苦



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/991.txt



2014年3月10日 11:05
假如我忘掉了年少你，那么那个善良的你，懦弱的你，生气时睁大眼睛的你，也就真正消失了



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/992.txt



2014年3月10日 11:00
乞丐在享受日光浴，王子也在晒太阳



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/993.txt



2014年3月9日 23:37
<世界>人晚上为什么要睡觉？因为人白天的时候才能清晰地感受到世界上其他人的存在。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/994.txt



2014年3月9日 16:33
夹心三明治～



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/995.txt



2014年3月9日 12:56
“我和老汉儿打dnf开外挂的往事”、“我和老汉儿打lol那段不得不说的故事”、



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/996.txt



2014年3月8日 19:49
2014年3月8日 19:49



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/997.txt



2014年3月8日 15:10
<世界>孩子父母的区别是走到哪里你都不会太想他们，因为你以为自己知道他们在什么地方，过着怎样的生活



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/998.txt



2014年3月7日 23:20
姑娘们父女节快乐2！@会 侃 @楠笺 @~\(≧▽≦)/~楽 @Bubble @? @ @就是那么酷 @ @宋先森 @尘陌 @放进冰箱的鸭梨 @M J @AyuSJIA @磊王 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/999.txt



2014年3月7日 23:18
姑娘们父女节快乐！@- @也好 @zoe. @Oceane @Frozen @弓长亻二梁 @。 @我的对床没节操 @孤灯清酒 @yu. @StrangeKiller @宋紫玥 @星莲BOY @沉沉丶 @只因爱你 @无毒面包 @羽毛 @Tortoiseshell @- 影子 @Amānda. @穆达神像 。 @小可爱 @食野 @又回到最初的起点 @彼方 @没有网名 @Mrs Lei @Nice @ 果宝特攻 @ZhūXIǎoQìng！ 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/100.txt



2016年7月24日 20:24
人们迫于生存，被编好队牺牲自己。 勇敢善良的渔民不可牺牲，善良温柔的椿去救他。 勇敢贪玩的湫去牺牲更好，湫去救了椿。 (勇敢意味着力量，善良贪玩与否意味着情商)




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/101.txt



2016年7月23日 07:53
傅里叶公式确实能表示出频谱。 接下来就是令人纠结的快速傅变。 又是个大件。。。。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/102.txt



2016年7月22日 15:48
企业生产武器
	
【大家都在看】中国将统筹海洋开发维权 引导民企研发生产武器 
近日，中共中央、国务院、中央军委印发了《关于经济建设和国防建设融合发展的意见》（以下简称《意见》）。《意见》着眼国家安全...
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/103.txt



2016年7月21日 03:38
你很好，很完美， 你的十多年过得很精彩。 。 你只需要想想每件事， 每件事都是对的，都是无与伦比的。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/104.txt



2016年7月20日 20:33
创造=随机+逻辑



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/105.txt



2016年7月20日 00:23
她的画像飞舞得满天都是，
暗红色蔓延开来。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/106.txt



2016年7月18日 16:21
这次应该对了
清洒  发表日志  傅里叶级数 
时域→频域F(ω) = ∫±∞ f(t)e^(-iωt) dx'（傅立叶变换）= F(ω)=∫±∞ f(t)*(-cos(ωt)+isin(ωt))dx（formula euler)........查看全文





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/107.txt



2016年7月16日 17:54
新四大金刚




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/108.txt



2016年7月15日 03:21
没有根源的东西或许有效，不过副作用不明确，是吧？？
随便配张图




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/109.txt



2016年7月14日 00:25
2016年7月14日 00:25



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/110.txt



2016年7月13日 03:58
现在我会说，幼儿园那货偷了我的陀螺，小学某人偷过我的悠悠球，中学某人试图让别人认为她是对的。
因为谁谁谁抛弃了逻辑。
。
很多年后，我可能会说我记得不是很清楚了，因为如今，恶心且痛苦的事天天都在发生着。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/111.txt



2016年7月12日 02:51
它走不了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/112.txt



2016年7月11日 04:29
它们很强大，就好像电脑成了你的一部分。 。 对比Windows，所受的限制很小，这一类的操作系统好像在吸引人们，非常开心有人去用它。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/113.txt



2016年7月10日 23:39
不听自己唱的歌就睡不着了
	
七里香【无损版】 
来听听 锅炉炸了i 唱的《七里香【无损版】》,真是太棒了!
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/114.txt



2016年7月9日 19:25
十年了，她穿梭在情场，他来过三次。
第一次很简单，他没有看到那些隐藏着的故事。
第二次有些麻烦，他什么都不要，要使一个什么都不要的人暴走有些困难，不过只要刺激他在生理学上的防御系统(即激怒)就可以了。
第三次…他已经可以比拟一些武器制造师了，他会造炸弹，会熔炼金属，配置火药。
我只需要打110把他带走就行了。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/115.txt



2016年7月8日 20:51
人们普遍支持语言
只是有时表现得不生效




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/116.txt



2016年7月7日 06:57
规律不会变， 那么我们的命运一开始就注定了。 【我会失望或是振作】




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/117.txt



2016年7月7日 00:45
天赋，思想，机遇，得失 不是自己能决定的。 所以人们很痛苦。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/118.txt



2016年7月5日 00:23
你们是两个分立的个体，又不是同一个人。 你们终究会遇到不同的路，这些路有时显得很决绝。 很多时候，能陪你走到最后的只有你自己。 所以爱一个人的最好方式是成为她。 当她长成了别人，你的爱就再不会离开了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/119.txt



2016年7月4日 20:36
我是一个普通的女孩，他是个很坏的男孩。
多年前，我们还在燃着篝火的夜里说着温暖的话；
多年以后，他位高权重，我步入大堂，砍下了他的头。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/120.txt



2016年7月3日 23:52
法国人？德国人？
	
Rose

歌手：Rose

所属专辑：《Rose》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/121.txt



2016年7月3日 23:19
这世界就是你所看到的，但它绝不是你所想的那样。
——大脑的原子有限，我们的思维通常是在猜测。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/122.txt



2016年7月2日 10:19
	
绿光

歌手：孙燕姿

所属专辑：《风筝》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/123.txt



2016年7月1日 23:11
2016年7月1日 23:11



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/124.txt



2016年7月1日 14:14
。。。。乔帮主呢




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/125.txt



2016年6月29日 01:27http://user.qzone.qq.com/1776177662
2016年6月29日 01:27



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/126.txt



2016年6月28日 22:54
屏幕坑贵，不可能到哪儿都接电视吧




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/127.txt



2016年6月28日 09:05
意识可以被影响，
这样一来，这世界变得非常奇怪又有趣




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/128.txt



2016年6月28日 00:14
意识会被腐蚀
大脑会选择忘掉不好的事




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/129.txt



2016年6月27日 17:33
街头神恶搞 腾讯认证 关注 真是坑得一手好狗！虽然很心疼，但还是忍不住笑出了声哈哈哈哈哈哈





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/130.txt



2016年6月27日 17:28
…
搞笑短片 腾讯认证 关注 哪里有卖这样的机器人，被萌死了~哎呀，脚脚卡住啦！





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/131.txt



2016年6月27日 17:16
哈哈哈哈
Jesson ：公鸡吃了药以后，妈呀，笑了我九十九次 | 点击头像关注空间，可获取更多精彩视频
视频缩略图



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/132.txt



2016年6月27日 03:35
上战场吧，男人！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/133.txt



2016年6月27日 00:23
半成品，总觉得脚边多了一坨




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/134.txt



2016年6月26日 00:15
当你喜欢一个人时，就出现了一个巨大的问题。
人能处理信息做出反应，找到规律即可控制人的反应。
。
这意味着，将增大你被遥控的可能(一定程度上的)
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/135.txt



2016年6月23日 21:24
牛顿说，这世界只存在物质和影响。
而生命，只是物质运动的一种形式。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/136.txt



2016年6月23日 21:22
分享 五月天 的歌曲《如果我们不曾相遇》 如果我们不曾相遇付费 （分享自@虾米音乐）
	
如果我们不曾相遇付费 
《如果我们不曾相遇》演唱者五月天，所属专辑《作品9号》；免费在线试听如果我们不曾相遇,MP3下载、如果我们不曾相遇歌词下载;更多五月天相关歌曲推荐,尽在虾米音乐！



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/137.txt



2016年6月23日 12:27
搞笑视频姐 腾讯认证 关注 哈哈哈哈你说你那个ADC溜得不得了结果啊10分钟死尼玛8次。。。





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/138.txt



2016年6月22日 03:43
听起来感觉和五月天有血缘关系。。。
话说这样讲会不会卷入当地土著纠纷…
	
Wind of Gold

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《Tierra》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/139.txt



2016年6月22日 02:08
虽然很乱来，不过比以前好的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/140.txt



2016年6月22日 01:29
青春只是一个阶段，并不是全部，还有更美好的会到来，你的美丽不会少。
(隔壁干甚呢完全没听到)
	
致青春 
来听听 锅炉炸了i 唱的《致青春》,真是太棒了!
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/141.txt



2016年6月20日 19:18
晒晒新键盘




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/142.txt



2016年6月19日 22:42
我想你走过那么多路，可是厌倦了？ 生个孩子，呆个几十年，我们就老了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/143.txt



2016年6月19日 09:10
	
你的力量

歌手：棉花糖

所属专辑：《2375》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/144.txt



2016年6月19日 08:57
	
Rose

歌手：Rose

所属专辑：《Rose》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/145.txt



2016年6月18日 00:33
我是想和一个人在一起走到最后的。 可我现在相信人都固有威胁。 所以我不想和别人走到最后了。 事情似乎走向… 后来我看到一个人没威胁，我想着，走到和她走到最后也挺不错的。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/146.txt



2016年6月16日 00:31
痛苦使人们进步，
所以痛苦难以真正避免
	
DAYBREAK'S BELL

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《DAYBREAK'S BELL》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/147.txt



2016年6月14日 23:13
如果时光真的可以倒流，那么…
清洒 上传1张照片到相册  颓废主义组装车间 
真相有时是反直觉的





'''







'''

/fst/sky/moon-river/micro-blog/1290746140/148.txt



2016年6月14日 14:10
	
牙关 
来听听 锅炉炸了i 唱的《牙关》,真是太棒了!
 



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/149.txt



2016年6月14日 01:25
	
See You Again

歌手：Jasmine Thompson

所属专辑：《See You Again》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/150.txt



2016年6月14日 01:17
2016年6月14日 01:17



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/151.txt



2016年6月14日 00:16
	
Good Night

歌手：曾轶可

所属专辑：《Forever Road》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/152.txt



2016年6月13日 01:06
清洒 ：夜深了，他静静地睡着了，微风飘落这小城。
人们重复着正确的事，
人们学习，判断，生存…
离开，有天再也不回来。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/153.txt



2016年6月12日 23:58
清洒 上传1张照片到相册  刷题预燃装置 




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/154.txt



2016年6月12日 21:15http://gamecenter.qq.com/gcjump?plat=qq&pf=invite&appid=100666228
2016年6月12日 21:15



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/155.txt



2016年6月11日 17:21
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/156.txt



2016年6月11日 12:34
我是个口耐滴小安卓，放地上可以跑，还阔以钻门缝




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/157.txt



2016年6月10日 22:53
“或许是不知梦的缘故，流离之人追逐幻影。”




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/158.txt



2016年6月10日 19:59
…
每天精彩一笑 ：摊上个逗逼主人是一种怎样的体验




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/159.txt



2016年6月9日 16:44
每天精彩一笑 ： 那些高考完的人：哈哈哈哈哈哈哈哈哈哈哈解放啦！！！！！还有谁能管我？！！还有谁能管我？！！还！有！谁！！！！！！




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/160.txt



2016年6月8日 14:04
总要发张图才安逸




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/161.txt



2016年6月8日 11:26
视觉系一些




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/162.txt



2016年6月8日 00:05
真理有时是反直觉的， 因为直觉是为了生存而不是真理。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/163.txt



2016年6月7日 23:48
2016年6月7日 23:48



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/164.txt



2016年6月7日 22:59
2016年6月7日 22:59



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/165.txt



2016年6月6日 23:31
我没出现，我抱着狗睡觉，我写代码，我在夜里读些极端的书。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/166.txt



2016年6月6日 23:15
2016年6月6日 23:15



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/167.txt



2016年6月6日 17:38
当珍惜的都走了，剩下的就是最珍贵的。 可我记得花的芬芳，雨后淋过雨的窗， 它们也都走了。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/168.txt



2016年6月6日 16:46
ascll…




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/169.txt



2016年6月5日 10:34
2016年6月5日 10:34



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/170.txt



2016年6月2日 00:09
	
月光奏鸣曲

歌手：Ludwig van Beethoven

所属专辑：《快乐宝宝古典乐之大自然摇篮曲》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/171.txt



2016年6月1日 13:37
逝者的灵，随风而去，又变成雨。 我的油纸伞在夜里显得很单薄， 他握着刀，踏向某种我未知的黑暗。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/172.txt



2016年5月31日 22:16
没人能肯定自己永远正确，可我们还是依然前行。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/173.txt



2016年5月31日 15:08
是啊无锡有影城，我希望你开开心心的，可到哪里都很乱




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/174.txt



2016年5月31日 11:36
人的感知和个人状态有关，人们根据感知作事。
通过改变某人状态，可以影响他作的事。
这可以相当成规模




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/175.txt



2016年5月31日 09:41
 树莓派文件夹内容 
下表列出了一些常用的文件夹，这其中的大部分符合Linux目录结构，但是也有一些是树莓派独有的。/sys文件夹里是树莓派上的所有硬件设备，你可以通过这个文件夹来使用它们
/boot 放置Linux内核以及其他用来启动树莓派的软件包
/bin 放置与Raspbian有关(包括运行图形界面所需的)的二进制可执行文件
...查看全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/176.txt



2016年5月30日 23:26
语言能改变认知，进而影响激素水平。 它生来就存在，这么多年了。 人们发现它，然后使用它。 晚安，all of this




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/177.txt



2016年5月30日 17:21
营养学基础




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/178.txt



2016年5月30日 01:05
生日快乐，十九年了，我不配




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/179.txt



2016年5月29日 20:04
人们在暴雨里奔跑，花瓣被打落，踩了一脚。
晚安，ALL




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/180.txt



2016年5月28日 23:32
人因条件做反应，沟通能发条件。
所以人能发虚拟条件，遥控他人。
事情难记录，虚拟信息与真实信息，难辨别。
对成年人来说这是如此容易。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/181.txt



2016年5月28日 18:58
身体的健康很重要




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/182.txt



2016年5月28日 17:45
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/183.txt



2016年5月28日 16:07
……




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/184.txt



2016年5月28日 13:54
 Linux-raspbian-python 从声卡读取数据 
从声卡读取数据和写入数据一样简单，下面我们用一个简单的声音监测小程序来展示一下如何用pyAudio读取声音数据。
59# -*- coding: utf-8 -*-
from pyaudio import PyAudio, paInt16
import numpy as np
from datetime import datetime
import wave
...查看全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/185.txt



2016年5月27日 20:35
 傅里叶级数 
傅里叶方程:F(ω)=∫±∞ f(t)e^(-iωt) dx
(f(t)看作一个周期函数)
Formula Euler : F(ω)=∫±∞ f(t)*(-cos(ωt)+isin(ωt))dx
...查看全文




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/186.txt



2016年5月27日 19:22
 模糊识别 
零维识别
对于比如颜色，某时间的声音强度。
它们之间有相同、不相同，大于小于，相近更相近的关系。



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/187.txt



2016年5月26日 19:29
so beautiful




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/188.txt



2016年5月26日 11:05
	
さよならの夏 ～コクリコ坂から～ (别了夏天~虞美人盛开的山坡~) (主題歌 別バージョン)(《来自虞美人之坡》剧场版主题曲)

歌手：手嶌葵

所属专辑：《スタジオジブリ・プロデュース「コクリコ坂から歌集」 (吉卜力工作室制作《虞美人盛开的山坡歌集》)》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/189.txt



2016年5月25日 23:41
no one will leave




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/190.txt



2016年5月25日 19:45
浪漫不是一天两天能造就的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/191.txt



2016年5月25日 19:11
我不够浪漫，我没有撒出一场雨来




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/192.txt



2016年5月25日 17:12
2016年5月25日 17:12



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/193.txt



2016年5月25日 12:44
把命运交付给别人，他感觉不到疼
	
乱红

歌手：陈悦

所属专辑：《西尔德斯 新世纪·中国》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/194.txt



2016年5月24日 20:49
人们的情绪相互影响，所以也有必要照顾每个人



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/195.txt



2016年5月24日 09:21
 Xdotool基本功 
Xdotool基本功
虽然xdotool是那样的直观，但它仍然是个脚本程序。因此，为了要正确地使用它，你还是得了解它的语法。不过敬请放心，相对于程序的功能而言，语法还是比较简单易学的。
首先，模拟击键是很容易的。你可以从终端敲入下面的命令：
$ xdotool key [name of the key]
如果你想要连接两个键，可以在它们之间使用“+”操作符。它看起来像这样：
$ xdotool key alt+Tab
...查看全文



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/196.txt



2016年5月23日 22:48
痣能抠掉的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/197.txt



2016年5月23日 20:42
有一种东西可以创造任何东西， 至少在物质基础被破坏之前它是安全的




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/198.txt



2016年5月20日 22:43
2016年5月20日 22:43



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/199.txt



2016年5月20日 22:42
2016年5月20日 22:42



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/200.txt



2016年5月18日 00:19
five years




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/201.txt



2016年5月17日 00:22
很神奇的一点是人可以被设置密码，要想某人达成某件事需要使ta接受某些条件。
人始终在忘却和接受条件，设你所需要的条件为好的，与之相反为坏的。
筛选效率足够可以使他有的条件相对稳定在某个范围，那么你基本上遥控了那个人。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/202.txt



2016年5月17日 00:02
诗的结尾
	
她说

歌手：林俊杰

所属专辑：《她说 概念自选辑》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/203.txt



2016年5月16日 23:58
人最擅长生存，又不是纪录和通信，即使纪录和通信已经成为生存的条件
	
七里香

歌手：周杰伦

所属专辑：《七里香》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/204.txt



2016年5月15日 21:20
你用物质去测量物质，物质的变化不可能完全清楚，这样的话，那些未知的部分可以被告知成任何结果，以达到某人的目的。
这个过程可能会调动你的攻击行为。
所以科学该进入一个新纪元了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/205.txt



2016年5月14日 23:47
他说你活了几十年只是作为一个陪衬， 你喝冰啤酒，你全身都痛，喝了酒会好一些。 夜风吹来，忽然想起这样的夜晚我还有五十多年。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1290746140/206.txt



2016年5月13日 06:44
作为一个系统，别人的命比你的重要。那么你就是别人无线连接的身体部分了，别人都能花掉你。




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/207.txt



2016年5月11日 16:46
那个黑色的人环绕着你，他告诉你时间就像快刀，你很快就老了




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/208.txt



2016年5月10日 19:40
夕阳是黑夜的黎明




'''







'''

/fst/sky/moon-river/micro-blog/1290746140/209.txt



2016年5月10日 17:33
我想着花开了，可我去时嫣巴巴的




'''







'''

/fst/sky/moon-river/micro-blog/The_Something.txt





 we met somewhere

 cher, vas y

 ただいま..

 she is a shadow



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/210.txt



2017年8月18日 20:50
今天战绩不错，心情逗好




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/211.txt



2017年8月18日 15:03
我二十了
我抬头，天空中有座岛
我看着那些字，觉得很荒唐
我写了五万



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/212.txt



2017年8月17日 00:48
2017年8月17日 00:48



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/213.txt



2017年8月17日 00:38
我们就这样错过吧
我二十了
让我独自行走，走回十七岁
就像乌云坠入大海
消失在这个不属于我的人世间
注定无眠



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/214.txt



2017年8月16日 19:41
命运不带走任何东西，命运是我们失去东西这事儿



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/215.txt



2017年8月13日 23:33
现在要开始决定留不留长头发



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/216.txt



2017年8月12日 21:18
像
初升的太阳，
静谧的森林，
河流，
黎明



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/217.txt



2017年8月10日 22:41
我想我会一直带着这个纪念



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/218.txt



2017年8月10日 22:40
风悄悄吹过头发，阴影变深
仿佛世间阳光都洒在这里了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/219.txt



2017年8月10日 20:43http://user.qzone.qq.com/1776177662/blog/1502369033
2017年8月10日 20:43



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/220.txt



2017年8月9日 23:30
2017年8月9日 23:30



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/221.txt



2017年8月9日 23:30
2017年8月9日 23:30



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/222.txt



2017年8月6日 23:05
感觉有魔力
	
She Is My Sin(《逆战》游戏插曲)

歌手：Nightwish

所属专辑：《Wishmaster》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/223.txt



2017年8月5日 23:10
那条曲线出现的时候我很高兴，可我还是觉得有愧于这个时代， 可谁又知道呢，也许大部分古兵，其实不爱惜生命，我们在做的就是时代




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/224.txt



2017年8月4日 13:39
同学们上课了，请打开英雄联盟，分小组开黑 下课后把战绩发我




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/225.txt



2017年8月4日 00:55
hat sin appear
in my eyes.
they are knitted,
like a spider net.



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/226.txt



2017年8月4日 00:01
跨过风，与河



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/227.txt



2017年8月4日 00:01
粉饰细节



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/228.txt



2017年8月3日 23:47
素




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/229.txt



2017年8月2日 23:11
2017年8月2日 23:11



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/230.txt



2017年7月31日 02:52
我说我不难过了，我在那岛上修一座塔 然后，又去哪里呢




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/231.txt



2017年7月31日 00:13
黑雾中沉没的船，干枯的手，刺耳的摩擦声



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/232.txt



2017年7月30日 21:32
我又可否看清，镜中人是谁
他有没有看清我。
镜中人，你又是否看清，
镜子外的人，是否看清你。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/233.txt



2017年7月30日 15:42
唱歌的人，下雨了都不会发觉



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/234.txt



2017年7月29日 19:29
罪人就要不停奔跑



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/235.txt



2017年7月29日 19:24
借着时光，翻阅过去。
镜中人为何，披上夜的微风。
太阳老了，坠入深渊，不可见




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/236.txt



2017年7月28日 22:12
我数次翻阅过去，希望找到一些星光



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/237.txt



2017年7月28日 21:26
我们看到后一件事，忘掉前一件事，大多数时候都没问题，可有的时候




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/238.txt



2017年7月27日 12:32
挑战强者的人，或在开始之前结束



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/239.txt



2017年7月26日 22:11
路既是正确，就勇敢一些



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/240.txt



2017年7月26日 22:08
悲剧，既是注定， 为什么不勇敢一些




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/241.txt



2017年7月25日 22:59
她去了我该去的地方
我的花送给了别人
有天下雨了，城市闪烁着星光




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/242.txt



2017年7月25日 10:25
他不该给烛火，冠以永恒之名



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/243.txt



2017年7月24日 14:26
人们总是停滞不前



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/244.txt



2017年7月24日 09:19
我那狗怎么办呢



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/245.txt



2017年7月24日 09:17
懦夫一生死多回，勇者一生死一次。
——威尔 莎士比亚



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/246.txt



2017年7月23日 20:49
灯火记得影子



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/247.txt



2017年7月21日 22:00
现实与理想差距越大，人就越会锻炼自己走神



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/248.txt



2017年7月20日 17:22
蓝天就很好



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/249.txt



2017年7月17日 23:06
2017年7月17日 23:06



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/250.txt



2017年7月17日 00:42
忽然想起谁说这世上，没有什么能困住一个真正的男人



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/251.txt



2017年7月16日 23:05
投影仪改装成功！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/252.txt



2017年7月15日 16:04http://user.qzone.qq.com/1776177662/blog/1500098222
2017年7月15日 16:04



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/253.txt



2017年7月14日 10:47
浮生乱世，有酒，饮之，自以为逍遥。
不想来之，拉不出来憋之




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/254.txt



2017年7月13日 22:47
带着所有的遗憾一路向北




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/255.txt



2017年7月13日 18:38
笔记]GTK教程
 网页链接 
	
网页链接 
本人作为一个老程序员（仅指年龄老）想要学习一些跨平台的开源项目，比如GTK+、GStreamer等，特写博客方便自己加深记忆，可能很多内容是直接从一些教程中摘取，如涉及到版权问题，请联系我:28341847@qq.



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/256.txt



2017年7月12日 21:06
她嫁人了，他当兵了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/257.txt



2017年7月11日 23:56
心中是一个人，又怎会热闹起来。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/258.txt



2017年7月9日 23:08
开始又结束



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/259.txt



2017年7月9日 13:42
『笔记』ESP8266 AT指令集
-----------------------------------
反回WiFi列表
AT+CWLAP
加入WiFi
AT+CWJAP="ssid","87654321"
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/1.txt



09:35
他在我身后，我找不到他。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/260.txt



2017年7月8日 11:00http://user.qzone.qq.com/1776177662/blog/1499412040
2017年7月8日 11:00



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/2.txt



昨天 22:24
昨天 22:24



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/261.txt



2017年7月6日 19:07
愿你是鸟，飞向碧蓝宇宙



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/3.txt



昨天 20:11
那句永远
没有句点
仿佛神的歌没有语言
我们的诺言
化作飞烟
你我之间
月光 ：莫斯科没有冬天
像久冻的湖不懂誓言
飞鸟划过永恒的终点
和单调的天边



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/262.txt



2017年7月4日 22:10
在我未走过的路上，洒满了花瓣。花的种子在心里生根发芽。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/4.txt



昨天 19:39
昨天 19:39



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/263.txt



2017年7月4日 19:19
2017年7月4日 19:19



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/5.txt



昨天 17:48
我还真是傻逼到某种地步了。。。
月光 ：同志们，作为阳光学校的第一届学生，我们一定要上进！我们要留下一个传说给学弟妹们！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/264.txt



2017年7月4日 19:19
在我未走过的路上，洒满了花瓣，
而我走过的路，满是荆棘。
那叫蔷薇，蔷薇就是暴怒的玫瑰。
——2017高考题词



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/6.txt



昨天 17:29
……
不懂事的折磨
如同烟花散落
漂浮的你我
人世的蹉跎
何曾想过 你我
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/265.txt



2017年6月30日 06:35
雨下得很安静，没有人去打破雨幕



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/7.txt



昨天 13:26
誓言与放弃



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/266.txt



2017年6月29日 23:24
この空泣き出す前に，サカサマになって



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/8.txt



昨天 13:14
从猿猴到智人，我们就是那种擅长于绝地反击的物种。
当然那么多万年也只有几次。。。。
浪得不着边际。。
劳资用的是手，谁TM知道会发生什么，是吧



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/267.txt



2017年6月29日 23:18
花开的，最后一朵 除夕夜的， 戏子与木兰船， 少年和白马。

 上传1张照片到《如果上帝吃火锅》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/9.txt



昨天 11:34
他/她
它只是不会说话，所以你帮它说话。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/268.txt



2017年6月22日 17:38
怒吼，灰烬，残生

 上传3张照片/视频到《如果上帝吃火锅》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/269.txt



2017年6月15日 07:25
优胜劣汰，周而复始



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/270.txt



2017年6月10日 15:18
ackage com.gopi.sopi;
import android.app.*;
import android.os.*;
import android.widget.*;
import android.widget.RelativeLayout.*;
import android.graphics.*;
展开全文
网页链接 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/271.txt



2017年6月9日 07:11
2017年6月9日 07:11



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/272.txt



2017年6月8日 16:54
/lib for EPC287
#include <iostream>
#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>
#include<sys/ioctl.h>
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/273.txt



2017年6月6日 08:10
2017年6月6日 08:10



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/274.txt



2017年6月5日 18:36
如果上帝吃火锅




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/275.txt



2017年6月4日 13:54
この空泣き出す前に，サカサマになって



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/276.txt



2017年6月3日 11:56
fft by Python3
import math
sound = []
N = 4096
w = 456
F = 1
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/277.txt



2017年6月1日 10:02
この空泣き出す前に，サカサマになって



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/278.txt



2017年6月1日 10:00
在这个天空哭泣前，颠倒过来



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/279.txt



2017年5月17日 07:37
我和某些人要重逢了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/280.txt



2017年5月16日 01:11
下雨了，它去哪里呢？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/281.txt



2017年5月15日 21:43
2017年5月15日 21:43



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/282.txt



2017年5月15日 20:08
所有失去的，还没到来的， 所有得到的，所有丢掉的， 愿神有酒，敬此半生。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/283.txt



2017年5月14日 04:35
nd Shepherd we shall be,
For thee, my lord, for thee.
Power hath descended forth from Thy hand
our feet may swiftly carry out Thy commands.
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/284.txt



2017年5月12日 23:32
我记得曾经许过两个承诺，或是命运吧，它们都不约而同地实现了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/285.txt



2017年5月11日 21:56
我们却总是，无法到达



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/286.txt



2017年5月11日 21:49
我们所感觉到的活着，可能是一种错觉。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/287.txt



2017年5月9日 22:52
远方的雷雨云中，暗淡的光芒正在挣扎



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/288.txt



2017年5月8日 23:49
那些光变成我们的样子，远去了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/289.txt



2017年5月6日 21:31
更新了头像




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/290.txt



2017年5月6日 00:52
不解，风尘。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/291.txt



2017年4月26日 08:24
抬头看见，初夏的阳光 你的一生，就在这里




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/292.txt



2017年4月25日 10:17
安然长眠吧，别让意识沉入湖底
夜空幽暗蛮远



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/293.txt



2017年4月25日 02:12
2017年4月25日 02:12



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/294.txt



2017年4月22日 02:58
2017年4月22日 02:58



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/295.txt



2017年4月21日 07:25
2017年4月21日 07:25



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/296.txt



2017年4月17日 00:28
我从不说谎，我只能告诉她，这是死亡的味道 碰过那泥土的手带有一种异样的瘙痒，我的狗愁眉苦脸，离我而去。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/297.txt



2017年4月16日 16:50
2017年4月16日 16:50



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/298.txt



2017年4月16日 07:31
	
4月16日是清洒 的生日，赶紧送礼物祝他生日快乐吧！
赠送礼物

清洒 
2017年4月15日 23:37
她对我说了一句话。我一激动，就会忘掉它其实是个谎



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/299.txt



2017年4月15日 00:43
踏马的四核手机一百毛爷爷 怎么造出来滴呀 污水排放过关吗




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/300.txt



2017年4月13日 23:05
二十岁之前玩游戏，别太过了
十八岁左右反应速度暴增，整个人全力玩游戏就会非常变态
很可怕，感觉超出了人类的范畴



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/301.txt



2017年4月12日 22:08
我要走了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/302.txt



2017年4月5日 14:11
它围着他转圈圈，好像这样会有用



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/303.txt



2017年4月5日 14:04
【洗脑 】:人在紧张时思维变简单，忽略掉一些对自己无关的条件
这个应该几十个世纪以前人们就知道了，毕竟与生活是如此贴切
如今确是大规模舆论武器的基本原理



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/304.txt



2017年4月4日 07:09http://mobile.rr.tv/pages/videoShare?id=129745&share=7376498
2017年4月4日 07:09



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/305.txt



2017年4月4日 06:53http://mobile.rr.tv/pages/videoShare?id=131443&share=7376498
2017年4月4日 06:53



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/306.txt



2017年3月30日 19:37
2017年3月30日 19:37



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/307.txt



2017年3月29日 06:50
人间飘零的落叶，最终会落尽另一片土壤



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/308.txt



2017年3月24日 18:46
我看到一个男人，代表了我看到一个男人。
不能代表那里有一个男人，
更不能代表他是个怎样的人。
我听到男人说话，代表了我听到人说话，
不能代表那个男人说话了，
更不能代表他说的是真的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/309.txt



2017年3月17日 00:03
我要走了，趁着最后一抹斜阳



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/310.txt



2017年3月16日 23:56
那朵云越发的渺远了，我要走了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/311.txt



2017年3月15日 00:23
醉酒，漂流，忘川，十五岁的我也在喝酒



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/312.txt



2017年3月15日 00:23
醉酒，漂流。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/313.txt



2017年3月14日 01:06
他的梦



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/314.txt



2017年3月14日 01:05
他的猫



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/315.txt



2017年3月4日 20:43
我正在申请LattePanda开发套件（含配件包）免费试用，戳这里~给我加油帮我一起赢取试用机会吧！
	
LattePanda开发套件（含配件包）免费试用 
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/316.txt



2017年3月4日 11:49
男人就要玩核弹

 上传1张照片到《刷题预燃装置》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/317.txt



2017年3月4日 11:43
男人就要玩核弹



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/318.txt



2017年2月20日 05:15
蛮荒的时候人被激怒要战斗
现在人被激怒要思考
现在人一怒就分泌肾上腺素，已经改不过来了……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/319.txt



2017年2月20日 04:54
最好别带着主观意识 人们只能感受到自己的难受 他的意图就会被培养得很自私 主观意识会形成专注， 专注会使你忽略掉细节




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/320.txt



2017年2月19日 02:09
时间会唱歌，油纸伞落下花瓣



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/321.txt



2017年2月19日 01:08
国产的，，，性能很强，脾气暴躁




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/322.txt



2017年2月17日 21:36
在国外，这台小电脑只卖五块




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/323.txt



2017年2月16日 21:54
这把京东上卖一万多




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/324.txt



2017年2月6日 06:28
2017年2月6日 06:28



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/325.txt



2017年1月27日 20:21
越千山兮 野茫茫 野茫茫兮 过大江 过大江兮 绝天海 与子征战兮 路漫长 收我白骨兮 瀛海旁 挽我旧弓兮 射天狼




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/326.txt



2017年1月23日 18:23
我有昆吾剑，贺郎山中锻； 我有明月铠，匣内霜月寒。 与子战河东，以甲蔽子身； 与子战河西，仗剑复子仇。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/327.txt



2017年1月20日 05:14
2017年1月20日 05:14



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/328.txt



2017年1月20日 05:13
2017年1月20日 05:13



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/329.txt



2017年1月18日 03:28
新楼夜里还是很萧瑟




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/330.txt



2017年1月17日 04:59
感谢每天为你批改作业的班主任




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/331.txt



2017年1月16日 14:29
分享青山テルマ的歌曲《ここにいるよ 》来自OPPO音乐(@ColorOS)：:  虾米音乐 
虾米音乐 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/332.txt



2017年1月13日 00:13
若要成佛，必当放弃一切希望，梧桐树下苦思十四天。 若要成佛，必将深陷无法逃避之痛苦，而后了然忘却。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/333.txt



2017年1月11日 04:25
2017年1月11日 04:25



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/334.txt



2017年1月9日 22:34
分享Joseph Baldassare的歌曲《We're All Beautiful》来自OPPO音乐(@ColorOS)：:  http://m.xiami.com/song/1771177912?f=OPPO 
	
http://m.xiami.com/song/1771177912?f=OPPO 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/335.txt



2017年1月7日 18:48
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/336.txt



2017年1月6日 04:06
你要相信自己，人是很厉害的，人类有能力通过音乐，听出钢琴的形状。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/337.txt



2017年1月3日 14:51
2017年1月3日 14:51



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/338.txt



2016年12月23日 21:30
漆黑的长夜，落花铺尽走廊。
忧伤的神像，烙上阴影守夜。
我穿着黑斗篷，烛火摇曳。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/339.txt



2016年12月22日 06:53
萌宠 腾讯认证 关注 一只会和主人吵架拽上天的羊。。羊：别逼逼！有本事放我出去，看我不揍扁你





'''







'''

/fst/sky/moon-river/micro-blog/1776177662/340.txt



2016年12月19日 05:33
萌宠 腾讯认证 关注 韩国一只阿拉斯加竟然会自己拿钱去买东西，成精了.





'''







'''

/fst/sky/moon-river/micro-blog/1776177662/341.txt



2016年12月17日 17:45
萌宠 腾讯认证 关注 钓鱼一只狗去，会有这样的发生!





'''







'''

/fst/sky/moon-river/micro-blog/1776177662/342.txt



2016年12月13日 23:06
那一刻我的世界观破碎了

 上传1张照片到《本地相册》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/343.txt



2016年12月8日 23:49
我看到了未来




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/344.txt



2016年12月7日 03:59
多年以前，阳光暖着，下过雨的灌木和花瓣。
多年以后，仍然阳光明媚。
我想要的东西已经被时间尘封，
只剩下深深地难过，像伤疤。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/345.txt



2016年12月7日 03:38
一双八块九包邮




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/346.txt



2016年12月5日 13:02
好东西




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/347.txt



2016年11月28日 16:10
。。。这种动物真的。。。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/348.txt



2016年11月26日 11:21
目前的生存压力是，每个原子都可能出错 我知道我不可能兼顾，比我质量大且灵活的，任何东西 未来还很难猜




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/349.txt



2016年11月21日 03:42
天然的，智能手表，主板




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/350.txt



2016年11月5日 08:27
2016年11月5日 08:27



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/351.txt



2016年11月5日 05:36
inus一定希望每个用电脑的人都很懂电脑 图1为 Ubuntu Kylin 图2为google glass 原理图... 图3为Ti牌MEMs，可用于投影仪

 上传3张照片/视频到《直升机与少年》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/352.txt



2016年11月2日 12:56
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/353.txt



2016年10月30日 20:23
2016年10月30日 20:23



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/354.txt



2016年10月26日 05:50
，是一条不归路




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/355.txt



2016年10月25日 21:47
ou're loved and hold



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/356.txt



2016年10月20日 16:53http://user.qzone.qq.com/1776177662/blog/1463194143
2016年10月20日 16:53



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/357.txt



2016年10月19日 17:14
小孩子很随意，只要让ta觉得比较好。
ta会去做 任何事情
而通常破坏比构建容易，所以小孩十分




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/358.txt



2016年10月18日 14:04
狗狗不曾拥有任何东西，现在它有了你，你就是它的全部了。
（图为coser粒子）




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/359.txt



2016年10月18日 10:45
2016年10月18日 10:45



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/360.txt



2016年10月17日 22:13
2016年10月17日 22:13



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/361.txt



2016年10月17日 06:58
小孩分辨力不强，让Ta觉得好，就能有效取得控制权

 上传1张照片到《The Weapen》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/362.txt



2016年10月15日 18:50
ou're loved, and hold



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/363.txt



2016年10月14日 13:06
乔布斯曾经在jeek阶段逗留了一段时间。。。

 上传2张照片/视频到《直升机与少年》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/364.txt



2016年10月14日 04:53
ou're loved & hold



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/365.txt



2016年10月14日 04:23
想当铁匠了
	
武器人间——重新打造有400年历史的中国单刀@阿尔法小分 | 人人美剧 
武器人间——重新打造有400年历史的中国单刀@阿尔法小分 | 人人美剧
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/366.txt



2016年10月13日 08:57
谁知道呢，也许最后



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/367.txt



2016年10月11日 22:15
2016年10月11日 22:15



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/368.txt



2016年10月11日 05:07
毛线



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/369.txt



2016年10月10日 21:58
华为手机能挡子弹，还有百元的微型挂耳手机，有手表手机，眼镜手机。 手机的世界真是丰富多彩

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/370.txt



2016年10月7日 06:38
请淡忘那些，能与不能



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/371.txt



2016年10月7日 00:58
2016年10月7日 00:58



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/372.txt



2016年10月6日 05:11
冬天快到了，所有父母对孩子们表现出相似的态度，一大波邻家男孩就被生产出来了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/373.txt



2016年10月1日 22:54
太多办法改写一段故事，连你自己都变了，那就很难再回来了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/374.txt



2016年9月26日 14:41
一个cos大神必然是集动漫宅，模特，ps大神，摄影师，文艺青年于一体的

 上传1张照片到《The Weapen》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/375.txt



2016年9月24日 05:23
2016年9月24日 05:23



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/376.txt



2016年9月24日 05:02
像我这种重病不就医的说不定哪天就暴毙了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/377.txt



2016年9月22日 13:12
你在逗我吗




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/378.txt



2016年9月18日 02:24
傅立叶变换:) It's old enough!

 上传1张照片到《本地相册》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/379.txt



2016年9月15日 19:28
大片的雪飘下来，我想起老和尚说过，人是平衡的，人被黑暗玷污，会去选择光明。 我看到光明也无力照亮黑夜，坚持光明的人都死了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/380.txt



2016年9月2日 01:43
夜里开始刮风，街道沉到了海底。
我觉得我的身体很厚实，
可那风穿过我心里的地窖，
我的过去，
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/381.txt



2016年8月30日 22:33
分享Standfast的歌曲《Lullaby for Lukas 》来自OPPO音乐(@ColorOS)：:  虾米音乐 
虾米音乐 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/382.txt



2016年8月30日 04:57
这里开始下雨，长夜像条河。 雾里的雕像，怀璧其罪。 我肩膀上有条蛇，它说： “吃那树上的果实，你将与神比肩。” ——《Tanakh·第三章》




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/383.txt



2016年8月27日 15:56
周立功到货！
接下来准备把他和树莓派连接起来




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/384.txt



2016年8月19日 01:33
2016年8月19日 01:33



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/385.txt



2016年8月15日 03:54
用户应用程序空间为8K字节,集成512 字节RAM 7. ISP（在系统可编程）/IAP（在应用可编程），无需专用编程器，无 需专用仿真器，可通过串口（RxD/P3.0,TxD/P3.1）直接下载用户程 序，数秒即可完成一片 8. 具有EEPROM 功能 9. 共3 个16 位定时器/计数器。即定时器T0、T1、T2

 上传1张照片到《直升机与少年》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/386.txt



2016年8月15日 03:47
D1为编程状态指示灯，编程过程D1一直亮，程序烧录完毕，D1灭掉。 D2为控制芯片IC2的电源指示灯。 D3为IC1(CPU)的电源指示灯。 K1为IC2的电源开关。 K2为IC1(CPU)电源开关。 J0为与电脑连接的并口数据线。 J1-J4为各个I/O口的扩展线。 最右的一排灯是测试程序用的。

 上传1张照片到《直升机与少年》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/387.txt



2016年8月13日 18:21http://user.qzone.qq.com/1776177662/blog/1471083685
2016年8月13日 18:21



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/388.txt



2016年8月9日 01:49http://user.qzone.qq.com/1577433293
2016年8月9日 01:49



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/389.txt



2016年8月9日 01:48http://user.qzone.qq.com/1577433293
2016年8月9日 01:48



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/390.txt



2016年8月9日 01:48http://user.qzone.qq.com/1577433293
2016年8月9日 01:48



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/391.txt



2016年8月9日 01:45http://user.qzone.qq.com/1776177662/blog/1470676434
2016年8月9日 01:45



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/392.txt



2016年8月9日 00:32
서울브링어



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/393.txt



2016年8月6日 01:09
016: 人是人 ， 真理是真理。 人们自利。 任何事。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/394.txt



2016年8月5日 06:07
2016年8月5日 06:07



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/395.txt



2016年8月5日 05:13
今年看到最扯的，不知川普会怎么想
	
美国发现甲骨文：印第安人是中国人后裔 
我在浏览【美国发现甲骨文：印第安人是中国人后裔】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/396.txt



2016年8月5日 00:35
明月倒映在海面。
——没有危险，就已经很美了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/397.txt



2016年8月4日 00:28http://user.qzone.qq.com/1776177662/blog/1470241681
2016年8月4日 00:28



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/398.txt



2016年8月2日 03:46
2016年8月2日 03:46



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/399.txt



2016年8月2日 03:37
自从上次买《奥秘》，到现在看到过最扯的。
然后发现这也是《奥秘》发的




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/400.txt



2016年7月31日 01:28
犯二总被破坏； 空闲的时间被挤走或是搅乱了， 没有什么安闲的时候。 - 至此，能让我快乐一点的只有肯德基。 所以我每天就挣钱吃肯德基， 学习、思考如何赚钱。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/401.txt



2016年7月31日 01:09
七月的萌雪  发表日志  raspberry pi 搭建网站(nginx+php+mysql+ddclient) 
1.安装网站系统sudo apt-get install nginx php5-common php5-fpm php-apc php5-mysql php5-gd mysql-server2、修改n......



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/402.txt



2016年7月30日 00:35http://user.qzone.qq.com/1776177662/blog/1469805668
2016年7月30日 00:35



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/403.txt



2016年7月29日 20:34
树莓派集群，或者说树莓派超级计算机。
这样应该行吧




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/404.txt



2016年7月28日 18:12http://user.qzone.qq.com/1776177662/blog/1469648450
2016年7月28日 18:12



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/405.txt



2016年7月28日 03:39
2016年7月28日 03:39



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/406.txt



2016年7月23日 01:31
ou saw it , and you know it. so this is your choice.




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/407.txt



2016年7月21日 03:37
你很好，很完美，
你的十多年过得很精彩。
。
你只需要想想每件事，
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/408.txt



2016年7月21日 01:19
七月的萌雪  发表日志  Raspberry Pi获取当前状态和数据（温度、CPU、内存、硬盘） 
建立脚本： sudo nano get.py写入：import os # Return CPU temperature as a character string ......



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/409.txt



2016年7月18日 00:09
他不是很在乎这事儿对你好不好，
因为他觉得自己是对的。
对的事就要去做。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/410.txt



2016年7月17日 10:11
美国最有影响的人体冷冻机构
	
Alcor: About Alcor 
我在浏览【Alcor: About Alcor】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/411.txt



2016年7月17日 09:50http://user.qzone.qq.com/1776177662/blog/1468720241
2016年7月17日 09:50



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/412.txt



2016年7月16日 17:59
屏幕老贵了，接电视吧




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/413.txt



2016年7月15日 23:05http://user.qzone.qq.com/1290746140
2016年7月15日 23:05



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/414.txt



2016年7月15日 23:05http://user.qzone.qq.com/1290746140
2016年7月15日 23:05



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/415.txt



2016年7月14日 18:02
我终于脱单了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/416.txt



2016年7月14日 00:29
2016年7月14日 00:29



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/417.txt



2016年7月13日 04:18
黑夜，花，星空，烛火




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/418.txt



2016年7月12日 02:56
我又起航了，起航意味着，我可以坠落了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/419.txt



2016年7月12日 02:52
它走不掉




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/420.txt



2016年7月10日 23:35
不听自己唱的歌就睡不着了
	
七里香【无损版】 
来听听 锅炉炸了i 唱的《七里香【无损版】》,真是太棒了!
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/421.txt



2016年7月8日 19:12
我强烈得意识到， 我所看到的只是冰山一角。 我认为的东西其实不存在。 。 所以我得换条路




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/422.txt



2016年7月7日 00:53
天赋，思想，机遇，得失 不是自己能决定的。 所以人们很痛苦。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/423.txt



2016年7月5日 03:48
卿松你对未来没什么打算，因为现在就是永远




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/424.txt



2016年7月5日 00:06
很多时候，能陪你走到最后的只有你自己
所以爱一个人的最好方式是成为她。
当她长成了别人，你的爱就不会离开了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/425.txt



2016年7月1日 01:01
2016年7月1日 01:01



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/426.txt



2016年6月29日 01:26http://user.qzone.qq.com/1776177662/blog/1467134692
2016年6月29日 01:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/427.txt



2016年6月28日 23:32
2016年6月28日 23:32



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/428.txt



2016年6月28日 18:06
分享 五月天 的歌曲《如果我们不曾相遇》 如果我们不曾相遇付费 （分享自@虾米音乐）
	
如果我们不曾相遇付费 
《如果我们不曾相遇》演唱者五月天，所属专辑《作品9号》；免费在线试听如果我们不曾相遇,MP3下载、如果我们不曾相遇歌词下载;更多五月天相关歌曲推荐,尽在虾米音乐！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/429.txt



2016年6月28日 18:06
分享 五月天 的歌曲《如果我们不曾相遇》 如果我们不曾相遇付费 （分享自@虾米音乐）
	
如果我们不曾相遇付费 
《如果我们不曾相遇》演唱者五月天，所属专辑《作品9号》；免费在线试听如果我们不曾相遇,MP3下载、如果我们不曾相遇歌词下载;更多五月天相关歌曲推荐,尽在虾米音乐！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/430.txt



2016年6月27日 00:29
当时都有种吓晕的感觉，声音小了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/431.txt



2016年6月23日 21:19
牛顿说，这世界只存在物质和影响
而生命，只是物质运动的一种形态



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/432.txt



2016年6月23日 20:36
分享 五月天 的专辑《勇敢》 勇敢 （分享自@虾米音乐）
	
勇敢 
五月天最新专辑《勇敢》介绍：IIIIIIIIIIIIIIIIIIIIIIIIIIIIII;勇敢免费在线试听，尽在虾米音乐！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/433.txt



2016年6月23日 12:28
搞笑视频姐 腾讯认证 关注 哈哈哈哈你说你那个ADC溜得不得了结果啊10分钟死尼玛8次。。。





'''







'''

/fst/sky/moon-river/micro-blog/1776177662/434.txt



2016年6月22日 23:55
我看不清那未来，变量缥缈得像一种洪流。 再美的花， 最后也许都要葬身海底。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/435.txt



2016年6月22日 23:31
2016年6月22日 23:31



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/436.txt



2016年6月22日 03:40
听起来感觉和五月天有血缘关系。。。
话说这样讲会不会卷入当地土著纠纷…
	
Wind of Gold

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《Tierra》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/437.txt



2016年6月22日 02:10
虽然很乱来，不过比以前好的




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/438.txt



2016年6月20日 19:58
我啥都不知道，我只想活得久一些




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/439.txt



2016年6月20日 19:48
不是第一次DIY了，也不是第一次成功了，也不是第一次扑街 突然想起了什么，想远方的城




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/440.txt



2016年6月20日 10:44
没人知道自己做的对不对，可我们就是如此固执



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/441.txt



2016年6月19日 22:37
2016年6月19日 22:37



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/442.txt



2016年6月16日 19:25
《虎牙》




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/443.txt



2016年6月16日 00:30
痛苦使人们进步，
所以痛苦难以真正避免
	
DAYBREAK'S BELL

歌手：L'Arc〜en〜Ciel (彩虹乐队)

所属专辑：《DAYBREAK'S BELL》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/444.txt



2016年6月15日 20:31
2016年6月15日 20:31



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/445.txt



2016年6月14日 22:39
真相有时是反直觉的




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/446.txt



2016年6月13日 01:00
夜深了，他静静地睡着了，微风飘落这小城。
人们重复着正确的事，
人们学习，判断，生存…
离开，有天再也不回来。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/447.txt



2016年6月12日 23:48
2016年6月12日 23:48



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/448.txt



2016年6月9日 20:02
我有绿钻，女神会跟我走吗




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/449.txt



2016年6月8日 20:11
人们希望别人对自己好




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/450.txt



2016年6月6日 17:44
当珍惜的都走了，剩下的就是最珍贵的。 可我记得花的芬芳，淋过雨的窗， 它们也都走了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/451.txt



2016年5月30日 17:22
营养学基础




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/452.txt



2016年5月29日 15:51
这世界那么多故事，怎么说得完？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/453.txt



2016年5月28日 23:48
人因条件做反应，沟通能发条件。
所以人能发虚拟条件，遥控他人。
事情难记录，虚拟信息与真实信息，难辨别。
人始终对自己好，所以发现这种方法好以后，会使用 。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/454.txt



2016年5月23日 23:02
人们计划着对自己好的事




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/455.txt



2016年5月23日 16:14
我寻着它蓝色的灵魂， 来到一个丛林，然后我看到它死了， 颜色变得灰暗。 我才想起来自己用不着穿过山川与大海， 一念之间，它又活了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/456.txt



2016年5月23日 02:18
人们作对自己好的计划，loop




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/457.txt



2016年5月23日 00:10
前天在家门口剪头发，洗头发的姐姐是彝族姑娘，声音沙哑，小时候常常大喊大叫父母才听得见，很受忽视，事实上心情不好所以胃口不好，瘦瘦的。 推荐我买很贵的洗发水，她花钱也很大把，但其实不重视，对她而言，生命也不过是流风，所以也不会重视我的




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/458.txt



2016年5月22日 23:02
我们尝试用一种不存在的东西创造任何东西。 在其物质基础被破坏之前它是安全的， 我们称之为，思想。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/459.txt



2016年5月22日 12:41
莫名地搬了新房，来到一个江南小镇




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/460.txt



2016年5月21日 23:01
梦到湖，破碎天空的彼岸。 走在黑夜里，一条没有尽头的路。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/461.txt



2016年5月21日 22:26
最后的火焰




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/462.txt



2016年5月21日 22:26
2016年5月21日 22:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/463.txt



2016年5月21日 22:26
2016年5月21日 22:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/464.txt



2016年5月18日 18:05
这是一座嘈杂的城市，我们的爱情都死了。
我们的爱情被杀死了，从此只存在脑中。
城市才是更重要的东西，
因为我们只有城市了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/465.txt



2016年5月15日 13:57http://user.qzone.qq.com/1776177662/blog/1463237414
2016年5月15日 13:57



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/466.txt



2016年5月15日 00:58
我可能还有…五十年？

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/467.txt



2016年5月14日 22:54http://user.qzone.qq.com/1776177662/blog/1463237665
2016年5月14日 22:54



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/468.txt



2016年5月14日 16:34http://user.qzone.qq.com/1776177662/blog/1463214885
2016年5月14日 16:34



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/469.txt



2016年5月14日 10:45http://user.qzone.qq.com/1776177662/blog/1463193952
2016年5月14日 10:45



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/470.txt



2016年5月10日 17:29
2016年5月10日 17:29



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/471.txt



2016年5月10日 17:29
如果没有人爱你，那么我就会爱你。
可我又想呐，如果某人没人爱，其实最可能是我自己。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/472.txt



2016年5月10日 17:21
我想着，街上那么多人，那么多人吃着别人提供的食物和服务，当然可以纵情猎杀；我又想着，那么多人都是妈生的，小时候多么顽皮。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/473.txt



2016年5月8日 23:54
2016年5月8日 23:54



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/474.txt



2016年5月3日 14:59
从来没有谁属于谁，只有属于两人的爱情



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/475.txt



2016年5月2日 20:26
2016年5月2日 20:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/476.txt



2016年4月29日 23:24
灵魂，该是记忆、反射和意识状态组成的。 可还是难以割舍。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/477.txt



2016年4月27日 01:23
我们在这个故事里爱着某人，在那个故事里被某人爱着。
你当然可以为了自己就随便干些什么事情，因为我不希望这样也是为了自己好。
所以要证明自己的价值？我以为喜欢是对每个人都好的，但是人与人之间是如此矛盾(？)




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/478.txt



2016年4月23日 17:52
如果你能根据生存本能 改变人们的意图， 你就会始终把它们调整到对自己好的状态。 。 我想，我会黑得像是石油…

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/479.txt



2016年4月22日 23:52
然后我知道了，危险的尽头人类还看不到，但你应该化解所能看到的危险。 然后我被告知我所见之事已经有人看到，并且预测了我的行动。 我就想哪，花重要所以它开了，花不重要它又谢了。 我筛选记忆，它们又只剩下美好的。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/480.txt



2016年4月21日 02:30
一支烛火怎能照亮，一座城市的夜空。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/481.txt



2016年4月20日 02:17
夜空里的妖艳花朵，绽放着墨色的花瓣




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/482.txt



2016年4月19日 00:42
窗外的黑暗夜空在召唤我




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/483.txt



2016年4月17日 22:26
一支烛火怎能照亮一座城市的夜空。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/484.txt



2016年4月17日 16:33
2016年4月17日 16:33



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/485.txt



2016年4月16日 23:57
你把那根不均匀的时间线以三维的方式贮存在脑海里了。 你随时可以回到过去， 你随时可以让那些雨点停在夜空里

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/486.txt



2016年4月16日 23:43
善良并不是别人告诉我的那样，总是对大家都好。 因为善良是一个承诺，承诺本身是没有好坏之分的。 善良是一份盟约。

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/487.txt



2016年4月16日 00:07
这世界远比我所看到的更广阔， 看不见的线把我们所联系。 善良是一种改变选择的指令， 善良本该是对的， 可它愿与我为敌。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/488.txt



2016年4月15日 23:50
2016年4月15日 23:50



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/489.txt



2016年4月15日 13:35
可我依靠着理性的思考，我就不再依靠着你了呀。 你想被人依靠着，仅此而已。 - 所谓的意识是一种幻觉，爱情又是什么。？

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/490.txt



2016年4月14日 23:36
再见xp




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/491.txt



2016年4月14日 01:53
对于一件有害无益的事， 若是让自己以为它对你好， 你就可以作出来。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/492.txt



2016年4月12日 11:36
2016年4月12日 11:36



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/493.txt



2016年4月10日 23:12
坠入梦

 上传1张照片到《乌鸦城堡》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/494.txt



2016年4月10日 22:53
2016年4月10日 22:53



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/495.txt



2016年4月10日 13:32
我问她贾宝玉最后怎样了，她只告诉我缘分尽了人就散了。 后来阅读题我看到贾宝玉最后在夜里敲灯，人就老了。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/496.txt



2016年4月9日 23:48
2016年4月9日 23:48



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/497.txt



2016年4月6日 12:44
月光 ：人类团体的力量不能完全发挥是因为我们不知道别的与我们相同的个体在干啥，再加上进化所需的自利本能，使人们防范着随时可能发生的矛盾。
这种混乱的动态集体可能稳定存在吗？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/498.txt



2016年4月4日 10:44
2016年4月4日 10:44



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/499.txt



2016年4月4日 10:44
2016年4月4日 10:44



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/500.txt



2016年4月3日 00:03
2016年4月3日 00:03



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/501.txt



2016年4月2日 23:36
2016年4月2日 23:36



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/502.txt



2016年4月2日 02:40
ell me your secret

 上传1张照片到《怡红别院》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/503.txt



2016年4月1日 13:10
2016年4月1日 13:10



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/504.txt



2016年3月31日 00:52
已经没东西可以失去了， 黑夜中的蜕变， 凉薄的黎明。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/505.txt



2016年3月26日 23:22
与黑夜道晚安
梦中是另一个
白昼



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/506.txt



2016年3月26日 21:55
2016年3月26日 21:55



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/507.txt



2016年3月26日 19:40
海平面的远方，
苍白得发指。
和沧桑。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/508.txt



2016年3月25日 22:06
谁知道呢，也许最后嫁给你的其实是那个人的好朋友，可别忧伤，你的人生本就丰富多彩




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/509.txt



2016年3月24日 23:21
吹着风，知道了怪兽石头的夫人是姐妹，吹着风，我吃了安眠药，我要感受人的意识…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/510.txt



2016年3月23日 23:10
Dance like nobody's watching; love like you've never been hurt Sing like nobody's listening Work like you don't need the money live like it's heaven on earth.

 上传1张照片到《刷题预燃装置》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/511.txt



2016年3月23日 23:10
Dance like nobody's watching; love like you've never been hurt Sing like nobody's listening Work like you don't need the money live like it's heaven on earth.

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/512.txt



2016年3月20日 00:35
“这些都是你。”




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/513.txt



2016年3月20日 00:34
神很忙的，ta会把心分给在乎的人，
而我只是挤在人海里。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/514.txt



2016年3月20日 00:33
有时我会怀疑，这片土地才是你的归宿，
挥发着你的血和梦想




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/515.txt



2016年3月19日 16:49
他们从母亲怀中长大，可我连名字都不记得



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/516.txt



2016年3月13日 13:28
2016年3月13日 13:28



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/517.txt



2016年3月13日 12:30
我们说灵与肉是兄弟。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/518.txt



2016年3月13日 00:31
每个人都是独一无二的，也绝不是你想的那样



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/519.txt



2016年3月12日 23:40
像是某种血管

 上传1张照片到《刷题预燃装置》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/520.txt



2016年3月12日 12:42
2016年3月12日 12:42



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/521.txt



2016年3月6日 13:34
也许这一幅画， 再也遇不到了。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/522.txt



2016年3月6日 11:00
神与人的区别在于，
你朝拜时TA会想着
壮哉我大中华。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/523.txt



2016年3月5日 23:00
之所以怀旧，正是因为无所顾虑，
正是因为无论怎样的火焰，都会踏过去。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/524.txt



2016年3月5日 21:51
飞机之所以如此高档和细心，
是因为有人曾看着它走远。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/525.txt



2016年3月5日 02:50
因为你告诉了女孩你很厉害，你能想到一些狭窄的道路，你能跑酷，你的桌子很简洁，后来它就变成一面盾，一座堡垒，可你的心却藏起来了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/526.txt



2016年2月28日 00:03
这样的夜，要怎么唱歌
聚光灯从未刺瞎我的双眼，
它未必真的亮如白昼。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/527.txt



2016年2月27日 12:59
这一车发了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/528.txt



2016年2月22日 23:04
沉入海底

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/529.txt



2016年2月22日 23:01
tupid age 15

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/530.txt



2016年2月21日 16:02
明年我就这样穿




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/531.txt



2016年2月21日 02:20
它绕着他转圈圈，好像这样会有用。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/532.txt



2016年2月19日 23:27
2016年2月19日 23:27



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/533.txt



2016年2月19日 23:27
现在大家激素水平普遍提高了，找个X朋友很容易吧。
可你喜欢的人呢，TA又在哪条街流浪。
风又吹倒油伞，有漆黑头发的女孩在夜里歌唱。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/534.txt



2016年2月19日 18:57
逝者的灵，随风而去，又变成雨。
油纸伞沾魂，鲜血循着小溪而去。
三月的夜，凉薄的风。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/535.txt



2016年2月18日 22:56
邻居家有个超级好学生。
有天她愁学习用的东东，我想告诉她我挺厉害的，我有大把的时间都在屋顶弄这玩意儿，可其实我都在玩游戏。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/536.txt



2016年2月18日 22:36
2016年2月18日 22:36



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/537.txt



2016年2月18日 00:26
2016年2月18日 00:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/538.txt



2016年2月17日 23:13
你是没有脚的鸟，从遥远的东方飞来，从不停下脚步。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/539.txt



2016年2月17日 18:01
大概是可以控制对话的走向的。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/540.txt



2016年2月17日 11:30
老外只用一个碗裝食物是为了方便刷吧…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/541.txt



2016年2月17日 02:52
天空是片海，人是水面的浮萍。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/542.txt



2016年2月17日 02:20
ust different,
The one,
Or this time.




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/543.txt



2016年2月16日 19:52
别再怀念，
没有用。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/544.txt



2016年2月15日 22:16
若你只是喜欢我的脸，大可把自己，变成我的样子。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/545.txt



2016年2月15日 17:53
只是做饭…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/546.txt



2016年2月15日 13:56
2016年2月15日 13:56



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/547.txt



2016年2月14日 23:03
…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/548.txt



2016年2月14日 13:45
我所理解的教育，是让人类幼崽（？）将本能的维护自我利益发展到维护共同利益（我认为的），并使之形成一个有机系统。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/549.txt



2016年2月13日 23:00
那段时间，她每天用蒸腾的热水敷脸；那天午后她化了很美的妆，长发搭在肩上。
那天她伤得很深，独自坐在窗前，喝着冷咖啡。街上行人如潮，恰巧有个披着乱头发的少年给了她一张特写。
那个夏天她红遍大江南北。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/550.txt



2016年2月13日 18:08
总是感觉失去了好多，可仔细一想，原本就什么都没有。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/551.txt



2016年2月12日 15:29
2016年2月12日 15:29



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/552.txt



2016年2月12日 15:23
ife come
life go…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/553.txt



2016年2月10日 22:16
与猛兽进行了搏斗，体会了在怒吼下肾上腺素狂飙的感觉，发现了直径七毫米的航模电动机，还充了三百多块把游戏角色打扮成心水的女孩模样，我还 准备养只，我还做了把弓箭，我还在芦苇里仔细找丢失的箭矢。
…
当你开始逃避的时候，生活又再一次开始了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/554.txt



2016年2月9日 22:32
手工制的弓和箭，很有成就感！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/555.txt



2016年2月8日 22:07
人只能做对自己好的事，如果一个人做出了对自己不好的事，那是因为他相信这事儿最终会对他好。
(敬最爱的喵和汪)




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/556.txt



2016年2月6日 00:21
人是个系统。
这个系统总是在做着对自己好的选择，
所以在有限的资源中存活下来了。
自我意识，是在进化出
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/557.txt



2016年2月5日 20:49
2016年2月5日 20:49



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/558.txt



2016年2月5日 20:12
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/559.txt



2016年2月5日 20:11
因为我是那种会飙车的人




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/560.txt



2016年2月2日 16:00
如果没弄错的话，它就是电浆枪…

 上传1张照片到《The Weapen》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/561.txt



2016年2月2日 00:59
他活在黑夜，我活在白天，
我伸出手，可以碰到他的指尖。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/562.txt



2016年1月31日 23:32
2016年1月31日 23:32



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/563.txt



2016年1月30日 00:26
我从未挥舞长刀，
而他，只喝酒，不说话。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/564.txt



2016年1月29日 00:40
原来心疼也会风干，当你走过那些小巷，
能看到人们，把风干的回忆，挂在屋檐下。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/565.txt



2016年1月28日 00:12
一场雨。

 上传1张照片到《怡红别院》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/566.txt



2016年1月27日 02:50
月光正好，愿我只留下侧影。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/567.txt



2016年1月26日 00:17
你还要随时扑出去为女孩挡刀子，尽管可能有许多男孩愿意为她挡刀子…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/568.txt



2016年1月25日 23:23
最痛骨的事莫过于失去了好奇。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/569.txt



2016年1月24日 22:27
往前跨一步就发现成了工人阶级…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/570.txt



2016年1月24日 21:26
愿他们依旧健在。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/571.txt



2016年1月24日 01:13
香农理论认为信息传递，是在一个点上复制另一个点的全部。
那么只要你在宏观世界传递信息，它就一定可以被截获。
而一个人从生到死，都没能真正守住自己的秘密。
永远有多远，永远就是一辈子。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/572.txt



2016年1月23日 00:08
哈利马上就要去对付那条最凶恶的树峰龙，可他是队伍里年龄最小的…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/573.txt



2016年1月22日 23:41
找不着家的孩子…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/574.txt



2016年1月21日 23:57
割腕作诗一首




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/575.txt



2016年1月20日 00:07
基本食物来源，从三者中均衡摄取




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/576.txt



2016年1月18日 18:11
节食的结果就是，我才吃了一碗！一碗啊啊啊！！！！！！胀死了！！！！！胃变小了？！！！要分娩样的！！！！！！！！！！！！！！
胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀胀



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/577.txt



2016年1月17日 23:58
若是睡不着，大可在这漆黑的河里流淌。
你沉在海底，你在河对岸发呆，
隔着一条河，在雾里认清自己。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/578.txt



2016年1月16日 23:58
是的，RPG火箭筒，自从遇到那女孩我就产生了一种杀马特的审美观




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/579.txt



2016年1月16日 22:02
若是以后学车了，就每天晚上开车出去，让昏黄的街灯在我脸上投下浓重的阴影，有女孩过马路时我就从容地从她们面前过去。（请自动无视右下角logo）（人格已被胡渣入侵）




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/580.txt



2016年1月16日 01:02
可你想要画浪漫的画，写漂亮的字给女孩看，你得怎么办呢？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/581.txt



2016年1月15日 17:40
今年最好的




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/582.txt



2016年1月13日 18:33
真的，考完试，月光都暖暖的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/583.txt



2016年1月12日 23:09
对待别人像对自己一样好，就是很好的人了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/584.txt



2016年1月12日 13:04
这么多年了，还是只能看着她乘车走远。
除非你立下生命的誓言。
保护她，无论是战火，白骨。
一瞬间只觉这世上空无一人，英雄们都死了，他们的后代还在红旗下成长着。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/585.txt



2016年1月8日 21:38
一件事情的用心程度是由它本身决定的，而改变的在你自己，你忽略了细节才会觉得事情简单，脑内存是有限的，细枝末节被挤出来了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/586.txt



2016年1月8日 01:18
可我想起的是成都游乐园里，那个旋转秋千。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/587.txt



2016年1月8日 00:50
问题是他们还会主动来打你
月光 ：以前一直以为出现有首都，正常运作系统的敌对国家只是传说中的事，但现在世上就真出现了一块20万平方的一露头就会死的地方……这种地方也不找老大？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/588.txt



2016年1月7日 05:11
那部电影告诉我们，当你遇到那个让你怦然心动的人时，就该马上去吻她，因为无论如何，你注定一辈子忘不了她，当你的心破碎时，它就再也不会为某人而颤抖。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/589.txt



2016年1月1日 00:45
我像往常一样，饥饿着，喝了那一点RIO。
我好像回到了从前，独自走着，而且不愿睡去。
我看着镜子里那张熟悉的脸，你能笑得更柔和了，
你学会了思考，而且永远不会再难过。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/590.txt



2015年12月31日 23:47
不老的花




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/591.txt



2015年12月27日 10:12
钻得越深，别人就越难找到我们。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/592.txt



2015年12月27日 00:04
浮动的黑色气泡，海藻连成一片，延伸到远方。
我们是超然的一份子。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/593.txt



2015年12月26日 21:46
舞会需要盛装



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/594.txt



2015年12月26日 21:42
2015年12月26日 21:42



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/595.txt



2015年12月25日 07:50
不够优秀是因为没人爱过你



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/596.txt



2015年12月20日 00:58
记忆长河，名曰忘川。
刘海碎发，雾里看花。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/597.txt



2015年12月19日 19:28
当时我就呆滞了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/598.txt



2015年12月13日 00:01
常态的女生大概会向优秀的方向靠拢吧，可惜永远到不了，就只能努力地接近着，像自己一样。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/599.txt



2015年12月5日 23:51
以前哪，在因斯粉了一个韩国留学的姐姐，她上传了自学的韩文，在韩国的照片。
如果不是遇到她我可能也不会觉得外国文化这么有趣，三年过去了，再找到老熟人几乎已经不可能了，但偶尔还是会很想她。
就是因为这样一个小小的理由，我似乎觉得，韩文是一门我必须去抽时间学会的语言吖。。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/600.txt



2015年12月1日 13:45
苏三跑了两步就一头栽倒在地，我看到嫣红的血从她胸膛漫开，血很快就融化了。
不过很多年后我才知道，还好我没有看到她的眼睛，否则，我一辈子都会做



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/601.txt



2015年12月1日 13:45
自主地去吃了自小时候起就垂涎至今的食物，回顾我的人生长河，夜幕下的点点依稀，如今又点起了很明亮的一盏灯，可以照到更远的地方。
那小可的瓶子我不愿丢，我在这世界上呆得太久了，我有那么多的好朋友，他们怎样了？
天河般的孤独。
我留下它，我记住它，我记住你们！
我丢了它。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/602.txt



2015年11月30日 07:38
uprise



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/603.txt



2015年11月28日 20:54
额




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/604.txt



2015年11月28日 19:16
夜幕就像稻草



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/605.txt



2015年11月26日 17:09
最开始，我们在不了解词语含义的情况下仍能做出反应，所以大脑的语言系统可能最开始是比较死板的，就像河道，走不通就走下一条。。。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/606.txt



2015年11月26日 11:18
我还是很爱国的，可我喜欢玫瑰，我也喜欢祖国的梅花，可很难得看到哟



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/607.txt



2015年11月25日 21:57
猜想人总会凭借其已知条件选择最佳行动。
而在某些情况下会忽略掉某些条件，从而形成了各种不同的形势……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/608.txt



2015年11月25日 20:22
目测是腰部的……跌打损伤？总之应该有一些组织被压坏了，毛细血管神经纤维什么的……可能有轻微的骨裂。 最近我快分成两只了。。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/609.txt



2015年11月24日 22:16
很多地方都说要把眼眶涂黑，可眼睛是窗户啊，有没有不关窗的美丽。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/610.txt



2015年11月24日 13:25
在较长时间保持某种状态后，自身就会发生一些奇妙的变化，比如清醒昏沉，亢奋忧郁，好的至少我知道这个咯




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/611.txt



2015年11月23日 15:18
月光 ：你曾经一无所有，如今有了珍惜的东西，还敢飞车吗？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/612.txt



2015年11月22日 21:06
在神看来，我们是如此调皮。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/613.txt



2015年11月22日 20:59
不刮胡子几天人就老了，感觉像是海外流浪了回家。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/614.txt



2015年11月22日 07:39
神秘又廉价的东西让人跟风啊

 上传1张照片到《The Weapen》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/615.txt



2015年11月21日 22:02
从此你渴望有一双翅膀。
但有了翅膀你还是不会快乐，
因为你要的不是翅膀，
你要的是飞翔。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/616.txt



2015年11月20日 00:00
那天的碎云，更红一些。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/617.txt



2015年11月19日 12:39
从前有个姑娘叫小芳，长得美丽又善良，一双美丽的大眼睛，辫子粗又长。十多年那个晚上，我在巴黎看夕阳，，，



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/618.txt



2015年11月19日 12:19
t is heavy just like Fe2O3




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/619.txt



2015年11月18日 00:19
因为他生来就是那种人，要穿过茫茫的的人海和高山，穿过暴雨和狂风，只为去往心中的海洋。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/620.txt



2015年11月16日 23:23
时光才审判着世人，当你老了，枯槁的手抓着银白的十字，才发现这一生过得很荒唐。

 上传1张照片到《The Weapen》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/621.txt



2015年11月16日 22:20
海上钢琴师，正看得令人切腹，又想起“你们已经成年了，要为祖国生下强壮的后代噢”之类吐槽，顿时无语了。

 上传1张照片到《The Weapen》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/622.txt



2015年11月16日 08:29
不过是从小就担惊受怕的，社会的顶梁柱神马的，对我来说太遥远，我比较渴望刺激的东西，当然，我还是很在乎身体。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/623.txt



2015年11月14日 12:28
昨天




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/624.txt



2015年11月14日 01:02
我能唱歌唱得很像原唱了，我能画出晃眼一看貌似很专业的画了，我还能翻墙，我还能写些感动自己的文字，喂!你们不开心吗？！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/625.txt



2015年11月13日 20:46
你发着光，现在太阳下，比黄金更加炫目，比蓝宝石更加深邃。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/626.txt



2015年11月12日 21:14
这是舒赵林给我的感觉




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/627.txt



2015年11月8日 08:05
2015年11月8日 08:05



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/628.txt



2015年11月7日 23:55
你可以看见时间吗？
你有认真记着他们吗？
这么久过去了，
你从未放弃过再次相遇的机会吗？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/629.txt



2015年11月7日 00:14
“你比你想得还要天才得多。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/630.txt



2015年10月31日 23:50
发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/631.txt



2015年10月31日 23:35
自身在思考复杂的事，外界在发生复杂的事。
如果跟你一起的人没有注意到你的状态，对话继续进行，可能会造成细节的遗漏，使接受到的信息与外界脱节…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/632.txt



2015年10月25日 00:16
若心是透明，
又岂愿呆在夜里寂寞。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/633.txt



2015年10月25日 00:15
2015年10月25日 00:15



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/634.txt



2015年10月23日 22:52
身边是天空
脚下是大地
还有
茫茫的人海




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/635.txt



2015年10月18日 00:00
当我想时，
我就你身边的任何人。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/636.txt



2015年10月17日 23:26
有一种前空翻的冲动…不过估计会摔断颈椎吧…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/637.txt



2015年10月17日 22:34
你是风暴，还是鸟。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/638.txt



2015年10月16日 23:44
我很难过。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/639.txt



2015年10月16日 23:16
那是肉毒素，装在玻璃瓶子里。
我常常打开那些图片和文字，
久久地凝视。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/640.txt



2015年10月16日 20:28
风雪再大，也有归途。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/641.txt



2015年10月16日 16:38
你是飓风，还是鸟。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/642.txt



2015年10月7日 21:52
后来发现脑袋是歪的，其他的还蛮有价值

 上传1张照片到《本地相册》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/643.txt



2015年10月7日 01:00
在心里挖个地窖，那里有座城堡。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/644.txt



2015年10月6日 23:49
乘着风，把我带到远方。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/645.txt



2015年10月5日 14:58
2015年10月5日 14:58



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/646.txt



2015年10月4日 23:44
你却永远停在镜子里，
时光如流水盘旋，
你不笑，
而且始终如此。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/647.txt



2015年10月3日 23:37
月光 ：Sympathy is
Put others'
Pain on you .




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/648.txt



2015年10月2日 22:34
专业者，变态为上




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/649.txt



2015年10月1日 14:05
恐惧 自由 贪欲 仇恨。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/650.txt



2015年9月30日 16:59
像是歌声落在她的枝桠。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/651.txt



2015年9月11日 22:08
我要在整个沿海买下一大片土地，种满那种最酸的果树。秋天的时候果子都掉在地上烂掉了，风一吹整个城市都是酸的。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/652.txt



2015年9月4日 00:52
我乐于此，而且，执着地活下去。
月光 ：我往夜里一站，就成了一棵树。
我不觉得饿，我也不知道自己
死了没有。
我乐于此，
而且执着地活下去。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/653.txt



2015年9月2日 22:17
鸟儿在筑巢，鲜花也在暗处盛开。
你浑身火焰，踏上漆黑的土地。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/654.txt



2015年8月29日 22:54
我像那盆扶桑，
枯萎了。
像是四肢都被榨干了。
基本的激素水平，脑细胞的休息
还是要完成的



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/655.txt



2015年8月29日 12:41
一路走来，从未改变。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/656.txt



2015年8月27日 14:11
他的一部分是在这里的，
另一部分不在。
他在那个电流组成的世界里活着，
欢笑，歌唱。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/657.txt



2015年8月27日 14:05
月光 ：八月二十七日小节
既然“情绪”
已经能在一定程度上被观察到了。
那么将这个抽象的事物引入意识里，
保持观察。
就能获得更多的相关信息。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/658.txt



2015年8月26日 23:00
找条件的方法不够，
才会没条件吧



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/659.txt



2015年8月26日 20:15
像一首诗，
一场远征。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/660.txt



2015年8月26日 09:40
器官所需要的，不过是适宜的养分和化学环境。
如此一来，我们给了它这些，它就可以像正常情况一样地工作。
而这些养分当然最好是另外的器官来提供。
受精卵也并不是只能在人体内发育，只要一个健康的器官就好了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/661.txt



2015年8月25日 23:28
这样想来的话，因为未知的原因，从两年前开始，我的朋友必须具备一定的逻辑沟通能力，
至于为神马会发生这样的事，我还得再想想



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/662.txt



2015年8月24日 23:19
据说孩子的大脑是可以随习惯改变的。
即我们所有的情绪是来自激素以及这种后天养成的习惯。
掌握了这些习惯特点当然可以做到情绪的产生。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/663.txt



2015年8月24日 22:39
月光 ：你哭得太累了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/664.txt



2015年8月23日 15:27
换个风格




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/665.txt



2015年8月22日 20:40
生命可贵，如此一来高压喷火试验就可以安全进行了。
唯一需要的是费用和时间。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/666.txt



2015年8月22日 20:34
那些歌也都随风飘扬了，
唯一走的青春，
不朽的只是梦想。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/667.txt



2015年8月22日 20:32
月光 ：不能同行，乃人生一大悲剧。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/668.txt



2015年8月22日 20:30
炖歌



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/669.txt



2015年8月20日 13:02
藏在影子里，看着世界烧成灰。
我们来这世上，是有一定意义的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/670.txt



2015年8月18日 16:06
整整一年都需要维生素C……
月光 ：使用杀虫剂吗不用吗……




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/671.txt



2015年8月17日 21:51
【八月十七日小节】情绪也能在很大程度上影响我们做的事，说的话。
在某些时候，情绪能带来负面影响，因而创造此条件就可能造成负面影响。
可能的解决方案：1.把情绪作为考虑的因素，维持自己的情绪，可能会花精力去注意。
2.坚毅性格的人，情绪对他的影响很小。
3.做事讲原则，这样即使情绪不好也能做正确的事。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/672.txt



2015年8月17日 15:57
小时候，歌是走调的。
我细心抄了歌词，
唱不好，
又丢掉。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/673.txt



2015年8月16日 22:55
至少可以在我逻辑
稍微出错的时候
马上发现问题



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/674.txt



2015年8月16日 07:47
曾如此执着，如今就这样算了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/675.txt



2015年8月15日 23:21
月光 ：十八年，有过多少生命的危险。
十八年，踏着浪，吹着风。
一路走来，如此不易。
人生本该如烟火，绚烂着盛开。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/676.txt



2015年8月15日 23:13
待我漂洋渡海，踏着歌声…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/677.txt



2015年8月15日 13:46
谁要……守住谁。
first in 2015 ,second in 2013.
something null
was happenning.
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/678.txt



2015年8月14日 20:54
你看云彩，
远了。
像你潇洒的灵魂。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/679.txt



2015年8月14日 13:28
闭关！
作业还有一大堆，还有我决定补的音乐鉴赏美术鉴赏……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/680.txt



2015年8月13日 22:48
这些黑乎乎的牛肉巴巴，
就是她的一生啊。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/681.txt



2015年8月12日 21:43
天空，
又近了…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/682.txt



2015年8月11日 15:34
似乎现在对别人不好。
以后还回来，就可以了。
可是时间
什么时候能倒流呢？
我们是搏击风浪的勇者，
飘荡在疯狂之海。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/683.txt



2015年8月10日 08:37
说起来的话，扣扣上确实是发生了一些怪事，当然密码可以通过多种方式泄漏，也可以登录空间不留下痕迹吧。
不过谁知道我这样说会发生怎样的事情呢。
我清楚的事情是说和做虽然是两件事情，不过都有其自身的意义。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/684.txt



2015年8月9日 13:28
油漆……
月光 ：指甲油又称“指甲漆”。它主要成分为70%-80%的挥发性溶剂，15%左右的硝化纤维素，少量的油性溶剂、樟脑、钛白粉以及油溶颜料等。
——“我个人比较相信有机化学。”




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/685.txt



2015年8月9日 01:39
不要跟我提肉的事……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/686.txt



2015年8月7日 22:24
然而我们都没有注意到的是，那盏雪白的聚光灯后站着一个黑影……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/687.txt



2015年8月6日 16:39
青海省，黑马河乡至青海湖，路边千米左右有一牧羊人营地。一五年八月六



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/688.txt



2015年8月6日 07:58
营养素
每日推荐摄入量（标红的数据为适宜摄入量）
蛋白质
75g
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/689.txt



2015年8月5日 22:28
这世上那么多漂亮的女孩子，她们每天细心地妆点自己，或是白白的皮肤，或是精心梳的麻花辫，或是水汪汪的眼睛……我怎么越看越觉得像是在地狱里嘶吼呢。
那么多被小心守护着的梦，像烟火一样灿烂。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/690.txt



2015年8月5日 06:51
此前一直认为，把诸如情绪的虚无缥缈的东西引入计算是不可能的。
情绪就像色彩，充满了变数。
不过色彩都是可以用数字表示的，情绪应该也可以。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/691.txt



2015年8月4日 22:24
我的……首饰？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/692.txt



2015年8月4日 13:57
梦三千里无裳，歌九千年未央



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/693.txt



2015年8月4日 13:48
一会儿还会有骆驼




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/694.txt



2015年8月4日 10:27
看沙漠




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/695.txt



2015年8月3日 20:12
这是成文的讲价技巧吧， 不过我相信啊， 这不是全部。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/696.txt



2015年8月3日 06:57
我可没有期待任何事情。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/697.txt



2015年8月1日 23:02
我们来这世上，喝着冰啤酒，唱着歌，爱着某个人。是否在夜里玩游戏，翻空间，是否细心地打点自己，守护着一颗暖暖的心。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/698.txt



2015年8月1日 17:45
不得不说，
虽然只一场雨，
但是穿越了时间。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/699.txt



2015年7月29日 22:41
只不过是有些事情，只许成功不能失败
月光 ：若把人际交往方面的推动力定量地进行计算，那么造成某个方向的推动是要付出一定的思考和注意力的……就像“原材料”一样。
同时，也有一定的“废物排放”，也就是说，在人们进入更深层次的思考时就会产生难以预知的后果。
以无理由的拒绝而造成情绪推动力的方式我将其称之为“我不能池”，会对人造成一定的情绪推动;同时，别人会对你产生一定的看法，不好避免，也就是“废物排放”量较大。
当解决了“废物排放”的问题，“我不能池 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/700.txt



2015年7月29日 15:29
烟熏妆
炎热的大地
又是
一座火炉样的城市罢了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/10.txt



昨天 10:55
法国总统名字还真是洋气啊。。。。
	
外交部：马克龙将于1月8日至10日对中国进行国事访问 
我正在看【外交部：马克龙将于1月8日至10日对中国进行国事访问】，分享给你，一起看吧！
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/701.txt



2015年7月29日 03:33
如果明天我出事了，
那么这就是我这辈子听的最后最美的歌。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/11.txt



昨天 00:13
完了我昨天晚上耍通宵，早上只睡了三个小时
现在头疼耳朵也烧就是睡不着
闭上眼睛就发白，，，感觉快挂了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/702.txt



2015年7月28日 21:45
因为未知的原因，奇葩的数量正在增加



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/12.txt



前天 23:01
艾滋病是如何从黑猩猩传给人类的？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/703.txt



2015年7月28日 01:31
花指，墨枝。
黑夜是她的母亲。
她的孩子是毒药。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/13.txt



前天 21:48
现在泡面居然可以一顿吃两碗



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/704.txt



2015年7月27日 20:08
在对话的过程中，
语言可以是信息的载体，
也可以是情绪的推动力，
两者都会对一个人的行为
产生引导作用。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/14.txt



前天 20:20
仿佛就是理想与现实的差距。。，




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/705.txt



2015年7月27日 19:54
时间一往无前，
空间永无界限。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/15.txt



前天 20:17
我有什么好遗憾的



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/706.txt



2015年7月27日 00:13
从理论上看
一种
在特定条件下
不太正常
的情况出现了
原本它应该是
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/16.txt



前天 20:16
小小的幼兽还有獠牙呢



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/707.txt



2015年7月26日 23:53
不知想起了什么。
我看了看身旁，
一座坟。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/17.txt



前天 19:54
夜行者，钢铁洪流




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/708.txt



2015年7月26日 20:38
亮点是车载电脑，这货听着就高端
豆荚 ：汽配店啥的酷毙了！只要一个稳定的发动机、四个轮子和框架、一些零件就能弄一辆四驱车开着走了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/18.txt



前天 15:39
已经……三年半了？
月光 ：对他而言，“爱情”不过是个词语，听起来就像是玻璃杯里热水把杯壁上都蒙上了一层雾，气泡慢慢地冒出来。“喜欢”像三千公里外的海岸线。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/709.txt



2015年7月25日 23:23
速度不够快
豆荚 ：钛合金！熔了作为喷火手环加大版的主要材料……微型助推火箭！……




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/19.txt



前天 15:33
麻麻这是要把我嫁到草原上去吗
月光 ：“她在台上旋转，镜中人抬臂、下腰，瀑布样的黑色头发垂下来，衣饰上流转的光芒恍若星辰。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/710.txt



2015年7月25日 20:05
敬诗人。

 上传1张照片到《燃灯》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/20.txt



前天 15:09
。。。。。。我没做到
月光 ：巨大的光束将我们的影子投在地面上，风浪席卷了我的头发，我看到黑影，那是——仿制型阿帕奇直升机！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/711.txt



2015年7月25日 20:04
梦想，
也是有生命的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/21.txt



前天 14:37
感谢小小的你，和那些努力。
你没有走远。
你失败了不少，却也几乎都成功了。
2018，抱一下
我们，继续努力。

月光 ：再越一步，
将失去所有。
同时也无所畏惧。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/712.txt



2015年7月24日 23:57
规律＋条件=未来。
似乎可以始终这样做。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/22.txt



前天 10:14
018，终结者还没有来
我们熬了通宵以后在铺盖窝里等死




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/713.txt



2015年7月23日 20:40
2015年7月23日 20:40



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/23.txt



2017年12月31日 18:36http://user.qzone.qq.com/1776177662/blog/1514716579
2017年12月31日 18:36



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/714.txt



2015年7月23日 20:36
弱点就是通讯密码。但是出题的人通常可以难倒解题的人…呃？
豆荚 ：我的手机连接的是宽带而不是互联网，所以我可以一边拯救世界一边和你玩游戏。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/24.txt



2017年12月31日 13:31
神奇的锡宁格勒， 我们去了成吉思汗陵， 他的后代至今仍在守灵 然后我得了高原反应，感觉快不行了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/715.txt



2015年7月23日 16:05
在科技垄断下 即使是低成本物品 也将被抬到一个 匪夷所思的价格 有些东西 也许是透支一辈子的积蓄 所以 路要自己走

 上传1张照片到《本地相册》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/25.txt



2017年12月31日 02:40
这个吊了
	
再见了微信！马化腾彻夜无眠，阿里巴巴最新王牌终于宣布！ [一点资讯] 
我在浏览 【再见了微信！马化腾彻夜无眠，阿里巴巴最新王牌终于宣布！ [一点资讯]】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/716.txt



2015年7月23日 16:03
他们已经人工合成了DNA片段
并且植入细胞体内
激活
预计不久也将把这一技术
用于修改人类基因
（以RNA病毒实现）



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/26.txt



2017年12月30日 21:37
好人正如草芥，怪人苟活于世



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/717.txt



2015年7月23日 00:50
时间到了，我就拥抱蓝天。
那些花和种子，
歌声和故事。
'
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/27.txt



2017年12月30日 21:31
“我们起舞，夜幕就要降临
噢我这辈子真是……
在一起吧
不再分别
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/718.txt



2015年7月21日 23:27
屁大点娃儿，这样算是早熟吗？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/28.txt



2017年12月30日 21:07
“人类灭绝了，猪都不会灭绝。”——罗永浩
不要十字架
不要檀香
走回刚刚来的地方
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/719.txt



2015年7月21日 23:26
豆荚 ：准备转职！到时在运费上省一省也许可以控制在百元以内！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/29.txt



2017年12月30日 20:45
看一看过去的你，少年继续努力




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/720.txt



2015年7月21日 20:36
这样就可以做更深一步的观察了，只是不知道1600倍是个什么状况。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/30.txt



2017年12月30日 16:39
我想重新活一遍
重新看看你的喜怒
再走一遍这条路
你说你要棒棒糖很开心
你要喝酒你要挂在天上的月亮
我居然想要放手



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/721.txt



2015年7月20日 21:46
liver sword
Gray hand
For dream .
星辰之歌。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/31.txt



2017年12月30日 14:37
我起床吃午饭，然后就被关在寝室外边啊，现在在风骑，手机也没带，qq都登不了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/722.txt



2015年7月20日 21:30
天空是远处的海岸线，你看着它，潮起潮落。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/32.txt



2017年12月29日 21:07
今天改造充电宝，全程高能
没办法啊，
现在在充电
也不能掉以轻心
纯粹和强大的东西都很可怕
。。。。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/723.txt



2015年7月20日 21:29
忧风席卷着尘埃，旅人在唱歌。
那条很空旷很悠扬的小巷正盯着我。
忽然我就再也不想往前了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/33.txt



2017年12月29日 20:28
2017年12月29日 20:28



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/724.txt



2015年7月20日 21:21
种花会经常因为各种隐秘的原因失败掉，要认真分析认真对待，持之以恒，才会有收获。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/34.txt



2017年12月29日 00:33
今天下午考思科， 二进制我鼓到不用草稿纸(我没有) 脑壳都想爆了 现在还在痛




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/725.txt



2015年7月20日 00:30
生命如此美丽




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/35.txt



2017年12月28日 23:34
人不轻狂枉少年？
不如回家跳花鞭
隔世舞剑
梦中作焉？
敌军飞马还未远
何处可见
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/726.txt



2015年7月18日 23:49
电视机里的，是真的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/36.txt



2017年12月28日 18:59
我买了一大袋发绳回来慢慢扎，估计可以用好几年




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/727.txt



2015年7月18日 23:48
 beautiful world




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/37.txt



2017年12月28日 17:50
踏马的河，不懂沉默
何为蹉跎，再无你我



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/728.txt



2015年7月18日 19:31
好像扣扣是我找的一个盆子，我没事就像挤海绵一样挤一些东西进去，挤不出来的时候还得想办法……
但那是你淋着暴雨，血在身上流淌着，那些东西，是可以供人供奉的。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/38.txt



2017年12月28日 00:56
不要充电用手机。
不要充电用手机。
不要充电用手机。
吓死人了。
重要的事情说三遍。
不要充电用手机。
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/729.txt



2015年7月17日 21:27
他居然……！！！
月光 ：哈哈哈哈！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/39.txt



2017年12月27日 18:58
我霸气的小啾啾




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/730.txt



2015年7月17日 20:29
真怪啊这世上怎么会有如此多喜欢自拍的货，而且个个都很漂亮
月光 ：毕竟我什么事都做不好，有一天我真的会死掉。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/40.txt



2017年12月27日 13:19
国之重器，华夏九鼎
重于泰山，甚于沧海
残忍的另一面是责任




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/731.txt



2015年7月17日 10:38
就当明天是世界末日。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/41.txt



2017年12月27日 11:19
我还小，我不要变老



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/732.txt



2015年7月16日 23:17
对我来说，
自己的故事，
才是历史啊。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/42.txt



2017年12月27日 10:52
薄雾成河，腊月初十



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/733.txt



2015年7月16日 18:59
一辆车在路上行驶，右轮脱落，随后左轮脱落，试分析乘客颈椎的受力情况。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/43.txt



2017年12月27日 00:01
不知何起，一望无际




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/734.txt



2015年7月15日 23:30
独一无二的东西，往往比较特殊。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/44.txt



2017年12月26日 12:00
“一匹马，一条船，一辈子，一把扇”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/735.txt



2015年7月15日 23:20
以前有鸽子飞过，记得它们清灰的尾羽。我们总是在改变，碾压了曾经的我们那么美的瞬间。
可是那些最让人心疼的瞬间，我都还记得。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/45.txt



2017年12月25日 22:08
“你这人啥都没有，只有烂命一条” “啥都做不到，只有拿命来赌” “现在连自己的命都不珍惜” “没人跟你比，因为” “正常人哪会做这事儿”




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/736.txt



2015年7月15日 23:18
又是漫无尽头的夜晚。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/46.txt



2017年12月25日 20:01
十块一包的卡罗莱纳， 发了四棵，挂了三棵 冬至已经过了 应该没事儿了吧




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/737.txt



2015年7月15日 18:11
谁要守住谁



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/47.txt



2017年12月25日 19:45
感觉那时候的思路还比较靠谱
清洒 ：刮过一道风，是想说什么
这风穿行在田野、荒原
不停留




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/738.txt



2015年7月15日 18:11
原来所谓刷脸的意思就是，别人一看你表情都不会怀疑你…固化效果吗……可是这并不是我想要的呀，没人会希望自己是一个失败者，无论在谁看来。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/48.txt



2017年12月25日 12:48
我堂弟是至尊星耀
我表弟的堂哥是最强王者
而我潜伏坑中数年
不见天日
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/739.txt



2015年7月15日 00:28
全天下，只此一人。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/49.txt



2017年12月25日 10:49
秋风萧瑟
独在街头
不懂何为沉默



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/740.txt



2015年7月13日 22:21
这种效果不太一样，人们对其的判断就会有偏差

 上传3张照片/视频到《本地相册》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/50.txt



2017年12月24日 23:39
世事难料
徒增折磨
她想说什么
谁又懂得




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/741.txt



2015年7月13日 16:59
神爱世人，像母亲爱着孩子，但是你却不爱任何人。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/51.txt



2017年12月24日 21:50
他们都在谈恋爱
桑田沧海
不聚不散
我好像牛磺酸
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/742.txt



2015年7月13日 15:57
就把过去当作诅咒，影子当作酒杯。
Past is a swear ,shadow is a cup.



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/52.txt



2017年12月24日 17:55
政策好，吃低保 生病它会自己好 不行就上山挖药




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/743.txt



2015年7月13日 15:38
和你的感觉就像是金桔柠檬。那种精心准备的温开水和着老农亲手种出的果实，完美无瑕的白糖…那样的温暖一杯。
看着蒸汽化成水滴出来，我竟然难过得想哭。
你给我的感觉就像这样一个夏天，但最可悲的是，我竟然从未喜欢过你。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/53.txt



2017年12月24日 08:36
我可能，承受不起……




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/744.txt



2015年7月13日 10:21
你不爱她，她也不会变好。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/54.txt



2017年12月23日 22:21
ו,
אבל אלוהים




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/745.txt



2015年7月13日 10:14
补课？补什么，音乐鉴赏？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/55.txt



2017年12月23日 18:10
一缕青丝
梦的影子
谁的白发
散尽人世



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/746.txt



2015年7月12日 10:30
k你们好像是第一次看到




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/56.txt



2017年12月23日 13:32
这本书的电影杀青了 好奇上海是个怎样的城市
这么多人写它 我这么喜欢这本书 又会看到什么
转过的圈能不能再回来 即使过了这么多年
…………
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/747.txt



2015年7月12日 05:34
晚风静谧得像是一片海，已经没有人还醒着了，青洒已经化了妆。窗下的柠檬树已经比人高出一大截，在夜色中，清香宜人。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/57.txt



2017年12月23日 03:19
落花流落谁的人家，
过往的话，
不必牵挂
世间的美，流落此处
像风裹秋桐，屈指可数
我们就这样，默默迷路
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/748.txt



2015年7月11日 18:20
考试时差点闹肚子，不知道结果怎样



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/58.txt



2017年12月23日 00:13
既然最终要被毁掉
又为何寻找依靠
世人不懂
昨夜清风正好
两无所扰 不如不要
一字一句 一斟一酌
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/749.txt



2015年7月11日 17:32
月光 ：发表图片




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/59.txt



2017年12月22日 23:29
也许在别人眼里你是一从蔷薇
可在他的眼里你是一朵白花
这便是你爱上他了




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/750.txt



2015年7月10日 20:02
“
你将来有可能成为我所仰视的人物，嫁给一方豪门，受无数粉丝追捧；也有可能嫁给一个黝黑的、肥胖的男人，慢慢的静静地老去。如果你有了幸福的生活我也不会去祝福你，如果你孤独地终老那么我就去安慰你。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/60.txt



2017年12月22日 17:02
2017年12月22日 17:02



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/751.txt



2015年7月9日 22:02
ing a crazy,happy song!
月光 ：毕竟我什么事都做不好，有一天我真的会死掉。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/61.txt



2017年12月22日 13:30
那些繁华像樱花，可我总觉得你一点也不
原来你是属于我的
这世上有一片属于你自己的繁花



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/752.txt



2015年7月9日 21:55
当然是要先做实验
月光 ：痘痘里的那些大颗粒固体，据说是油，油能溶于脂质的话，那么我应该可以用消毒针扎一个小孔，然后用牛奶洗去，应该不会留下疤痕。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/62.txt



2017年12月22日 13:29
陈年艾草香，白发三千丈。
浮云捉不透，残香鬼见愁。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/753.txt



2015年7月8日 03:17http://user.qzone.qq.com/1776177662/blog/1436294900
2015年7月8日 03:17



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/63.txt



2017年12月21日 18:38
你又想她了，你要决定是否穿过茫茫大海，
找到她。
你会不会后悔，
你会不会后退？
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/754.txt



2015年7月6日 12:28
机动厨子……




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/64.txt



2017年12月21日 13:27
你洒过的种子，都会开花



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/755.txt



2015年7月4日 15:03
许下个愿望吧




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/65.txt



2017年12月21日 13:01
有人说转过的圈还能回来



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/756.txt



2015年7月4日 04:06
希望每个人都有无穷的力量，去实现自己的梦想，否则，我们来这世上做甚？
月光 ：“I'll be the special one,
More than
You can imagine."



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/66.txt



2017年12月20日 18:46
愿世间净土，皆在你处



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/757.txt



2015年7月3日 23:30
“Kimsum
我希望你成为一个很漂亮的女孩子，
你的美貌，远超常人。
这会带来很多困扰
孤独
将如影随行
但我也希望你拥有
高大的灵魂。”收起



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/67.txt



2017年12月19日 18:27
大学生笔记墙 ：大一计算机复习必备。转给你身边的小伙伴吧
6



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/758.txt



2015年7月3日 17:12
“那些过去了的事都不重要了吗？
曾经每天一块的零用钱
亦或是管够一个月的肚子
买的那些装备。
曾经那么珍惜地数着
Windows
右下角的时间
亦或是
省钱买书
而准备好了喝汤、吃米粉调料度日。
时间久了，
那些书都被同学弄丢了
那些美丽到心疼的碎片，
小心翼翼收集起来的瞬间。
都不重要了吗。
过去的愿望呢？
十三岁的自己
……你在哭吗？”收起



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/68.txt



2017年12月19日 13:29
现在的女孩怎么都这么美？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/759.txt



2015年7月3日 17:11
月光 ：“无论什么样的风景，都不重要了。
这世界好拥挤，
快点回家吧，或者
永远不要走到尽头。”




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/69.txt



2017年12月18日 10:18
恕我眼拙
看不清殿堂广阔
十八年沉默
葬身在这片刻
过往蹉跎
何若悔过



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/760.txt



2015年6月28日 08:16
2015年6月28日 08:16



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/70.txt



2017年12月18日 08:14
那一年 的花季
那一刻 的呼吸
那一生 的旅行




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/761.txt



2015年6月28日 08:16
生理期？神马玩意儿？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/71.txt



2017年12月17日 22:09
外星人也是人，也有人权



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/762.txt



2015年6月27日 22:56
“Life come , life go…GOGOGO!”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/72.txt



2017年12月17日 20:02
三千里艳阳
三千里迷惘
三千里时光
然后回乡



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/763.txt



2015年6月27日 20:38
我们在回忆过去的同时，也在创造历史。
两者都重要。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/73.txt



2017年12月17日 13:45
他很爱惜自己
他把命给你了
如果这你看不起
那你很可悲
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/764.txt



2015年6月27日 20:36
也许我该种些葡萄藤，榨成汁，这样烤肉会很好吃




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/74.txt



2017年12月17日 12:42
这世上没有谈不妥的事
如果有
可能是某人出了问题
如果还有
那就是这世界出了问题



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/765.txt



2015年6月26日 12:43
船、河、雨、伞。
偶尔下雨的时候还是会回忆过去，
我挎着枣红色的骏马，它在粗声地喘着气。
我让雨淋湿了我的刀，
于是我们又踏入夜色中。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/75.txt



2017年12月17日 10:05
风起年月，岁守边陲
不知何年何月
何地栽培




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/766.txt



2015年6月25日 11:22
愿我是清晨之鸟，拉开黎明之帘，所到之处光芒盛开。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/76.txt



2017年12月16日 21:32
泰山之威，何为可畏？ 巍哉巍哉，不以枉然。 若为人伦，汝辈岂在？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/767.txt



2015年6月23日 13:53
但是只要我还活着，你就不会死
月光 ：不过我觉得我会快就老了，身体枯成木，皮肤皱成纸……然后我就还是会觉得无能为力




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/77.txt



2017年12月16日 13:39
“日本人浪你没办法呀，一家三口，家里老头，乞丐首相，连家里那把刀都



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/768.txt



2015年6月22日 14:01
又是个颠覆我化学观的玩意儿




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/78.txt



2017年12月16日 11:22
许你一世英明，半世风情
恍如隔世的空灵，
战争的践踏和
瘦弱的衣襟
风吹密林
为你践行
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/769.txt



2015年6月21日 23:00
eautiful days




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/79.txt



2017年12月15日 17:01
若是你不对自己好
如何知道别人真正所要




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/770.txt



2015年6月21日 00:59
光束将我们的影子投在地面上，我看到了巨大的黑影。
仿制型阿帕奇直升机！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/80.txt



2017年12月15日 13:49
人们都差不多
看到的不同只是外物
最后的最后
无论如何
我们还是差不多



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/771.txt



                                                                                              


'''







'''

/fst/sky/moon-river/micro-blog/1776177662/81.txt



2017年12月15日 10:10
踏马的河。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/772.txt



2015年6月20日 20:08
乙醚是麻醉剂，可以把人麻翻
月光 ：水分子中的两个氢原子均被烃基取代的化合物称为醚。醚类化合物都含有醚键。醚是由一个氧原子连接两个烷基或芳基所形成，醚的通式为：R–O–R。它还可看作是醇或酚羟基上的氢被烃基所取代的化合物。醚类中最典型的化合物是乙醚，它常用于有机溶剂与医用麻醉剂。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/82.txt



2017年12月14日 23:24
外国人脑洞真大




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/773.txt



                                                                                                


'''







'''

/fst/sky/moon-river/micro-blog/1776177662/83.txt



2017年12月14日 17:24
“一生练刀，可能只会用到一次。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/774.txt



2015年6月20日 11:23
伊吹也是偶像之一




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/84.txt



2017年12月14日 11:00
2017年12月14日 11:00



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/775.txt



2015年6月20日 11:10
ike under a rain , cold me all




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/85.txt



2017年12月13日 19:08
愿他的坟头白花飘扬
笛声悠长
一如既往
随风飘荡
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/776.txt



                                                             


'''







'''

/fst/sky/moon-river/micro-blog/1776177662/86.txt



2017年12月13日 11:07
发布了个性签名




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/777.txt



2015年6月17日 00:06
 Dark Black Night



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/87.txt



2017年12月13日 00:42
“抱歉，你们继续。。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/778.txt



2015年6月13日 22:41
我觉得我就是那种会做出某种惊世骇俗事情的人，但是每次尝试的结果都不堪入目，被我清理掉了；你觉得你是那种平平常常忙碌一生的人，可做出来的事总是惊世骇俗。这样才公平不是吗？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/88.txt



2017年12月11日 10:33
如果我是个男孩
哪怕只有一天
清晨我会
从床上跳下来
如果我是个男孩
我想我会懂得
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/779.txt



2015年6月13日 22:35
月光 ：Be a poem , or a song .




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/89.txt



2017年12月11日 10:33
2017年12月11日 10:33



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/780.txt



2015年6月8日 20:44
月光 ：最后人类的女孩嫁给了机器人




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/90.txt



2017年12月10日 16:51
你的 背篼 我挑
短笛大王喵帕斯 ：六个字，用你的专业表白




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/781.txt



2015年6月8日 13:28
当遇到无法理解的事情时，还有一种方法就是确定对方是否达到了目的，通常可以从情绪、行为上进行观察。再结合对方所观察到的目标行为即可估计对方的心里状态。
以前是没有这种问题的，所以毫无疑问我的生活发生了改变。这种改变可以是随机形成的，也可能是人为影响的结果。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/91.txt



2017年12月10日 16:51
你的 丫头 我教
你的 网费 我烧
短笛大王喵帕斯 ：六个字，用你的专业表白




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/782.txt



2015年6月8日 01:04
人的心很奇怪，明明很强大的人，会因为感动败于弱小的人；明明弱小的人，会燃烧自己所有的东西，为强者……殉葬。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/92.txt



2017年12月10日 16:39
你的 丫头 我教
短笛大王喵帕斯 ：六个字，用你的专业表白




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/783.txt



2015年6月7日 22:20
我还依稀记得那……燃烧的战书。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/93.txt



2017年12月10日 14:12
战斗民族核弹灭火




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/784.txt



2015年6月7日 18:47
禁忌之针
月光 ：这么一来就解释得通了，三月是因为身材不好被四月嘲笑，所以注射了这玩意儿。
这一生若是从事一个不能吐槽的职业，我大概会被憋死吧。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/94.txt



2017年12月9日 05:23
手一抖，就成了这辈子最蠢的事……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/785.txt



2015年6月6日 16:08
辣椒素溶于油脂，牛奶中含有油脂，故喝牛奶可以解辣。此外，适量醋也可



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/95.txt



2017年12月9日 04:46
奇葩代代相传
清洒 ：自从上次买《奥秘》，到现在看到过最扯的。
然后发现这也是《奥秘》发的




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/786.txt



2015年6月6日 14:45
ost brother is coming！！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/96.txt



2017年12月9日 00:39
人来人往，一片寂默



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/787.txt



2015年6月6日 13:34
这简直是他妈的福音




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/97.txt



2017年12月8日 09:57
意大利人属哈士奇的
	
两国厮杀200年，死伤数十万，竟因一水桶！希特勒：意大利真搞笑 [一点资讯] 
我在浏览 【两国厮杀200年，死伤数十万，竟因一水桶！希特勒：意大利真搞笑 [一点资讯]】一起看吧!
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/788.txt



2015年6月6日 01:24
月光 ：也许我驻守在这里，不离开比较好



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/98.txt



2017年12月6日 17:29
有些选择作出了，就再无法回头。
有些梦不堪回首，有些雨一片哀愁。
有些花开在极寒，有些人不会再有。
剃不剃头，要想很久。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/789.txt



2015年6月6日 01:19
明天会觉得光线刺目好像夜里一样，黑暗里有花在盛开，花瓣落了满地。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/99.txt



2017年12月6日 17:12
人世喧嚣。没有依靠，两无所扰。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/790.txt



2015年5月30日 17:12
若是忘了时间，还能抓住什么



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/791.txt



2015年5月30日 17:03
少年的心变换不定，被雨夜灌满的胸膛现在都还冰凉。

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/792.txt



2015年5月24日 11:24
微量肾上腺素+高达设计题，刷题再也停不下来



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/793.txt



2015年5月23日 23:57
写作业要靠肾上腺素，这事儿本身就很狗血。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/794.txt



2015年5月23日 14:18
“If you can , why not to do this?” “我们总会在某些事候，有一些疯狂的想法。” “你已经颓废得太久了。”

 上传6张照片/视频到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/795.txt



2015年5月23日 14:09
月夜的时候，赤壁湖上的水是暗蓝色的，水面上散发着淡淡的微光。
我的客人是一个和尚，有时我觉得很奇怪这和尚怎么一天到晚老在外面瞎晃，不过若是他只是个正经和尚那么想来我们就不会这么认识了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/796.txt



2015年5月23日 13:51
小腿肌肉似乎开始变得更加有活性，跳跃高度比以往增加了百分之十以上。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/797.txt



2015年5月17日 17:44
抓住时光的手腕。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/798.txt



2015年5月17日 17:43
夜幕下的天空，黑暗里坠落的星光



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/799.txt



2015年5月12日 06:56
	
5月12日是清洒 的生日，赶紧送礼物祝他生日快乐吧！
赠送礼物

清洒 
2015年5月9日 23:01
也就是说，向着正确的方向有所行动，事情是会开始变好的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/800.txt



2015年5月9日 14:12
万物之灵，本该孤独。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/801.txt



2015年5月9日 14:07
爱情折磨人，夜晚太漫长。芦苇斜织成夜，风吹醒梦。当黑火烧遍这世界，我才真正从这具躯壳里醒来了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/802.txt



2015年5月2日 22:44
“你为什么残忍地杀害了你最好的几个朋友？”
“因为当杀手很帅啊……”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/803.txt



2015年5月1日 18:52
唯一的同伴是自己，唯一的对手是地心引力！
清洒 ：自从我还是个婴儿学走路，我就死死地攥住“重心”不放。是时候开始学着释放它了！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/804.txt



2015年5月1日 18:50
自从我还是个婴儿学走路，我就死死地攥住“重心”不放。是时候开始学着释放它了！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/805.txt



2015年5月1日 10:51
人生易短，秉烛以苟活。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/806.txt



2015年5月1日 10:38
黄昏的暮色，衰老的时光是躲在黑暗里的影子，蒙上了昏灰的尘埃。每一步都像是永夜那么长。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/807.txt



2015年4月25日 11:12
你呆得好像一座山欸，那么沉重。其实山啊海啊对人类来说都小儿科，万物之灵迟早是要征服世界。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/808.txt



2015年4月24日 19:33
跨海之山，林间飞鸟。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/809.txt



2015年4月24日 19:22
燃烧的夜，手中的灯。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/810.txt



2015年4月19日 06:30
你瞪着大眼睛看着那个又笨又大的家伙，用手按一下，没反应，用指甲按着，薄膜的屏幕上荡起一圈一圈的涟漪…
据说我们身体里的细胞每十年更新一次，那个过去的自己，是住在我心里的



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/811.txt



2015年4月19日 06:03
苹果的软件很棒，就像心跳和呼吸一样。像是你长出的翅膀…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/812.txt



2015年4月11日 22:58
日本人真的奇怪！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/813.txt



2015年4月11日 22:56
我能到那未来吗？我参加毕业典礼的那天，也会下雨吗？雨点泼洒在林间树叶上，啪嗒嘭啪嗒嘭…雨中林间会有人唱歌吗，梦里的百合花…




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/814.txt



2015年4月11日 11:01
椭圆（Ellipse）是平面内到定点F1、F2的距离之和等于常数（大于|F1F2|）的动点P的轨迹，F1、F2称为椭圆的两个焦点。其数学表达式为：|PF1|+|PF2|=2a（2a>|F1F2|）。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/815.txt



2015年4月10日 23:32
夜深了，幽幽的光静静地勾画着流畅的线条，像是悠远的海岸线。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/816.txt



2015年4月10日 23:03
第二分组The dawn.黎明丧钟。你们是危险如斯，腐蚀着我身上的铁甲。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/817.txt



2015年4月10日 22:54
就这样转动着，一往无前。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/818.txt



2015年4月7日 12:38
昨天刚刚认识了二弟和三弟，今天他们就变卖了身家，我们去打了很多兵器



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/819.txt



2015年4月6日 21:50
有座城，你一生都找不到，有片海打湿了梦，飘落的夕阳，花写的画，云唱



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/820.txt



2015年4月6日 15:14
你会在银行柜台前看到他，会在宾馆的前台看到他，会在街上偶遇他，这世上有太多和他一样发型一样表情一样脸型的人了，你会渐渐开始想，他以后也会变成这样平平常常的人吧？这样你就可以随时找到他，你就可以大声地跟他说话而他只是埋着头……你不知道这世界有多广阔。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/821.txt



2015年4月4日 20:44
你总是在台下忧伤，那么久了，那个台子一定欠着你很多东西。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/822.txt



2015年4月3日 21:19
百度神灯？！感觉这世界跑的好快……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/823.txt



2015年3月29日 00:59
我觉得……我比较像一个园丁



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/824.txt



2015年3月29日 00:54
What a fuking heavy bag，你摇摇晃晃地走在小巷里，踢着路旁的石子，心里想着，怎么有这么多石子？
月光 ：王巧玲说，初恋最让人难忘的夕阳下的拥抱。我就想啊，夕阳下哪里有什么拥抱哟，夕阳下……夕阳下是你背着大大的书包，踏着沉重的脚步；夕阳下是你和一群不认识的小孩围在路边摊；夕阳下是你孤孤单单地在空荡的操场上瞎晃，带着耳机听摇滚……你的生命还没升起，就落下了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/825.txt



2015年3月24日 09:15
什么邮箱大师耶！真的好想吐槽，网易真的是如此执着于邮箱啊…



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/826.txt



2015年3月22日 01:42
神秘和黑夜是两兄弟，孤独是你最爱的面妆，金钱无眼，噩梦噬心。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/827.txt



2015年3月22日 01:27
“当你凝视深渊的时候，深渊也在凝视着你。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/828.txt



2015年3月15日 02:48
本来就不该随意揣测别人的隐私…
清洒 ：不考虑个人隐私的话，其行为是畸形的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/829.txt



2015年3月15日 02:40
不考虑个人隐私的话，其行为是畸形的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/830.txt



2015年3月14日 20:35
三月三，放烟火。烟火不见，孤魂满天。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/831.txt



2015年3月8日 02:08
怎么突然又变成中文了，拜托诶你不是日语都有不支持中文的吗。。。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/832.txt



2015年3月8日 02:00
尼玛下载个软件而已那么长的条款看得完吗？好，看得完，的看多久？看完了我还有时间不？还是英文的……



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/833.txt



2015年3月6日 16:44
我们可以试图根据语言的逻辑性和连贯性，在一定程度上预测对话的走向。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/834.txt



2015年2月23日 12:41
以手机信号控制物理开关，这是不可能的吧




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/835.txt



2015年2月22日 20:42
“XXX去吧，只有他嘴巴最长。”话说嘴巴的长度和这事儿有关系么？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/836.txt



2015年2月22日 20:41
你真想知道什么样的人能够成功，你日思夜想想破了头也得不到答案。其实你只是想做个成功的人。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/837.txt



2015年2月19日 23:00
“…晚睡前卧室前一步右五步关阳台门窗，后转一步右两步脱下鞋，摆放整齐后转身坐下，以臀部为支点左旋九十度盖上被子入睡。”
“…走在路上注意双腿的协调以及前脚掌落点的触感，平稳落地后转移重心…”
“…有人问候先确认对方身份，成功后回礼，询问，试图帮忙…”
-----《集成化卿松标准程序与生产规格》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/838.txt



2015年2月18日 14:48
正因为不同的人有了不同的性格，我们根据不同的性格和不同的先天条件塑造了不同的模样。若世界上不同性格的人都长着同一张脸，那不是很可怕的事情吗？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/839.txt



2015年2月13日 22:29
因为出现的频率很高，所以我写出了这个基于西昌话的英语口语单词：Natar，做主语放句首代指前面所提到的人。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/840.txt



2015年2月12日 23:16
曾经的自己…那是什么？非要下一个定义的话，那是我的上帝，他主宰着你的一切，他就是你自己！但你永远无法控制他，时间是一扇打不开的窗。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/841.txt



2015年2月12日 21:50
重达七十九公斤…没我重
qou ：史上最大斗牛犬……@DicTatoR 




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/842.txt



2015年2月12日 20:19
人们人们总是说，心态心态。可是心态包含了太多东西了，你对事物的看法、你对未来的打算…心态心态啊，心态就是你的止步之地！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/843.txt



2015年2月12日 15:17
“你是靠两条腿走路的人，而不是靠意念，嗯？你的感觉到自己的双脚在运动啊……”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/844.txt



2015年2月12日 00:04
Good night ,Gina!U call me make THAT ID finally ,!!



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/845.txt



2015年2月11日 00:24
＂⋯你抓不住球了⋯你场子不够大了⋯你⋯罩不住了⋯＂




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/846.txt



2015年2月11日 00:20
2015年2月11日 00:20



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/847.txt



2015年2月10日 21:26
＂你知道为什么70年代女星要画眉毛吗？＂
＂为什么呢？＂
＂呵呵，因为可以藏伤疤啊＂
＂……"




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/848.txt



2015年2月10日 21:20
2015年2月10日 21:20



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/849.txt



2015年2月10日 14:27
“他站在一片黄色飞驰的球场上，猛然伸出手却抓不住球。原来他教会我的方法是片面的。他不是我的大英雄，他也只是一个被命运玩弄的可怜人。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/850.txt



2015年2月10日 00:00
2015年2月10日 00:00



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/851.txt



2015年2月2日 19:29
送的礼物是一个金苹果和一句话，那句话才是礼物吧？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/852.txt



2015年1月10日 22:17
晨酒不敌月光斩。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/853.txt



2015年1月2日 03:29
你把它设置为头像，在某天又换掉；你把它从历史记录里翻出来，它被反复裁剪放大，已经严重失真。你乐此不疲，并且不知道一张图片有着怎样的魔力。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/854.txt



2014年12月27日 09:48
如此苍白的一张纸上要写出花来不成



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/855.txt



2014年12月19日 11:05
2014年12月19日 11:05



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/856.txt



2014年12月19日 11:04
2014年12月19日 11:04



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/857.txt



2014年12月19日 11:03
2014年12月19日 11:03



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/858.txt



2014年12月19日 11:02
2014年12月19日 11:02



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/859.txt



2014年12月19日 11:02
2014年12月19日 11:02



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/860.txt



2014年12月19日 11:01
2014年12月19日 11:01



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/861.txt



2014年12月19日 11:00
2014年12月19日 11:00



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/862.txt



2014年12月19日 10:46
好像穿成这样

 上传1张照片到《碎片》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/863.txt



2014年12月19日 10:32
你能感觉到的，思路越来越清晰，感觉越来越敏锐，有什么正在从你的血脉里苏醒了，有一种正在到来的东西叫做“青年时期”。门口的栀子树老了，花开了又谢，青春将尽。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/864.txt



2014年12月16日 09:00
隐秘者的协定



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/865.txt



2014年12月14日 13:06
“就这样活着吧？”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/866.txt



2014年12月14日 12:41
光合作用（Photosynthesis）是绿色植物利用叶绿素等光合色素和某些细菌（如带紫膜的嗜盐古菌）利用其细胞本身， 叶绿体 在可见光的照射下，将二氧化碳和水（细菌为硫化氢和水）转化为储存着能量的有机物，并释放出氧气（细菌释放氢气）的生化过程。同时也有将光能转变为有机物中化学能的能量转化过程。植物之所以被称为食物链的生产者，是因为它们能够通过光合作用利用无机物生产有机物并且贮存能量。通过食用，食

 上传1张照片到《刷题预燃装置》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/867.txt



2014年12月14日 12:41
光合作用（Photosynthesis）是绿色植物利用叶绿素等光合色素和某些细菌（如带紫膜的嗜盐古菌）利用其细胞本身， 叶绿体 在可见光的照射下，将二氧化碳和水（细菌为硫化氢和水）转化为储存着能量的有机物，并释放出氧气（细菌释放氢气）的生化过程。同时也有将光能转变为有机物中化学能的能量转化过程。植物之所以被称为食物链的生产者，是因为它们能够通过光合作用利用无机物生产有机物并且贮存能量。通过食用，食

 上传1张照片到《刷题预燃装置》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/868.txt



2014年12月7日 15:51
无可抗拒，只有生生不息。（生。。。）



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/869.txt



2014年12月6日 21:09
说得稍微恶心些，你的意识在另一个人的身上发芽了，你开始以TA的感官来感受世界。时间太久了，仅仅是两个字，你都可以感觉到面前的这个人是不是你最在意的TA。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/870.txt



2014年12月6日 10:44
听说有一种东西叫河灯，可惜已经没有了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/871.txt



2014年12月5日 21:13
毕竟妖孽不觉得自己是妖孽。如果你们都妖孽了的话，那么我也成为妖孽吧



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/872.txt



2014年11月30日 12:18
有种鸟生来就是要衔着木条跨越大海，而我只是观望者。飞鸟丢了它的木块，在海面盘旋。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/873.txt



2014年11月25日 22:38
罐头，入库封存
Limousine ： 装酷谁不会刘海涛你说是不是 




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/874.txt



2014年11月25日 22:28
梦想不灭，青春永驻！

 上传4张照片/视频到《刷题预燃装置》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/875.txt



2014年11月21日 21:26
召唤！！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/876.txt



2014年11月21日 21:20
如果梦想是个女孩，那她是有着可爱的脸下残缺不堪的身体。要为了守护心中的梦想而努力啊！f(梦想→现实).




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/877.txt



2014年11月14日 19:52
你注定要在烟雾中中长大，在肆意的黑暗中独自盛开，然后绽放出太阳一般



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/878.txt



2014年11月11日 09:20
那时候我和你呆在候机区边的长椅，我感觉……所有的光都撒在这里了

 上传1张照片到《碎片》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/879.txt



2014年11月11日 09:20
 上传3张照片/视频到《碎片》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/880.txt



2014年11月11日 09:16
2014年11月11日 09:16



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/881.txt



2014年11月11日 09:13
2014年11月11日 09:13



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/882.txt



2014年11月11日 09:12
使用相册封面制作工具创作的封面照片

 上传1张照片到《颓废主义组装车间》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/883.txt



2014年11月11日 09:11
2014年11月11日 09:11



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/884.txt



2014年11月11日 09:10
2014年11月11日 09:10



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/885.txt



2014年11月11日 09:07
ence
61
 上传69张照片/视频到《SPACE》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/886.txt



2014年11月8日 09:33
伐




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/887.txt



2014年11月7日 21:01
你不需要做什么特别的事，你就是安静地坐在那里，你也拥有许多别人想都不敢想的东西，美丽是欠给世界的罪。你拥有了太多的东西，所以才要每一天都过得充实。“充实”是暖软的阳光。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/888.txt



2014年10月31日 10:50
康宁大猩猩玻璃

 上传1张照片到《怡红别院》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/889.txt



2014年10月24日 21:24
忽然间一种奇怪的想法——地铁什么的造在那么又黑又深的地下就是为了让那些个什么奇奇怪怪的不明生物跑进去然后被火车的动能消灭掉的吧？？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/890.txt



2014年10月19日 10:47
他是……黑洞和宝藏



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/891.txt



2014年10月17日 17:52
逻辑学语言
到目前为止，人类所使用的语言，可以分为三类：自然语言（如：英语和汉语）、半形式化语言（如：数学的语言。即：自然语言加特定的符号）和形式化语言（如：逻辑的语言）。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/892.txt



2014年10月17日 11:14
百度文化论语
· 人一定要做自己喜欢且擅长的事情· 认准了，就去做；不跟风，不动摇· 专注如一· 保持学习心态· 公司离破产永远只有30天· 每个人都要捡起地上的垃圾· 百度不仅是李彦宏的，更是每一个百度人的· 一定要找最优秀的人才· 给最自由的空间· 允许试错· 证明自己，用结果说话· 让优秀人才脱颖而出· 愿意被挑战· 说话不绕弯子· 对事不对人· 百度没有公司政治· 遇到新事物，先看看别人是怎么干的· 听多数人的 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/893.txt



2014年10月17日 10:30
家门口的栀子花是不是又开了？我们曾在花下奔跑、欢笑，那是大地上的事了。
但是大地上的事情太多了。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/894.txt



2014年10月16日 13:44
“坐在大街边的玻璃房子里喝着几十块的咖啡，可心里还是老想着天上的星



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/895.txt



2014年10月11日 23:57
子在川上吟，逝者如斯乎




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/896.txt



2014年10月11日 23:38
爆照了！
时间带来的创伤，只有科学才能弥补。？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/897.txt



2014年10月8日 09:32
也许偶像的意义就是在你年少的时候，你唱他们的歌给你的朋友听，强暴某某某看MV……你一直说要去看偶像的演唱会，但是你发现好快的你就老了都没有人陪你去看演唱会……但是你在看电视是看到他们都还是会很认真的去看，他们是你的偶像。

 上传4张照片/视频到《the sand of sea》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/898.txt



2014年10月3日 22:23
很大的一只狗，有着藏獒的面部结构和白色的毛色(我映像中的敖犬都是棕黑色的)，单独在景区入口等主人




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/899.txt



2014年10月3日 22:17
卓玛，也是吃掉了很多自己亲手养大的牛羊的血的，大草原的孩子；所以也很珍惜自己的，生命




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/900.txt



2014年9月30日 22:04
“既然你这么相信科学，那么你就为了科学死去吧”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/901.txt



2014年9月29日 09:25
特斯拉英文为tesla（字首小写），符号表示为T，是磁通量密度或磁感应强度的国际单位制导出单位。在1960年巴黎召开的国际计量大会上，此单位被命名以纪念在电磁学领域做出重要贡献的美籍塞尔维亚发明家、电子工程师尼古拉·特斯拉。
1 T = 1Wb/m2=1N/(A·m)=1Kg/(A·s^2)=1N·s/C·m



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/902.txt



2014年9月29日 09:25
2014年9月29日 09:25



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/903.txt



2014年9月29日 09:17
磁场的强度1
H(高斯)=2I(安培)/10r(公分)<；==长直导线
I：系指导线上的总电流，可借着增加线圈的匝数来提高导线上的总电流。
r：为与导线间的垂直距离。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/904.txt



2014年9月29日 09:16
众所周知的人物，安培

 上传1张照片到《燃灯》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/905.txt



2014年9月29日 08:59
2014年9月29日 08:59



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/906.txt



2014年9月29日 08:57
奥斯卡·王尔德（Oscar Wilde，1854~1900），19世纪出生在英国（准确来讲是爱尔兰，但是当时由英国统治。）最伟大的作家与艺术家之一，以其剧作、诗歌、童话和小说闻名。唯美主义代表人物，19世纪80年代美学运动的主力和90年代颓废派运动的先驱。

 上传1张照片到《燃灯》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/907.txt



2014年9月29日 08:56
家门口的栀子花是不是又开了？我们曾在花下奔跑、欢笑，那是大地上的事了。 但是大地上的事情太多了。

 上传1张照片到《燃灯》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/908.txt



2014年9月28日 13:00
道林格雷的画像 by Wild




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/909.txt



2014年9月27日 14:19
映射]设A、B是两个非空集合，如果存在一个法则f，使得对A中的每个元素a，按法则f，在B中有唯一确定的元素b与之对应，则称f为从A到B的映射，记作f：A→B。
其中，b称为元素a在映射f下的象，记作：b=f(a); a称为b关于映射f的原象。集合B中所有元素的像的集合成为映射f的值域，记作f(A)。
注意：(1)对于A中不同的元素，在B中有不同的象；（2）B中每个元素都有原象，称映射f建立了集合A和集合B之间的一个一一对应关系，也称f是A到B上的 展开



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/910.txt



2014年9月26日 11:18
油画的前身是15世纪以前欧洲绘画中的蛋彩画，后经尼德兰画家扬·凡·艾克（Jan Van Eyck），（1385年-1441年） 对绘画材料等加以改良后发扬光大。后人因扬·凡·艾克对油画艺术技巧的纵深发展做出的独特贡献，誉其为“油画之父”。

 上传1张照片到《the sand of sea》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/911.txt



2014年9月26日 11:16
2014年9月26日 11:16



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/912.txt



2014年9月26日 11:10
2014年9月26日 11:10



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/913.txt



2014年9月26日 11:03
2014年9月26日 11:03



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/914.txt



2014年9月26日 10:59
2014年9月26日 10:59



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/915.txt



2014年9月26日 10:51
大衣]： 大衣是京剧服装内部分工的行当之一，它的存在是为演员创造角色服务。从技术职能来 讲是管、拌、扎、勒，所谓的服装的管理保养，在演出中负责演员的服侍的装扮、特殊人物的扎勒，大衣在管理上有很强技能操作以及服饰的名称识别和塑造不同人物着装类型，为此服装的分行对表演起到了保证作用，为艺术的完整，达到预期效果，发挥着集资的智慧和才能，大衣行当在技艺处理上有其自己的范围和特点。
　　（1） 范围及作用： 大衣 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/916.txt



2014年9月26日 10:50
ice couple

 上传1张照片到《the sand of sea》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/917.txt



2014年9月26日 10:49
HTC Desire 820 ,8核64位，￥1999,2014/09/26

 上传1张照片到《the sand of sea》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/918.txt



2014年9月23日 12:50
卢瑟福领导团队成功地证实在原子的中心有个原子核，创建了卢瑟福模型（行星模型）。他最先成功地在氮与α粒子的核反应里将原子分裂，他又在同实验里发现了质子，并且为质子命名。第104号元素为纪念他而命名为“鑪”。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/919.txt



2014年9月23日 12:49
卢瑟福首先提出放射性半衰期的概念，证实放射性涉及从一个元素到另一个元素的嬗变。他又将放射性物质按照贯穿能力分类为α射线与β射线，并且证实前者就是氦离子。因为“对元素蜕变以及放射化学的研究”，他荣获1908年诺贝尔化学奖。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/920.txt



2014年9月23日 12:47
更多图片(4张) 欧内斯特·卢瑟福（英语：Ernest Rutherford, 1871年8月30日－1937年10月19日），新西兰著名物理学家，知名为原子核物理学之父。学术界公认他为继法拉第之后最伟大的实验物理学家。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/921.txt



2014年9月23日 12:45
卡文迪许实验室是英国剑桥大学的物理实验室。卡文廸许实验室旧址入口实际上就是它的物理系。剑桥大学建于1209年，历史悠久，与牛津大学同为英国的最高学府。剑桥大学的卡文迪许实验室建于187l～1874年间，是当时剑桥大学的一位校长威廉·卡文迪许私人捐款兴建的。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/922.txt



2014年9月23日 12:39
次原子粒子又称亚原子粒子，指结构比原子更小的粒子。其中包括原子的组成部分如电子、质子和中子（质子和中子本身又是由夸克所组成的粒子）和放射和散射所造成的粒子如光子、中微子和渺子，以及许多其它奇特的粒子。总地来说，次原子粒子可能是电子、中子、质子、介子、夸克、胶子、光子等等。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/923.txt



2014年9月21日 13:45
2014年9月21日 13:45



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/924.txt



2014年9月21日 12:31
　　伽利略用木板制成斜槽蒙上羊皮纸，用铜球从槽上滚下，他用大容器稳定地滴水并用天平称量的方法解决计时问题，测出铜球在斜槽上的位置与时刻，在这样的条件下，对物体沿不同角度的光滑斜面运动的规律进行了上百次的定量研究，得出结论：物体沿光滑斜面运动是匀变速直线运动，进而将斜面倾角趋于90时，推理得：　　自由落体运动是初速为零的匀变速直线运动。　　那伽利略为什么要研究自由落体呢？　　西方有句谚语：“对运动无知 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/925.txt



2014年9月20日 23:27
【自己永远无法证明的猜想】1.你的身后1米处有一个透明的人； 2.在你离开自己的房间后你的桌子会到处飞，在你回家的一瞬间他们又恢复原状。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/926.txt



2014年9月20日 23:23
为什么物质的行进速度不能快于光速？（１） 作者：阿西莫夫 施加给一个物体的能量可以通过多种途径对这个物体产生作用。如果，铁锤敲在悬空的钉子上，钉子就会得到动能，也就是得到运动的能量，而向外飞去。如果铁锤敲在嵌入硬木里的钉子上，那么，钉子就不会运动，这时，它仍然会得到能量，但这个能量表现为热的形式。 　　阿尔伯特·爱因斯坦在他的相对论中指出，质量可以看作是能量的一种形式（原子弹的发明已经确凿地证明他这种 展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/927.txt



2014年9月19日 11:13
2014年9月19日 11:13



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/928.txt



2014年9月16日 09:23
人类语言大致产生在五万年前.这个时候,人类智力的进货经历了手巧的人、直立的人、和智慧的人三个阶段，智力达到了一定程度，同时，这个时候人的发音器官也进化到了一定的程度，能够发出一定复杂的语音来，语言就产生了。而人类文化史的发展也能证明，这个时候产生了语言




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/929.txt



2014年9月12日 10:58
设置了主页形象墙照片




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/930.txt



2014年9月12日 10:45
在你消失的时光里，我又捕捉到指向你的矛头。有些事情总是无法解释的，如果说你又回来了，在我周围的某个地方。我又会怎么样




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/931.txt



2014年9月5日 10:53
2014年9月5日 10:53



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/932.txt



2014年9月5日 10:53
2014年9月5日 10:53



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/933.txt



2014年8月4日 09:38
世界很大，你很美。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/934.txt



2014年8月4日 01:16
有些话，就是要说出来，才会有感觉嘛。“你回来啦？”感动得心理发酸。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/935.txt



2014年7月14日 05:41
“你是凝结的时间，流动的语言，黑色的雾里，有隐约的光。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/936.txt



2014年7月12日 21:27
梦想是海水。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/937.txt



2014年7月9日 23:38
那你也会等我那么久的吧？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/938.txt



2014年6月12日 23:14
寒风冻死我，明天垒个窝



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/939.txt



2014年4月25日 13:22
尽可以守着一颗温暖的心，看它慢慢变凉。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/940.txt



2014年2月10日 20:53
你有翅膀，于是我就给予你力量飞翔 。。？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/941.txt



2014年2月8日 16:54
活着0



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/942.txt



2014年2月8日 16:54
狗血的青春



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/943.txt



2013年10月9日 06:16
活着



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/944.txt



2013年10月9日 02:44
2013年10月9日 02:44



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/945.txt



2013年10月5日 16:28
、



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/946.txt



2013年10月5日 01:53
他稀疏的头发也渐渐地变长 你心中的老脸却木着 静静地看着这一切



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/947.txt



2013年10月3日 01:10
天气好，l心情逗好！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/948.txt



2013年9月23日 14:04
-=别开玩笑可以么



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/949.txt



2013年9月17日 21:36
！！！
磊王 ：是的童鞋们 你们看这帮老魂淡就是这么做售后的！！ http://url.cn/



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/950.txt



2013年9月16日 17:46
当时蛋蛋哭了！！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/951.txt



2013年9月16日 15:32
意外地卷入到某个很大很大的世界里了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/952.txt



2013年8月7日 12:29
440069 ：　　　　　　　　　　　　　　　　　　　　　　　　　　　　尊敬的起床困难户：您此次起床共用了13分钟，您已击败了全国10%学生，寝室还有一位同学起床失败，正在重起，隔壁宿舍全部死机！　　　　　　　　　　　　　　　　　　　　　给我一张床，我能睡到世界灭亡。　　　　　懒床的童鞋请举手！




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/953.txt



2013年7月19日 19:38
欸欸，运气大大的好



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/954.txt



2013年7月16日 23:00
你说不负我就不负我了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/955.txt



2013年7月16日 20:22
我靠 怎么这么mang



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/956.txt



2013年7月16日 17:40
租个房子？？太疯狂了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/957.txt



2013年7月16日 08:38
。。。奇葩。。有病。。我有回什么东西么



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/958.txt



2013年7月15日 22:36
我们出生时是外星人，后来变成地球人



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/959.txt



2013年7月15日 06:08
不要看扁了那些少年，俗话说得好，少年穷则国穷，少年猥琐则国猥琐。我们的责任重大。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/960.txt



2013年7月3日 21:56
古湿一般的地名
古兰绿苑



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/961.txt



2013年7月1日 22:22
2013年7月1日 22:22



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/962.txt



2013年6月30日 19:14
从今以后做一个无心无言有心有言的人。你经历的不代表我经历的。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/963.txt



2013年6月29日 11:46
从今以后一定会在乎真正在乎我的 其他人无视



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/964.txt



2013年6月28日 23:21
就 这样吧，别涛我，这是我能做到的最好的？结局了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/965.txt



2013年6月25日 12:09
不来了啊。。。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/966.txt



2013年6月24日 19:42
我们都有过去式



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/967.txt



2013年6月11日 21:57
其实以前我课堂打坐穿越时空 各种YY 但就是从没敢想过发生这样的事



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/968.txt



2013年6月11日 21:29
也一起走过几年了，各种完败。。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/969.txt



2013年6月11日 13:12
“拜拜”“明天见”好不好



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/970.txt



2013年6月8日 17:09
你妹啊，！！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/971.txt



2013年6月6日 16:20
浸食



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/972.txt



2013年6月6日 14:41
你妹啊妹啊妹啊啊 啊



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/973.txt



2013年6月6日 09:44
QAQ. =-=



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/974.txt



2013年6月6日 05:54
QAQ我一定要刻苦修炼。。！！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/975.txt



2013年6月1日 11:45
每日一句(CET-6):You can never turn the clock back.时光不能倒流。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/976.txt



清洒
你是怎么想的。
评论转发删除

我也说一句
清洒
赶作业，赶作业！
评论转发删除

我也说一句
清洒
。。。。。。
评论转发删除

我也说一句
清洒
特期待开学！虽然我作业还有一大堆！！
评论转发删除

我也说一句
清洒
对不起。
评论转发删除

我也说一句
清洒

评论转发删除

我也说一句
清洒
。。
评论转发删除

我也说一句
清洒
蒙面，打了就跑
评论转发删除

我也说一句
清洒
你问他女朋友跟来没
评论转发删除

我也说一句
清洒
甩他一坨子啊
评论转发删除

我也说一句
清洒
把他脸打残
评论转发删除

我也说一句
清洒
我发表了内容

评论转发删除

我也说一句
清洒
一个圣斗士不可能在同一招下吃两次憋。。
评论转发删除

我也说一句
清洒
Watermelon。：二中期末新标语。感觉又要亮了。

2013年1月16日 22:39转发(154172)评论(239)

评论转发删除

我也说一句
清洒
相爱多年，他总爱带着她四处游玩。遇到人多的地方，他总会对她说：“要是走散了，就留在原地等我，我一定会回来找你。”这一日她又与他走散了，但她在原地等了一天，却一直等不到他回来。直到深夜，才有个中年男子找来，握住她的手柔声说：“妈，爸已经过世很多年了，您别再等他了。”

评论转发删除

我也说一句
清洒
是谁啊到底
评论转发删除

我也说一句
清洒
长大了一点才发现所谓大人其实一点都不高大
评论转发删除

我也说一句
清洒
美得一塌糊涂。
评论转发删除

我也说一句
清洒
e
评论转发删除

我也说一句
清洒
...http://detail.tmall.com/item.htm?spm=a1z10.
评论转发删除

我也说一句
清洒
...http://detail.tmall.com/item.htm?spm=a1z10.4.w3.9.7yadGO&id=13093121302&
评论转发删除

我也说一句
清洒
4月16日生日，快送上祝福吧！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/100.txt



2017年12月5日 07:37
我已淡妆，画地三尺，青山为常



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/101.txt



2017年12月4日 18:48
哈士奇真是犬界泥石流， 三代都洗不干净




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/102.txt



2017年12月4日 00:59
长发及腰，风落膝边草



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/103.txt



2017年12月3日 13:36
熊熊：生出个啥玩意儿




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/104.txt



2017年12月3日 02:05
2017年12月3日 02:05



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/105.txt



2017年12月2日 22:01
吃大家都喜欢徒步过河呀，阴死的可能已经有二十个了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/106.txt



2017年12月2日 02:16
刮过一道风，是想说什么
这风穿行在田野、荒原
不停留




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/107.txt



2017年12月2日 01:55
“那些别人没告诉你的，都会随着时间，慢慢显露出来。”



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/108.txt



2017年11月29日 15:12
razy stupid boy,
stupid crazy girl.



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/109.txt



2017年11月29日 08:14
隔江，蓬发乱葬，宛如千尺肠



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/110.txt



2017年11月27日 13:26
曾几何时，听人说起，
假如你着了生活的壳子，
球要悲伤，球要心急，
那些不日毛的日子会过去。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/111.txt



2017年11月26日 19:01
黑暗像洪水将我淹没，
我手握残喘的烛火。
Darkness flooded me like flood,
with a dying holding candle.



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/112.txt



2017年11月26日 18:56
你说你清醒，
那我问你，
对人类来说，最重要的是什么？



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/113.txt



2017年11月23日 11:16
“哪位道友在此渡劫？”
“我！本杰明·富兰克林！”
“还有我，尼古拉·特斯拉！”




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/114.txt



2017年11月22日 23:37
有什么事情要发生了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/115.txt



2017年11月22日 23:15
如果我喜欢你的话，我应该也会很喜欢你儿子




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/116.txt



2017年11月21日 18:13
小狮子长大了就会闹矛盾，这使它们寂寞。寂寞的公狮子找到母狮子，生小狮子使得它们团结。小狮子长大又离开，大狮子又会寂寞。
某天人间不再寂寞，狮子可能就灭绝了。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/117.txt



2017年11月21日 12:41
莫斯科没有河流。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/118.txt



2017年11月19日 03:07
粑粑麻麻说网络上坏人很多，所以我给小号名起成了陈晨，微信名起成了哲
后来我发现这个名字有点适合我，
陈晨听起来阳光，一点点正直，
然后我越来越像一个叫陈晨的男孩
没人叫我名字，说不定某天我就长成陈晨了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/119.txt



2017年11月19日 02:55
我不担心你，是因为你将永不孤单



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/120.txt



2017年11月19日 00:04
我不担心你，是因为你将永不孤单



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/121.txt



2017年11月18日 19:55
2017年11月18日 19:55



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/122.txt



2017年11月17日 00:04
苏媚  ：最冷的几个月 请不要乱扔垃圾 我们冷 他们更冷 请接力!!!




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/123.txt



2017年11月15日 00:59
这世界，本就是一匹脱缰的野马
有一天，会把我们，都远远地甩在后面
时间一到，我们都翘辫子




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/124.txt



2017年11月14日 13:09
2017年11月14日 13:09



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/125.txt



2017年11月14日 13:04
从你踏上这条道路
你就知道
你无法回头
从一开始
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/126.txt



2017年11月14日 11:17
现在的APP都怎么了，下载了一证件照APP，很专业的样子，制作完了要保存还收钱！一块！



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/127.txt



2017年11月13日 23:34
不完美



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/128.txt



2017年11月13日 15:33
愚公移山真好玩！
	
愚公移山3智叟的反击(8.6分 2244人评价) - TapTap 发现好游戏 
鉴于很多粑粑灰常喜欢我们的宣传MV，听到就控制不住记几~所以我就乖乖的把音乐和视频文件地址交出来啦，...
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/129.txt



2017年11月13日 14:43
俄式打群架
	
当俄罗斯汉子打群架时候飙中文, 不行了要笑抽了! 
【生活不一般】当俄罗斯汉子打群架时候飙中文，不行了要笑抽了！
 



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/130.txt



2017年11月13日 01:34
我会失明，可你会讲给我听



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/131.txt



2017年11月13日 01:20
亲爱的 你离我 那么远了
如今的你 行囊沧桑 困惑无助
风在 午后阳光都还在
我们去哪儿了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/132.txt



2017年11月11日 18:45
某天过着过着我就死了
可能都不会怎样




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/133.txt



2017年11月10日 18:14
心且乱，十世能述乎



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/134.txt



2017年11月9日 12:13
三食堂豆汤饭太好吃了，，，



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/135.txt



2017年11月6日 14:51
我要去打铁！ 汉八方，大马士革刚，我来了，，，




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/136.txt



2017年11月5日 23:35
2017年11月5日 23:35



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/137.txt



2017年11月3日 20:39
佛崔索夫，右眼重伤 仍发奋学习， 设计出了许多形状奇异的战车




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/138.txt



2017年10月30日 23:17
每个人都有一条路，路的尽头
躯体破碎，灰飞烟灭
也拒绝闭眼




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/139.txt



2017年10月30日 23:16
每个人都有一条路，路的尽头
躯体破碎，灰飞烟灭
即使是那样
也没有人会闭眼




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/140.txt



2017年10月30日 00:26
2017年10月30日 00:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/141.txt



2017年10月29日 22:39http://user.qzone.qq.com/1776177662/blog/1509287948
2017年10月29日 22:39



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/142.txt



2017年10月24日 12:15
2017年10月24日 12:15



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/143.txt



2017年10月23日 20:48
守得岁月静好




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/144.txt



2017年10月23日 07:53http://mobile.rr.tv/pages/videoShare?id=118630&share=7376498
2017年10月23日 07:53



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/145.txt



2017年10月22日 19:50
他告诉我，世界的尽头有座岛，
荒废，沉沦，那是我要去的地方
在这里我不过算个旅人




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/146.txt



2017年10月20日 16:17http://user.qzone.qq.com/1776177662/blog/1508487434
2017年10月20日 16:17



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/147.txt



2017年10月20日 08:01
we are just mess, lose control




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/148.txt



2017年10月18日 00:49
南方，我的家乡，
曾经的梦想，春的希望。
忘不了的悲伤，落幕的夕阳，
下着雨的晚上，不知所措的慌张，
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/149.txt



2017年10月16日 23:27
2017年10月16日 23:27



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/150.txt



2017年10月15日 23:40
你喜欢的人，随风而来，随夕阳而去 月光洒落人间，公主嫁给乞丐




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/151.txt



2017年10月15日 23:31
人来人往的城市，呆的越久，越习以为常。 欲望越膨胀，我们越受伤 不如去一趟荒野，感受文明的珍贵




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/152.txt



2017年10月14日 16:03
这不叫吃鸡，这叫鸡撞枪口上




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/153.txt



2017年10月11日 23:49
入党申请书，写了六节课。。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/154.txt



2017年10月11日 00:36
2017年10月11日 00:36



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/155.txt



2017年10月11日 00:31
很多年前的夜里下着雨 我在低头她在挥手
百里之外 地铁驶过某一站
人来人往 一片寂寞
或是薄雨洒在雨伞里，白炽灯像是某种篝火
或是长发披肩，像是一道墨
或是破碎的云，狂风吹散的岛，生锈的栏杆
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/156.txt



2017年10月8日 20:20
绽放人生第二春



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/157.txt



2017年10月8日 20:15
达到你所能想的，还要在那之上



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/158.txt



2017年10月8日 17:05
三里桃花十里酒，此生无憾。
望尽头路，九尺高楼



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/159.txt



2017年10月8日 04:45
三月里的蒲公英，充满了洋溢的春意



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/160.txt



2017年10月7日 09:08
Moon on Xichang




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/161.txt



2017年10月6日 22:31
人痛苦是因为有记忆。
若是这世上有产忘忧草的地方，我一定每晚都去偷。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/162.txt



2017年10月6日 00:14
十月烟花巷，遥望故人长



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/163.txt



2017年9月30日 22:20
遥想当年，贫困潦倒的书生，凌乱嘈杂的戏班
灯光照亮了戏子，惊慌失措的小脸
和她瀑布般的长发
“这是你的吗？”
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/164.txt



2017年9月30日 21:28
格式比较散的歌
	
真实故事改编(《极光之爱》电影永夜主题曲|《末日备忘录》随书附赠单曲)

歌手：石头 (五月天)

所属专辑：《极光之爱 电影原声带》

下载



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/165.txt



2017年9月29日 17:08
那辆车是怎么回事！被拖过吗？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/166.txt



2017年9月29日 16:40
老子要去一个远到令人遐想的地方



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/167.txt



2017年9月27日 21:47
Daddy's library




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/168.txt



2017年9月27日 18:38
2017年9月27日 18:38



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/169.txt



2017年9月24日 01:36
热血奔腾的上海，距此2000公里
悠久凝重的北京，距此1800公里
这里是稍微悠闲的成都。
你们在哪儿呢？




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/170.txt



2017年9月23日 20:39
周杰伦的歌，老鸭汤火锅料，婴儿尿不湿
喊成都话的职员，包装夸张的各种食品
高楼上倒映着灯光，年轻男女玩碰碰车
夜空深如墨，我在这里瞎逛



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/171.txt



2017年9月20日 19:05
君不见，黄河之水天上来，奔流到海不复回。
君不见，高堂明镜悲白发，朝如青丝暮成雪。
人生得意须尽欢，莫使金樽空对月。
天生我材必有用，千金散尽还复来。
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/172.txt



2017年9月18日 20:35
心理健康课第十三组，法律道德课第一组



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/173.txt



2017年9月17日 08:41
大学电竞专业揭秘：打LOL成专业，国庆作业是打上铂金 




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/174.txt



2017年9月16日 08:37
彼时，君未成名我未嫁，
初夏薄雨，又是相遇时




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/175.txt



2017年9月14日 09:31
窗外开始下雨，我走下楼
天很黑，我看到瘦高的她
她抬手。仿佛一道惊雷炸开，
我不确定那是不是她
展开全文




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/176.txt



2017年9月14日 09:27
窗外开始下雨，
天空苍白得像一张宣纸
我斟上清酒，
那一天，终于到了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/177.txt



2017年9月14日 09:24
窗外开始下雨
我等的人，就在我面前




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/178.txt



2017年9月13日 18:39
它离不开她
它小心翼翼地跟着女主人
它蹦哒，转圈圈，她走了它会很难过。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/179.txt



2017年9月13日 16:38
作息表




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/180.txt



2017年9月13日 15:18
一上课就紧张



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/181.txt



2017年9月12日 21:27
2017年9月12日 21:27



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/182.txt



2017年9月12日 19:59
关山荫，桃花琴， 脉脉流水，默默乡土情。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/183.txt



2017年9月11日 20:47
军训快结束了，天黑了
心里空荡荡的，好像有什么东西远远地离开了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/184.txt



2017年9月10日 11:38
2017年9月10日 11:38



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/185.txt



2017年9月9日 21:30
走过的路，不是人影和街道，而是时光 落下的雨，打翻的酒，是青春 我醉倒在池边，一切一如一万年前的清晨




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/186.txt



2017年9月9日 21:26
2017年9月9日 21:26



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/187.txt



2017年9月7日 16:43
每当我找不到存在的意义
每当我迷失在黑夜里
夜空中最亮的星
请照亮我的眼睛




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/188.txt



2017年9月6日 22:18
2017年9月6日 22:18



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/189.txt



2017年9月6日 15:20
蠢事会和好事一样多



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/190.txt



2017年9月4日 16:19
托普学院校歌
蜀中川西，都江流域，信息时代托普学院应运而生；
国家强盛，中华的复兴，全靠我们一起来承担。
同学们，努力学习，诚实守信，务求实干，做人的根本；
同学们，积极工作，精通技能，立志创业，做事的基石。
要勤奋努力，只争朝夕，坚守托普的传统；
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/191.txt



2017年9月4日 12:13
视觉酱 腾讯认证 关注 就舅服你。





'''







'''

/fst/sky/moon-river/micro-blog/1776177662/192.txt



2017年9月3日 00:44
神奇的字幕君，你这么搞笑爹妈知道吗？ 




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/193.txt



2017年9月2日 23:12
44322335 ：？？？卢本伟是真让人害怕...
我就转发没多久现在就解决了？？？
：D？
我害怕。



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/194.txt



2017年9月2日 22:20
焦黄色的天空，裂开了一条缝。
我们就在这天空下欢呼。
我们自此别过，互不相欠。




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/195.txt



2017年9月1日 11:56
诶当兵卖命不容易，不知道他们怎么看我们



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/196.txt



2017年8月31日 20:47
我们的军训服装质量还是可以




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/197.txt



2017年8月31日 10:50
我们都不好好说再见



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/198.txt



2017年8月29日 03:16
露天汽水，泡沫球场




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/199.txt



2017年8月27日 21:38
动物通灵之后呀，有趣的事才刚刚开始




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/200.txt



2017年8月25日 22:02
找富婆是人生最后希望




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/201.txt



2017年8月25日 17:40
终于可以在寝室好好唱歌了



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/202.txt



2017年8月25日 01:21
不是所有故事都有好结局
他们也曾像你我一样，
然后坠落



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/203.txt



2017年8月23日 16:25
这世界变得大而空旷



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/204.txt



2017年8月23日 01:04
2017年8月23日 01:04



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/205.txt



2017年8月21日 21:30
分界线，判断是非，也造成错误

 上传1张照片到《直升机与少年》



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/206.txt



2017年8月20日 22:06
忘了背负的罪
忘不了圧弯的脊梁
然后再次启航




'''







'''

/fst/sky/moon-river/micro-blog/1776177662/207.txt



2017年8月20日 17:03
光荣的土地不是用犁来翻耕
　我们的土地用马蹄来翻耕，
　光荣的土地上种的是哥萨克的头颅，
　静静的顿河到处装点着年轻的寡妇，
　我们的父亲，
　静静的顿河上到处是孤儿，
展开全文



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/208.txt



2017年8月19日 20:02
蓝色的天空和海
沉没的十字帆
是过的太久了，忘记了背负的罪



'''







'''

/fst/sky/moon-river/micro-blog/1776177662/209.txt



2017年8月18日 22:09
乌云无法承载暴雨，坠入大海
我醉倒，在海边。
我要一直一直，寻找着答案



'''







'''

/fst/sky/moon-river/Zero. About/.txt



　　一、韩凌枫

　　时值二零一五年九月，极阳。

　　今天的太阳出奇地大，阳台上的一束嫩芽焉巴着，看那有些蜷曲的小叶子，似乎也快要沦为她脚底碎黄中的一员了。

　　韩凌枫的就花盆里生活着各种各样的幼苗，不过一直很努力的南瓜已经死了，土豆没事，苹果的小叶子上有几个洞，不过似乎没有大碍，也不知道怎么回事，反正经常莫名其妙地死了就是了，韩凌枫看到那颗挺立着的小柠檬也快不行了，拿漱口的杯子，在厨房接了一杯水，灌了下去。

　　最近无聊到爆，韩凌枫试着种了一些植物，若是以后找不到工作，不至于饿死。

　　韩凌枫觉得，怎样都好，别跟人打交道，谁知道会发生什么莫名其妙的事。

　　他快读大学了，不是很出名。

　　打开手机漫无目的地翻看，屏幕上端跳出一则新闻来，标题是《2020年光棍危机》。那就像碳酸糖投入了水中，快速地冒出泡泡，然后韩凌枫陷入了巨大的恐慌。

　　不能再这样颓废下去了，是时候做点什么了！

　　二、据守！

　　他很少关心别人住在哪儿，除了顾小曼。

　　他以前帮顾小曼复印过报纸，虽说那次他差点死于车祸，不过也算是印象深刻，别的韩凌枫不太清楚，但他总觉得那次是很奇怪啊，那么突然地让自己送报纸，又不说明来意，不过他倒是很乐意。

　　这些日子，父母每天早出晚归，他没事可做时，就玩游戏、看电影，再到看电视剧，已经无聊透了，生物钟也完全打乱。

　　恍惚地走到街上，韩凌枫想，干脆去书城吧，在那些书海中找一本清淡一点的，若是很快就觉得无聊了，随时也可以回来，再不去街上瞎逛，买只小仓鼠啥的……

　　然后他就路过了那个岔路口，顾小曼家在里边。

　　如今他每次路过这里，都会扭头看看，并伴随着一阵恍惚。

　　这丫头没问题吧？整天神神叨叨的……是当初发生了什么事情吗？否则她会发那种神经？

　　她的妈妈骂了她么？她有什么样的苦衷吗？她其实也对自己的缺点感到无力吗…就像曾经的自己那样，那样的无助。

　　韩凌枫忽然不想去书店了，停在人行道上，不知道怎么办才好。

　　他看到那边路口有个小吃摊，摊主是个瘦削的中年人，有着点点花白的头发。

　　今天，自己就在这里呆吧。

　　三、时光如白马

　　其实自己在那儿白坐着，是很不好意思的，于是韩凌枫从包里摸了几张皱巴巴的零钱，向摊主要了点东西，摊主他丝毫没有不适的意思，于是韩凌枫也能心安理得地呆在那里了。

　　正午的太阳有些小了，看上去光照很适中，韩凌枫塞着耳麦听音乐。

　　自己，做事也不够好啊。

　　如果有成绩比你更好的，能力也比你强的人，有比你帅的，说话也比你动听的人，那为什么不去喜欢那个人呢？如果他很爱你，对你好，你又为何不与他相爱呢？

　　也许，根本的问题还是在自己身上吧，小时候也是这么想的，至少韩凌枫从小到大还没看到过比自己更着急的人……

　　韩凌枫闭上眼睛，习惯地用手和头发遮住半张脸，看上去像是石头做的。

　　时光如白马，一去不复返；时光如白发，噬咬着你的心。

　　四、日落

　　韩凌枫不知道自己能带到多久，电量过低时他关了手机，这是他的一个习惯，这样还有点去打电话救急。

　　期间摊主问他是大学生了吧，韩凌枫说自己高三了。

　　不想说话，不想动，不过肾还是得珍惜的。

　　后来天色渐渐变得有些橘黄，中年人收了摊，很快马路边只剩下个水泥柱，还有那些石椅，整个街道在初生的夕阳里飘晃着。

　　再有一个多小时，天就黑了，韩凌枫是不会在外边呆太久的。

　　还是回去吧，继续过自己的生活。

　　顾小曼从小就学钢琴，这也是她的特长啊，说不定以后她会非常的出名啊，成为像那些明星一样的人，这样韩凌枫每次看到她就回很难受。但是像她那样坏脾气的女孩，也许会很孤单呢，那么自己就去安慰她。

　　韩凌枫想着，表情一片严肃。

　　可就在这时，在那拐角处，有个样子很眼熟的漂亮女孩出现了，韩凌枫皱着眉头，然后差点没被吓死，那是她！

　　顾，小，蔓！

　　她比以前漂亮了很多，很像那些遥远的女神了，穿衣服也很时尚。

　　她打着电话，向马路的那一头走去了。

　　韩凌枫看看自己的衣服，马上把头别了过去，冷汗直冒。

　　又突然出现了，还是逃跑吧，自己已经很累了。

　　可她拿着电话的样子，却又有着一种神秘的力量。

　　五、淬火

　　韩凌枫最后还是没有直接走掉，他跟在后边，想着等到自己准备好了，就突然出现。

　　最后他就看到顾小曼和一个很帅的男生一并走着，吃火锅，逛街。后来天黑了，男孩和女孩挤在人群中买铁板烧，空气里散乱着霓虹灯光，音乐声。

　　在小巷里，雪白的路灯打在漆黑的路面上，在角落里，男孩吻了女孩。

　　韩凌枫就站在阳台外的走廊上，在那盏刺眼的聚光灯后边，没人看得到。

　　韩凌枫看着那两个漂亮的人渐渐地走远了，脸上没有什么表情。

　　半个小时后，韩凌枫回到家，很晚都没有睡着，于是拿起正在充电的手机翻看着。

　　有网友说，虽然现在单身男光棍有三千多万条，不过男子通常都会娶比自己年龄小的女孩的，所以光棍危机不会太糟糕的。 



'''







'''

/fst/sky/moon-river/Zero. About/The Army.txt



　　男子看着眼前的老头，恭敬地泡了碗茶。

　　“那么，建军是个什么样的人呢？”

　　在蒸腾的白雾里，老头惬意地眯起了眼睛。

　　缘起

　　在那个地方，知识被认为是“人”的诞生，没有知识便与家禽无异。

　　人家能把你吃掉，当然不会告诉你。

　　而学会从科学的角度观世界，才是第一次睁眼。

　　而这个孩子，从他第一次睁眼，就紧紧扼住了命运的咽喉。

　　守门人深知男孩的非同凡响，但自己表现得与往常一样，因为能说出口的都不重要，而重要的事，人们从不说出口。

　　情深

　　“人是个系统，总是在做些对自己好的选择，抢夺着资源和机会。” 



'''







'''

/fst/sky/moon-river/Zero. About/The Maple.txt



　　尾声

　　一

　　他跑在雨里，思绪很乱，如果你遇到过这种情况你就能懂。

　　脑袋里总是莫名地冒出她说的话，你披着一件衣服发短信，手都在发抖，感觉不到冷。

　　你曾为她穿过拥挤的马路，你在手臂上刻下她的名字，鲜血流淌。

　　你为了她什么都不要了。

　　二

　　“我下了。”我输入。

　　好像也能表示“我下地狱了”。

　　是啊，我下地狱了

　　三

　　我叫韩凌枫…我也讨厌想起自己是天生的失败者。

　　城市是幅画，而我只是过客。

　　四

　　又是三年过去了，她不再把和新男友的照片发到朋友网，也不再让陌生人进她的空间，她不再系马尾辫，也不剪干净的短发，她只是把头发留到脸颊。

　　我不再纠结，因为最糟糕也就是那样了，不会感觉更糟了。

　　这是因为我变了，我忘掉了一些会伤害我的东西。

　　我习惯了，我迟钝，麻木，说好听些就是稳重了，难以因为外物而冲动。

　　哈哈我变稳重了，这样想来还不错。

　　五

　　我就在她身旁，我就在她身旁。

　　我知道我很讨人厌，但是我下意识地，就想去靠近她，我在人群中寻找她，默默地走在她身边。

　　如果发生了什么，或许我就会毫不犹豫地守在她身前。

　　现在她就坐在我身边，虽然我注定失败。

　　我在一页纸上写下一个公式，这是我平生第一次感到有些不凡的东西。

　　这是傅里叶公式啊，哪怕是最基本的，也足以让我处理声音的频谱。

　　我忘不了你话里的忧愁，你忧郁，又实在。

　　如果我能再造一个你，也就不会再打扰你了，我和我的诅咒，就能结束在我这。

　　不简单，也不难。 



'''







'''

/fst/sky/moon-river/Zero. About/The Team Skill Form.txt



　　姓名:维克多

　　年龄:21

　　性别:男

　　___________主修___________

　　心理学(三级学科)(生物学–生理学–心理学)

　　___________辅修___________

　　医学:外科医学、临床医学、细胞生物学

　　体育:滑翔、自由飞跃

　　计算机:c语言、网络技术

　　化学:有机化学、细胞化学

　　语言:英语、俄语、法语

　　（注：青洒主修有机化学，外语主修法语）

　　___________信仰___________

　　基督教 



'''







'''

/fst/sky/moon-river/Zero. About/The Dreamer.txt



　　时值二零一三年九月

　　你是我心里的地窖。

　　我抓着酒，

　　火光开始飘摇。

　　邓秋离

　　窗外阳光明媚，绿叶飘在蓝天里，邓秋离把书都收好，整齐地放好，确认很美观。

　　邓秋离在教室里的所有时间几乎都在写题，她对这种劳动没感觉的，好像是呼吸，是生命的一部分。

　　同桌已经睡了两节课了，小平头上的汗流了下来，散发着一股怪味儿。

　　对于他来讲，邓秋离是他最搞不懂的人之一，就像个躯壳，而她的精神是活在数字里，在那些铅字组成的迷宫里。

　　邓秋离对于未知的事情有一种敬畏，微小的差错对她而言是种打击。

　　就像那个男孩出现时，她不可以丢脸。

　　默默地心算了自己的状态，邓秋离开始有一些安心，而同桌睡得跟死了一样。

　　一分一厘

　　又是能晒着太阳的周一，邓秋离的校服像是新的，天蓝色暖暖的，邓秋离喜欢这种感觉，天空都像是洗过的。

　　这座城市里的男生很漂亮，皮肤很白，很有小聪明，他们学着明星的样子留着头发，学素描、钢琴、吉他……

　　邓秋离记得小学时班里也有个男孩会弹吉他，可他说话女声女气的，还偷穿自己的衣服，脑袋像个坚果，贱贱地笑笑，看起来像个小丑。

　　可大城市里的男生不一样了，那是完全另一种感觉，他们穿着名牌的干净衣服，每天用洁面乳洗脸，话很多，可听起来很怪。

　　他们就像一只只小刺猬，充满了敌意，也不会让你知道他们在想什么。

　　唯有一个人例外。

　　每周一时，邓秋离和三五成群的同学走过广场去上音乐课，会与他擦肩而过。

　　那是一个有着柔软头发的男生，皮肤很柔和，穿着白色的体恤衫，他的发色似乎有些淡金，让人觉得温暖，就像是有阳光在他身上生根发芽了，散发着看不见的温热的光。

　　他看起来很忧伤，好像永远都不会快乐。

　　邓秋离总是感觉世界变得很安静，嘈杂声都被吞没了。

　　她像往常一样埋着头，紧张地走过。

　　她的身后有个长发女生环抱着手臂，正无事可做，看到了这一幕，打断了身边姐妹们的对话。

　　“每次看到那个男生，邓秋离就会低着她那傲娇的聪明脑袋耶。”

　　一分二厘

　　初二过了一半，邓秋离的数学成绩依旧是全校第一，还是很勤快地帮老师清理每天的作业，像是那种天命的学神，对那些还在恍惚着的小男孩小女孩来说，邓秋离是比天还高的存在。

　　邓秋离最近做事特别来劲儿，心里那条河欢快地蹦跳着。

　　她加到男生的扣扣了，是那种网上搜罗的很唯美的头像，昵称是“雨点“，说话很谦虚。

　　他很傻很幽默，偶尔会跟邓秋离开个玩笑，邓秋离觉得，世上最幸福的，就是与喜欢的人相爱。

　　她每天会打开空间看朋友们的状况，那个长发女生发了一条说说，却让她觉得有些不安。

　　”有一种病叫幸福，只有爱的人才能给你温暖。“

　　一分三厘

　　邓秋离坐在前排墙边的座位上，埋着头写练习册。

　　不知道为什么，男生不跟他说话了，天天和那个长发女生打闹，女生拿了他的东西，他们就相互打闹，追逐。

　　他们的成绩徘徊在中下游，邓秋离每次去找男生说话，他却用一双黑色的眼睛瞪着自己，像是黑夜到来，再没有那种温暖。

　　男生在空间里发说说。

　　“爱是你的唯一弱点，是不可遏制的心痛。”

　　邓秋离的脑子很乱，想着那个男孩在阳光下的样子。

　　心里想着他怎么可以这样恶毒。

　　一分四厘

　　很久了，男生已经莫名地把自己删了。

　　邓秋离面无表情，看着在“可能认识的人”里出现的那个id。

　　扣扣号码头几号与后几号吻合，好友印象和签名风格吻合，是那个男生，昵称是“黒吉他“。

　　那个男生在高三那年转走了，从此渺无音讯，邓秋离不敢加他，少有的，不知道怎么办才好，也许哪天就看不到了。

　　最后她复制了这个扣扣号码，它在加密后变成了一长串数字。

　　邓秋离就把它粘贴进了自己空空的留言板里。

　　邓秋离，十八岁，特长是她想守住的秘密没人能知道。

　　后来，她也试过用小号小心地加男生的好友，可总是没回音。

　　就当你睡着了，那我就等你醒来。邓秋离想着。

　　二分一厘

　　邓秋离高一了，实在太无聊，数学作业已经写到了一个骇人听闻的程度了，再写怕会引起轰动，而且反复地看同样内容的书也是没劲的。

　　若是再进一步，看看高端的三角函数啥的，怕还是会引起轰动。

　　邓秋离，双眼四百度，妈妈说长大后都不敢做手术。

　　邓秋离想，也许找几个闺蜜吧？可同学们看到她像看到怪物一样，都抱着敬而远之的态度。

　　无聊无聊无聊，打坐入定吧，无聊透顶啊

　　二分二厘

　　邓秋离偶然看到一则资料，当你在睡前构思一个简单场景，反复回想，连续几天，你就可能梦到它。

　　这个好，有点神棍，比较神奇，可能做到。

　　邓秋离设计了一个水泥墙小屋，长宽各一米，高两米，还有一盏白炽灯。

　　于是她每天睡前都在回想那小屋的结构，水泥墙触感，白炽灯的光……好几天了没成功，不过生活有趣多了！

　　三分一厘

　　不知过去了多久，邓秋离沉醉与数学，以及庞大的计算机内核中。

　　每天都要听着舒缓的歌才能睡得着。

　　这天她看到了一首魔性的歌，鬼魅般的声音，整首歌回荡着相同的旋律，他就这样睡着了。

　　睡梦中，她梦到自己是福尔摩斯。这世界里回响着那鬼魅般的歌声，几分钟一句。

　　那天她惊醒了，眼中满是难以置信，睡梦中的时间真的会慢很多吗？

　　三分二厘

　　高中了，班上开始有学生逐渐意识到，人类的思想分为表层意识、潜意识、深层记忆。

　　邓秋离听说了，忽然觉得这个世界很飘摇。与自己形影不离的数学、物理、其他科学，居然没有提到哪怕一点心理学的知识。

　　好像自己这几年来昼夜学习全走错了。

　　她了解到，人的表层意识是有存在时间的，短期记忆时没提到，这些意识就会存入深层记忆中，等待相关记忆激活时联想到相关内容。

　　她暂时还没有告诉任何人，这个信息与其他事物有无限多的关联，在表层意识的不断遗忘与激活下，就会引发不同的想法。

　　比如电脑内存与硬盘的关系类似于此，就会造成有一群人认为她是玩电脑沉迷了。

　　说不是他们就会认为是在袒护真正沉迷的人……

　　比如这些平常大家都不说，就会出现一群人认为这是疯言疯语。

　　说不是就会出现一群人认为所有精神疾病患者都是无辜的……

　　比如这样子一介绍就会出现一群人认为这些是煽动……

　　这些都是表层意识不断遗忘与激活形成的判断。

　　现代社会正在脱离丛林法则，合作是新的道路。

　　表层意识的容量大，持续时间长，能让这个人对于外界环境的判断更准确，能让这个人的生活更加稳定，不易受到误导。

　　三分三厘

　　踏入构建梦境的世界之后，邓秋离意识到睡眠与意识有很大的关联。

　　睡觉有时做梦，做梦内容与最近的记忆有关联，梦境内事物间关联不强，逻辑不强，判断迟缓，不易记忆。

　　从逻辑上判断，这是因为最近的记忆正在被弱关联地提取出来，放到熟睡的意识中。

　　这很可能是做梦的基本原理。

　　为什么睡觉时，人脑要将最近的记忆提取出来？

　　又走到死胡同了。 



'''







'''

/fst/sky/moon-river/Zero. About/Lock Database's Power Grid.txt



　　洛克通过制造极为隐秘的加密元器件，以交流电网为主体，控制着全世界约1%的人口。



'''







'''

/fst/sky/moon-river/Zero. About/The Rose Cross.txt



　　Helen

　　我还依稀记得那小巷里的风景，有和蔼的摆地摊的人，很多和我一般年纪，却又和我完全不同。

　　如今那里已经空了，我也没有时间再去想这些事情。

　　只是不经意间回想那画面，却已至此。

　　我的王啊，我为你准备了皇冠，你却不想要。

　　那么，我就自己戴上它。

　　我是海伦。

　　First.

　　这是一间有些年头的酒馆，木地板上布满了黑色斑点。

　　屋顶吊着老旧的铁制烛台，那火光微微亮着，房间里一片昏黄。

　　大厅的正中间，一群衣着华贵的少男少女正围坐着。

　　桌子上放着一杯酒，它有着葡萄酒般的性质，却更加剔透明亮。

　　鲜艳的暗金色，让那高脚杯好像盛了一碗火。

　　其中一个高个子男孩很开朗，他正摩拳擦掌想要试试眼前那杯酒。

　　他身旁是一个个子很小的男孩，他看上去很担心，生怕自己品尝不到了，可却害羞地不敢说话。

　　火酒，来自远方的部落，每一杯，都价值连城。

　　这一桌小公子们，攒够了零花钱，才换来一杯。

　　于是他们才来到城中最老派的乌鸦酒馆，品尝一下这神的贡品。

　　高个子的少年名叫斯特拉，矮一点男孩是特伦。

　　海伦浅浅地笑了，看着他们，她姣好的脸颊像海面倒映的明月，让人难忘。

　　戴思雅坐在她身边，看上去很紧张。

　　别的女孩眼里都多多少少有些秘密，那种处心积虑想要掩埋的秘密。

　　谁没有秘密呢，只是海伦更加天衣无缝。

　　女孩们都想着怎样培养男孩子们，是的，你要怎样面对他们，让他们变得更好。

　　Second.

　　世界上有无数关于神的书籍。

　　西方世界的伊国主要有两本，一本是《神典》，这本书记载了世界的一切，是一本从开始到结束的书，一切的基础，所有公民都会阅读。

　　另一本则很少有人知道，名为《恩泽》，这是心灵澄澈的修女才能领悟的。

　　其实，读过这本书的，全世界只有数十人而已，而且很多只是一面之缘。

　　其实呢，海伦自己就读过，而且背得滚瓜烂熟。

　　重要的部分来了，这两本书有很多种读法，按照一般小说的思路来读，它其实跟前一本差不多，是以神话表达了善良和勇敢这些高尚的品格。

　　第二种读法是要很多乡绅才懂得的了，故事里出现的方法，它们是重点。

　　比如捆绑其实是代表限制，比如忽悠或者装作不知道强行破坏某些关键环节。

　　比如复活的力量代指东山再起，或是使人鼓起信心的方法，惩罚恶人的力量代表使他们不能得逞最终失败的方法。

　　再比如书中说恶魔发现了圣子，并试图杀死他，圣子利用一块石头骗过了恶魔，并召集英雄杀死了恶魔。

　　在第一层意思中，这代表了勇敢善良的品质；在第二层中，这代表当你这些方法被发现后，用某种方法迷惑坏人，再召集同伴，灭了他。

　　这样，乡绅们就能用这些方法自保，让社会稳定下来。

　　世人以为到这里就结束了。

　　其实《恩泽》还有很多的读法，精密得仿佛某种机械。

　　这才是它有别于前一本的地方，它们生来不同。

　　而海伦，只不过是刚刚涉猎。

　　Third.

　　一切都结束了，夜幕降临。

　　少爷、公主们都乘着马车回去了，海伦站在阴影里，喝下一杯清澈透明的美酒。

　　“海伦小姐，您今晚也要去教堂吧，圣母大人会等侯您的。”一位修女说。

　　“是啊。”海伦的语气很认真。

　　她每天只睡三四个小时，据说这种睡眠方法是古代一位学者发明的，这在《秘典》中被描述为“亚当夏娃偷吃善恶树上的苹果”。

　　这种方法在一些旁支典籍中也有记载，比如希腊神话中的金苹果。

　　马车踏上熟悉的白沙路，海伦知道，自己到达目的地了，她得转移自己的注意力，把这些想法放到意识底层，不引起别人的注意。

　　这种方法在东方被以“冥想”、“道法自然”隐喻过。 



'''







'''

/fst/sky/moon-river/Zero. About/Daddy's Legend.txt



　　零

　　老爹老了，脸上的皱纹像一条条裂缝。

　　老爹身体不好，年轻时熬夜太多，双眼布满血丝，胃也不好。

　　老爹老了，容易被豺狼盯上。可能被年轻的流氓侃晕，可能被作为韩凌枫的软肋要挟，可韩凌枫会照顾他。

　　可谁能留得住时间？我们终将回到一切的开端。

　　老爹的结石发了，看上去快不行了，韩凌枫卖掉了房产证。

　　他查着字典，联系上了美国人体冷冻基金，这是他唯一能想到的办法了。

　　最后他谈成了，要把老爹送到美国去，老爹不肯走，韩凌枫麻醉了老爹，并且答应他，他不会让家人都离开的，他们一家都会活下去。

　　老爹被送到美国，接受全身冷冻。

　　韩凌枫忽然觉得一切都很很飘摇，现在老爹的生命全靠一份合同，一个招牌，一个承诺。 



'''







'''

/fst/sky/moon-river/Zero. About/The Craftsman.txt



　　一

　　我叫程晨，我爸是铁匠，为军队制造武器。

　　我妈则是佣人……这也没啥好说的，我只是芸芸众生里最平凡的那一类，所以我每天都把自己的事情做到最好，我相信我已经成为了一个合格的老百姓，这也是唯一能让我满意的事。

　　十多岁时，我结了婚，我的妻子来自外省，因闹饥荒嫁到我家，勤劳努力，父母对儿媳妇也比较满意。

　　二十多岁后，我也很顺利地接手了父亲的工作，为军队打造兵器。

　　我觉得我还是蛮靠得住的，必要时发下火，还是能承受大量的工作。

　　直到有一天，我受到了来自本地高官的排挤。

　　我很气愤，但也无路可走了，我干什么都不对，于是我开始潜心钻研铁匠技术。

　　现在想来，我不用那么着急——我是一把手，这种程度的排挤不会把我怎样，因为没人能接替我的工作了，我只需要保证我的工作。

　　可我不知道，我去研究铁匠了，军队的工作也荒废了，上面以为我变坏了，不再用我。

　　我也就成了浪人铁匠，父亲不再见我。

　　二

　　一天夜里，我正在酒馆喝酒。

　　江城夜里灯火通明，火光在江面蜿蜒。

　　我已经享受整整了一年江城的慵懒繁华，家产已经被我败光，还有几个月我就得搬回老家了。

　　这时，我注意到一个年轻人。

　　他的黑发很短，斜搭在眼前，皮肤很白很干净，看上去竟然比歌楼里的姑娘们还要漂亮。

　　“老师傅，您还做铁匠吗？”他径直走过来。

　　说到铁匠两个字我就气得喘不上来，而且我完全不认识他。

　　“你没毛病吧？”我皱着眉头说。

　　他竟然看着我，他的眼神在烛光里显得通透明亮，洞悉一切。 



'''







'''

/fst/sky/moon-river/Zero. About/14.12 to 16.06.txt



　　THISWINTER

　　创世更新时间：2014-12-1313:21:57字数：375

　　整个书桌乱得一团糟，我觉得以后可能有用的东西我都留着，导致两平方的平面上好像迷宫一样，还有发生危险的可能。

　　最近的生活像是在夏天的时候呆在飘摇大雨里的面包车上，四周都是嘈杂声，有花了眼的轿车按着喇叭使劲地尖声吼，也有雨中的行人在疯跑，自己在满是雾气和水滴的玻璃窗里，不知道下一刻会遇到什么。像这样的天气，要出去的人是个难事，要回家的人也是要遇到诸多的困难，你甚至不能出门去找你爱的人！这样的瓢泼的暴雨，第二天就会天晴了吧？

　　天晴了我就可以去街上走，去工作、拿工资，去买吃的，去找我喜欢的人。心里的雨天下得比夏天的雨还要大。

　　现实是，冷空气入境，寒冷的天气导致空中水蒸气含量少，天气冷得不像话但是一点雨都没有，风刮在脸上生疼，这是要席卷你的水分。

　　黑夜像火焰一样蔓延开来，笼罩着所有的树，无月，只有大地上寒冷的灯光。

　　还没有雪——雪是受冻者的灵魂。

　　这个冬天好冷。

　　冷啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊

　　笔记

　　创世更新时间：2014-12-2114:06:28字数：1177

　　2014-12-21：第一章，增加了韩凌枫的昏迷状况。第二章，韩凌枫苏醒后反应不合逻辑，稍加内容。

　　2015-1-1:第一章引子部分有逻辑错误，逃入荒野的一队人，首先面临的最大困难就是饥饿。

　　2015-1-2：第一、二章中有多处猪脚名打错，已经修改。第三章开头不太扣情节，还没有想到应该如何修改；后文韩、维两人的交谈中，抓住谈话走向的人应该是老练冷静的维克多，已修改。

　　2015-1-5：第四章由“突变”更名为“四面楚歌”。情节渐渐趋于丰满和复杂，出现种类更多、数量更多的错误。后来又修改了标点符号和一些“镜头”指向的细节。

　　2015-1-10：第一章引子中增加了少量细节，总觉得不够友好，不能吸引人。

　　2015-1-12：第四章中为韩凌枫增添了少量心理活动。（PS今天有人去世了，天气太冷了）

　　2015-1-19：第二章中韩凌枫的对白太那啥……太女神了，修改之。

　　2015-1-29：刚发的第五章中修改了一些形容词

　　2015-1-22：第四章中增加了少量细节，增加了韩凌枫的心理活动，可以说能突出他的性格和心理状态。

　　2015-1-25：第三、四章中增加了少量细节。

　　2015-1-27：第二章中增加了细节。因为人对自己未知的东西总有一些奇怪的不熟悉感，这点在之前韩凌枫没有表现出来。第一章不太友好的感觉，不知道读者会怎么想，我自己读来都是很乱的感觉，应该重写的，只是之前稍微整理了一下。

　　2015-1-30：调整了第五章中建军的人设，建军是配角，而且他是有一些秘密的人，所以调低了他的存在感，他应该是那种幽灵一般的天才人物。

　　2015-1-31：修改了第五章中戴思雅·伊丽莎白的人设，她是一个皇室边缘血亲，究竟是不是算作贵族很难讲，所以她才不受重视，才能跑出来。

　　2015-2-16：第二章有少量修改。

　　2015-3-17：修改第二章中韩凌枫与Victor的对话，因为韩凌枫是那种思路不太清晰的野孩子一般的人，所以说话快、说话冲且不经大脑思考，在这种突然的情况下他保持不了那种女神般的气质。总是觉得想写的内容不完美，不敢面对什么的……最近世界观有些改变，感觉整个人眼界和以前不太一样了，感悟也很多；发展之前的章节中有很多的缺点，我应该更加用功才是啊，所以……希望接下来的章节会让看过的人觉得喜欢。

　　2015-3-19：第一章与第四章中韩凌枫的设定有所冲突，韩凌枫是刚刚满了十八岁，修改之。

　　2015-3-20：修改了第五章……一个错别字。

　　2015-3-29：将第一章中的引子部分去掉了，准备在之后由插叙的方式放出来。

　　2015-4-18：思考后还是把第一章的引子给加上去了，增删了一些细节。一直觉得不妥的第四章也略有增加。本想把这本书无限制地写下去，但是最近想到了一个道理：那就是小说不一定要写多长，但是要写到自己满意为止，尽到自己的最大努力那样才能无愧于心。

　　第六章中修改了部分细节。

　　致亲爱哒读者

　　创世更新时间：2015-01-0517:17:18字数：362

　　我不知道有多少人看了我的小说（耶！），但是总之我自己是不可能点两百多下的啦。

　　最近觉得自己思路越来越开阔，越来越能把一个世界完整、有序地展示出来，就是细节上往往出现会出现一些问题，我还要学会修改！

　　最近看了一些小说写得很不错，第一时间就抓住了我的注意力。

　　《无限进化之最强王者》末日之后的景象描写得就像我自己亲身体验一样！

　　《地球OL》一口气看了三十来万字，感觉很好！

　　同时，对于我自己的小说，我也有一些发现和问题！

　　随着剧情渐渐丰满和复杂，我感到自己驾驭文字的功力还不够，常常出现错误还要多次修改，而且修改的次数和涉及的章节往往比较多。

　　有一瞬间太猴急，写出来的剧情走向就不合逻辑，就感觉人物不像个成年人啊啊

　　我还有不短的路要走啊啊，我还要多多练习，故事架构的方法，人物塑造的方法什么的，能不能帮到我呢？

　　一打字就走火……总之，很感谢大家！

　　成功上传封面！

　　创世更新时间：2015-04-2213:58:29字数：142

　　熬了一通宵终于搞出了这张图来，眼睛痛痛痛！！！这样下去会不会成高度近视啊啊啊啊！！！周日上传后果然很快就有了。虽然是一夜辛勤的结晶，不过奈何本人技法有限，目前来讲能做到这个程度自己还是觉得惊喜的。

　　不过……我每次看到我那不协调的色调就觉得有点堵，希望大家见谅……啊。不过我会继续努力的！

　　遭遇大质量天体

　　创世更新时间：2015-05-2713:52:13字数：117

　　最近好像情绪比较激动啥的，晚上睡不着白天做事也很烦躁，感觉好像遭遇到了某些莫名的事情，自由自在的感觉已经找不到了，我不想太监，也不愿中断我的情感探险，写这本书的想法是我狠无聊的时候想到的，在每个夜晚它都在慢慢地长大，我是舍不得放手的！

　　我很难过

　　创世更新时间：2015-10-1623:57:18字数：285

　　今天仅需不太稳定，做了一些很傻的蠢事。

　　我做了一些很傻的事，说了一些很傻的话，我不帅，我很傻，那样的话认真起来就会很好笑吧？

　　韩凌枫已经遇到朱梓了，会有什么样的事发生呢？

　　维克多成了肩负责任的人了吧，他会始终走下去。

　　邓秋离的心冷得像座冰雕。

　　橘子男又发生意外了。

　　谁知道老涛在想什么…

　　你们会成功吗，会和我一起走完这段路吗？

　　夜幕又下来了，出奇的安静。明知道很伤眼睛，却一点也不在乎。若是始终这样，这双眼睛看不到真正的光，它也会很失落的吧。这个男孩又会掐掉那些歌，尽管它们是被很用心地写出来的，男孩也会一个人发呆。

　　我真的很难过，想乘着晚风，乘着黄昏下那些鸽子的尾羽，到更加遥远的国度。

　　你看到那玄幻的世界了吗

　　创世更新时间：2015-11-0713:43:50字数：363

　　这书似乎与玄幻一点关系都没有，一想到这个我连头都抬不起来，总是在想自己是不是很不负责任。

　　既然选了玄幻，却不好好钻研，连玄幻是啥都不知道，已经开头了……

　　不过也没规定玄幻怎么写啊……

　　那你为啥不写科幻……

　　额，我确实要写玄幻的，可是……

　　玄幻究竟是什么？

　　韩凌枫只是个普普通通的少年，每天玩手机玩游戏，有堆成山的作业，他怎么会知道玄幻是什么呢？

　　我也不知道玄幻是什么，可是它一定是存在的。

　　我很早就看了玄幻的小说，主人公从练外功到渡雷劫开始修真，最后成仙，甚至超脱世界，成为无上的存在。

　　我自然知道这是幻想…

　　（把小说当成现实八成是走火入魔了……）

　　可小说里的仙山云岛是什么？灵力仙气又是什么？倘若只是普普通通的幻想，会让人以百万字去诠释吗？

　　我相信命运在冥冥之中操控着你，也相信这世上没有做不成的事。

　　我知道有一天我一定会得到一个答案的，韩凌枫也是。

　　写故事还是写小说

　　创世更新时间：2015-11-2200:43:36字数：412

　　我一直当作故事来看，后来我开始幻想，开始构思小说，开始写小说，都是把小说当作故事的。

　　老师讲小说是一种虚构情节的文学体裁。

　　我开始写小说了，发现小说应该属于故事，但故事并不都能被称作小说。就像父母教会我们说话，识物，辩是非，我们在看书，游戏，交谈时也是在认识这个世界，我们无时无刻不在积累经验，我们随时都在学习。

　　所以我们看到的，听到的，都会带给我们一些记忆，一些经验，一些习惯，不好的故事可能会带来血腥的快感，暴力的性格。

　　作为一个作者，能随意地发文，然后全世界都可以看到你写的东西，你若放纵自己的物欲，追寻快感，是会造成一些后果的。

　　小说并不完全等同于故事，它带来的是好的精神品质，应该是作者从生活中积累来的。这些文字应该经过细心的雕琢，精心准备，是作者所珍惜的。

　　因为你的思想会传播给看到它们、听到它们的人，它们是否会唤醒坚强、勤劳、正义？会不会传播着虚伪和自私？我又能否克服它们呢？

　　我想，循着细心、谦逊、勤奋的路子应该不会错的。

　　白天开着黑夜的灯

　　创世更新时间：2016-01-0703:23:33字数：514

　　最近我变得很不同了。

　　我读了《乔布斯传》，我开始学着他一样画电路图，我听摇滚画速写，我想唱却无能为力，画得像个小孩子一样；我试着节食，甚至像他一样绝食，我在厕所吐得稀里哗啦，好像整个人的胃都搅在一起了，可我并不觉得痛苦。

　　这世上有许多事，比这，要更加痛苦的多。

　　可我发现我还是那个发泄情绪的小孩子啊，我想做的事还在那里好好的呆着，我甚至连自己都找不到了，我忘了韩凌枫的感受，我丢掉了那个孤单的，在夜里玩单调游戏的男孩。

　　他的梦想，他的痛苦，他喜欢的女孩，我都想不起了。

　　我想我需要再看一遍最初的第一章，可我发现我竟然删掉了最初引子的大部分，那些事被我彻底地遗忘了。这与被女孩们删掉的感觉不同，我一点没有失落，我只是不知道那时候我怎么了，那个男孩，是怎么能够多么多年发呆，熬夜，沉浸在小说或者无趣的老游戏里，天天想着女孩，那么多年啊！

　　那么多年啊……

　　那是白天开着黑色的灯，忍受着自闭少年们奇怪的思绪而过来的，我怎么可以忘掉他。

　　他还在天台，在广场，与同样饥渴的人，找着笑话，麻醉自己的灵魂。

　　那些画面都变成了快镜头，可永远都不会停止，后来一段回忆就变成了一幅画，你把它从心里剥出来，挂在墙上，你的心就空了。

　　那幅画的名字，就叫《白天开着黑夜的灯》。

　　明月

　　创世更新时间：2016-01-2001:46:35字数：160

　　一

　　这是一片寂寥的夜空，我浮动在明月之下，冷光跨过千万光年，与我遥望。

　　我什么都没有，连形体都没有。

　　我从不担心死亡，就算某天真死了，又能如何？

　　活着对我来说没有意义。

　　但是有天，我看到了头顶的月。

　　那是什么？我很想知道。

　　二

　　夜空是巨石，拖着我往下坠。

　　整个世界都在阻碍着我。

　　我时而停止，时而更加疯狂地向上而去。

　　直到某天，我看到她的脸。

　　ASoul

　　创世更新时间：2016-04-2801:26:07字数：262

　　我觉得韩凌枫是有灵魂的，因为他和我很像，我把我的“灵魂”给他了，他就像我跑到那个世界里去了。

　　可我又不是女孩，我怎么让朱梓变成真的？

　　到目前为止，韩凌枫和朱梓只是一个人和一个胡思乱想的角色相遇了，他们一起聊天走路解谜。只是感觉比较好，但他们还没有真正契合，他们还没接纳彼此成为生命中不可割舍的一部分。

　　可你不能让一个人和一个幻想契合吧，朱梓得活起来。

　　话说想到这里我又迷茫了，我所崇拜的大神话都很少，他们是没时间说？还是其实这样不好？

　　这些感悟和目标会不会成为这本书的一部分，以至于使正文不完整了？我想，就算不好，我也得去弄明白原因。 



'''







'''

/fst/sky/moon-river/Zero. About/Dude Dragon.txt



　　一

　　中午了，阳光毫无遮拦地照进了房间，阿龙醒来了。

　　他懒散地去刷牙洗脸，看着那些牙刷和杯子。

　　阿龙叼着烟，在这里过了两年半，他渐渐发现这屋里还有另一个人。

　　是的，你的屋里还有另一个人，尽管你完全不记得他，也不知道他是谁。

　　日子一天天过去，渐渐地你能发现他留下的痕迹，他的性格和小习惯。

　　是的，这屋里还有另一个人。

　　二

　　下午，阿龙会去一家饭馆传菜，那是一家热热闹闹的大餐馆，下午特别忙。

　　上午没什么事，但他觉得无聊，于是就打半天工。

　　厨师长五大三粗的，他总是埋着头不说话，收了工才闲聊几句。

　　附近街道旁馆子特多，压力也挺大。

　　有一天他发现一个女孩，留着马尾辫，在阳光下散发着柔和的光。

　　挺漂亮的，他想着。

　　他发现女孩每天也会走过这条街，他们总是能擦肩而过。

　　她就好像电影里的那样美丽。

　　她身边有一群朋友，都有着相同的气质。

　　阿龙想着我要专一才行。

　　她有时站中间，有时没有，她声音很小，阿龙从来没有听到过她的声音。

　　阿龙烫了头发，发型不好他不敢出门。

　　有时阿龙没遇到她，会在那里抽支烟等一会儿。

　　有时等到她他就现在很远的地方，用余光看着她；有时等不到，他就会觉得失落，然后离开。

　　三

　　在城市的一角生活，喜欢着一个女孩，一切平凡又简单。

　　阿龙从没想过去认识她，他相信自己主动事情就会搞砸。

　　所以从远处看着她，就很好了。

　　有天夜里，他没心情玩游戏，于是抽着烟，逛空间。

　　他看到附近的人里有个不一样的扣扣，也是网络头像，也是挺有个性的昵称，可什么地方不一样。

　　阿龙加了好友，聊了一会儿，对方很有趣。

　　她叫林海清，说话很可爱的样子。

　　他开始翻她的空间，女孩很有文采，好友很多，赞很多。

　　然后他看到了她的照片，姣好的脸颊，瀑布样的长发。

　　竟然是她！

　　竟然是她！

　　阿龙双手颤抖着，翻开之前的对话，她很坦诚，很有兴趣的样子。

　　她喜欢我吗？

　　她喜欢我吗？

　　她有点喜欢我吧？

　　这世上最幸福的事就是你喜欢的人，她也喜欢你。

　　难以言表。

　　四

　　街边餐馆都多少有点黑道色彩，只不过很淡。

　　关于女孩

　　十年了，她穿梭在情场，他来过三次。

　　第一次很简单，他没有看到那些隐藏着的故事。

　　第二次有些麻烦，他什么都不要，这很麻烦。

　　我激怒了他，他满口脏话，被赶走了。

　　第三次…他学会了造炸弹，包括熔炼金属，配置火药。

　　…………

　　还是打110把他带走吧。

　　终

　　双溪镇很美，秋季，一片湖倒映着泛黄的枫树林，醉倒了无数摄影师。

　　不过最近，有游客在林中发现了一具被掩埋的女孩尸体。

　　女孩尸体已经开始腐化，是两天前附近城市失踪的女孩，同一天，一打工男子阿龙失踪，警方初步判定为情杀……

　　有极少数网友发现，凶手是流着泪，哭泣着行凶的。 



'''







'''

/fst/sky/moon-river/Zero. About/The Orchid.txt



    (《兰·密卷》后来被维克多写成了一篇论文，名为《人类行为基础》，提交给教授时被有意无意地翻漏了。)
　　道
　　原意是道路，在这里它的引申意为规律。
　　道贯穿大千世界，大到宇宙星辰，小到尘埃芥子，都蕴含着道。
　　天
　　人力所不能及的东西，比如道？
　　(且认为道是永恒不变的)
　　地
　　人力能及的东西，比如物质。
　　人
　　且认为人是一个物质系统。
　　。反应：
　　这个系统能感知，然后进行一系列反应，比如“思考”。
　　这个系统能通过记忆，而学习，而成长。
　　。优胜略汰：
　　能保持稳定，且能及时通过繁殖，更新基因的生命被保留下来。
　　。自利：
　　生命做对自己好的事，使系统更加稳定。
　　(在天地的基础上)
　　自利使系统更加稳定，它通过优胜略汰被保留了下来。
　　自利和繁殖，能满足优胜略汰，是几十亿年来生命进化的基础。
　　(且认为人类是自然进化出来的)
　　。忆，识
　　在解析思路时，初学者会因为表层意识存在的时间过短，遗忘重要细节，造成错误判断。
　　以及，深层记忆中没有相关资料，临时思考造成表层意识占用，加速表层意识的遗忘。
　　由表层意识的稳定性问题可以形成大规模欺骗。
　　这种武器至少存在了上亿年。 



'''







'''

/fst/sky/moon-river/Zero. About/The Lock.txt





　　（有关洛克的正面记录带有黑暗色彩，只有勤劳踏实才能带来安稳的生活，切记）

　　黑铁

　　一道尾迹在天空中出现，直奔向一座安静的城市。

　　就在它即将消失在地平线时，刹那，璀璨耀眼的光芒席卷了这个世界，随后极端恐怖的热浪摧毁了一切。

　　1945年8月6日，广岛，被夷为平地。

　　这是一个像触了电似的，满头白发的德国老头，他刚刚关上电视，关于广岛原子弹爆炸的报道戛然而止了。

　　爱因斯坦家乱得出奇，各种资料衣物到处都是，这个老头看上去很疲惫，慢慢地走到他同样乱糟糟的床铺前，躺下了，他就随手拉来毯子的一角，蜷缩着睡着了。

　　这位老科学家已经举世闻名，可他家里空荡荡的。

　　不知过了多久，一个男人无声无息地走到他身边，轻轻地剪下了一截头发。

　　他以口型念着：“阿尔伯特·爱因斯坦，我们得到你了。”

　　黑暗中一扇门被打开，一个人说：“别去生物区就好。”

　　那人哼哼，走进了那扇标有“生物技术区”的铁门，就像个精神病院。

　　1945年8月6日，洛克得到了爱因斯坦的基因，他是这个组织得到的第一份真正的天才的基因。

　　永生

　　有希望达成永生的技术有许多种，很多是相当残忍的。

　　一器官移植。

　　二改写衰老基因。

　　三培养新细胞，用纳米机器人换掉衰老细胞。

　　四人体机械化。 



'''







'''

/fst/sky/moon-river/Zero. About/Lock Database's Centrol Host.txt



 维克多小心地打开那台笔记本电脑，以防有什么保护措施。

　　它的外壳以黑色金属铸造，看上去能防导弹。

　　橘子男戴着头盔说:“还是我来吧。”

　　少有的，这次维克多点点头，于是，穿着一身护具的橘子男上了。

　　安静。

　　橘子男看着漆黑的屏幕，没有背光灯的踪迹，他以为还没通电。

　　忽然，屏幕上出现了一行绿色文字。

　　“启动预案307…”

　　橘子男一看启动了预案，心中一紧，随后又放松下来。

　　保护措施一般被称为“紧急XX”，“预案”一般是临时计划的。

　　果然，屏幕上出现了接入的标志。

　　“输入你最在意的事。”

　　我去，密码还是出现了，这下不好办了，如果这电脑确定面前的人不是它所等待的，很可能就会自毁。



'''







'''

/fst/sky/moon-river/Zero. About/Happy Single Day.txt



    一、韩凌枫
　　时值二零一五年九月，极阳。
　　今天的太阳出奇地大，阳台上的一束嫩芽焉巴着，看那有些蜷曲的小叶子，似乎也快要沦为她脚底碎黄中的一员了。
　　韩凌枫的就花盆里生活着各种各样的幼苗，不过一直很努力的南瓜已经死了，土豆没事，苹果的小叶子上有几个洞，不过似乎没有大碍，也不知道怎么回事，反正经常莫名其妙地死了就是了，韩凌枫看到那颗挺立着的小柠檬也快不行了，拿漱口的杯子，在厨房接了一杯水，灌了下去。
　　最近无聊到爆，韩凌枫试着种了一些植物，若是以后找不到工作，不至于饿死。
　　韩凌枫觉得，怎样都好，别跟人打交道，谁知道会发生什么莫名其妙的事。
　　他快读大学了，不是很出名。
　　打开手机漫无目的地翻看，屏幕上端跳出一则新闻来，标题是《2020年光棍危机》。那就像碳酸糖投入了水中，快速地冒出泡泡，然后韩凌枫陷入了巨大的恐慌。
　　不能再这样颓废下去了，是时候做点什么了！
　　二、据守！
　　他很少关心别人住在哪儿，除了顾小曼。
　　他以前帮顾小曼复印过报纸，虽说那次他差点死于车祸，不过也算是印象深刻，别的韩凌枫不太清楚，但他总觉得那次是很奇怪啊，那么突然地让自己送报纸，又不说明来意，不过他倒是很乐意。
　　这些日子，父母每天早出晚归，他没事可做时，就玩游戏、看电影，再到看电视剧，已经无聊透了，生物钟也完全打乱。
　　恍惚地走到街上，韩凌枫想，干脆去书城吧，在那些书海中找一本清淡一点的，若是很快就觉得无聊了，随时也可以回来，再不去街上瞎逛，买只小仓鼠啥的……
　　然后他就路过了那个岔路口，顾小曼家在里边。
　　如今他每次路过这里，都会扭头看看，并伴随着一阵恍惚。
　　这丫头没问题吧？整天神神叨叨的……是当初发生了什么事情吗？否则她会发那种神经？
　　她的妈妈骂了她么？她有什么样的苦衷吗？她其实也对自己的缺点感到无力吗…就像曾经的自己那样，那样的无助。
　　韩凌枫忽然不想去书店了，停在人行道上，不知道怎么办才好。
　　他看到那边路口有个小吃摊，摊主是个瘦削的中年人，有着点点花白的头发。
　　今天，自己就在这里呆吧。
　　三、时光如白马
　　其实自己在那儿白坐着，是很不好意思的，于是韩凌枫从包里摸了几张皱巴巴的零钱，向摊主要了点东西，摊主他丝毫没有不适的意思，于是韩凌枫也能心安理得地呆在那里了。
　　正午的太阳有些小了，看上去光照很适中，韩凌枫塞着耳麦听音乐。
　　自己，做事也不够好啊。
　　如果有成绩比你更好的，能力也比你强的人，有比你帅的，说话也比你动听的人，那为什么不去喜欢那个人呢？如果他很爱你，对你好，你又为何不与他相爱呢？
　　也许，根本的问题还是在自己身上吧，小时候也是这么想的，至少韩凌枫从小到大还没看到过比自己更着急的人……
　　韩凌枫闭上眼睛，习惯地用手和头发遮住半张脸，看上去像是石头做的。
　　时光如白马，一去不复返；时光如白发，噬咬着你的心。
　　四、日落
　　韩凌枫不知道自己能带到多久，电量过低时他关了手机，这是他的一个习惯，这样还有点去打电话救急。
　　期间摊主问他是大学生了吧，韩凌枫说自己高三了。
　　不想说话，不想动，不过肾还是得珍惜的。
　　后来天色渐渐变得有些橘黄，中年人收了摊，很快马路边只剩下个水泥柱，还有那些石椅，整个街道在初生的夕阳里飘晃着。
　　再有一个多小时，天就黑了，韩凌枫是不会在外边呆太久的。
　　还是回去吧，继续过自己的生活。
　　顾小曼从小就学钢琴，这也是她的特长啊，说不定以后她会非常的出名啊，成为像那些明星一样的人，这样韩凌枫每次看到她就回很难受。但是像她那样坏脾气的女孩，也许会很孤单呢，那么自己就去安慰她。
　　韩凌枫想着，表情一片严肃。
　　可就在这时，在那拐角处，有个样子很眼熟的漂亮女孩出现了，韩凌枫皱着眉头，然后差点没被吓死，那是她！
　　顾，小，蔓！
　　她比以前漂亮了很多，很像那些遥远的女神了，穿衣服也很时尚。
　　她打着电话，向马路的那一头走去了。
　　韩凌枫看看自己的衣服，马上把头别了过去，冷汗直冒。
　　又突然出现了，还是逃跑吧，自己已经很累了。
　　可她拿着电话的样子，却又有着一种神秘的力量。
　　五、淬火
　　韩凌枫最后还是没有直接走掉，他跟在后边，想着等到自己准备好了，就突然出现。
　　最后他就看到顾小曼和一个很帅的男生一并走着，吃火锅，逛街。后来天黑了，男孩和女孩挤在人群中买铁板烧，空气里散乱着霓虹灯光，音乐声。
　　在小巷里，雪白的路灯打在漆黑的路面上，在角落里，男孩吻了女孩。
　　韩凌枫就站在阳台外的走廊上，在那盏刺眼的聚光灯后边，没人看得到。
　　韩凌枫看着那两个漂亮的人渐渐地走远了，脸上没有什么表情。
　　半个小时后，韩凌枫回到家，很晚都没有睡着，于是拿起正在充电的手机翻看着。
　　有网友说，虽然现在单身男光棍有三千多万条，不过男子通常都会娶比自己年龄小的女孩的，所以光棍危机不会太糟糕的。



'''







'''

/fst/sky/moon-river/Zero. About/Alex.txt



　　公元1520年

　　阳光透过树叶和薄雾被滤成了细碎的点点金光，森林里高得看不清树叶的藤树几乎覆盖了整个天空，植物的气根从树顶垂下来，在水饱和度很高的空气中贪婪地吸收着水分和阳光。令人困惑的是，每一棵树的树干上都生长着密密麻麻的根须，有的细如年轻男人的胡须，越靠下的却像是真正的根系一样粗壮。

　　这里除了高大的树木，地面几乎没有任何植被覆盖，也是只有深黑色的泥土上散落着稀稀松松的几片枯黄的落叶。宽大的船型叶因失水枯黄地蜷缩起来，已经开始腐烂。

　　如果是皇宫里那些皇家药剂师来到这里，一定会很是惊讶，而后是好奇。地面上是如此的干净，以至于只有少量的落叶和青苔，大地就这样毫无保留地暴露在湿润的空气当中。这代表了这个地方营腐生微生物的活性非常之强，几乎是超人的能力，才能在这么短的时间内腐蚀掉落叶。

　　或者说……这里生活着以落叶为食物的草食动物？

　　远处传来清脆的碎裂声，却是一个看起来很老的中年男人渐渐出现了。

　　他端着黑金色罗盘，身着黑色的华丽贵族服饰，这件衣服太过正式，明显不太适合丛林处。虽然衣服的主人已经很小心，但还是弄脏了，那些贵气英气多被禁锢在灰尘之下，看上去有些尴尬、不符场合。

　　他秉承了西班牙人一贯的乐观，虽然衣着略显难堪，但是整个人虎虎生风有精神。

　　叶尖摩擦发出沙沙的响声，这人头也不回，只是大声说：“孩子！别乱吃东西。”

　　“扑通”！一声落在男人身后，重物坠地的闷响传来，周围的树木都在振动。

　　只见一个瘦猴一般的生物扭动着从地上爬了起来，没事似的给男人看它手里的东西。这一幕诡异极了，像是一只强壮的猴子努力挺直腰杆要把它手里的东西凑到那人眼前。

　　原来是一只绿色花纹的蜘蛛，已经被捏得口吐绿水，猴子的脸上咧开了一个绽放的笑容。

　　那分明又是一张人类的脸！

　　“被捏死了。”男人似乎习以为常，粗着嗓子提醒他，比起在船上招呼那些水手时不知温柔到哪里去了。

　　他们整个上午都在赶路，最后来到了一座小山顶，山顶上长满了青草，却再也没有任何树木。

　　猴子还是在他的身后，此刻却丝毫感受不到男人身上的某种庄严的情绪，自顾自地拔着草根。

　　“埃里克森，就是这里了，你可要记好了这个地方。”中年人凝视着四周的森林，在这里似乎有一条林与草的界线。

　　小猴子玩着草根，中年男人沉思着。这阳光太耀眼了，他们的影子像是倒在地上的黑染料，异常地鲜明，带着一种恍惚的不真实感。 



'''







'''

/fst/sky/moon-river/Zero. About/The Circle Evil.txt



　　(内容来自古籍《兰》)

　　前言

　　世界已轮回无数代，我不知道自己是在什么位置，时光沿着宇宙长河流淌，过去已不可寻。

　　正文

　　第一纪，勇士

　　宁静的溪水缓缓流淌着，远处有一座尖塔似的高山，山背披着白雪，冰水融化成了这河。

　　枯黄斑点的森林把蓝天劈成了裂缝，枯枝败叶落了满地。

　　一个身穿皮革盔甲的男人，坐在溪边的一丛杂草上，怀里抱着这条河，背上背着整片森林和蓝天。

　　这是他这些日子以来找到的唯一一条河，被石子围着，河水很清澈。

　　他决定就呆在这里不走了。

　　还记得少年时，男孩追着老骑士问问题，内容大概是很担心以后自己要死了怎么办。

　　毕竟人总是在避免自己的死亡。 



'''







'''

/fst/sky/moon-river/Zero. About/The Man.txt



    引子
　　“你是谁？”
　　“我是陈宫。”
　　一
　　“那么陈宫先生，这便是我们第一次合作了。”主上说。
　　“好……”陈宫近日染了风寒，肺热，忍不住喷出一坨鼻涕，赶忙用手绢擦去，慌忙应道。
　　主上深吸三口气，才缓过来。
　　二
　　“我TM是陈宫啊，喂！！”
　　三
　　“陈宫？”
　　“啊哈，，那个啥，，我没收到消息阿……喂！真的！！……”



'''







'''

/fst/sky/moon-river/Zero. About/The Siren.txt



　　楔子

　　爱上一个黑帮狂花的结果必然是，你跟她说话得穿戴防弹衣，有足够的掩体及完备的撤离路线。

　　然后蹲在几百米外用话筒喊时，也要随时注意可能的包抄范围。

　　一

　　宋星又悄悄来到预定的地点，猫着腰掏出那把老旧的扩音器，小声地喊到：“我知道你在！你有那么多办法去说一个事！”

　　喊了三遍后，也没有人撤退的动静。

　　正要喊第四遍的时候，走过来一个光头小混混，显然是刚蹲过牢子，他一边说：“哟兄弟你干啥呢？”一边顺势就要过来。

　　宋星机智地注意着身后的情况，并同时与小混混保持着距离。



'''







'''

/fst/sky/moon-river/Zero. About/The Premeditate.txt



    插头一
　　在这城市里有时也会迷路，也会像在树林里一样，遭人捕食。
　　插头二
　　维克多只好挡在橘男身前：“这人傻逼，不要鸟他！”
　　1.0
　　维克多站在栏杆前，浅黄色粉刷的教学楼正好高过那些翠绿的叶子，浸透在蓝天里。微风吹过，它便在阳光下摇曳生辉。
　　一旁忽然冒出个乱糟糟的脑袋，还在啃橘子。
　　“你在干神马？”那人比维克多小一些，正在啃一个橘子。
　　维克多看着那如同杂草一般生长的头发，心中有些不快。他从小就很讨厌自己的头发乱乱的，那会给自己带来不少麻烦，比如羞愧感。
　　这个啃橘子的男子非常活跃，连带着笨手笨脚的毛病，常常嚎叫着撞倒同学的东西，这与细心的维克多完全不同。两人的座位隔得远，维克多长得帅，几乎不说闲话，而橘子男常常被女生欺负。
　　他们是初中同学，却都不太理解对方，橘子男的文科奇差，物理却名列前茅，这让成绩均衡靠前的维克多感到很无奈。
　　维克多看着他啃橘子，说：“我没干什么……”
　　只是夏天的太阳很舒服。
　　橘子男瞪着眼神经质地看着他，心里想着你没事儿会傻站着？
　　维克多被那双直愣愣的眼睛盯得心里发毛，转身回了教室。
　　时间又到了中午，橘子男独自在教学楼外闲逛，忽然看到那个安装的高高的摄像头，脑海里忽然浮现出维克多的身影。
　　维克多那一版一眼的样子，还真像那个点着红光的摄像头啊……
　　维克多这么优秀，物理那些简单的问题居然不会耶，真的太奇怪了。橘子男心里一直很疑惑。
　　当他再次回到教室，维克多正有些过意不去，之前在走廊上的对话不太礼貌。
　　维克多很细心，他总会感到愧疚，再默默地改正它。
　　橘子男回来后看到维克多正静静地看着自己，不禁愣住了。
　　他在干什么？为什么这样看着自己？
　　维克多是很优秀的，是那种德智体美劳兼备的五好学生，应该不会做没有意义的事情啊。
　　他在干什么呢？
　　一向积极的橘子男忽然有些沉默。
　　维克多该不会趁着停电的夜里，悄悄剪开了摄像头的线路，从而可以得到里面的图像吧？
　　维克多常常抚摸着桌子，衣服，独自发呆，他该不会是拆了投影仪和无线电接收器，悄悄地集成到了衣服，甚至是座椅上了吧，橘子男可毫不怀疑他的能力。
　　1.1
　　阳光透过树枝，寝室里安静得像是停滞了。同学们都在抽时间学习，只有橘子男趴在上铺，想着电路的问题。
　　橘子男是个奇葩，他现在高一，对电路非常感兴趣，在这世上奇葩的热情超越一切，特别是那种很聪明的奇葩。
　　机械太过严谨，只有在思考电路的时候，他才觉得自己像是能守住一切。
　　今天他又遇到一个问题，那些问题总是像天险一般难以逾越。
　　这时候他就会吃点东西，到处发神经。
　　寝室的同学已经不鸟他了，他下了床，拿起一个橘子，猫手猫脚走到门口，把头伸出去瞧了瞧。
　　走廊里一个人都没有，橘子男悄悄来到了隔壁寝室。
　　维克多正在桌前奋笔疾书，对橘子男来说已经达到极限的作业量，维克多却一直文理双修，甚至还念了四书五经。
　　橘子男剥开手中的橘子，绕有兴致地看着眼前的干净男孩。
　　维克多的书桌上什么都没放，只有一盆清新的薄荷，在那简洁时尚的瓶子里，放在桌子左上角的黄金分割点上。
　　初中时维克多的书桌还循规蹈矩地整齐摆放着放着许多书，高中时就不是了，他把古典文学和自然科学丢到了书柜里，只留下了一种空灵的美感。
　　维克多看了一眼橘子男，继续干自己的事。
　　“你发神经啊？”
　　“维克多你才发神经啊，你女鬼上身啊？”
　　橘子男心中不爽，想着等我用放大镜做出苹果一号机了再嘲笑你云云。
　　1.2
　　“橘子男在一坨泥巴上刻了个RB国旗也……”
　　“告诉过你了，劳资在做电动机换向器……”
　　1.3
　　“你这是？”长发女生问。
　　“有一天我要开自己的直升机，已经快成功了……”橘子男说，手都在抖。
　　“嗯……那你加油哦……”
　　1.4
　　不要充电用手机。
　　不要充电用手机。
　　不要充电用手机。
　　吓死人了。
　　重要的事情说三遍。
　　不要充电用手机。
　　不要充电用手机。
　　不要充电用手机。
　　维克多思量片刻，在空间里写下这些，希望每个人都能看到，特别是青洒。
　　然后又觉得太吓人了，皱着眉头考虑了一个多小时，犹豫着删掉了它。
　　然后又觉得不得不发，这个东西要是有人还不知道那才是反人类。
　　就在这时，手机上弹出一条消息，青洒刚刚阅读了被删掉的消息。
　　现在已经凌晨了，她还没睡，他们同时登了扣扣，认真地看同一条消息。
　　世事真是奇怪。
　　2.0.1
　　他是法国留学回来的，只差一点点，他就能成为一个著名的生物化学家了。
　　除了化学，他就什么都没有了，他也睡着军绿色的铁架床，枕着干净但色彩不协调的粗布被子。
　　可他的知识能推动整个人类的进步。
　　青平安，他来到这世界是带着某种使命的。
　　2.0.2
　　红唇，苗条的身材，大多时候很安静。她低调，又带着不可抗拒的魔力。
　　她被称为“红桃”，这意味着别人无法完成的事她就可以做到。
　　那是在一个酒吧，舞台前摇晃着缭乱的霓虹灯，他看到一个戴着眼镜的男人。
　　他就像一点快要熄灭的蜡烛，看上去很老，老得快死了。
　　她忽然就走到台前，亲手调了两杯酒，走了过去。
　　开玩笑，她是这里的老板娘。
　　2.0.3
　　她怀了他的孩子。
　　他要求打掉，他不要后代，可她坚持留下孩子。
　　他竟然暴怒了，她失手杀掉了他。
　　她是这里的地头蛇，他只是个异乡人，这事没能惊动派出所。
　　有天夜里，她生下了个女孩，取名叫青洒。
　　3.0
　　“我们的教室在五楼，宿舍在三楼。”维克多看着青洒。
　　“一个人的体重，乘以三楼，足以摧毁人身上任何一块软骨。”
　　“可从来没人注意到。”
　　3.1
　　“如果我们都喜欢同一个女孩怎么办呢？”
　　“那你是王子，我是骑士，人再多点就是骑士团。”
　　“说不定能征服亚欧板块。”
　　3.2
　　这么多年了，还是只能看着她乘车走远。
　　除非你立下生命的誓言。
　　保护她，无论是战火，白骨。
　　一瞬间只觉这世上空无一人，英雄们都死了，他们的后代还在红旗下成长着。
　　3.3
　　此为永别。
　　我以为已经足够清静。
　　最后我还是哭了
　　忽然间，泪如雨下，一塌糊涂。
　　 3.4
　　人一生总是要遇到好多好多的人
　　遇到对的人，人们就相爱，
　　遇到错的人，人们就离开。
　　他们说你会找到你真正爱的人
　　可若是你在身边
　　你就是我最爱的人
　　3.5
　　她好像又不走了，也没有说一句话。
　　煎熬。
　　3.6
　　你的背篼我挑
　　你的网费我烧
　　你的丫头我教
　　3.7
　　…………
　　“你根本不懂！”女子说。
　　“事实上，我懂，我从小体弱多病，扎针几十次，手术应该也有十回，有两回无麻醉，那时我还小，有几回是在精神病院里全麻电疗，病人们前一天都被关在禁闭室里禁水，否则可能就会死人。当时我觉得我可能一生都要呆在那里了。”
　　“我醒来时，连我自己是谁都记不得，而我根本没病，因为我自己就是精神病医生。”
　　“我学法语是因为青洒，我学日语是因为觉得他们人很好，而我学临床是因为我绝不会再去医院看病，我受伤了我就自己给自己动手术。”维克多平静地说。
　　4.0
　　“如果我是个男孩，即使只有一天。
　　清晨我会，从床上跳下来。
　　我望着天空，去酒吧勾搭女生。
　　我兄弟都挺我。”
　　“？？……”



'''







'''

/fst/sky/moon-river/Zero. About/Lock Database's Mind Analysis.txt



思路分析仪是一种通过对说话者语调、节律、停顿、逻辑等进行分析，辅以脑电图分析，可以获得回答者对任何一个问题的态度。

　　这种科技我部于上世纪五十年代已经有了成品，可供用于获取秘密等行为。





'''







'''

/fst/sky/moon-river/Zero. About/Mr.Cao.txt



　　一

　　公元二零一三年五月三日，凌晨，大概是夜猫子刚刚准备去睡觉的时候。

　　曹家大院。

　　这是一间又宽又干净的大房子，大得仿佛是另一番天地了。所有的东西都在发光，花纹大气考究的砖地板、几十上百年的什么木的家具，来自欧洲的某种珍惜动物皮革所制的沙发，世界上的每一款这种皮沙发都是身价上亿美元的大师手工制作的，他们的外形都是独一无二的。

　　这座房子配备有同样豪华的厨房、卫生间、阳台、花园、泳池…这处住所本身就是一件艺术品，是可以整个搬到展览厅里去供人膜拜的那种，日常维护就需要至少是艺术系研究生才能涉足，否则任何一个行动都是在破环她的美感。

　　一代又一代的艺术家把这座房子都看成是自己的孩子，对她倾注了毕生的心血，一位又一位颇有灵气的年轻艺术家在这里老去，变成了白白发苍苍的老人，无数英才的灵魂都安居在这里了，这座建筑也就成了无价之宝，渐渐地有了自己的灵魂。

　　此时天边的鱼肚白还都淹没在黑暗中，在顶楼庭宅里，曹廷安终于做出了决定，然后他点亮那盏皇家水晶吊灯，把原本透过巨大水族缸的幽蓝色睡眠呼吸灯的光芒遮盖了。

　　他拿起放在那水晶床头柜上定制的黑色镶钻手机，看着幻蓝色鱼缸里游动的热带鱼，拨通了海拉的号码。

　　曹廷安的父亲去世之后，他就担起了还要照顾妈妈的责任，提前踏入那个由父亲一手建起的庞大、陌生又复杂的金钱帝国里，唯一的依靠就只有海拉了。

　　海拉比曹廷安大六岁，金发，家乡是欧洲东部某个名不见经传小国家，十一岁时来到中国，十七岁时就已经成为了曹峰钢铁集团这只工业巨兽总裁的私人助理，几乎每个认识海拉的人都疑惑于她何以能在这般年纪就能有此作为，后来他们才知道，海拉是一个当之无愧的天才，她的计算能力和协调能力可以说是无人能及。

　　“海拉是那个公司人脉的全能型服务端。”竞争对手们在开会时这样描述她，就是指她对各种事情各个员工的强大协调能力。

　　有无数的人想要挖走海拉，因为这个人的潜力实在是太可怕了。但是海拉对无论多高的条件都无动于衷，又过了十年，曹峰钢铁集团总裁的独子曹廷安已经长成大孩子了，海拉依然还在那个位子上，且散发着女王般的气场。

　　但是只有少数人知道，海拉是曹峰钢铁集团总裁收养的孩子，她的双亲死于非命，正在街头等死时偶遇了曹廷安的爸爸，这才被他带了回去，并被他培养成了自己未来继任者的得力助手。

　　海拉是不可能背叛曹家的，海拉是不会背叛曹家的，即使是没人理解，即使是举目无亲。

　　即使是后来曹廷安的父亲因突发疾病英年早逝……吗？

　　但是这真相对曹廷安来说并不重要，海拉是像他姐姐那样的人，是他即将就任的那家公司里最熟悉的人，又是那么的有能力，若是因为怀疑就转而问别人，那除非是曹廷安放弃了这间父亲留给自己的这家公司。

　　而曹廷安是不会放弃的，除非是揭开父亲的死所留下的疑团。

　　“呵呵，老板好啊。没想到您这么早就醒了。”冰凉的手机响了一会后被接通了，电话那头传来了慵懒的女声，海拉倒是像往常一样开着玩笑。

　　“我还是喜欢你叫我廷安啊海拉姐……”曹廷安听到海拉的声音心里很舒服，像是一直压在他胸口的时候被撤走了一样，但是毕竟是自己这么晚了还把人家吵醒，他心里挺不好意思的。

　　“嗯好吧，廷安。怎么了？”海拉没有怪曹廷安，因为他从小就担心这担心那，如今也是为人谨慎，即使年纪轻轻却比同龄人要靠谱得多。

　　“我知道已经很晚了，我很抱歉，不过我一夜没睡，嘿嘿，我要去突袭杰克叔叔！”

　　杰克是又一位曹峰钢铁集团中的外籍高层，是个美国中年人，有着刮得干净利落的络腮胡子，衬上黑色的西装简直是帅极了。杰克也是曹峰钢铁集团资格最老的高层，据说他与曹廷安的爸爸有着很深的交情，曹廷安想了一晚上，决定还是去问他一些事情。

　　“知道了知道了，多打听些秘密哦廷安，老家伙可是知道很多秘密的！”

　　打完电话海拉躺在床上又纠结了起来，这样下去公司里的局面不知道会不会有所改变啊，还有，她怎么能让曹廷安那个小孩子去一个老狐狸那儿打听消息呢？

　　海拉拧开了床头灯，橘黄色的温和的光芒把她那条白色睡裙衬托得很柔美。

　　曹廷安开着银白色的兰博基尼在高速路上静静地滑行，车窗外的夜色开始有一丝泛白。他十八岁生日那天拿到了机动车驾驶证，但是他也如同所有的年轻人一样喜欢开快车。

　　曹延安调整好状态，把手机调成静音，用座位旁的按钮加速到了每小时两百公里，整辆车像是一道夜幕下的银色疾影。

　　杰克现在应该，在乡下吧？曹延安的脸上带着微笑。

　　二

　　2013年5月3日6:00am

　　黎明缓缓地到来了，天空像是浑浊的湖水在渐渐泛白，曹廷安站在田野中一座两层的阁楼下，缓缓地呼吸，从嘴里吐出一丝淡淡的烟雾。

　　他熬了一晚上，现在虽然脑子很清醒，反应却很慢，若是不干些什么提提神曹廷安觉得自己会发生些什么意料之外的事情。

　　这里只是普通的农田，公路边一座略显粗糙的三层小洋楼单薄地矗立着，楼边还有一辆沾满灰尘的红色拖拉机。

　　曹廷安的跑车在这里出现真的是太过惹眼了。这么看上去的话，杰克似乎是一个辛勤的劳动人民，在大好的时代下靠自己的勤劳致富。

　　但是杰克是个猥琐的老外啊，这违和感几乎都要爆表！

　　曹廷安把烟头掷在地上，用帆布鞋踏熄了，从墙里传来一阵恶毒的狗吠。院子的白铁皮大门没关，从门缝里隐约可以看到一条大号的黄黑的狗正恶毒地吠着。

　　就是这里么？

　　曹廷安用半小时的时间飚了一百多公里，自从进入了这个小镇他就被各种脱线情绪所占据，每一堵墙、路边那些手掌高的水稻、每一条狗都在刺激着他的心理承受能力，话说自己是不是被那老头子给耍了，要是被当成小偷包围了该怎么办啊。

　　小心地走进院子，那条大黄狗不停地狂吠着，一次又一次地冲击着那条两指粗的铁链。

　　这货该不会从小就把那链子扯到大的吧，曹廷安这样想。

　　狗窝的对面有座鸡棚，老母鸡们把头伸了出来，深沉地凝视着曹廷安。

　　曹廷安站着想了一会儿，然后蹑手蹑脚地进了那门，狗吠得更厉害了。曹廷安开始想那狗最怕什么，当然是它的主人打它所用的棍子。虽然整个院子看上去不是那种特别严谨的摆设，不过不可能每次狗乱咬人都去专门找那棍子，所以棍子很可能是在这附近的。

　　曹廷安环视四周，很幸运的，在别人家大门口有一根鸡毛掸子，于是曹廷安走过去拿起掸子对着那大黄狗挥舞了几下，那狗果然就不吭声了。

　　这狗在看门的狗中算是很大的，曹廷安看着那似乎有着藏獒血统的庞大身躯，无语于此刻它眼里流露出的惊慌。

　　看来狗的主人很爱狗啊，说不定平常还会不忍把狗栓起来。

　　曹廷安看那狗渐渐安静下来了，走到院子的门口，犹豫了一下，然后敲了敲门。过了一会儿，门里一点声音都没有，这时他突然觉得自己很傻，刚刚狗叫得那么大声都没人听到，这会儿他这么敲门人会有人听到？

　　但是大门明明是开着的，房子里没人的可能性不大，用科研部那帮人的话来说就是陷入了逻辑死角，曹廷安环视院子，整个院子很正常，狗也很正常，发生什么事的可能性不大。

　　这段时间是曹廷安人生的重要过渡，是决不能出一点差错的，可是万一发生什么事就不好了，曹廷安想了一会儿，最终还是使劲敲了敲门。

　　然后曹廷安就在那门前敲了十多分钟，都快要放弃了。

　　忽然听到门里有脚步声，有人走过来，打开了门，一个头发花白却很精神的的老头子出现在曹廷安眼前，那人皮肤上有些斑点，穿着一件有些脏的大衣一般的外套，淡然地看着曹廷安。

　　“哟，稀客啊。”果然是杰克，还操着一口很纯正的中文。

　　泥煤……你这样子能听见人家敲门么，曹廷安想。

　　杰克的乡间小屋从外表上看和附近其他的房子没什么不同，不过走进了房间才可以看到，这里的摆设很简洁，色调很和谐。进门后可以看到客厅很干净，地板、桌子椅子都比较偏木色，杰克是比较会享受生活的老头，虽然有些人也说他比较慵懒。

　　杰克的话很少，给人的感觉是很厚重，曹廷安觉得那种父亲的味道又回来了。

　　老头带着年轻人走进客厅，曹廷安撇见那浅木色的椅子上坐着一位正在看新闻的少年，穿着纯黑色的体恤。背对着他们，头发很直很干净，是个亚洲人。

　　“介绍一下，他叫建军，是我的小侄子。”这屋子里很保暖，杰克真帮曹廷安把外衣挂在椅子上。

　　曹廷安本想自己来，一听这话愣住了，想着你什么时候有个中国侄子了，还面不改色，用父亲的话说，就是“老狐狸尾巴露出来了吧”。

　　当他看到那少年转过头来时，一瞬间有些失神，那个孩子的长相其实并不出众，皮肤很黑，人很小，却长着一张成年人的脸，眼睛又黑又空，波澜不惊。

　　那种眼神曹廷安还是第一次看到，很凝实，很平淡，像是一块没有思想的石头。这种人曹廷安还是第一次见到，不过也很合逻辑，毕竟奇葩的人总有神奇的朋友，杰克就是这种奇葩的人，这很正常。

　　男孩很沉默，可是那种感觉让人觉得很礼貌，就像是他已经打过了招呼。

　　“建军，这位是曹廷安，他是我的老板。”杰克说。

　　“你好。”建军说，声调没有变化，不过从说话的节奏上还是能看出惊讶。

　　曹廷安意识到眼前这位少年可能只比自己小了一点，于是说：“很优秀啊！”

　　然后曹廷安想起来自己是来突袭杰克的，于是笑嘻嘻地说，我又发现你的小秘密了哦，杰克老狐狸！

　　杰克笑了笑，为曹廷安倒了水，坐下来聊天，为曹廷安讲了关于他父亲的往事。

　　取暖所用的火盆很温暖，也温暖了曹廷安的心。曹廷安的心以前是凉的，凉到一定程度了他就会去飙车，刺激一下他那颗麻木的心。如今这种温暖的感觉已经很少了，这世上只有杰克和海拉能给他亲人般的温暖了，他很珍惜。

　　杰克喝着茶，为曹廷安讲了他爸爸在年轻时候的事，时间已经不早，曹廷安看了看表，已经快要八点了，于是起身穿上外衣。

　　“九点我就要开会去了，这是我人生第一次主持会议，你居然请假！”曹廷安背对着杰克，说。

　　“我也是没办法嘛，不过我相信这难不倒你的，你可是曹家的长子。”杰克喝着茶，“这么说起来你这么喜欢飙车，慢点才好嘛。”

　　“安啦，我的物理课可是从没有被扣过分！”曹廷安深呼吸，已经开始调整状态，开快车这种事马虎不得。

　　“那我就不送你了。”曹廷安转身前，看到杰克的茶杯上冒着蒸腾的白气。

　　跑车发动的声音传来，屋子里又安静了下来，只有液晶电视的屏幕变换着各种色彩，声音早已没有开。

　　杰克喝了口茶，把头靠在座椅上闭目养神。

　　“他怎么样？”建军一边说，一边玩着自己修长的手指。

　　这个少年从刚才开始就一直没说话，似乎是有些怕生的样子。

　　“曹廷安啊，年轻的曹氏钢铁集团董事长，肩负了很多的责任。”杰克说。

　　“我很喜欢他，我会去他的公司的。”

　　“其实到现在我都不太能肯定你的身份。却还是不得不去做事，”杰克打量着眼前这个少年，觉得那身黑衣更显神秘了。

　　“还真的觉得我老了。”

　　“说起来，我也有一个朋友……也很无助。”

　　而在不远处的高速公路上，风在吹打着浅浅的车窗，天都亮了，白色的光很冷，驾驶座上的曹廷安觉得，这世上有太多的事，自己无能为力。

　　不过，还是要全力以赴地走下去。 



'''







'''

/fst/sky/moon-river/Zero. About/Lock Database's Sagittarius' Trees.txt



　　时至今日，仍然有人认为植物总是弱小的。

　　但是在数十亿年前，人马座X23星系却出现了一种外星植物，能根据外界环境调整自身基因编码。

　　最终，这种植物灭绝了该星球上的所有其他物种，且可以独自生存。

　　这种植物的疯狂繁殖一次又一次地挑战着气候环境的极限，它们度过了一次又一次的灭绝危机，最终突破了大气层。

　　当中央射电望远镜第一次观察到该物种时，它们已经占据了整个星系，并演化出了极其庞大的分支体系。

　　该星系双主星被庞大的植物网络包裹，无数的孢子从行星上裹挟资源并送往环恒星带。

　　某些大型孢子能够进行亚光速飞行，甚至具有扭曲空间的能力。 



'''







'''

/fst/sky/moon-river/Zero. About/Lock Database's Artificial Cells.txt



人类区别生物和机械，已经不再有明显的界限了。

　　我部科学家转基因特斯拉给出了一种全新的纳米机器人方案。

　　该方案有别于我部传统的纳米机器人，具有极强的自我复制能力，能够像生物一样吞噬金属，复制产子。

　　



'''







'''

/fst/sky/moon-river/Zero. About/Lock Database's Secret Level.txt



    洛克组织的密码系统，是将每种可能的加密方法进行排序，在大规模集成电路被发明以后，这个序列便疯狂增长，以至于达到了好几万。
　　由于上不封顶，其实没有成员真正知道洛克的最高级加密方案是什么。
　　已知的量子加密就排在三万左右的位置，外界已经发现了其缺点，之所以排得比较高主要还是因为对器材要求比较高。
　　这里不包括交叉加密与再加密、加密密匙、加密顺序分层加密等杂项。



'''







'''

/fst/sky/moon-river/Zero. About/The Master.txt



　　楔子

　　若要成佛，必当放弃一切希望，梧桐树下苦思十四天。

　　若要成佛，必将深陷无法逃避之痛苦，而后了然忘却。 



'''







'''

/fst/sky/moon-river/Backup/Diggar.txt



    男孩冷眼看着那柄匕首上下翻飞，他时而正手时而反手，刃口寒光冷冽，仿佛清泉
　　他其实相当紧张，只要一个失神，就可能从此残废。
　　



'''







'''

/fst/sky/moon-river/Backup/The Bin.txt




　　烧着烧着，丹炉就炸了，浓烟滚滚，老头呛得直不起腰，弟子只得在一旁造孽地看着



'''







'''

/fst/sky/moon-river/Backup/The Peace.txt



    人们说，昨夜有人，躲过了富商三剑，穿胸将其杀死。
　　“战争已死，无需起誓。”
　　歌楼上，长发男子身着白衣，他走下一子，面无表情。
　　男子叹息。
　　一般情况下，人一生只有两个誓言
　　一个是婚誓，一个是死誓
　　所以人不该发誓的，没发过誓的人活得久



'''







'''

/fst/sky/moon-river/Backup/Cross.txt



    老人穿过人群走了过来，看着眼前这个男孩，愣了片刻，布满皱纹的干脸一扯，摇了摇头：“这男的太弱了，第一次看到这么弱的人。”



'''







'''

/fst/sky/moon-river/Backup/Victor.txt



    一维克多每天自然醒，橘子男必须要闹钟，他的闹钟是一个c4
　　二维克多不说话，任两人在那里亲热，闭上眼，脑海里那些波浪形状的长线又出现了。
　　他随心所欲地拉长那些线，取点，求和。
　　“在想啥呢？”女子的声音打破了一切。
　　维克多有些恼怒，还是淡淡地说：“三角函数。”
　　他不喜欢撒谎，说谎有什么好？



'''







'''

/fst/sky/moon-river/Backup/The Island.txt



    海上大雾弥漫，韩凌枫忽然想起以前，他就要遇到维克多他们的时候，做过一个梦，梦中是大雾的夜，将军、大名困守孤城，海中走来密密麻麻的海妖，城墙高的巨人扛着海底遗迹的石柱，缓缓走来……
　　至今想起，仍让人发沐。



'''







'''

/fst/sky/moon-river/Backup/Moon Light.txt



    他看着刀架上的刀，越是靠近，越觉得寒气逼人。
　　他试着握了握，可全身发软。
　　他握不了。
　　也许有一天他会遇到另一个喜欢的女孩，那时他就需要持刀了。
　　那还来得及吗？
　　还是握不了。
　　只能……先走了。



'''







'''

/fst/sky/moon-river/Backup/Luna.txt



    月的本体是不会动的，但是它在大地上的倒影被人们所看见。
　　它的存在因太阳而被放大了，因为这种存在而对世人产生着影响。
　　这种感觉，最终形成了某种意识体，或者说映像，随着文化传承。
　　有一天，大地上出现了一位女子，名曰女娲，她有着赐予生命的能力，她在月下徘徊，月神孕育而生。
　　月神死后，躯体成了一把臂刀，名曰月光。
　　其持有者，可穿行于过去与未来。



'''







'''

/fst/sky/moon-river/Backup/Spring Two.txt



    她就一直默默地跟在他身后，不走。
　　他生气了，说你老是跟着我好烦阿，她就躲起来。



'''







'''

/fst/sky/moon-river/Backup/The Fight.txt




　　脖颈发凉



'''







'''

/fst/sky/moon-river/Backup/The Heart.txt



    胸膛变得酸酸的，心跳在向着她的方向而去。



'''







'''

/fst/sky/moon-river/Backup/The Island Watcher.txt




　　一
　　“他终于见到了那座岛，他登上最高的山顶，把破碎的船的桅杆拴在那里，残缺的旗帜在狂风中摇曳”
　　我会在那里见到她
　　自此，我便爱上黄昏
　　二
　　他终于见到了那座岛，他登上最高的山顶，把破碎的船的桅杆拴在那里，残缺的旗帜在狂风中摇曳
　　“我会在那里见到她
　　自此，我便爱上黄昏”



'''







'''

/fst/sky/moon-river/Backup/The Wave.txt



    海风吹过男子飘散的头发，一缕缕舒适地晃动着。
　　“我不是谁。我只是一个拿刀的人，那个骑着马男人会娶你，其实你也爱他。”
　　“你杀了我吧。”
　　“被恋人亲手杀死，并不觉得遗憾。”
　　就这样，结束吧。



'''







'''

/fst/sky/moon-river/Backup/Teacher.txt



    
　　“韩兄文采伯仲，可有老师？”酒过三巡，那人有意无意地问了一句。
　　有啊，韩凌枫心说，九年制义务教育，那定然不可能告诉你。
　　“路兄言过了，在下只是有幸在书院读过一些书罢了，算不得好。”
　　“哦？那路某就向请教那书院在哪？叫什么名字？”
　　“小书店罢了，不值一提。”韩凌枫愣了片刻，急中生智，对道。



'''







'''

/fst/sky/moon-river/Backup/The Breaking.txt



    关于上界，古籍中鲜有记载，只是说，明亮如白昼，极北有雪域，极南有深山。
　　他环顾四周，人不少。上界气息浓郁，这里的人都极为干净，修为也极高。
　　修炼之道，也颇有异同。很多仙家大术，在这里可能只是基础。
　　他深吸一口气，环顾四周。
　　气息异常浓郁，可能是人力而为。
　　他并非强行破界，意味着能够理解上界真气而内化，在此自由活动。
　　上界小，下界大，而下界底蕴已颇为深厚，却极少有人飞升，就是因为下界气息混杂，人口众多。
　　气息混杂，则以淬炼肉体为易；人口众多，则相互影响，真气乱流，难以参透天地奥妙。
　　上界小，下界大，孕育了无穷的炼体之人，所以下界才与上界并称为两界。
　　可是炼体者无法抵御上界气息的剥夺，极难飞升。若是强行破界，即便没有失去形体，也会意识破碎，半人半鬼。
　　自始至终，能够以肉体强行飞升的，也就只有盘古一人。
　　开天辟地，纵横三界，霸气之极！
　　那么，因无力回天而闯入上界的自己，是破界飞升了，还是意识已经残缺，陷入永恒的幻境当中了？
　　



'''







'''

/fst/sky/moon-river/Backup/Higher World.txt



    不得不说，我觉得成都是个很好的城市
　　小时候，女孩去坐旋转秋千，她喊我哥
　　我不敢坐那种东西，我坐在长椅上
　　拿着一瓶红茶，她每转一圈就喊一声
　　我不知道我有什么好到现在都不知道
　　“那种东西要很多人抬吧？”他一脸震惊地看着我。
　　“我们的会自己动。”我说。
　　“可我就是不知道咋的就过来了，他们也不清楚。”
　　“那种地方就是上界啊。”
　　“是啊，是上界。”我卖他一个关子。



'''







'''

/fst/sky/moon-river/Backup/Look at me.txt



    韩凌枫忽然想起来，他是翻完过顾小蔓的说说的。
　　他以前从来不去看别人的说说，直到那天深夜。
　　后来他就常常向往于此，也仅仅只是向往。
　　顾小蔓是写小说的，写得烂的一皮，还拉韩凌枫一起写。



'''







'''

/fst/sky/moon-river/Backup/Parents.txt



    “那韩中可是？”
　　“我祖上是治男女之事的，我父母是私塾先生。”韩凌枫想了想，说道。



'''







'''

/fst/sky/moon-river/Backup/The Goal.txt




　　“你这坑得太明显了吧。。。”他汗颜。
　　然后他关上了门，没有去看那一瞬间女孩的眼神。
　　女孩还是挺自负自己有两下子，可这种事，从来都是男生的阿。



'''







'''

/fst/sky/moon-river/Backup/Spring.txt



    他忽然发现，她一直在身后看着他，站在那里已经很久了。
　　“天凉了，你会感冒的。”姑娘小声地说，她手里捧着叠好的细布衣服，洗得很干净。
　　她帮他披上衣服，仍是呆站了很久，欲言又止。
　　“哥，有时候我觉得……若我也是一个男子，该多好。”
　　“那样我或许就可以成为你的好友，陪你一起谈笑、喝酒、打猎……”
　　说着说着，她就哭了。
　　他心知，这姑娘是把生活中的不快，都寄托到了他身上。



'''







'''

/fst/sky/moon-river/Backup/The Plan.txt




　　 15、5、30：基本上确定了小说展开情节的思路，首先描写一个现实的世界，然后在人物的探索、行动下挖掘出潜在的东西。
　　以快读、慢读都适宜为目标，力求“看到文字就想到画面”的描写，“细细读来颇有感悟”的抒情。
　　人物塑造方法为：现实主义。来源于生活，力求准确地把一个人物的一生展现出来(这样好么)
　　before————————————
　　写大纲之前首先写一下我现在的想法。第一，为什么叫大纲而不是总纲，我也不知道，但是没有人管它叫总纲的！总纲是类似于“天地会总纲”那样的东西吧--，所以还是叫它大纲算了，字面上的意思是“大体剧情”什么的，不过我的大纲有点特殊，剧情角色感情一起写，大概就是这样吧。
　　首先是第一卷，名字叫靖难，这是跟历史上明朝发生的靖难之役有关，或者说以它为基础、前提什么的而改编的情节。（“靖难之役”见相关资料），靖难之役发生的事件经过改编之后引出了一个神秘的空间。
　　世界概念
　　“空间”是指它像是地球附近凭空多出来的一块，在地球附近，空间凹陷形成了一个独立地带，与外界只有一个拳头大小的连接点，这个连接点从三维空间上看是一块有着一定质量的小圆球(?!)，所有与它相接触的物体、能量都会被吸入，受重力的影响。为质量大小始终在变化，它在地球表面做无规则环绕运动，有时上万年远离地球，有时坠入太平洋吞噬海水……有时数万年长夜，有时数万年烈日炎炎。而在人类文明崛起的数千年里，它从太空回归，进入比较稳定的环绕，周期大约是数十年到数千年接近一次地球，造成过大规模的灾难。
　　它的一个定义是它与外界只有一个出入口，光也是从这里进入的，看起来就像太阳一样，但是不太温暖；唯一的出口也是这里，但是距离异空间中的地面太远（几千米至几万米始终在移动），所以从它诞生起进入的人和东西就没有出来过。历史上没有任何关于这里的记载，它造成的空间缺失放到太阳系，乃至整个宇宙中都是微不足道的，所以人类社会至今不知道这里的存在。
　　***补充1时间规则：由于一些原因（。。引力异常什么的），进入这个空间时时间的速度受到影响，内部时间流逝速度不平均。
　　第二个定义是空间中有不太稳定的生态系统，绝大多数是植物且热带植物居多（经常落入地球中吸水，水分多），当它在太阳直射下的热季气候温暖，植物茂盛持续生长；在太阳光被遮挡的寒季会造成缓慢的植物大批死亡（植物因寒冷死亡，微生物将其分解后放出热量）还是能保持温度。有少量昆虫和大量微生物。
　　进入热量难以散出，由于入口小它在远古时可能较为寒冷，但是经过亿万年的堆积已经比较温暖，这些热量被转化为化学能储存在植物体内。所以这里的气候自从稳定下来便逐渐有植物出现并形成了稳定的生态系统。
　　季候分两季，时间不定短则数十年长则数百年，昼夜长短不定但是周期不短，一个白昼最少也是地球上的数天。（有时它绕地球的速度很快）
　　白昼很长，黑夜也很长，所以这里的植物能储存更多的糖分，甚至还在某些方面表现出动物一样的特征。
　　（植物细胞储存糖类的细胞器是液泡，储存糖分的器官是果实、某些根茎。所以这里的植物根系发达，组织颜色浅而且随着白天的变长其颜色会越来越浅，体内甚至会有大量液体流动）
　　******************坑：这个空间的重力为什么会和地球上差不多，这个问题难以解答，只能说它的泥土厚度大得难以想象。（于是这样一来可能就会多了很多神奇的生物，大地龙什么的）
　　第三个定义是历史上进入过的人。从人类进入农耕社会开始，大约每隔数百年就会有人被送入，但是相当分散没有规律，而且进入的人再不会出来，所以人类社会一直都没有发现异常空间的存在，只是很多人把很多由它影响的现象错误地归为不同的原因引起的，因为在没有证据的情况下，没有人可以知道是否有什么东西存在。
　　在设定中，进入这个空间的人不少，各个地区的人，各个时代的人，有小人物，也有对世界走向产生重大影响的大人物。这么多人进入了这个空间，并且不同程度地重建了自己所在地区的文明，导致在几十公里的异常空间里曾经诞生过十数个成一定规模的文明和无数的部落、小型团体。
　　***第零定义
　　这个空间很安全么？如果是，那么这么多的人在这个空间里像在地球上一样生活、繁衍，也绝对发现了它的秘密，从而想办法出去了。但事实上并没有任何人出去过这里，这些璀璨的，文化融合而产生的绚烂多姿的文明，都莫名地被切断了，几乎一点东西也没有留下，亘古不变的只是树林——不会说话的树、树、树！正是这个世界每隔一段时间便会大灭绝一次，而每一次，都是相当暴力的灭绝：泥土被掀开、山脉被破坏、板块被打碎（如果有板块的话）、动植物被吞噬，只有微生物和土壤中难以发现的种子能够存活。造成这一切的原因是一个谜一般的生物。
　　所有会动的东西遇到它都会被毁灭，所以只有异常空间部落中的酋长、祭司一类的人从极为罕见的古遗迹里可怖的伤痕中得知了它的存在，并且将其封存。（异常空间的有些文明时期存在极少数的遗迹，它们被传送入的人发现后细心地保护起来，而大多数文明则是被毁灭得渣都不剩）
　　在有一个文明时期，穿越的秘密便是被聚集起来的穿越者隐瞒了，只留下一些遗迹手稿之类，新任酋长祭司参观遗迹后便能推理出事情的大概，就这样经过了无数代人平安无事，于是这个穿越与毁灭的故事成了当地口口相传的故事，虽然有大部分人不太相信，但还是有狂热的支持者。部落中颇有心计的人察觉到他们在害怕什么，却死活问不出来。但是有一天，在这一代的新酋长还未曾忘记古老的恐怖时，他被人从睡梦中偷听到了这个故事，于是造成了大规模的骚乱和恐怖，起义军以此为借口准备推翻古老的君主，并且还做了像模像样的应对远古魔神的措施。
　　但是当起义军与部落军在马里奥堡最终决战之时，远古魔神苏醒了，它力大无穷，恍若开天的神祗，巨大的伟力撕裂了天空、大地和海洋。但是历史上唯有这一次人类是做了充分的准备工作的，至少留下了较多的遗迹；这段历史被随后出现的更加先进的文明解读了出来，魔神的传说被揭开，但还是被政治高层所知晓，他们肩负起了拯救世界的责任。
　　（PS。1*因为进入的人一次比一次来自更加先进文明的时代，而且这些文明领袖有意识地寻找十数年乃至百年才出现一次的来自原先世界的穿越者，而且没有天敌的制约，所以与人口数量相比，这里的文明科技水平发展速度极快，就算是被毁灭一次比一次更加先进，发展速度更快。）
　　（这样充满暴力的古神话影响着这里一代又一代的人，他们崇尚力量，坚信“武道”云云）
　　*高潮剧情开始之前发生的事是在一个伪现实世界里的，它与真实的现实世界几乎没有差别，只是多出了一群秘密一点的人，所以伪现实世界只是比真正的这个世界有一点点的不同。在那个世界里，社会环境除了平和之外，还有一点点神秘感，以及对知识的看重和尊重，在这样的环境下熏陶出来的少年会去做一些神秘又正值伟大的事，即使他们心中的正义不被承认。
　　洛克组织称这里为红月，因为在它刚刚受到太阳照射时，由于是球形，光的折射率一开始很大，故清晨天空为血红色而得名。UFO称这里为广寒，取自神话，有人为进入的意图。
　　其实这个东西是一节损坏的外星飞船推进器，核动力推进，以空间曲率为约束力，以稳定核聚变代替火箭燃料的化学反应，速度快得难以想象，不过还不能突破光速，是常规火箭与正反粒子湮灭引擎、曲率引擎之间的过渡产品。
　　其中有一生命，职能是控制反应，以核聚变为生命活动的能量来源，最开始的光球已经死了，它在吸收了地球土壤后为适应环境变成了岩石、昆虫、哺乳动物的外型。
　　亚历克斯是它的弟弟，是类似于备胎的存在，当
　　*************************剧情、人设
　　第一卷的主要讲的是主人公韩凌枫怎样从一个普通人阴差阳错地加入一个未知的团队的，这本书是穿越，主人公肯定是要穿越的，这是穿越之前的磨合吧。首先韩凌枫是一个各方面一般般的学生，性格上比较温和，不会到处惹麻烦的那种人，责任心偏强，很善良，总是在想自己哪里哪里又做错了什么的，其实这样的人学习不好是因为他没有动力和决心吧，总之，实际上韩凌枫在班里算是一个比较胆怯、自由自在的心地善良之人，死对头什么的几乎没有。这样来看，他已经在心底承认了自己“平平常常”，他没有信心，觉得自己天生就不是那种某方面很强的人。
　　女生缘他方面一般般偏好，女生觉得他这样的人很好，他唯一的惹人讨厌的地方就是女生缘比较好，班上的女生都不反感和他说话啦讨论啦，这是韩凌枫唯一惹人记恨的地方，如果他处理好了这个问题那么韩凌枫几乎就是亲切榜头号王老五。但是韩凌枫从来没有想过这样的事情，所以啦，他还是自由自在地生活着，成绩也稳步上升。
　　韩凌枫在主要剧情开始后的半年以前被一个向他表白的女生给大骂了，正常情况下，这样的阴影会持续笼罩他几年的时间，他唯一的惹人喜欢的地方，亲切也将被无情地割去。所以不得不让人怀疑他是否是一场阴谋的受害者，但是无论如何，韩凌枫彻底丧失了他原来所有的一些正常人的品格和行为，让人感觉到他在发疯。（隐藏事件）
　　第一部是讲韩凌枫如何从一个青春期刚过的正常无比的人变成了别人眼中的天才级人物，总是是要起到一定的励志才好。韩凌枫遭遇了神秘队伍后与这些爱思考的天才级人物经历了一场冒险，最终也有了自己的执著和追求。
　　*神秘队伍总体人设
　　男性角色是一名神秘强大的队长，死板强大的副队长，一个爱吃橘子的落魄机械师程序猿：橘子男，崇拜肌肉精通各种武器的霸哥，年龄最老的大叔厨子和一力大无穷的兽人）没错，兽人！锲子过后会有他与古代玄幻的碰撞，说是一本以面对玄幻的小说也不为过吧！）；女角色是擅长枪械物理的短发活力女，擅长数学算法的眼镜短发女邓秋离，擅长生物化学的长发女。
　　主人公是傻子男（应该是中二男才对），所以主要人物的性格习惯都是别人自己拿出来分享的。
　　****邓秋离
　　邓秋离就是那种所谓的班级里人人皆知的好学生，从小如此。她的人生头十八年没有瑕疵，而且带着今后也不会有的趋势。她是韩凌枫的小学同学，初、高中校友（初高中韩凌枫已经被分班制与女神隔离开了），但是她的身世、家庭没有人知道，韩凌枫被强迫加入神秘队伍第一次任务后发现邓秋离就是这里的资深队员，主攻算法，这一切似乎证明着，女神不是人而是神，与韩凌枫这种狗腿子是完全不同的两种生物！！
　　能不说话就不说话。
　　****维克多
　　神秘队伍副队长。性格强迫、完美主义者，最突出的习惯是用无死角摄像头观察自己的每一个动作表情。维克多会把每天所有见过的人、自己与他人发生的对话等记录在脑海里，以便进行逻辑思考，因为好奇，他喜欢探究别人在想什么。
　　总是想得很周到，长得很帅。
　　****青洒
　　化学家的女儿，有机化学与生物化学爱好者。很漂亮，总能成功。名字是自己改的，对大多数人没有安全感，却与维克多默契无间。
　　***橘子男
　　队伍里负责主要的技术支持的人，大四学生，怪才，格格不入的宅男（正常人范畴）；精通物理学、多种编程语言和应用，电路、机械。因为爱吃橘子并且吃得很猥琐被称为橘子怪人。在思考的模式上比较接近维克多，但是要有一些人性（更有同情心更正常的感觉），只是不太注重仪表，所以比较神经质。习惯是把每天的经历以某种方式储存起来，以进行逻辑思考，目的是保护自己不受别人负面心理的影响。
　　计时狂，总是在计算时间。
　　此人极度佩服队长。
　　***霸哥
　　军事爱好者，在勤奋方面他是一个天才，并且尽可能地把自己往特种兵的方向锻炼；爱好跑酷，经常受伤，所以也学了基本的急救、医学，但是大伤都是维克多处理的，所以很是佩服维克多。
　　***兽人默德
　　在第一部中加入队伍，与异常空间中灭世的巨人是近亲，性格是老实憨厚崇尚力量什么的。
　　总人设中配角、隐藏人物顾小曼。
　　＊反派角色
　　海拉：美国人，某秘密集团富二代的继任之后的直接下属，女强人，智商超高，算法大师。她是这个神秘的集团前任老总留给继承人的唯一一位心腹级助理，牛叉到爆，全能。这个集团的继承人发现了公司中的秘密，以及被人追杀，海拉是他活下来的唯一依靠。
　　************
　　*设定的碎片*
　　************
　　#队长让队员们平时不摄入过量食物，在任务前食用大量含糖
　　简单来说，
　　当穿越之后维克多等人凭借知识和力量稳定并且掌控了局面，而队长李巫和理科奇才橘子男联手竟然硬生生将这个时代的科技水平往前猛地拉近了T一千多年，而时空旅行依然遥遥无期。就在一个冬天，每个人都已经绝望的时候，异变出现了，这个世界有古怪！踏海仙人、异兽屠城！而韩凌枫则被仙人认定其有“仙缘”，被仙人收为徒弟！韩凌枫带着古刀江月去往了武夷之山，开始逐步学习修真。
　　精彩之处在于：这个世界上真的有所谓“修仙”、“仙人”吗？韩凌枫究竟会经历什么？这一行人将何去何从？
　　dream
　　第四章架空日本战国海妖
　　纯粹虚构的梦境，表现了韩凌枫的精神状态。
　　第五章地下室的雕刻家
　　是过去发生的事情。
　　第六章艾利克斯童年时期
　　艾利克斯是麦哲伦收养的不明生物，其基因与地球生物完全不同，体内能源以生物聚变反应堆控制。（虚构科技：在某些近乎苛刻的条件下，聚变反应能在常温下进行。）



'''







'''

/fst/sky/moon-river/Backup/The Soider.txt




　　女子走在前面，我看着她走，不由自主地跟着，我碰了碰剑柄，甲胄碰了碰我的胸口。
　　我不能让她一个人走夜路。
　　即使我也不太好。



'''







'''

/fst/sky/moon-river/Backup/The Teacher.txt



    一
　　“一生练刀，可能只会用到一次。”
　　“人们都差不多，看到的不同只是外物。最后的最后，无论如何，我们还是差不多。”
　　“不要轻信想法，却要坚信直觉。”
　　“若是你不对自己好，如何真正变强。”
　　“还有曾经的自己。”
　　二
　　老师问我“你确定？”，提着刀。
　　后来他没有回家。
　　现在我要去作他未尽之事，提着刀。
　　三 对决
　　他盯着对方，不挪开目光。
　　周围没有人，月光在刀尖流淌。
　　只需要一个失神，就会万劫不复。
　　事已至此，只有先卸下对方武装，再试图说明来意。
　　月光极盛，刀快如风！
　　他不进攻，横刀格挡，他挡住了一刀、两刀……不敢有片刻失神。
　　他的命很贵的，还要去爱很多人。



'''







'''

/fst/sky/moon-river/Backup/How it so cheap.txt



　　我将拜访一位故人
　　她将嫁给一个男生
　　如柴似虎
　　如夜落寞
　　我将拜访一位故人
　　她将嫁给一个男生
　　如纤似羽
　　老不难过
　　我将拜访一位故人
　　她将嫁给一个男生
　　如风似水
　　默默，温热
　　我将拜访一位故人
　　她将嫁给一个男生
　　中正平和
　　如花向阳
　　我将拜访一位故人
　　她将嫁给一个男生
　　如风似树
　　不羁自过
　　我将拜访一位故人
　　她将嫁给一个男生
　　我将拜访一位故人
　　她将嫁给一个男生



'''







'''

/fst/sky/moon-river/Backup/The Night.txt



    他没说一句话，拿走了最快的一把剑。
　　好像有人在告诉他，怎样绕过那些壮丁。
　　富商转身，身后站着一个人。
　　他用尽全身的力气，穿透了富商的小腹。
　　他将富商定死在立柱上，他看不到鲜血。
　　的二天清晨，泪迹已干，他在巷尾醒来，像一个乞丐
　　人们说，昨夜有人，躲过了富商三剑，穿胸将其杀死。
　　男子看着废墟，喃喃地说：
　　“你若爱一个人，你会为她而死。
　　“如果有必要，你会燃尽最后一个细胞，你的一切，赴死如赴生。”



'''







'''

/fst/sky/moon-river/Backup/The Usurpation.txt




　　“哼！”维克多冷哼，“促进科技发展是正路，我们也应当代表一方，显然是不心者意图篡权。”



'''







'''

/fst/sky/moon-river/Backup/All Of It.txt



    15、5、30：基本上确定了小说展开情节的思路，首先描写一个现实的世界，然后在人物的探索、行动下挖掘出潜在的东西。
　　以快读、慢读都适宜为目标，力求“看到文字就想到画面”的描写，“细细读来颇有感悟”的抒情。
　　人物塑造方法为：现实主义。来源于生活，力求准确地把一个人物的一生展现出来(这样好么)
　　before————————————
　　写大纲之前首先写一下我现在的想法。第一，为什么叫大纲而不是总纲，我也不知道，但是没有人管它叫总纲的！总纲是类似于“天地会总纲”那样的东西吧--，所以还是叫它大纲算了，字面上的意思是“大体剧情”什么的，不过我的大纲有点特殊，剧情角色感情一起写，大概就是这样吧。
　　首先是第一卷，名字叫靖难，这是跟历史上明朝发生的靖难之役有关，或者说以它为基础、前提什么的而改编的情节。（“靖难之役”见相关资料），靖难之役发生的事件经过改编之后引出了一个神秘的空间。
　　世界概念
　　“空间”是指它像是地球附近凭空多出来的一块，在地球附近，空间凹陷形成了一个独立地带，与外界只有一个拳头大小的连接点，这个连接点从三维空间上看是一块有着一定质量的小圆球(?!)，所有与它相接触的物体、能量都会被吸入，受重力的影响。为质量大小始终在变化，它在地球表面做无规则环绕运动，有时上万年远离地球，有时坠入太平洋吞噬海水……有时数万年长夜，有时数万年烈日炎炎。而在人类文明崛起的数千年里，它从太空回归，进入比较稳定的环绕，周期大约是数十年到数千年接近一次地球，造成过大规模的灾难。
　　它的一个定义是它与外界只有一个出入口，光也是从这里进入的，看起来就像太阳一样，但是不太温暖；唯一的出口也是这里，但是距离异空间中的地面太远（几千米至几万米始终在移动），所以从它诞生起进入的人和东西就没有出来过。历史上没有任何关于这里的记载，它造成的空间缺失放到太阳系，乃至整个宇宙中都是微不足道的，所以人类社会至今不知道这里的存在。
　　***补充1时间规则：由于一些原因（。。引力异常什么的），进入这个空间时时间的速度受到影响，内部时间流逝速度不平均。
　　第二个定义是空间中有不太稳定的生态系统，绝大多数是植物且热带植物居多（经常落入地球中吸水，水分多），当它在太阳直射下的热季气候温暖，植物茂盛持续生长；在太阳光被遮挡的寒季会造成缓慢的植物大批死亡（植物因寒冷死亡，微生物将其分解后放出热量）还是能保持温度。有少量昆虫和大量微生物。
　　进入热量难以散出，由于入口小它在远古时可能较为寒冷，但是经过亿万年的堆积已经比较温暖，这些热量被转化为化学能储存在植物体内。所以这里的气候自从稳定下来便逐渐有植物出现并形成了稳定的生态系统。
　　季候分两季，时间不定短则数十年长则数百年，昼夜长短不定但是周期不短，一个白昼最少也是地球上的数天。（有时它绕地球的速度很快）
　　白昼很长，黑夜也很长，所以这里的植物能储存更多的糖分，甚至还在某些方面表现出动物一样的特征。
　　（植物细胞储存糖类的细胞器是液泡，储存糖分的器官是果实、某些根茎。所以这里的植物根系发达，组织颜色浅而且随着白天的变长其颜色会越来越浅，体内甚至会有大量液体流动）
　　******************坑：这个空间的重力为什么会和地球上差不多，这个问题难以解答，只能说它的泥土厚度大得难以想象。（于是这样一来可能就会多了很多神奇的生物，大地龙什么的）
　　第三个定义是历史上进入过的人。从人类进入农耕社会开始，大约每隔数百年就会有人被送入，但是相当分散没有规律，而且进入的人再不会出来，所以人类社会一直都没有发现异常空间的存在，只是很多人把很多由它影响的现象错误地归为不同的原因引起的，因为在没有证据的情况下，没有人可以知道是否有什么东西存在。
　　在设定中，进入这个空间的人不少，各个地区的人，各个时代的人，有小人物，也有对世界走向产生重大影响的大人物。这么多人进入了这个空间，并且不同程度地重建了自己所在地区的文明，导致在几十公里的异常空间里曾经诞生过十数个成一定规模的文明和无数的部落、小型团体。
　　***第零定义
　　这个空间很安全么？如果是，那么这么多的人在这个空间里像在地球上一样生活、繁衍，也绝对发现了它的秘密，从而想办法出去了。但事实上并没有任何人出去过这里，这些璀璨的，文化融合而产生的绚烂多姿的文明，都莫名地被切断了，几乎一点东西也没有留下，亘古不变的只是树林——不会说话的树、树、树！正是这个世界每隔一段时间便会大灭绝一次，而每一次，都是相当暴力的灭绝：泥土被掀开、山脉被破坏、板块被打碎（如果有板块的话）、动植物被吞噬，只有微生物和土壤中难以发现的种子能够存活。造成这一切的原因是一个谜一般的生物。
　　所有会动的东西遇到它都会被毁灭，所以只有异常空间部落中的酋长、祭司一类的人从极为罕见的古遗迹里可怖的伤痕中得知了它的存在，并且将其封存。（异常空间的有些文明时期存在极少数的遗迹，它们被传送入的人发现后细心地保护起来，而大多数文明则是被毁灭得渣都不剩）
　　在有一个文明时期，穿越的秘密便是被聚集起来的穿越者隐瞒了，只留下一些遗迹手稿之类，新任酋长祭司参观遗迹后便能推理出事情的大概，就这样经过了无数代人平安无事，于是这个穿越与毁灭的故事成了当地口口相传的故事，虽然有大部分人不太相信，但还是有狂热的支持者。部落中颇有心计的人察觉到他们在害怕什么，却死活问不出来。但是有一天，在这一代的新酋长还未曾忘记古老的恐怖时，他被人从睡梦中偷听到了这个故事，于是造成了大规模的骚乱和恐怖，起义军以此为借口准备推翻古老的君主，并且还做了像模像样的应对远古魔神的措施。
　　但是当起义军与部落军在马里奥堡最终决战之时，远古魔神苏醒了，它力大无穷，恍若开天的神祗，巨大的伟力撕裂了天空、大地和海洋。但是历史上唯有这一次人类是做了充分的准备工作的，至少留下了较多的遗迹；这段历史被随后出现的更加先进的文明解读了出来，魔神的传说被揭开，但还是被政治高层所知晓，他们肩负起了拯救世界的责任。
　　（PS。1*因为进入的人一次比一次来自更加先进文明的时代，而且这些文明领袖有意识地寻找十数年乃至百年才出现一次的来自原先世界的穿越者，而且没有天敌的制约，所以与人口数量相比，这里的文明科技水平发展速度极快，就算是被毁灭一次比一次更加先进，发展速度更快。）
　　（这样充满暴力的古神话影响着这里一代又一代的人，他们崇尚力量，坚信“武道”云云）
　　*高潮剧情开始之前发生的事是在一个伪现实世界里的，它与真实的现实世界几乎没有差别，只是多出了一群秘密一点的人，所以伪现实世界只是比真正的这个世界有一点点的不同。在那个世界里，社会环境除了平和之外，还有一点点神秘感，以及对知识的看重和尊重，在这样的环境下熏陶出来的少年会去做一些神秘又正值伟大的事，即使他们心中的正义不被承认。
　　洛克组织称这里为红月，因为在它刚刚受到太阳照射时，由于是球形，光的折射率一开始很大，故清晨天空为血红色而得名。UFO称这里为广寒，取自神话，有人为进入的意图。
　　其实这个东西是一节损坏的外星飞船推进器，核动力推进，以空间曲率为约束力，以稳定核聚变代替火箭燃料的化学反应，速度快得难以想象，不过还不能突破光速，是常规火箭与正反粒子湮灭引擎、曲率引擎之间的过渡产品。
　　其中有一生命，职能是控制反应，以核聚变为生命活动的能量来源，最开始的光球已经死了，它在吸收了地球土壤后为适应环境变成了岩石、昆虫、哺乳动物的外型。
　　亚历克斯是它的弟弟，是类似于备胎的存在，当
　　*************************剧情、人设
　　第一卷的主要讲的是主人公韩凌枫怎样从一个普通人阴差阳错地加入一个未知的团队的，这本书是穿越，主人公肯定是要穿越的，这是穿越之前的磨合吧。首先韩凌枫是一个各方面一般般的学生，性格上比较温和，不会到处惹麻烦的那种人，责任心偏强，很善良，总是在想自己哪里哪里又做错了什么的，其实这样的人学习不好是因为他没有动力和决心吧，总之，实际上韩凌枫在班里算是一个比较胆怯、自由自在的心地善良之人，死对头什么的几乎没有。这样来看，他已经在心底承认了自己“平平常常”，他没有信心，觉得自己天生就不是那种某方面很强的人。
　　女生缘他方面一般般偏好，女生觉得他这样的人很好，他唯一的惹人讨厌的地方就是女生缘比较好，班上的女生都不反感和他说话啦讨论啦，这是韩凌枫唯一惹人记恨的地方，如果他处理好了这个问题那么韩凌枫几乎就是亲切榜头号王老五。但是韩凌枫从来没有想过这样的事情，所以啦，他还是自由自在地生活着，成绩也稳步上升。
　　韩凌枫在主要剧情开始后的半年以前被一个向他表白的女生给大骂了，正常情况下，这样的阴影会持续笼罩他几年的时间，他唯一的惹人喜欢的地方，亲切也将被无情地割去。所以不得不让人怀疑他是否是一场阴谋的受害者，但是无论如何，韩凌枫彻底丧失了他原来所有的一些正常人的品格和行为，让人感觉到他在发疯。（隐藏事件）
　　第一部是讲韩凌枫如何从一个青春期刚过的正常无比的人变成了别人眼中的天才级人物，总是是要起到一定的励志才好。韩凌枫遭遇了神秘队伍后与这些爱思考的天才级人物经历了一场冒险，最终也有了自己的执著和追求。
　　*神秘队伍总体人设
　　男性角色是一名神秘强大的队长，死板强大的副队长，一个爱吃橘子的落魄机械师程序猿：橘子男，崇拜肌肉精通各种武器的霸哥，年龄最老的大叔厨子和一力大无穷的兽人）没错，兽人！锲子过后会有他与古代玄幻的碰撞，说是一本以面对玄幻的小说也不为过吧！）；女角色是擅长枪械物理的短发活力女，擅长数学算法的眼镜短发女邓秋离，擅长生物化学的长发女。
　　主人公是傻子男（应该是中二男才对），所以主要人物的性格习惯都是别人自己拿出来分享的。
　　****邓秋离
　　邓秋离就是那种所谓的班级里人人皆知的好学生，从小如此。她的人生头十八年没有瑕疵，而且带着今后也不会有的趋势。她是韩凌枫的小学同学，初、高中校友（初高中韩凌枫已经被分班制与女神隔离开了），但是她的身世、家庭没有人知道，韩凌枫被强迫加入神秘队伍第一次任务后发现邓秋离就是这里的资深队员，主攻算法，这一切似乎证明着，女神不是人而是神，与韩凌枫这种狗腿子是完全不同的两种生物！！
　　能不说话就不说话。
　　****维克多
　　神秘队伍副队长。性格强迫、完美主义者，最突出的习惯是用无死角摄像头观察自己的每一个动作表情。维克多会把每天所有见过的人、自己与他人发生的对话等记录在脑海里，以便进行逻辑思考，因为好奇，他喜欢探究别人在想什么。
　　总是想得很周到，长得很帅。
　　****青洒
　　化学家的女儿，有机化学与生物化学爱好者。很漂亮，总能成功。名字是自己改的，对大多数人没有安全感，却与维克多默契无间。
　　***橘子男
　　队伍里负责主要的技术支持的人，大四学生，怪才，格格不入的宅男（正常人范畴）；精通物理学、多种编程语言和应用，电路、机械。因为爱吃橘子并且吃得很猥琐被称为橘子怪人。在思考的模式上比较接近维克多，但是要有一些人性（更有同情心更正常的感觉），只是不太注重仪表，所以比较神经质。习惯是把每天的经历以某种方式储存起来，以进行逻辑思考，目的是保护自己不受别人负面心理的影响。
　　计时狂，总是在计算时间。
　　此人极度佩服队长。
　　***霸哥
　　军事爱好者，在勤奋方面他是一个天才，并且尽可能地把自己往特种兵的方向锻炼；爱好跑酷，经常受伤，所以也学了基本的急救、医学，但是大伤都是维克多处理的，所以很是佩服维克多。
　　***兽人默德
　　在第一部中加入队伍，与异常空间中灭世的巨人是近亲，性格是老实憨厚崇尚力量什么的。
　　总人设中配角、隐藏人物顾小曼。
　　＊反派角色
　　海拉：美国人，某秘密集团富二代的继任之后的直接下属，女强人，智商超高，算法大师。她是这个神秘的集团前任老总留给继承人的唯一一位心腹级助理，牛叉到爆，全能。这个集团的继承人发现了公司中的秘密，以及被人追杀，海拉是他活下来的唯一依靠。
　　************
　　*设定的碎片*
　　************
　　#队长让队员们平时不摄入过量食物，在任务前食用大量含糖
　　简单来说，
　　当穿越之后维克多等人凭借知识和力量稳定并且掌控了局面，而队长李巫和理科奇才橘子男联手竟然硬生生将这个时代的科技水平往前猛地拉近了一千多年，而时空旅行依然遥遥无期。就在一个冬天，每个人都已经绝望的时候，异变出现了，这个世界有古怪！踏海仙人、异兽屠城！而韩凌枫则被仙人认定其有“仙缘”，被仙人收为徒弟！韩凌枫带着古刀江月去往了武夷之山，开始逐步学习修真。
　　精彩之处在于：这个世界上真的有所谓“修仙”、“仙人”吗？韩凌枫究竟会经历什么？这一行人将何去何从？
　　dream
　　第四章架空日本战国海妖
　　纯粹虚构的梦境，表现了韩凌枫的精神状态。
　　第五章地下室的雕刻家
　　是过去发生的事情。
　　第六章艾利克斯童年时期
　　艾利克斯是麦哲伦收养的不明生物，其基因与地球生物完全不同，体内能源以生物聚变反应堆控制。（虚构科技：在某些近乎苛刻的条件下，聚变反应能在常温下进行。）



'''







'''

/fst/sky/moon-river/Backup/The Montain.txt



    插头
　　泰山之威，何为可畏？
　　悠哉悠哉，不以枉然。
　　若为人伦，汝辈岂在？
　　——《阵之卷·山之威》
　　一
　　男子睁开眼的时候，黑影摇晃



'''







'''

/fst/sky/moon-river/Backup/The White.txt



    这具白骨，死去千年，双手仍掐着对方的咽喉。
　　他看得脊背发凉，喉头发紧。
　　白衣男子不说话了，故事到这里就结束了。
　　“等等，若这具白骨是……”
　　他转头，身后哪里有什么白衣男子，他独自站在山洞里，仿佛走火入魔。



'''







'''

/fst/sky/moon-river/Backup/The Lost.txt



    刮过一道风，是想说什么
　　这风穿行在，田野、荒原
　　不停留
　　过去就像遗世的风，穿过无际的田野。
　　而时间就像雨，从不垂怜世人。



'''







'''

/fst/sky/moon-river/Backup/The Power.txt



    “你可知道为何人总会找到真相？”皇帝说。
　　“因为人们长耳朵，长眼睛，人们为此思考，保护自己。”



'''







'''

/fst/sky/moon-river/Backup/Antiaris toxicaria.txt



    见血封喉，又称箭毒木，汁液色白，剧毒。触及伤处，片刻毒发，立死。
　　他看着那棵巨大的树木，其叶与书中所述相符，他将披风缠在手上，扯下一根。



'''







'''

/fst/sky/moon-river/Backup/The Flower of Life.txt




　　炊烟花
　　再回去的时候
　　我想坐在长椅尽头，看花开花落，云卷云舒，稀朗朗的行人
　　一直很多年，茁壮发芽，如同鲜花
　　也许你最在意的人，都会变成你最爱的人
　　可你最爱的人，不是你的爱人
　　一棵树一生会发几次芽
　　一场雨一晚会说几句话
　　一朵花长大会找谁嫁
　　我们慢慢地，慢慢地
　　都会走到最后，长廊如墨，如夜如漆
　　可一颗心满满的，如何携手再走
　　回头，不见，醒来只是一场梦
　　清醒才是幻觉。我们就默默看着
　　人们过往，大地云烟
　　人没了退路，就燃起战火，踏上王座
　　之前的不过，是等着它来的那一天



'''







'''

/fst/sky/moon-river/Backup/Back.txt



    他死死地盯着对方，提防着随时可能出现的暗手。
　　我不能死，我不能死。
　　虽然见不到顾小蔓了，可我活着回去还能见小然，见青洒，见邓秋离。



'''







'''

/fst/sky/moon-river/Backup/Old Man.txt



    他走投无路了，没人要他，酒楼也将他踢出大门。
　　饿了两天了，他满脸污垢，连自己是谁都不知道。
　　第三天晚上，一个中年男人出现在他面前。
　　“年轻人，就算你饿死在这，也不会有人怜悯你的。”
　　“要不要随我做一些脏活？”



'''







'''

/fst/sky/moon-river/Backup/The Reactor.txt




　　蒸腾的烟雾仿佛云海，维克多走到巨大的平台中央，举起双手，时隔多年，他又回来了。
　　“橘氏”聚变反应堆正在启动，预热。指示灯亮着令人不安的暗红色。
　　你看着它们长大，有天也要亲手将它们埋葬。



'''







'''

/fst/sky/moon-river/Backup/Genghis Khan.txt



    这么说来啊，成吉思汗可以说是灭过中国，给汉文化以巨大的打击。
　　韩凌枫崩溃了，想起当时游览成陵，觉得成吉思汗很厉害，给守陵的人行过一个礼。
　　要不是改革开放民族大融合这拿到古代是得被骂逆子吧？对方还回了一个礼……



'''







'''

/fst/sky/moon-river/Backup/Our Walking.txt




　　“等等……”
　　“那把是日本刀……”
　　“那把是苗刀。”
　　“跑……!”



'''







'''

/fst/sky/moon-river/Backup/The Fire , Miss & Flower .txt




　　（第二卷大战）
　　建军说：“你看看这些人，他们看到了人性的弱点，却不想去改变，只是从中捞取利益，无论是物质的还是非物质的。”
　　“曾经有一个开朗的孩子，天天在深夜玩手机，如此的孤单。”
　　“几年前的你自己，正在你心中，哭泣着。”
　　“不是么？”
　　他的声音越来越清晰，通过人工肺所挤出的空气发出沉重嘈杂的声音，仿佛能看见那黑色的怒火不可遏制地迸发出来。
　　韩凌枫原本那些着急和激动的情绪竟然都凭空消失了，鸡皮疙瘩很快地起了全身。韩凌枫觉得孤独和惊慌，这样的时刻，自己却仿佛感觉不到那些刀尖和火焰划在自己的身上一样。没有同感，难道自己的人性已经在几年的孤独中被泯灭了吗？
　　韩凌枫被自己惊出了一身冷汗，随后又摇摇头让自己恢复理智。
　　建军一直都是一个稳重的人，他从来不多说一个字，从来不多发出一个声音，这样一直有四年这么久。而今天他是如此歇斯底里，如此疯狂。
　　他已经豁出去了，今天，将是生死之战！
　　——————————————————————————————————————
　　“别跟我说这些，这算什么？这不过是因为自利说出的一句话罢了，你想想你自己做了什么，你杀死了一个女孩，还把一个男孩逼到了绝境。
　　他一直重复着知错了，磕着头，有些人似乎已经认为他是在刺激男孩，让他发奋。
　　他表现得有些英勇，难不成真是豁出性命的刺激吗？
　　难道他真是在刺激男孩让他发奋？
　　我几乎已经这样认为了，可我忽然想起来，有那么多的办法可以让男孩变好，可他偏偏就是要让女孩子去死。
　　可这时我竟然完全想不到办法。
　　我放他走了，很多年后我忽然想起来，男孩女孩什么都可以不要，以至于拖累了别人，是因为，他们已经什么都不剩了啊。
　　他们已经不再奢望任何，稍微好一点的生活。
　　—————————————————————————————————————————
　　章节名：泪花
　　位置：穿越篇结局
　　这是一家郊外的酒家，之前这里是没有人烟的，直到最近才因为枫华酒舍而有了慕名而来的人，渐渐地出现了小镇。
　　据说这里隐居着一位高人，原本位居朝廷大博士，同时又是传说中凌虚位仙人的在世。是这世间唯一一位精通科学，而又遗世独立的仙人。有人说，他就是当朝五大圣人中最神秘的那一个，也就是韩凌枫。
　　甚至还有人说，这间酒家的掌柜就是枫的好朋友。
　　酒馆是泥土修筑的，房梁上堆砌着茅草，但是整个酒家的光线、摆设都很有格调，丝毫不逊色于那些名士居所。
　　酒馆里坐着零零散散的客人，两位身着黑衣斗笠的人抬头看着墙上的字迹，一人直目凝视，另一人无声地念诵着
　　—————————————————————
　　梦里花开
　　章节名：忘川
　　位置：伏羲卷，转折或发展
　　----
　　那是一条幽蓝色的河，淡淡的黑雾在河里淌着，连同无数的细小光点，河上岸里弥漫着粘稠的白雾。
　　河与岸之间是没有界限的，全被雾气淹着，白气在这一片天地里浮游着，一直延伸漫天的星海之中。到我们都怔住了，我们从未想过会看到这般奇景，这简直是美得不像话。
　　然而我们就看到在那雾中安静地坐着一个小男孩，自然健康的黑发，虽是月景，却似乎满脸都是阳光。
　　我看着怪熟悉的，仔细一想才发现那竟是十八岁的自己。
　　————————----------------------------------------------------------------------
　　青色花瓣，靖难后白雨前
　　韩凌枫打开扣扣，然后下载了微博，他要找的人已经很难找到了，因为已经丢了，那就是韩凌枫连自己的梦想，连同所有过去都一起放弃掉了的时候。
　　因为微博是很奇特的，你可以在上面搜某个人的名字，如果她也玩扣扣，那么你就能找到她，她修改的签名，她发的照片和她说的话，上面会有，尽管只是一点点。
　　无论是把你删掉的人，还是谁错过的谁。
　　那个叫青洒的女孩，就很特殊啊。他在微博上搜了青洒，这世上同名的人很多，不过这样古风的名字就少一些了，而头像最美的那个一定就是青洒。
　　---------------------------------------------------------------------------------------------
　　忽然之间，小人物的爆发
　　奎因忽然抓起女孩的手，很霸道地拉着她走开了。
　　“我不管你喜欢不喜欢我，我很喜欢你就是了。”
　　__________________________---
　　喜欢是匹傻马，拖着人在前面跑呀跑
　　——-------------------------------------------------
　　我他妈就是个被诅咒的家族，我妈孤独我爸孤独，我公公英年早逝我阿姨英年早逝我叔叔英年早逝，公公的两女儿孤孤单单的，阿姨的儿子完全不要命，我外公是红卫兵，爷爷哪来的他自己都不知道就走了，我祖祖还是卖鸦片…
　　----------------------------------------------------------------------------
　　沙漠快巴，男孩被戏弄，吊在车外，偶然间发现尸体，引出恐惧者。
　　恐惧者囚禁了三个人并且放血。一个人七刀一个人烫伤，还有一个受尽折磨。
　　他是特工。
　　(某天夜里)他施展魔法，引发了爆炸，逃离牢笼，逃到了沙漠边陲的小镇，本该是黑市的地方却空无一人，他饶了几圈，眼看恐惧者们就要追来，他想了想，从包中拿出一瓶药水喝下，然后他看到了黑市。
　　他找了个人贩子把自己卖了，



'''







'''

/fst/sky/moon-river/Backup/Three-Dimensional.txt



    维克多的胡子已经留到一寸长，他看上去有些邋遢。
　　“根据霍金的时间观，过去的四川和现代的四川，实际上都是存在于同一位置，只是第四维度值不同。
　　“而当时的我们，四维度值与现代四川相同，所以说我们能相互影响，也就是说我们处在同一时间段。”
　　维克多拿起手里那把朴实而又细致的刀，满脸复杂。
　　“不知怎的，这把刀本身的第四维度值非常不稳定，本身就是在时间的长河里不断穿梭。”
　　“百万年来，我们所熟知的物体都具有稳定的四维值，不会忽然跑回去。”他想了一下，补充道。
　　“而我猜，它内部的某些结构，会使它每隔一段时间，就会积蓄能量，或是遇见契机，就像发动机点火改变三维值一般，改变自身的四维值。
　　“而韩凌枫成为了它的契机，甚至使它一同改变了周围物体的四维值，仿佛发动机爆炸一般。
　　“爆炸中心的刀四维值变化最大，回到了百余年前，我回到了几年前，其他人估计也会很快出现。
　　“还好，我们的后背与前胸没有出现在不同时间。
　　“以前我一直觉得这种理论是扯淡，世界只有三维，什么空间弯曲，时间流逝变慢，都是在三维的基础上形成的幻觉，如果说是要回到过去，也最多只能通过物体现状反推过去的状态。
　　“现在看起来，是我肤浅了。”
　　他抬头，叹气，当年白皙的脸颊变得十分粗糙。
　　“据传，月光为仙人所制，老子不过也是凡人，这把刀真正的作者，怕只能是外星人或者，大自然本身什么的了。”
　　书里说这把刀是认主的，有缘之人持此刀，能超脱三界之外。这样看来自己就是这把刀的新主了，可如今韩凌枫一点也开心不起来，反而听得后背发凉。
　　古代生产力水平落后，欺强凌弱，满山强盗，疾病横行。还有可怕的徭役和数十万人血流成河的大战。
　　手握宝刀就能成一代豪杰？别开玩笑了，就算能成，也不是他韩凌枫。
　　自己的话，估计第一战就会被砍翻的吧？



'''







'''

/fst/sky/moon-river/Backup/The Runner.txt




　　“当天下大乱，你就这么跑了？“
　　“对阿我就这么跑了，我还要提前看好往哪儿跑怎么跑……“



'''







'''

/fst/sky/moon-river/Backup/The Secret.txt






'''







'''

/fst/sky/moon-river/Backup/The Sword.txt



    一
　　老板环绕着他，低声细语。
　　“一般情况下，人一生只有两个誓言。
　　“一个是婚誓，一个是死誓。
　　“所以人是不该发誓的，没发过誓的人活得久。”
　　“这位小兄弟，有何贵干呀？”中年人眯着眼，歪嘴笑了一个。
　　二
　　“反正练剑一生，可能就只有第一次能用上。”
　　



'''







'''

/fst/sky/moon-river/Backup/The Blank Moutain.txt



    雾书有云：空海有山，云绕其山。长发及腰，风落膝边草。世人亦称外山。
　　那破屋里的小道士犹豫再三，还是走了出来，恭恭敬敬地行了一个礼，说：“这位道友莫要怪我，只是天地自有大道，岂是你我所能涉及？即便是想一下，日后怕也会遭来劫数。”
　　说完，他诚诚恳恳地回了茅草屋。
　　看起来基本上就是一座普通的小山啊。我心已经放弃了，歇了歇脚，就着景色，又一路走回去。
　　下山时，我就觉得不对头，越想越奇怪，却又不太清楚是哪里不对。
　　又回到了那个小村庄，村里人很热情地招呼我吃晚饭，他们的灶台冒着炊烟。
　　我忽然就想明白了，那个小道士，他的想法竟然和我这个不同时代的人一模一样！
　　他说的话，哪里是思想狭隘的古人所想的？完全是我的心里话，那座山上的云仿佛飘到了我的脑海里，我甚至有些想不起小道士的脸。
　　他真的存在过吗？
　　我看着那座山，忽然觉得很奇怪，好像它在读我的想法。
　　我决定明天再去一趟。
　　大清早有老者带着弟子上山采药，老人白发苍苍，徒弟背着背篼。
　　他默默看着，觉得很好。
　　



'''







'''

/fst/sky/moon-river/Backup/The Running.txt




　　我拿出火折子，扔起来，感觉它在空中的角度，然后抓住。
　　以此估计自己的身、心是否同步。



'''







'''

/fst/sky/moon-river/Backup/The Battle.txt



    你要走了，真的要走了。
　　不改了。
　　你收拾好你的东西，最重要的，是午后阳光，和一幅没有名字的女孩的画。
　　然后你放走了马，摸摸它的头；你给仓鼠加了粮，够它吃一辈子了；你告别了小黄鸭，摸摸它的头；你深吸一口雾气，告别了暮色里的森林。
　　你要走了，你的小小的远征，要开始了。



'''







'''

/fst/sky/moon-river/Backup/The Ghost.txt



    队长的技术，应该很厉害吧？
　　究竟强到什么地步呢？韩凌枫心里也没底。
　　他的手在键盘上敲打着，带着某种奇妙的柔和旋律，一道一道的防线在快速崩溃。
　　仿佛恶鬼蔓延。
　　队长的电脑跑的系统，是那种吹牛逼电影里黑客用的那种，屏幕一片漆黑，只有一行行的瘦英文。
　　平时，这台电脑会显示一个被光点环绕的细圆圈，它旋转，光点灵巧地闪烁，其中一小块非常有节律，仿佛某种心跳。
　　



'''







'''

/fst/sky/moon-river/Backup/The City of We.txt




句谦把包丢在地上，裹了裹身上的衣服。他觉得自己快崩溃了，并不是他没赶到最后一班车，准确的说，是晚班的司机提前发了车，可能是司机今天很累，可能是为了几分钟的时间看某个精彩的电视节目……再或者就是与自己一样，希望早一点回家。家里什么都好，不管是家乡的炒饭还是那条大狗。
　　A城的夜晚是不安静的，句谦没有生在这样的大城考试市，很多车声，夜市缭乱的灯光让他很怀念家乡，安静的像一谭湖水的城市，还有牵牛花慢慢地长到你的窗前。
　　夜晚的车站安静的就像沉入了大海那样，只有排排路灯点点的灯光环绕在车站周围，像是璀璨的项链。远方匍匐的山脉上浮现出奇异的金边露出的黑色剪影就像是怪物的脊背。远处有零星的面包车安静地停在路边，起风了，树叶轻轻地摇摆，说不出的凉快。
　　就在这个时候，下雪了。
　　在偏南方的城市是很少下雪的，一年难得几次雪天也多半是小小的白色颗粒状，当然，A城也不例外。然而此刻，天空中飘下的慢慢地变成了一片一片，虽然是很小的一片片，但是对于句谦这种从小便生活在南方城市的学生来说，是一辈子也没有看到过的景色。
　　就像是整朵的花在风中划过。这时，一幅幅的画面在句谦的脑海里勾画，或者说是苏醒过来，貌美如花的女子在雪中舞剑，白须的老者站在一旁，远处是淡淡几笔勾勒的高山流水……
　　就在这个时候，一阵突然的阴冷传来，句谦不禁打了个机灵，他渐渐弥散的意识也被强行拉回了现实里。有什么地方不对劲，自己没有察觉到的不对劲，是什么呢？到底是什么？
　　句谦猛然醒悟过来，现在才刚刚入冬，像A城这样的南方小城，不要说在这个时候下雪，连听都没有听说过，一颗都没有更别说像现在这样的阵仗。
　　这时句谦的背后突然一阵发凉，太安静了。风声，之前树叶的沙沙声，守夜的面包车里微弱的灯光，车站旁24小时便利店的闪烁的灯光。全都消失了。他猛地从座椅上跳了起来，掏出口袋里的手机，翻到通讯薄里最低端最角落里的那个号码，它位于单独的一组之中，因为它的名字没有按照中文或者英文的首字母进行排序。电话号码“~~”，看上去有些可笑。
　　就在句谦要按下去拨这个号码之前，电话响起，铃声是烂大街的三星来电铃声，电话号码正是他刚要拨出的“~~”。
　　“你还在A城吧？紧急情况。20分钟后我在B街等你。”电话里传来年轻男子的声音。
　　果不其然，事情没有结束啊。
　　句谦，原本是像普通大学生那样，有些自己想做的事情，也有些小小猥琐心理的大大的好青年，但是就在某年暑假他的生活费被耗子吃了！！没错，天晓得现在的耗子是饿成什么个样子了，有些滑稽的这晴天霹雳让句谦是笑不出来也哭不出来，于是开始了艰辛的暑假打工生活。可是从小娇生惯养的他哪里知道钱是有多难挣啊！一番折腾下来，他还是没能挣到买论文的钱。（虽然句谦自己觉得有些别扭，但在他那些室友看来这倒是非常合理）



'''







'''

/fst/sky/moon-river/Backup/The Mist.txt



    “记着我给你的话，还有那个术。”男子摸摸女孩的头发，转身走了，不住三回头。
　　他浑浑噩噩，仿佛走了一生。他走到一个清澈泉水的山洞，他明白了，就是这里了。
　　他跪坐下来，抽出细长的短刀，对着自己的小腹，紧绷双手。
　　该结束了。
　　他就这样，一直这样，竟然下不去手。
　　他的一切都充斥着澎湃、酸楚。
　　他时而起身，时而躺在地上，时而泪流满面。
　　整整一天了，他已筋疲力尽，头发紧贴着脸颊。
　　我为什么下不去手？
　　我留在世上还有何愿望？
　　是否神明已将我遗忘？
　　他恍惚地走出了山洞，清晨的阳光透过雾气，在山谷中摇摇晃晃。
　　恍若仙境。



'''







'''

/fst/rain/rainbag





























/*







 leaf


i o pi s leaves







 wood


i s leaves s leaves level two





*/






















/*

 void  *  starfall  (  void  *  sky  )

  {

*/


 void  *  dream_saw_starfall   (  void  *  sky  )

  {


/*

 無形 星落 擇 無形 蒼天 者

 其

*/


/*

 void  *  dream_rain  (  void  *  leaf  )

  {

*/


 void  *  dream_saw_rain   (  void  *  leaf  )

  {


/*

 無形 夢柬星雨 擇 無形 葉 者

 其

*/


 void  *  dream_saw_rainbag   (  void  *  bag  )

  {


/*

 倛 潤迾黨  倛 黨 氪

*/
















/*

 it returns null if dreamming about fst goes wrong

*/


/*

 if dream gose wrong

 it will return null 

*/


/*

 it could return null

 then this dream return null

*/


 return   dream_wake  (  "yes"  );


/*

 回應 夢醒 擇 「然」 者也

*/






















  }


/*

 終也

*/



























'''







'''

/fst/rain/hoby.c






'''







'''

/fst/seed/shell/save.sh



#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address=''
MOUNT="no"

echo "Name    : $name"








if [ -d "/dev/sda1/" ];then
  address="/dev/sda1"
  echo "Address : $address"

elif [ -d "/media/gop/TxL/" ];then
  address="/media/gop/TxL/"
  echo "Address : $address"

elif [ -d "/media/gop/TXL/" ];then
  address="/media/gop/TXL/"
  echo "Address : $address"

elif [ $name == "deepin-PC" ];then
  address="/media/deepin/TxL"

elif [ $name == "beaglebone" ];then
  address="/media"
  mount /dev/sda /media
  MOUNT="yes"

elif [ $name == "raspberrypi" ];then
  address="/media/pi/TxL/"

elif [ $name == "dragino-129ff8" ];then
  address="/mnt/sda1"

elif [ $name == "Orangepi" ];then
  address="/media/usb"

elif [ $name == "ubuntu" ];then
  address="/media/TxL"

else
  echo "No gopUSB device."
  address="unknow"
fi




if [ $address != "unknow" ];then
  echo "..."



  if [ ! -d $address ];then
    mkdir $address
  fi

  mv -f  ${address}/seed         ${address}/backup
  cp -rf /opt/TxL/seed           ${address}/seed
  rm -rf ${address}/backup

fi





if [ $MOUNT == "yes" ];then
  umount /dev/sda
fi




  echo "Done."




'''







'''

/fst/seed/shell/git_scv-failed.sh




#!/bin/bash

export GIT_SSL_NO_VERIFY=1





'''







'''

/fst/seed/shell/wifi.sh





#!/bin/bash

sudo iwconfig wlan0 essid "ChinaTelecom-EDU2.4G"

sudo dhclient wlan0



'''







'''

/fst/seed/shell/scp.sh







if [ $# -lt 1 ]; then

   echo ''
   echo ' Please type [user@ip] to update.'
   echo ''

   exit 1

fi


path=$2

if [ -f $path/build.c ]; then

   if [ -d seed ]; then
      rm -rf seed
   fi

   scp -r $1:$path ./

   if [ -d seed ]; then
      rm  -rf  $path
      mv  seed $path
   fi

fi



'''







'''

/fst/seed/dream.c







/*

 list if files

 we could auto got this from it soon


 use a long and complex list to do it

*/



/*

 seed/library/Linux.h

*/



 # include "../../../library/standard/Linux.h"








/*

 moved flag to hope of dog

*/

/*

 things/c/that/flag.c

*/















/*

 get that form a convent, maybe from network

 good idea

*/















/*

 it is for things taking before getting


 struct of watchdog about

*/


// watchdog/about/that/that/system.c

// watchdog/about/that/that/cpu.c

// watchdog/about/that/that/memory.c

// watchdog/about/that/that/disk.c

// watchdog/about/that/that/network.c

// watchdog/about/that/that/sonud.c


// watchdog/about/that/that/that.c









/*

 things to clean it

 be easier to read

 move them cause they couldn't be support by things

*/


// watchdog/about/that/clean/system.c

// watchdog/about/that/clean/cpu.c

// watchdog/about/that/clean/memory.c

// watchdog/about/that/clean/disk.c

// watchdog/about/that/clean/network.c

// watchdog/about/that/clean/sonud.c

// watchdog/about/that/clean/mate.c


// watchdog/about/that/clean/that.c







/*

 there's load about and put about below

*/



/*

 watchdog/about/that/put/that.c

 watchdog/about/that/load/that.c

*/

















/*

 take it where they belong


 watchdog hopes maybe added after this

 add flag?

*/


//# include "../../../watchdog/that/hope.c"






/*

 maybe get hope and thing part away

*/






/*

 dog will use

*/



//# include "../../../network/that/that.c"

//# include "../../../network/that/hope.c"





/*

 net necessary to at start

 network/that/check.c

 network/that/clean.c

*/






// voice/that/that.c

// voice/that/hope.c
















/*

 load them after including

 as a structure



 put it to the end of list of head and build

 then it can use the structure of configurations to note configurations everywhere


 and if we don't have anyone in code, we set a head of blank to fill it



 we use pointer as void

 and they are still used blank file to fill files unuseful sometimes

*/



 # include "../../../things/c/that/hope.c"









/*

 they're in one things

 all of value in a little dream

*/




# include "../../../things/c/that/that.c"



























/*

 ways of box

 load them first

 they could be use everywhere afterthis

*/






/*

 maybe someday we will use it



 some day we use lots of library file to use it by acrossing device

 and i need almost little number to use with gnu library

 so i need to take it

*/



// things/c/data/translate/number_word.c









/*

 some day use it to display

 as we are on tkinter


 maybe save tonot

*/



// # include "../../../things/c/system/output/print.c"







/*

 in the things we have ways we take

 and they're from library

 maybe use a dirent to put all library way in


 far away from things

*/



// things/c/system/file-system/dirent/is.c


// things/c/system/file-system/file/is.c

// things/c/system/file-system/file/get.c

// things/c/system/file-system/file/save.c

// things/c/system/file-system/file/append.c







/*

 someway on the system only

 maybe take as alibrary

*/


// things/c/system/process/deamon.c






/*

 wait sometime

 it's different with different system

*/



// things/c/system/process/wait.c






/*

 this use a file named stdin

 may be we sould rewrite it on something

*/


// things/c/system/commandline/shell.c









/*

 data doing

 write myself diy


 maybe i should get them far away from ways from librarys

*/


// things/c/data/secret/secrets/drop_note.c

// things/c/data/secret/secrets/drop_blank.c

// things/c/data/secret/secrets/sum.c


// things/c/data/secret/that.c

























/*

 dog

*/


// watchdog/about/that/clean/system.c

// watchdog/about/that/clean/cpu.c

// watchdog/about/that/clean/memory.c

// watchdog/about/that/clean/disk.c

// watchdog/about/that/clean/network.c

// watchdog/about/that/clean/sonud.c

// watchdog/about/that/clean/mate.c


// watchdog/about/that/clean/that.c











/*

 put or load about

 use some kind of ways load before

 so put them here instead of before at first

*/


// watchdog/about/that/put/that.c

// watchdog/about/that/load/that.c











/*

 note doing

 should be strong could read note balabala...

*/



// watchdog/note/save.c

// watchdog/note/clear.c











/*

 get about


 get them from system

*/


// watchdog/about/system/name.c

// watchdog/about/system/build.c


// watchdog/about/ip/build.c



// watchdog/about/cpu/rate.c

// watchdog/about/cpu/temperature.c

// watchdog/about/cpu/frequency.c

// watchdog/about/cpu/core.c

// watchdog/about/cpu/build.c





// watchdog/about/memory/build.c




/*

 little difficult

*/

// watchdog/about/disk/build.c





/*

 maybe get it blank on some system

*/



// watchdog/about/sound/alsa.c










/*

 check things




 now it could run with no root

*/



/*

 watchdog/check/root.c

*/

// watchdog/check/network.c

// watchdog/check/power.c

// watchdog/check/update.c





/*

 load things

*/


// watchdog/load/hope.c

// watchdog/load/symbol.c

// watchdog/load/listen.c







/*

 dog show


 maybe display on display

*/


// watchdog/show/about.c










// watchdog/that/dog.c

















/*

 sound snake calculate


 high level way

 put it below

*/


// sound/ft/show.c

// sound/ft/dft.c

// sound/ft/fft.c

// sound/ft/test.c







/*

 add the sound code


 make it pure

 use alsa outsite

*/




/*

 if  (  strcmp ( that_type, "base" )  ==  0  )


  {

*/





// sound/corde/blank.c




/*

  }

*/






/*

 else if  (  strcmp ( that_type, "alsa" )  ==  0  )


  {

*/


/*

 sound/corde/alsa.c

*/


















// network/that/check.c

// network/that/clean.c











/*

 The data code
  is for send some data
  in the network connection



  like rain, shine ...

*/


/*

 use other ways to update

 client send word next

*/




// network/message/data/update/build.c

// network/message/data/update/backup.c

// network/message/data/update/append.c

// network/message/data/update/next.c

// network/message/data/update/load.c






/*

 appending data to the message


 why put it below

*/

// network/message/data/that.c









/*

 Append the action codes
 it isn't static

*/



/*

 use a place of dirent to do it

*/


// network/message/action








/*

 strcpy ( note_dirent, note_path );

 strcat ( note_dirent, "/network/message/action" );



 pointer_dirent  =  opendir ( note_dirent );






 do


  {




 ent  =  readdir ( pointer_dirent );




 if  (  ent != NULL  &&  ent -> d_type == 8  )


  {



 strcpy (

          note_file_action,

          strstr ( note_dirent,  gop_configurations . name_the ) + strlen ( gop_configurations . name_the )

        );


 strcat ( note_file_action, "/" );

 strcat ( note_file_action, ent->d_name );




 action_seed_append (
                      note_file,
                      note_path,
                      note_file_action

                    );




  }


  } while ( ent != NULL );




 closedir ( pointer_dirent );

*/










/*

 the module of judge
 means to take the words get on network

 the plan is using the trees system

*/



// network/message/judge/blank.c

// network/message/judge/hello.c

// network/message/judge/who.c

// network/message/judge/information.c

// network/message/judge/command.c











/*

 build the network message system

*/



// network/message/that.c









/*

 the translate system of network


 connect things

 maybe we could use them in library

*/



// network/tcp/connectted.c

// network/tcp/connector.c










/*

 build the

*/


 # include "../../../things/c/code/main.c"






















/*

 this was wrong and i don't know y

 now we use include to gather files

*/








/*

# include <stdio.h>
# include <stdlib.h>

//# include <unistd.h>

//# include <math.h>       // math.sin / math.cos
# include <string.h>       // for ways str??? ()
//# include <time.h>       // for time ( NULL )




//# include <ifaddrs.h>    //for ip address
//# include <fcntl.h>

//# include <dirent.h>     // for dirent


//# include <pthread.h>    // for thread


//# include <signal.h>     // for check_deamon() ->
                           // for tcp block out.

//# include <sys/time.h>   // for note_save() -> gettimeofday()

//# include <sys/socket.h> // for network -> socket

# include <sys/stat.h>     // for file status    way lstat ()

//# include <sys/types.h>  // for check_deamon() ->
//# include <sys/param.h>  // for ...

//# include <arpa/inet.h>  // for network


*/







/*

 make a seed

 to get gop

*/

/*

int main ()


  {

*/




/*

 at first it load hopes and run action_seed ()

*/

/*

 load_hope ();

*/



/*

 printf ( "%s", "seed starts...\n" );

*/

/*

 action_seed ( "base" );


 action_flower ( "base" );

*/















/*

 where the seed list

*/


/*

 void * note_path  =  malloc (  18  *  sizeof ( char )  );

 strcpy ( note_path, "trees/seed/1.note" );

*/



















/*

 check seed   <-

 read seed

 drop note

 save flower

*/


/*

 printf ( " check seed ... " );

*/








/*

 void * note_status;



 note_status  =  malloc (
                          sizeof ( struct stat )
                        );

*/






/*

 if success it will return something

*/

/*

 if (

      lstat (

                               note_path,
             ( struct stat * ) note_status

            ) != 0

    )




  {

 printf ( "%s", "can't find seed \n" );

 return -1;

  }









 free ( note_status );



 printf ( "done \n" );


*/
































/*

 check seed

 read seed   <-

 drop note

 get flower

*/


/*

 printf ( " read seed ... " );

*/




/*

 must give it 3 blank site

 or it crush :<


 it is 3 on termux on sumsung 8 cores with 2g memory

 and it is 5 on cygwin on hp 2 cores with 1g memory

*/

/*

 void * note_flower = malloc ( 5 * sizeof ( char ) );

 void * note_number = malloc ( 1 * sizeof ( int ) );

 * ( int * ) note_number = 5;


 void * note_words = malloc ( 128 * sizeof ( char ) );

 void * note_file;

*/







/*

 note_file  =  fopen ( note_path, "r" );

*/



/*

 could open a wrong place

*/


/*

 if ( NULL == note_file )

  {

 printf ( "seed couldn't open \n" );

 return -1;

  }

*/




/*

 if success it return a pointer

*/

/*

 while (

         NULL != fgets (
                         ( char * ) note_words,
                                    128,
                         ( FILE * ) note_file
                       )

       )

  {



 * ( int * ) note_number  +=  strlen (  ( char * ) note_words  );


 note_flower = realloc (
                           ( char * ) note_flower,
                         * ( int * )  note_number * sizeof ( char )
                       );


 strcat (
          ( char * ) note_flower,
          ( char * ) note_words
        );


  }

*/




/*

 this for test

*/

/*

 printf (
          "\n %d \n %d \n",
           strlen (  ( char * ) note_flower  ),
         * note_number
        );

*/







/*

 it use flower

 and that will be free at last

*/


/*

 free ( note_number );

 free ( note_words );

 fclose (  ( FILE * ) note_file  );


 printf ( "done \n" );

*/




























/*

 check seed

 read seed

 drop note <-

 save flower

*/



/*

 char note_word [ 2 ] [ 16 ];

 strcpy ( note_word [ 0 ], "#" );

 strcpy ( note_word [ 1 ], "//" );

*/












/*

 they are for read

*/


/*

 void * note_place  =  note_flower;

 void * note_enter;

*/


/*

 this is for check

*/

/*

 char  note_path_file [ 128 ];

*/






/*

 use for check

*/


/*

 note_status  =  malloc (
                          sizeof ( struct stat )
                        );

*/







/*

 do

  {




 note_enter  =  strchr ( note_place, '\n' );

*/






/*

 if it isn't the last round

 make it is that we could read

*/


/*

 if ( NULL != note_enter )

  {

 * ( char * ) note_enter  =  '\0';

  }

*/









/*

 get the path

*/


/*

 strcpy (  ( char * ) note_path_file,  ( char * ) note_place  );

*/








/*

 take blank type away

 always goes wrong here

*/







/*

 while (  * ( char * ) note_place  ==  ' ' )

  {



 note_place  =  note_place + 1;

*/


/*

 strcpy (
          ( char * ) note_path_file,
          ( char * ) note_path_file + 1
        );

*/

/*

  }

*/














/*

 if it is a file that note said

*/


/*

 if (

      lstat (

                     ( char * ) note_place,
              ( struct stat * ) note_status

            ) != 0

    )


  {

 printf ( "%s \n", ( char * ) note_place );

  }

*/








/*

 if it isn't last loop

 return it so

 keep reading

*/

/*

 if ( NULL != note_enter )

  {


 * ( char * ) note_enter  =  '\n';


 note_place  =  note_enter + 1;


  }

*/








/*

 last round exit

*/

/*

  } while ( NULL != note_enter );

*/













/*

 free ( note_status );

*/

























/*

 free ( note_path );

 free ( note_flower );





 printf ( "%s", "Over.\n" );



 return 0;


  }


*/



'''







'''

/fst/seed/light.java






'''







'''

/fst/seed/water.sh









# maybe use .dll

  gcc  ../things/spi/waveshare_1.3inch.c  -s  ../things/spi/waveshare_1.3inch.so

 
 
  gcc  ./seed.c  -o  ../../?



'''







'''

/fst/seed/windows/stm.bat





cd ../c/stm32/system

type system_init.h  >  ../../../../../flower.c

echo.  >>  ../../../../../flower.c





cd ../head

type variables.h        >>  ../../../../../flower.c
type Kylin_mini_v1.2.h  >>  ../../../../../flower.c

echo.  >>  ../../../../../flower.c






cd ../system

type time.h  >>  ../../../../../flower.c
type gpio.h  >>  ../../../../../flower.c

echo.   >>  ../../../../../flower.c







cd ../resouce



if      "%~1"=="vga"     type vga.c  >>  ../../../../../flower.c



echo.  >>  ../../../../../flower.c




'''







'''

/fst/seed/python/qzone.py




import os
import sys
import time
from PIL import Image





image    = [0, 0, 0, 0, 0, 0, 0, 0]
image[1] = Image.open('/opt/gop/library/auto-qzone-1.png')
image[2] = Image.open('/opt/gop/library/auto-qzone-2.png')
image[3] = Image.open('/opt/gop/library/auto-qzone-3.png')
image[4] = Image.open('/opt/gop/library/auto-qzone-3.png')
# 裁剪

# 尺寸
size     = [0, 0, 0, 0, 0, 0, 0, 0]
size[1]  = image[1].size
size[2]  = image[2].size
size[3]  = image[3].size
size[4]  = image[4].size

# 颜色
#pixel = getpixel((w, h,))
pixel    = [0, 0, 0, 0, 0, 0, 0, 0]
pixel[1] = image[1].load()
pixel[2] = image[2].load()
pixel[3] = image[3].load()
pixel[4] = image[4].load()

# 缩放
#image[0].thumbnail((w//2, h//2))

# 旋转
#image[0].rotate(45)

# 显示
#image[0].show()

# 保存
#image[5].save('/opt/gop/library/auto-qzone-3.png')



def find_image( s1, s2 ):

    number = 0
    step   = 1
    target = [-1, -1]
    limit  = 0.80 * (size[s2][0]//step) * (size[s2][1]//step)

    for w in range(size[s1][0] - size[s2][0]):

        for h in range(size[s1][1] - size[s2][1]):

            number = 0

            if target == [-1, -1]:

                ww = 0 - step

                while ww < size[s2][0] - 1 -step :

                    ww += step
                    hh = 0 - step

                    while hh < size[s2][1] - 1 - step :

                        hh += step
# 颜色
                        if  pixel[s1][w+ww, h+hh] == pixel[s2][ww, hh]:

                            number += 1

                            if number >= limit :

                                target[0] = w
                                target[1] = h

    print(target)
    return target




count = 1

if len(sys.argv) > 1:

    try:

        count = int(sys.argv[1])

    except:

        print("Please type number of the beginning.")
        quit()


while(1):

    os.system("scrot /opt/gop/screenshot.png")

    image[0] = Image.open('/opt/gop/screenshot.png')
    image[5] = image[0].crop( (1700, 140, 1740, 1030) )
    image[6] = image[0].crop( (1170, 140, 1220, 1030) )
    image[7] = image[0].crop( (2000, 800, 2100, 1000) )
    image[0] = image[0].crop( (1130, 110, 1750, 1030) )

    size[0]  = image[0].size
    size[5]  = image[5].size
    size[6]  = image[6].size
    size[7]  = image[7].size

    pixel[0] = image[0].load()
    pixel[5] = image[5].load()
    pixel[6] = image[6].load()
    pixel[7] = image[7].load()

    target        = [0, 0, 0, 0]
    target[0]     = find_image(5, 1)
    target[1]     = find_image(5, 2)
    target[2]     = find_image(6, 3)
    target[3]     = [0, 0]



    if target[0] == [-1, -1]:

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)

        os.system( "xdotool key Down" )
        time.sleep(0.5)

        os.system( "scrot /opt/gop/backup-" + str(count) + ".png" )

        continue

    if target[1] == [-1, -1]:

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)

        os.system( "xdotool key Down" )
        time.sleep(0.5)

        os.system( "scrot /opt/gop/backup-" + str(count) + ".png" )

        continue

    if (target[2]   != [-1, -1] and target[0][1] > target[2][1]) or target[0][1] > target[1][1]:

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)


        for i in range( (target[1][1])//40 + size[2][1]//40 + 1 ):

            os.system( "xdotool key Down" )
            time.sleep(0.1)

        time.sleep(0.5)

        os.system( "scrot /opt/gop/backup-" + str(count) + ".png" )

        continue
        


    os.system(
                " xdotool mousemove " + str(target[0][0]+1700-490) + " " + str(target[0][1]+140+30)
             +  "         mousedown 1"
             +  "         mousemove " + str(target[0][0]+1700-300) + " " + str(target[0][1]+140+30)
             +  "         mouseup 1"
             )


    os.system( "xdotool key ctrl+c" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 100 100" )
    time.sleep(0.1)

    os.system( "xdotool click 1" )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+a" )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+v" )
    time.sleep(0.1)

    if target[2] == [-1, -1] or target[2][1] - target[1][1] >= 50:
        os.system(
                   " xdotool mousemove " + str(target[0][0]+1700-550) + " " + str(target[0][1]+140+65)
                 + " sleep     0.1"

                 + " mousedown 1"
                 + " sleep     0.1"

                 + " mousemove " + str(target[1][0]+1700) + " " + str(target[1][1]+140-20)

                 + " mouseup   1"
                 + " sleep     0.1"

                 + " key       ctrl+c"

                 + " sleep     0.1"

                 + " mousemove 100 100"
                 )
    if target[2] != [-1, -1] and target[2][1] - target[1][1] < 0:
        os.system(
                   " xdotool mousemove " + str(target[0][0]+1700-550) + " " + str(target[0][1]+140+65)
                 + " sleep     0.1"

                 + " mousedown 1"
                 + " sleep     0.1"

                 + " mousemove " + str(target[1][0]+1700) + " " + str(target[2][1]+140-10)

                 + " mouseup   1"
                 + " sleep     0.1"

                 + " key       ctrl+c"

                 + " sleep     0.1"

                 + " mousemove 100 100"
                 )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 900 990" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool key Return" )
    time.sleep(0.1)

    os.system( "xdotool key       ctrl+v" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 825 20" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 825 120" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 500 195" )
    time.sleep(0.1)

    os.system(
               "xdotool type /opt/gop/library/micro-blog/"
             + str(count)
             )
    time.sleep(0.1)

    os.system( "xdotool key       Return" )
    time.sleep(0.3)

    os.system( "xdotool key       Return" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 1700 20" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)


    for i in range( (target[1][1])//40 + size[2][1]//40 + 1 ):

        os.system( "xdotool key Down" )
        time.sleep(0.1)

    time.sleep(0.5)

#    while target[3] != [-1, -1]:

#        find_image(7, 4)



    count += 1







os.system("rm /opt/gop/screenshot.png")



'''







'''

/fst/seed/python/note_blog.py



 
import sys





if len(sys.argv) != 2:
    print("PLEASE TYPE: python3 .../*.py id")




that_id      = sys.argv[1]
buffer_count = 1
buffer_file  = []
buffer_blog  = []
buffer_note  = []
buffer_time  = []


while 1:

    buffer_file  = "/opt/TxL/sky/micro-blog/"
    buffer_file += that_id
    buffer_file += "/"
    buffer_file += str(buffer_count)
    buffer_file += ".txt"
    try:
        buffer_file  = open(buffer_file, "r")
    except:
        break
    buffer_blog  = buffer_file.readlines()
    buffer_file.close()

    buffer_year      = buffer_blog[0].find("年")
    buffer_month     = buffer_blog[0].find("月")
    buffer_day       = buffer_blog[0].find("日")
    buffer_hour      = buffer_blog[0].find(":")
    buffer_today     = buffer_blog[0].find(" ")
    buffer_yesterday = buffer_blog[0].find("昨天")
    buffer_after     = buffer_blog[0].find("前天")

    if buffer_year != 4:

        if buffer_yesterday != -1:
            buffer_blog[0] = "2018年1月2日" + buffer_blog[0][buffer_yesterday+2:]
        elif buffer_after != -1:
            buffer_blog[0] = "2018年1月1日" + buffer_blog[0][buffer_after+2:]
        elif buffer_today == -1 and buffer_hour != -1:
            buffer_blog[0] = "2018年1月3日 " + buffer_blog[0]
        else:
            buffer_note.append("")
            for i in range(len(buffer_note)):
                buffer_note[len(buffer_note) - 1 - i] = buffer_note[len(buffer_note) - 1 - i - 1]
            buffer_blog[0] = "1970年0月0日 00:00\n"

    try:
        buffer_year      = buffer_blog[0].find("年")
        buffer_month     = int(buffer_blog[0][buffer_blog[0].find("月") - 1])
        buffer_day       = buffer_blog[0].find("日")
        buffer_hour      = buffer_blog[0].find(":")
        buffer_today     = buffer_blog[0].rfind(" ")
        buffer_yesterday = buffer_blog[0].find("昨天")
        buffer_after     = buffer_blog[0].find("前天")

        buffer_time  = (int(buffer_blog[0][0:buffer_year]) - 1970) *  365
        buffer_time += (int(buffer_blog[0][0:buffer_year]) // 4 - 492)

        if   buffer_month >= 2:
            buffer_time += 31
        elif buffer_month >= 3:
            buffer_time += 28
        elif buffer_month >= 4:
            buffer_time += 31
        elif buffer_month >= 5:
            buffer_time += 30
        elif buffer_month >= 6:
            buffer_time += 31
        elif buffer_month >= 7:
            buffer_time += 30
        elif buffer_month >= 8:
            buffer_time += 31
        elif buffer_month >= 9:
            buffer_time += 31
        elif buffer_month >= 10:
            buffer_time += 30
        elif buffer_month >= 11:
            buffer_time += 31
        elif buffer_month >= 12:
            buffer_time += 30

        buffer_time += int(buffer_blog[0][buffer_day - 1])
        buffer_time  = buffer_time * 86400
        buffer_time += int(buffer_blog[0][buffer_today+1:buffer_hour]) * 60
        buffer_time += int(buffer_blog[0][buffer_hour+1:buffer_hour+3])

    except:

        break

    buffer_note.append("")
    buffer_note.append("")
    buffer_note.append("")

    for i in range(len(buffer_note) - 3):

        buffer_note[len(buffer_note) - 1 - i] = buffer_note[len(buffer_note) - 1 - i - 3]

    buffer_note[0] = str(buffer_time) + "\n"
    buffer_note[1] = ""
    buffer_note[2] = "\n"

    for i in range(len(buffer_blog)):
        if i != 0:
            buffer_note[1] += buffer_blog[i][:-1] + "\\n"

    buffer_count += 1



print(buffer_count)

buffer_file  = "/opt/TxL/sky/note/" + that_id + ".note"
buffer_file  = open(buffer_file, "w")
buffer_file.writelines(buffer_note)
buffer_file.close()



'''







'''

/fst/seed/python/light.py



import os











light  =  []

light.append("/fst")

light.append("")

light.append("")

light.append("")




shadow = []


shadow.append(os.listdir(light[0]))

shadow.append([])

shadow.append([])

















light[1] = "no"




















while  light[1]  ==  "no":




    light[1] = "yes"












    for light[2] in shadow[0]:











        if not os.path.isdir(light[0] + "/" + light[2]):




            shadow[1].append(light[2])









        else:



            light[1]  =  "no"







            shadow[2] = os.listdir(light[0] + "/" + light[2])





            for light[3] in shadow[2]:





                shadow[1].append(light[2] + "/" + light[3])












    shadow[0] = shadow[1]
  

    shadow[1] = []






















shadow[1] = open(light[0] + light[0], "w")


shadow[1].write("")



shadow[1].close()






for light[1] in shadow[0]:


    shadow[1] = open(light[0] + "/" + light[1], "r")


    light[3] = shadow[1].readlines()


 

    shadow[1].close()




    shadow[1]  =  open(light[0] + light[0], "a")


    shadow[1].write("\n")

    shadow[1].write("\n")

    shadow[1].write("\n")


    shadow[1].write("'''")


    shadow[1].write("\n")

    shadow[1].write("\n")


    shadow[1].write(light[0] + "/" + light[1])


    shadow[1].write("\n")


    shadow[1].write("\n")

    shadow[1].write("\n")

    shadow[1].write("\n")



    shadow[1].writelines(light[3])




    shadow[1].write("\n")

    shadow[1].write("\n")


    shadow[1].write("\n")

    shadow[1].write("'''")

 
 
    shadow[1].write("\n")

    shadow[1].write("\n")


   
    shadow[1].write("\n")

    shadow[1].write("\n")

    shadow[1].write("\n")




    shadow[1].close()






light = []

shadow = []    





'''







'''

/fst/seed/arduino/egg/egg.ino





int number_dht11;





void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}



'''







'''

/fst/seed/arduino/esp/esp8266.ino



String recv;
int    count;

void setup() {
  
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);


  Serial.println("AT+RST");
  while ( !Serial.find("OK") ) {
      delay(100);}
    
  Serial.println("AT+CWMODE=1");
  while ( !Serial.find("OK") ) {
      delay(100);}





  digitalWrite(LED_BUILTIN, HIGH);
  
  Serial.println("AT+CWJAP=\"gopi\",\"raspberry\"");
  
  count = 0;
  while ( !Serial.find("CONNECTED") or !Serial.find("WIFI GOT IP") ) {
    delay(100);
    count++;
    if ( count == 10 ) {
        Serial.println("AT+CWJAP=\"gopi\",\"raspberry\"");
        count = 0;}}
  
  digitalWrite(LED_BUILTIN, LOW);}
  
  
  
  

  
  
String message;
int    length;
String command;

void loop() {
  
  
           message  = "This is gop station.";
           message += "\n------------------------------\n";
           message += "esp8266,Arduino\n\n";
           message += recv;
           message += "\n------------------------------\n";
           message += "Message.";
           
           length   = message.length();
    
           command  = "AT+CIPSEND=";
           command += length;
    
    
    Serial.println("AT+CIPSTART=\"TCP\",\"10.10.10.1\",520");
    
    while ( !Serial.find("CONNECT") ) {
      
        digitalWrite(LED_BUILTIN, HIGH);
        delay(100);
        digitalWrite(LED_BUILTIN, LOW);
        
        count++;
        if ( count == 10 ) {
            Serial.println("AT+CIPSTART=\"TCP\",\"10.10.10.1\",520");
            count = 0;}}
    
    
    
    Serial.println(command);
    delay(100);
    Serial.println(message);
    delay(100);
   
   
    Serial.println("AT+CIFSR");
    delay(100);
    recv = Serial.readString();
    
    Serial.println("AT+CIPCLOSE");
    delay(100);}



'''







'''

/fst/seed/arduino/test/test_speed.ino






/*

 test the speed of analog regist

 （ include a analog regist,
            a judgement loop,
        and a plus command
   maybe ）

 0.00011-      for uno
 0.000043196-  for gr-citrus

*/

    long number_time  =  0;



void setup() {

  // put your setup code here, to run once:
  
    analogReference ( INTERNAL );

    Serial.begin ( 9600 );}



void loop() {
    
  // put your main code here, to run repeatedly:

  number_time  = micros();

  
  for ( int i=1; i<8000; i++ ) {

      analogRead ( A0 );}

  Serial.println( micros() - number_time );
}



'''







'''

/fst/seed/arduino/ragister/ragister.ino









/*

 this is to test

 and for good ideas

*/


/*

long number_time  = 0;

int  number_count  =  0;

*/



char buffer_force [ 2 ]  =  " ";





void setup() {

  // put your setup code here, to run once:
  
 
    Serial.begin ( 9600 );
  
  
  // set wifi

  // ...




  }






void loop () {
    
  // put your main code here, to run repeatedly:


  //number_time  = micros();




  buffer_force [ 0 ]  =  ( char ) analogRead ( A0 );


  Serial.print ( buffer_force );
  
  

  //other board to send

/*
  if  (  number_count  <  10240  ) {
  
    number_count  =  number_count - number_count;}
    
  else {
  
    number_count  =  number_count - number_count;}
*/




  //this return after this


  //buffer_force [ number_count ]  =  '\0';




  //delay ( 10 );

}



'''







'''

/fst/seed/arduino/iic_force/iic_force.ino



#include <Wire.h>

#define Register_ID 0  
#define Register_2D 0x2D  
#define Register_X0 0x32  
#define Register_X1 0x33  
#define Register_Y0 0x34  
#define Register_Y1 0x35  
#define Register_Z0 0x36  
#define Register_Z1 0x37  

int a1 = 2;
  
int ADXAddress = 0xA7 >> 1;  // the default 7-bit slave address  
int reading = 0;  
int val=0;  
int X0,X1,X_out;  
int Y0,Y1,Y_out;  
int Z1,Z0,Z_out;  
double Xg,Yg,Zg;  
  
void setup()  
{  
  pinMode(a1, OUTPUT);  
  //digitalWrite(a1, HIGH);  
  
  Wire.begin();                  
  Serial.begin(9600);      
  delay(100);  
  
  // enable to measute g data  
  Wire.beginTransmission(ADXAddress);  
  Wire.write(Register_2D);  
  Wire.write(8);                //measuring enable  
  Wire.endTransmission();     // stop transmitting  
  
}  
  
void loop()  
{  
  //--------------X  
  Wire.beginTransmission(ADXAddress); // transmit to device  
  Wire.write(Register_X0);  
  Wire.write(Register_X1);  
  Wire.endTransmission();  
  Wire.requestFrom(ADXAddress,2);   
  if(Wire.available()<=2)     
  {  
    X0 = Wire.read();  
    X1 = Wire.read();   
    X1=X1<<8;  
    X_out=X0+X1;     
  }  
  
  //------------------Y  
  Wire.beginTransmission(ADXAddress); // transmit to device  
  Wire.write(Register_Y0);  
  Wire.write(Register_Y1);  
  Wire.endTransmission();  
  Wire.requestFrom(ADXAddress,2);   
  if(Wire.available()<=2)     
  {  
    Y0 = Wire.read();  
    Y1 = Wire.read();   
    Y1=Y1<<8;  
    Y_out=Y0+Y1;  
  }  
  //------------------Z  
  Wire.beginTransmission(ADXAddress); // transmit to device  
  Wire.write(Register_Z0);  
  Wire.write(Register_Z1);  
  Wire.endTransmission();  
  Wire.requestFrom(ADXAddress,2);   
  if(Wire.available()<=2)     
  {  
    Z0 = Wire.read();  
    Z1 = Wire.read();   
    Z1=Z1<<8;  
    Z_out=Z0+Z1;  
  }  
    
  //display the real value  
  Xg=X_out/256.0;  
  Yg=Y_out/256.0;  
  Zg=Z_out/256.0;  

  
  
  
/*
             z=
            |  /y=
            | /
            |/       x=
    --------+--------
           /|
          / |
         /  |
*/

  Serial.print(Xg);
  Serial.print(',');
  Serial.print(Yg);
  Serial.print(',');
  Serial.print(Zg);
  Serial.println();
  
  delay(200);}  















'''







'''

/fst/dream/dream/hope.c



﻿








 struct hope_dream

  {



/*

 构成  云夢泽
 
 之為

*/


/*

 何為 云夢泽 乎

*/







 void *  path;



/*

 無址 址 者


*/




 void *  name;


/*

 無址 名 者

*/











/*

 we could use that name straightly

*/



/*

 void *  name_data;

*/


/*

 void  *  name_trees;

*/


/*

 無址 林之名 者

*/





/*



 void *  name_backup;


*/


/*

 void  *  name_river;

*/


/*

 無址 河之名 者

*/




  };


/*

 也

*/



'''







'''

/fst/dream/dream/about.c







 struct  about_dream


  {


/*

 ���� �P���Ɖ�

 ֮��

*/


/*

 �Ξ� �P���Ɖ� ��

*/






 void  *  yes;

 void  *  no;


/*

 �oַ Ȼ ��

 �oַ ˳ ��

 �oַ �� ��

*/






 void  *  rest;


/*

 �oַ ЪϢ ��

*/





  }


/*

 Ҳ

*/



'''







'''

/fst/dream/dream/that.c















/*

 many of strange ideas

*/




/*

 void  * * * * *  gop;

*/




 void * that;




/*

 �oַ �� ��

*/









'''







'''

/fst/dream/dream.c














void * dream ( void * that_dream ) {


// your dreams, the others does not know


    that_dream   =   realloc(   gop [ * ( short * ) that_dream ] [1] [0] [0],   1 + 2 + 4 );









// fall sleep, like a river, like forever

    sleep :


    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [3]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [4]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [5]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [6]  = 0;
    ( ( short * ) gop [ * ( short * ) that_dream ] [1] [0] [0] ) [2] += 4;

/*

    if (

            strcmp (
                       ( char * ) gop [one] [two] [three] [four],               ( char * ) that_type
                   )
            == 0

        ) {

        goto about;}


    else {

        two ++;}







    if ( gop [one] [two] != NULL ) {

        goto sleep;}


    else {

        one   = -1;
        two   = -1;
        three = -1;
        four  = -1;}

*/












// when u dreamed about something, u just did not know others

    about :








    printf (

             "%s %d %d %d %d \n",

                 ( char  *  )   gop [ * ( short * ) that_dream ] [0] [0] [0],


               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [3],
               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [4],
               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [5],
               ( ( short *  )   gop [ * ( short * ) that_dream ] [1] [0] [0]   )  [6]

           );







    return NULL ;}




'''







'''

/fst/dream/here.c












/*

 we are here

              love and cry

*/








 int here ()

  {






/*

 gop [ branches ] [ leaves ] [ line ] [ cell ]

 gop [    2     ] [   2    ] [  2   ] [  2   ]


*/

















/*

 in the trees

*/





/*


 0/0.note



 read

 read    : one
 read me : 1


*/













/*

 in the star

*/





/*

                                                      gop
                                                       .------------------
                                                      / \                   gop[...]
                                                     /   \
                                                    /     \
                                                   /       \
                                                  /         \
                                                 /           \
                                                /             \
                                     gop[0]    /               \   gop[1]
                                              /                 \
                                             /                   \
                                            /                     \
                                           /                       \
                                          /                         \
                                         /                           \
                                        /                             \
                                       /                               \
                                      /\                                \
                                     /  \                                \
                                    /    \                                \
                                   /      \                                \
                                  /        \                                \
                                 /          \                                \
                                /            \                               /\
                   gop[0][0]   /              \  gop[0][1]                  /  \
                              /                \                           /    \
                             /                  \                         /      \
                            /                    \            gop[1][0]  /        \  gop[1][1]
                           /                      \                     /          \
                          /                        \                   /            \
                         /                          \                 /              \
                        /                            \             ......          ......
                       /                              \
                      /                                \
                     /                                  \
                                           -------------------------------------------------
                                           |
          ------------------               |   -------------------------------    |   ---
      [0] |  read         | ...       [0]  |   |  0 | 9 | 4 | 0 | 0 | 1 | 0 | ... |   |
          ------------------               |   -------------------------------    |   |     _   _   _   _   _   _
      [1] |  read : one   | ...       [1]  |   | -1 | 9 | 0 | ......              |   |    |_| |_| |_| |_| |_| |_|
          ------------------               |   ---------------                    |   |
      [2] |  read me : 1  | ...       [2]  |   | -1 | 9 | 0 | ......              |   |
          ------------------               |   ---------------                    |   ---
                                           |
                                           ------------------------------------------------
*/











/*

 at this time

 it should be blank

*/



 if ( gop != NULL )

  {

 return 0;

  }







 else

  {



/*

 it return blank when it fail

*/


 if  (  NULL == (             gop                          =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }


 if  (  NULL == (             gop [ 0 ]                    =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }


 if  (  NULL == (             gop [ 0 ] [ 0 ]              =  malloc ( 2  * sizeof ( void * ) )        )  )  { return 0; }

 if  (  NULL == (             gop [ 0 ] [ 1 ]              =  malloc ( 2  * sizeof ( void * ) )        )  )  { return 0; }


 if  (  NULL == (             gop [ 0 ] [ 0 ] [ 0 ]        =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }

 if  (  NULL == (             gop [ 0 ] [ 0 ] [ 1 ]        =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }

 if  (  NULL == (             gop [ 0 ] [ 0 ] [ 2 ]        =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }


 if  (  NULL == (             gop [ 0 ] [ 1 ] [ 0 ]        =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }

 if  (  NULL == (             gop [ 0 ] [ 1 ] [ 1 ]        =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }

 if  (  NULL == (             gop [ 0 ] [ 1 ] [ 2 ]        =  malloc ( 1  * sizeof ( void * ) )        )  )  { return 0; }





 if  (  NULL == (             gop [ 0 ] [ 0 ] [ 0 ] [ 0 ]  =  malloc ( 4  * sizeof ( char ) )          )  )  { return 0; }

 else

  {

       strcpy  (  ( char * )  gop [ 0 ] [ 0 ] [ 0 ] [ 0 ],  "read"  );

  }





 if  (  NULL == (             gop [ 0 ] [ 0 ] [ 1 ] [ 0 ]  =  malloc ( 10 * sizeof ( char ) )          )  )  { return 0; }

 else

  {

        strcpy  (  ( char * ) gop [ 0 ] [ 0 ] [ 1 ] [ 0 ],  "read : one"  );

 }





 if  (  NULL == (             gop [ 0 ] [ 0 ] [ 2 ] [ 0 ]  =  malloc ( 11 * sizeof ( char ) )          )  )  { return 0; }

 else

  {

        strcpy  (  ( char * ) gop [ 0 ] [ 0 ] [ 2 ] [ 0 ],  "read me : 1"  );

  }




 if  (  NULL == (             gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]  =  malloc (      sizeof ( short ) )         )  )  { return 0; }

 else

  {

              (   ( short * ) gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]   )  [ 0 ]  =  0;
              (   ( short * ) gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]   )  [ 1 ]  =  9;
              (   ( short * ) gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]   )  [ 2 ]  =  0;

  }




 if  (  NULL == (             gop [ 0 ] [ 1 ] [ 1 ] [ 0 ]  =  malloc ( sizeof ( short ) )              )  )  { return 0; }

 else

  {
              (   ( short * ) gop [ 0 ] [ 1 ] [ 1 ] [ 0 ]   )  [ 0 ]  =  -1;
              (   ( short * ) gop [ 0 ] [ 1 ] [ 1 ] [ 0 ]   )  [ 1 ]  =   9;
              (   ( short * ) gop [ 0 ] [ 1 ] [ 1 ] [ 0 ]   )  [ 2 ]  =   0;

  }




 if  (  NULL == (             gop [ 0 ] [ 1 ] [ 2 ] [ 0 ]  =  malloc ( sizeof ( short ) )              )  )  { return 0; }

 else

  {

            (     ( short * ) gop [ 0 ] [ 1 ] [ 2 ] [ 0 ]  )  [ 0 ]  = -1;
            (     ( short * ) gop [ 0 ] [ 1 ] [ 2 ] [ 0 ]  )  [ 1 ]  =  9;
            (     ( short * ) gop [ 0 ] [ 1 ] [ 2 ] [ 0 ]  )  [ 2 ]  =  0;

  }




  }





 return 1;

  }










'''







'''

/fst/river/zero



hello seed.



'''







'''

/fst/river/fifth



it's 2:57, december 29th.
seed's age is 420.
.
i'd clear about stm.


'''







'''

/fst/river/first



it's 3:58,2018/12/22 now.
..
gop need protein 75g daily.
......
gop need lipids 50g daily.
........
gop need carbohydrates 55% to 65% of all energy intake.
.....
gop need vitamin a 0.8gRE daily.
.....
gop need vitamin d 0.01mg daily.
....
gop need vitamin e 14mg daily.
...
gop need vitamin c 100mg daily.
.....
gop need vitamin b1 1.3mg to 1.4mg daily.
..
gop need vitamin b2 1.2mg to 1.4mg daily.
.
gop need vitamin pp 13mg to 14mg daily.
.
gop need calcium 800mg daily.
......
gop need magnesium 350mg daily.
.
gop need phosphorus 700mg daily.
..
gop need potassium 2000mg daily.
....
seed's age is 5.83.413.
..........
..
seed's age is 5.83.414.



'''







'''

/fst/river/ninth



it's 1:04, December 28th now.
..
 seed's age is 422.



'''







'''

/fst/river/sixth



it's 4:50, december 27th
seed's age is 420.



'''







'''

/fst/river/tenth























,,

 o-.o





















o-.o




,

 pine



,

 gop



.
















,


 i really don't known what it is i typed

 & it is as hope ^-^

 and it haven't have any promise to anyone yet

 but u should do things u promise to others



.





















,


 before two thousand and ninteen



,


 seed









,

 cd TxL




,

 gcc  seed/that.c  -o  ./?




,

 ./?




.





















,

 cd ./TxL



,

 bash  ./seed/box/Linux/seed.sh




,

 ./?




,

 ./?



.























,

sky






,

 light






,

 hope








,

seed's hope is here.




# wget   ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.5.tar.bz2

# tar   -xjf   alsa-lib-1.1.5.tar.bz2


# gcc   /opt/TxL/flower.c   (-std=c++0x)   -lm   -lpthead   (-lasound)   (-lwiringpi)   /opt/?









# where they were



 name    seed

 data    trees

 backup  river









# hopes



 door, be

 dog, be
 show, not

 connector, be
 connectted, be







# plugin by connecttted

# maybe use at some future


# could be use on sound with serial


 sound       off
 sound-show  off
 sound-save  off









# wirely connector maybe use in dream

# or just use in sound maybe



# serial plug
 








# sometimes it neeed a serial inside




# serial tty4









# maybe other kind of net






# tcp    0 connecter 0 connectted
# udp    0 connecter 0 connectted
# spi    master
# iic    master









 address-to    192.168.4.3

 port-to       520
 port-this     520


 connect-step  0.1


 update-size   1024
 update-step   1







,

 listenning



 voice, shake     44100
 voice, close     1

 snake, circle    512





.

















,

river



.




,

tree



. 




































'''







'''

/fst/river/third



it's 23:40,2018/12/25 now.
seed's age is 418.


'''







'''

/fst/river/seventh



it's 20:37, december 27th
seed's age is 421.



'''







'''

/fst/river/eighth



it's 1:04, December 28th now.
..
 seed's age is 422.



'''







'''

/fst/river/fourth



it's 2:26,2018/12/26 now.
seed's age is 419.


'''







'''

/fst/river/second



seed's step is 5.83.415.
..........
..........
...
it's 7:43,2018/12/22 now.
....
seed's age is 416.
..........
..........
..........
.........
seed's age is 417.




'''







'''

/fst/trees/s/e/e/d/age.txt






'''







'''

/fst/voice/that/hope.c







 struct hopes_sound


  {






 int    rate;

 int    channels;

 int    snake;





  };





'''







'''

/fst/voice/that/that.c














 struct gopi_sound


  {




/*

 Sometimes i wanna use alsa

 maybe sometimes we need to use

 adc, network, or python or otherss

*/

//    char type_corde [ 32 ] = "blank";









/*

 The saving path of
     sound  files


 we use data of trees

*/


// char  path_sound [ 128 ];







/*

 The number of words' file

*/

 int number_listen = 1;










/*


  ------<--------1234...-------------



 maybe use a symbol

 maybe two of it

*/



 double result_sound [ 200 ] [ 513 ];
//                   [ num ] [  t  ]


 double result_ft [ 200 ] [ 513 ];
//                [  t  ] [  w  ]


 double buffer_listen [ 100 ] [ 513 ] [ 200 ];
//                    [ num ] [  w  ] [  t  ]



  };






'''







'''

/fst/voice/snake/dft.c




void dft(int site) {


    double mo;
    double t;
    double w;
    double n;

    for ( w=1; w<=N/2; w++ ) {

        double num  = 0;
        double numi = 0;

        for ( n=1; n<=N; n++ ) {

            t = n/N;
            num  += (result_sound[site][(int)n]*cos(2*M_PI*w*t));
            numi -= (result_sound[site][(int)n]*sin(2*M_PI*w*t));}

        mo = sqrt(num*num+numi*numi)/(N/2);

        if (mo > 1){

            output_print( "double", (char*)&w    );
            output_print( "string",        ":"   );
            output_print( "double", (char*)&mo   );
            output_print( "string",        "\n"  );}

        result_ft[site][(int)w] = mo;}}



'''







'''

/fst/voice/snake/fft.c




void fft(int site) {



    double mo;
    double t;

    double buffer_fft[33][17][3];




    double round;
    double w;
    double n;

    for ( round=1; round<=32; round++ ) {

        for ( w=1; w<=16; w++ ) {

            buffer_fft[(int)round][(int)w][1] = 0;
            buffer_fft[(int)round][(int)w][2] = 0;

            for ( n=round; n<=N; n=n+32 ) {

                t = (n-round)/N;
                buffer_fft[(int)round][(int)w][1] += (result_sound[site][(int)n]*cos(2*M_PI*(double)w*t));
                buffer_fft[(int)round][(int)w][2] -= (result_sound[site][(int)n]*sin(2*M_PI*(double)w*t));}}}





/*
          result_sound[site][(int)n] * cos(2*M_PI*w/N * (n-round+round))

        = result_sound[site][(int)n] * cos(2*M_PI*w/N*(n-round)) * cos(2*M_PI*(double)w/N*round)
        - result_sound[site][(int)n] * sin(2*M_PI*w/N*(n-round)) * sin(2*M_PI*(double)w/N*round)
*/


    double bin_fft[257][3];

    for ( w=1; w<=N/2; w++ ) {

        bin_fft[(int)w][1] = 0;
        bin_fft[(int)w][2] = 0;

        for ( round=1; round<=32; round++ ){



            bin_fft[(int)w][1]

        += (buffer_fft[(int)round][(int)w%16][1] * cos(2*M_PI*w*round/N)
           +buffer_fft[(int)round][(int)w%16][2] * sin(2*M_PI*w*round/N));



            bin_fft[(int)w][2]

        -= (buffer_fft[(int)round][(int)w%16][2] * cos(2*M_PI*w*round/N)
           -buffer_fft[(int)round][(int)w%16][1] * sin(2*M_PI*w*round/N));}




        mo = sqrt(bin_fft[(int)w][1]*bin_fft[(int)w][1] + bin_fft[(int)w][2]*bin_fft[(int)w][2]);
        mo = mo/(N/2);

/*
        if (mo >= 1) {

            output_print( "double", (char*)&w    );
            output_print( "string",        ":"   );
            output_print( "double", (char*)&mo   );
            output_print( "string",        "\n"  );}
*/

        result_ft[site][(int)w] = mo;}

    if ( information_flag.sound_show ) {

        ft_show(site);}}



'''







'''

/fst/voice/snake/show.h



void ft_show( int site ) {

    double max_f   = 100;
    double h       = 23;      // High
    double w       = 40;      // Long
    double dirta_w = (N/4)/w;




    int i ;
    int ii;

    for ( i = h; i > 0; i-- ) {

        output_print("int"   , (char*)&i  );
        output_print("string",        " " );

        if ( i < 10 ) {

            output_print("string", " ");}

        for ( ii = 0; ii < w; ii++ ) {

            if ( result_ft[site][(int)(ii*dirta_w)+1] > (max_f/h)*i )
                output_print("string", "■");

            else
                output_print("string", " ");}

            output_print("string", "\n");}}



'''







'''

/fst/voice/snake/test.h





void test_ft(const char* site) {



    double t;
    double n;

    for( n=1;n<=4096;n=n+1 ) {

        t=n/4096;
        result_sound[1][(int)n] = sin(2*M_PI*160*t+1)*10;}




    if      ( strcmp(site, "snake") == 0 ) {

        output_print("string", "FT test start.\n");

        dft(1);

        output_print("string", "FT test done.\n");}




    else if ( strcmp(site, "fft") == 0 ) {

        output_print("string", "FT test start.\n");

        fft(1);

        output_print("string", "FT test done.\n");}}



'''







'''

/fst/voice/listen/alsa.c







#include <alsa/asoundlib.h>

void * gop_corde ( void * what ) {











// Preparing for this.
//
// ... i actually don't understand them
//
// :D

    int  buffer_size;
    int  period_size;

    int latency_min;
    int latency_max;

    int resample;

    snd_pcm_t * chandle;






// this is for saving what error it is

    int number_error;





// this count is for cuont
//  how many times it try
// there is something wrong
// when  it is too big.
//  Start this module after watchdog is ready

    int number_turnning;





// Wait the dog.

    while ( ! gop_about.flag.start ) {

        usleep ( 100000 );}




// Setup sound path
//
// this sould be saved at the new one in the trees
//
// and we have a number to save the new one now
//
// so we could not use this
/*
    strcpy ( path_sound, path_the       );
    strcat ( path_sound, "/trees/sound" );
*/














// Start.

    while ( gop_about.flag.main ) {




// Wait when it's stop &
//   there's no capture devices

        if (

               ! gop_about.flag.sound
        ||       gop_about.sound.number_capture == 0

           ) {

            usleep ( 100000 );}

        else {

// It's start.












// A clear, useful note system can make
//
//   user know more differences about this thing.
//   it's important.

            note_save ( "corde", "alsa corde start", "now" );






// If corde always reset , change corde device

            number_turnning ++;






// Auto find capture device

            if ( gop_about.sound.device_capture == 0 ) {

                 gop_about.sound.device_capture = 1;}//information_sound.number_capture;}






// If the device always reset
// turn device

            else if ( number_turnning > 2 ) {

                number_turnning = 0;

                output_print ( "string", "The target of capture device is turnning.\n" );


                if ( gop_about.sound.device_capture > 1 ) {

                    gop_about.sound.device_capture --;}


                else {

                    gop_about.sound.device_capture = gop_about.sound.number_capture;}}







// Re-preparing the values

            buffer_size  = 0;            /* auto */
            period_size  = 0;            /* auto */
            latency_min  = 32;           /* in frames / 2 */
            latency_max  = 2048;         /* in frames / 2 */
            resample     = 1;

// it goes wrong in c code
//            chandle      =  snd_pcm_t*;
            chandle      = NULL;

            number_error = 0;





//--------------------------------------------------------------------------
// Open the target device

            number_error = snd_pcm_open(
                                        &chandle,
                                         information_sound.device[1][information_sound.device_capture],
                                         SND_PCM_STREAM_CAPTURE,
                                         SND_PCM_NONBLOCK
                                       );
// When it's going wrong.

            if ( number_error < 0 ) {

                output_print("string", "Record open error\n");

                usleep(100000);

                continue;}

//--------------------------------------------------------------------------

            snd_pcm_hw_params_t      *ct_params;
            snd_pcm_hw_params_alloca(&ct_params);


            number_error = snd_pcm_hw_params_any(
                                                  chandle,
                                                  ct_params
                                                );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: configuration broken\n");

                information_flag.sound = 0;

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_hw_params_set_rate_resample(
                                                                chandle,
                                                                ct_params,
                                                                1
                                                              );
            if ( number_error < 0) {

                output_print("string", "Sound corde: resample setup failled\n");

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种访问类型。

            number_error = snd_pcm_hw_params_set_access(
                                                         chandle,
                                                         ct_params,
                                                         SND_PCM_ACCESS_RW_INTERLEAVED
                                                       );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: access type not available\n");

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一种格式。

            snd_pcm_format_t    format   = SND_PCM_FORMAT_S16_LE;

            number_error = snd_pcm_hw_params_set_format(
                                                         chandle,
                                                         ct_params,
                                                         SND_PCM_FORMAT_S16_LE
                                                       );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: sample format not available\n");;

                break;}
//--------------------------------------------------------------------------
//将配置空间限制为仅包含一个通道计数。

            number_error = snd_pcm_hw_params_set_channels(
                                                           chandle,
                                                           ct_params,
                                                           channels
                                                         );

            if ( number_error < 0) {

                output_print("string",        "Sound corde: channels count ");
                output_print("string",        "not available for:"          );
                output_print("int"   , (char*)&channels                     );
                output_print("string",        "\n"                          );

                if ( channels == 1 ) {
                    channels = 2; }

                else if ( channels == 2 ) {
                    channels = 1; }


                snd_pcm_drop(chandle);
                snd_pcm_hw_free(chandle);
                snd_pcm_close(chandle);

                number_turnning++;

                usleep(100000);

                continue;}

//--------------------------------------------------------------------------
//将配置空间限制为最接近目标的速率。

            unsigned int rrate = rate;

            number_error = snd_pcm_hw_params_set_rate_near(
                                                            chandle,
                                                            ct_params,
                                                           &rrate,
                                                            0
                                                          );
            if ( number_error < 0   ) {

                output_print("string",         "Sound corde: rate Hz ");
                output_print("string",         "not available for : " );
                output_print("int"   ,  (char*)&rate                  );
                output_print("string",         "\n"                   );

                break;}

            if ( (int)rrate != rate ) {

                output_print("string",        "Sound corde: rate "       );
                output_print("string",        "doesn't match, requested ");
                output_print("int",    (char*)&rate                      );
                output_print("string",        "Hz   , get "              );
                output_print("int",    (char*)&snd_strerror              );
                output_print("string",        "Hz\n"                     );}

//--------------------------------------------------------------------------

                 int                       latency = latency_min - 4;
                 int                      *bufsize = &latency;
                 int                       last_bufsize = *bufsize;
        unsigned int                       c_time;
                 snd_pcm_hw_params_t      *c_params;
                 snd_pcm_sw_params_t      *c_swparams;
                 snd_pcm_uframes_t         c_size, c_psize;

            snd_pcm_hw_params_alloca( &c_params   );
            snd_pcm_sw_params_alloca( &c_swparams );
            snd_pcm_uframes_t          periodsize  ;

            snd_pcm_hw_params_copy  (  c_params, ct_params );

            periodsize              = *bufsize * 2;

//--------------------------------------------------------------------------

          __again:

            if ( buffer_size > 0          )

                break;


            if ( last_bufsize == *bufsize )

               *bufsize += 4;


            last_bufsize = *bufsize;

            if ( *bufsize > latency_max   )

                break;

//--------------------------------------------------------------------------

          __set_it:

            number_error = snd_pcm_hw_params_set_buffer_size_near(
                                                                   chandle,
                                                                   c_params,
                                                                  &periodsize
                                                                 );
            if ( number_error < 0 ) {

                output_print("string",       "Sound corde: unable to " );
                output_print("string",       "set buffer size for : "  );
                output_print("int"   , (char*)bufsize                  );
                output_print("string",        "\n"                     );

                break;}

//--------------------------------------------------------------------------

            if (period_size > 0)

                periodsize = period_size;

            else

                periodsize /= 2;

//--------------------------------------------------------------------------

            number_error = snd_pcm_hw_params_set_period_size_near(
                                                                   chandle,
                                                                   c_params,
                                                                  &periodsize,
                                                                   0
                                                                 );

            if ( number_error < 0 ) {

                output_print("string",        "Sound corde: unable to ");
                output_print("string",        "set period size  for : ");
                output_print("int"   , (char*)&periodsize              );
                output_print("string",        "\n"                     );

                break;}

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_period_size(
                                               c_params,
                                              &c_psize,
                                               NULL
                                             );

            if ( c_psize > (unsigned int)*bufsize )

                *bufsize = c_psize;

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_period_time(
                                               c_params,
                                              &c_time,
                                               NULL
                                             );

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_buffer_size(
                                               c_params,
                                              &c_size
                                             );

//--------------------------------------------------------------------------

            number_error = snd_pcm_hw_params(
                                              chandle,
                                              c_params
                                            );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to set hw params\n");

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_sw_params_current(
                                                      chandle,
                                                      c_swparams
                                                    );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to determine current swparams\n");

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_sw_params_set_start_threshold(
                                                                  chandle,
                                                                  c_swparams,
                                                                  0x7fffffff
                                                                );
            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to set start threshold mode\n");

                break;}

//--------------------------------------------------------------------------

            snd_pcm_uframes_t    val;

            number_error = snd_pcm_sw_params_set_avail_min(
                                                            chandle,
                                                            c_swparams,
                                                            val
                                                          );

            if ( number_error < 0 ) {

                output_print("string", "Sound corde: unable to set avail min\n");

                break;}

//--------------------------------------------------------------------------

            snd_pcm_hw_params_get_period_size(
                                               c_params,
                                              &val,
                                               NULL
                                             );

            number_error = snd_pcm_sw_params(
                                              chandle,
                                              c_swparams
                                            );

            if ( number_error < 0 ) {

                output_print("string", "sound corde: unable to set sw params\n");

                break;}

//--------------------------------------------------------------------------

            number_error = snd_pcm_sw_params(
                                              chandle,
                                              c_swparams
                                            );

            if ( number_error < 0 ) {

                output_print("string", "Unable to set sw params\n");

                break;}

//--------------------------------------------------------------------------

            char*   buffer_sound = (char*)malloc(
                                                  (
                                                    latency_max
                                                  * snd_pcm_format_width(format) / 8
                                                  ) * 2
                                                );

            number_error = snd_pcm_format_set_silence(
                                                       format,
                                                       buffer_sound,
                                                       latency*channels
                                                     );

            if ( number_error < 0 ) {

                output_print("string", "Sound corde: set silence error\n");

                break;}


//--------------------------------------------------------------------------

            number_error = number_error = snd_pcm_start(chandle);

            if ( number_error < 0 ) {

                output_print("string", "Sound corde: go error\n");

                break;}




















// ready to corde
//
// this is for saving the value of force
 
            int number_force        = 0;


// sometimes it went wrong , print same data
// this is for compare

            int number_force_buffer = 0;




            int number_round        = 0;



// this is to note how aloud this piece of voice is

            int number_aloud        = 0;


//

            int number_step         = 1;


// this is to note the step of snake round

            int number_step_snake   = 1;


// how long this corde will keep

            int number_count        = 0;


// sometime it goes bad, always return the same data

            int number_reset        = 0;









//  Setting finished,
//    corde program start

            while ( gop_about.flag.sound ) {

// start code



// Read date

                long r;

                do {

                    r = snd_pcm_readi ( chandle, buffer_sound, latency );

                  } while (  r  ==  - EAGAIN  );





// Take the data

                int i;

                for (
                        i  = 0;
                        i <= 21;
                        i  = i+1
                    ) {



// What is this

//                    number_force_buffer++;





// Get data
// the data number is too big

                    number_force =  * ( ( int * ) buffer_sound + i ) / 100000;


// some device strange
//   we should do some

//                    number_force =  * ( ( long * ) buffer_sound + i ) / 100000   -   number_force;








// check data

// alsa have already set time, so we could not to set the time judged











// if we found a voice

                    if ( number_force >= 200 ) {

                        number_aloud++;}











// Save date
//
// this will be ok
//
// |                                                             |
// |  -----------------------------123456...--->---------------  |
// |                                                             |
//
// just like water
//
// the force could be banance when it start to note a big voice




                    if ( number_step < 200) {


                        result_sound [ number_step + 0 ] [ number_step_snake ] = number_force;}





// take a step

                    number_step_snake ++;








// Update date for next getting
//
// we need to compare maybe

//                    number_force = result_sound [ number_step + 0 ] [ number_step_snake - 1 ];















// judge the loop


                    if ( number_step_snake > N ) {



// whatever,

// be ready to start next looop

                        number_step_snake = 1;




// for test

/*
                        if ( !information_flag.sound_show ) {

                            output_print("int", (char*)&number_aloud);
                            output_print("string",     "\n");}
*/




// when this count buffer is not 0

// we keep listen and be ready to get out and fft

                        if (  number_aloud >= 200  ) {

                            number_count = 9;}



                        if ( number_step < 100 ) {

                            number_step++;}

                        else {

                            if      ( number_count > 1 ) {

                                number_count--;}


                            else if ( number_count == 1 ) {

                                information_flag.sound = 0;}}



                        number_aloud = 0;}}

//==========================================================================
// Big check after
//  21 x 1000 rand

                if (number_force_buffer != number_force) {

// if this time this got
// a  different data,
// prepare for the next time check.

                    number_force_buffer  = number_force;

// when it get different data
// don't reset it

                    number_turnning--;
                    number_reset   --;

// If number_turnning is so low,
//    that data will be too deep,
//    that never come back.

                    if ( number_turnning < 0 ) {

                        number_turnning = 0;}

                    if ( number_reset    < 0 ) {

                       number_reset    = 0;}}


                else {

// If this time this got
// a sample data,
// count this.

                    number_reset++;

// If it always get same data
// reset it
                    if ( number_reset >= 9 ) {

                        output_print("string", "Sound corde: reset\n");

                        number_count = 0;

                        break;}}}

//--------------------------------------------------------------------------
// close it

            snd_pcm_drop   (chandle);
            snd_pcm_hw_free(chandle);
            snd_pcm_close  (chandle);













// it will cause note save many times and data wrong

            if ( number_count == 1 ) {

// When it's testing,
// we could need to know
// how many piece of data it get

                if ( ! gop_about.flag.sound_show ) {

                    output_print("int",   (char*)&number_step);
                    output_print("string",       "\n"        );}



// Doing snake calculate,
//   it's a number of 400

                int i;

                for (

                        i  = 1;
                        i <= number_step  &&  i < 200;
                        i ++

                    ) {

                    fft(i);

// The speed of snake,
//      mast be changed

                    if ( gop_about.flag.sound_show ) {

                        usleep(100000);}}






// Save this voice.
// we dose not have it

//                if ( information_flag.sound_save ) {

//                    listen_save(number_step);}






/*

// Compair this & memory


*/





                information_flag.sound = 1;}





            else {

                note_save("corde", "alsa corde close", "now");}}}





    pthread_exit(NULL);}









'''







'''

/fst/voice/listen/blank.c




void * gop_corde ( void * what ) {





    while ( ! gop_about.flag.start ) {

        usleep ( 100000 );}






    while ( gop_about.flag.main ) {





        if ( ! gop_about.flag.sound ) {

            usleep ( 100000 );}




        else {


            note_save ( "corde", "blank Corde start", "now" );


            while ( gop_about.flag.sound ) {

                usleep ( 100000 );}


            note_save ( "corde", "blank Corde close", "now" );}}



    pthread_exit ( NULL );}



'''







'''

/fst/README.md




























 i really don't know what it is i typed

 & it is as hope ^-^

 and it haven't have any promise to anyone yet

 but u should do things u promise to others





# before two thousand and ninteen




# gop seed


it is a program with my learning,
maybe it's not meaningful
but it's always just meaningful to me..


just use gcc now

 cd TxL

 gcc  seed/that.c  -o  ./?

 ./?

then u can c






/*

 first

     cd ./TxL


 it's a beginning with this script

     bash ./seed/box/Linux/seed.sh


 then it will make a file named '?'


     ./?


 then try again


     ./?


  ok , just like that... :D
  then, you can see

*/





# sky

the resource and hopes found

they've  grow little bigger


# river

all the tools and softwares used

and forget it

this river is for save the code before as the title

and this is awesome


# tree

this is a dream and i don't know if this could finished



'''







'''

/fst/leaves/fst/bananas



�� 
  
  
  
  
 0  /&  0&  2&  1&  4&  5&  6&  3&  7&  0 
  
  
  
  
   0  Z�S  0 
  
  
   0�0    �p    0  / /   0 
  
  
   0�0    �p    0  / *   0 
  
   0bk0    �p    0  * /   0 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   0  �:y  0 
  
  
  
   0_�e0    �p    0  #   i n c l u d e   0 
    
   0_�0    �p    0  #   i n c l u d e   < 0 
  
   0�0    �p    0>   0 
  
   0_N0    �p    0>   0 
  
  
  
   0�f0    �p    0  #   i f n d e f   0 
  
   0�:y0    �p    0  #   d e f i n e   0 
  
   0� �0    �p    0  #   d e f i n e   0 
  
   0_N0    �p    0  #   e n d i f   0 
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   0  LuS  0 
  
  
  
   0�d0    �p    0  (   0 
  
   0x�0    �p    0  (   0 
  
   0�0    �p    0  )   0 
  
  
   0vQ0    �p    0  {   0 
  
  
   000    �p    0  " 0 
  
   000    �p    0"   0 
  
   0KN�0    �p    0,   0 
  
   0_N0    �p    0  ;   0 
  
   0�_N0    �p    0  ) ;   0 
  
  
   0�~_N0    �p    0  }   0 
  
   0�~	q0    �p    0  }   0 
  
  
  
   0L�0    �p    0  d o   0 
  
   0�VvQ0    �p    0    }   w h i l e   (   0 
  
  
  
   0�V�a0    �p    0  r e t u r n     0 
  
   0�V�_0    �p    0  r e t u r n     0 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   0  Sb_  0 
  
  
  
   0&g'g0    �p    0  v o i d     *   *     0 
  
  
   0!qb_0    �p    0  v o i d   *   0 
  
   0 �L�0    �p    0  c h a r   *   0 
  
  
   0;N�N0    �p    0  m a i n   0 
  
  
   0KN0    �p    0  - >   0 
  
  
  
   0�vS0    �p    0  *   0 
  
   0b_S0    �p    0  &   0 
  
  
  
  
   0!q�zpeb_S0    �p    0  (   u n s i g n e d   i n t   *   )   0 
  
   0!q�z�wpeb_S0    �p    0  (   u n s i g n e d   s h o r t   *   )   0 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   0  \S  0 
  
  
  
   0!q0    �p    0  !   0 
  
   0�0    �p    0  & &   0 
  
  
  
   0�k0    �p    0  &   0 
  
   0N�k0    �p    0  ! &   0 
  
  
  
   0�]�y0    �p    0  < <   0 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 


'''







'''

/fst/leaves/rain/deamon.c








 # include  < stdio.h  >

 # include  < stdlib.h  >




 int main ()


  {


 system ( "/opt/? deamon   >   /opt/TxL/trees/0/TxL_deamon.note" );


  }



'''







'''

/fst/leaves/rain/7lc.py




import time
import _thread
import tkinter

#==========================================================================

r         = 5
w         = 1
d         = [10]

F1        = 10
F2        = 0.5

xy        = []

xy.append(  [   323,                       200                       ] )

xy.append(  [   xy[0][0]/2,                xy[0][1] - xy[0][1]/1.618 ] )  # up
xy.append(  [   xy[0][0]/1.618,            xy[0][1]/2                ] )  # right
xy.append(  [   xy[0][0]/2,                xy[0][1]/1.618            ] )  # down
xy.append(  [   xy[0][0] - xy[0][0]/1.618, xy[0][1]/2                ] )  # left

#--------------------------------------------------------------------------

buffer_xy = []
buffer_xy.append(xy[0])
buffer_xy.append(xy[1])
buffer_xy.append(xy[2])
buffer_xy.append(xy[3])
buffer_xy.append(xy[4])

#--------------------------------------------------------------------------

oval      = [0,0,0,0]

tag_oval  = [
              'oval0',
              'oval1',
              'oval2',
              'oval3'
            ]

#--------------------------------------------------------------------------

line      = [0,0,0,0]

tag_line  = [
              'line0',
              'line1',
              'line2',
              'line3'
            ]

#--------------------------------------------------------------------------

window = tkinter.Tk()
canvas = tkinter.Canvas(
                         window,
                         width  = xy[0][0],
                         height = xy[0][1],
                         bg     = "white"
                       )

title = canvas.create_oval(
                            xy[0][0]*(9/10) - r / 1.618,
                            xy[0][1]*(1/10) - r / 1.618,
                            xy[0][0]*(9/10) + r / 1.618,
                            xy[0][1]*(1/10) + r / 1.618,
                            fill    = "#F0F8FF",
                            outline = "#F0F8FF",
                            tag     = "title"
                          )

#==========================================================================

def canvas_draw():

    for i in range(4):

        oval[i] = canvas.create_oval(
                                      xy[i+1][0] - r,
                                      xy[i+1][1] - r,
                                      xy[i+1][0] + r,
                                      xy[i+1][1] + r,
                                      fill    = "#F0F8FF",
                                      outline = "#F0F8FF",
                                      tag     = tag_oval[i]
                                    )

#--------------------------------------------------------------------------

        if i == 3:
            line[i] = canvas.create_line(
                                          xy[i+1][0],
                                          xy[i+1][1],
                                          xy[1][0],
                                          xy[1][1],
                                          fill    = "#F0F8FF",
                                          width   = w,
                                          tag     = tag_line[i]
                                        )

        elif i < 3:
            line[i] = canvas.create_line(
                                          xy[i+1][0],
                                          xy[i+1][1],
                                          xy[i+2][0],
                                          xy[i+2][1],
                                          fill    = "#F0F8FF",
                                          width   = w,
                                          tag     = tag_line[i]
                                        )

#==========================================================================

def canvas_delete():

    for i in range(4):

        canvas.delete(tag_oval[i])
        canvas.delete(tag_line[i])

#==========================================================================

def canvas_move():

    while 1:
   
        for i in range(4):

#--------------------------------------------------------------------------
# In the canvas.

            if xy[i][0] < 0:
                buffer_xy[i][0] = 0

            if xy[i][0] > xy[0][0]:
                buffer_xy[i][0] = xy[0][0]

            if xy[i][1] < 0:
                buffer_xy[i][1] = 0

            if xy[i][1] > xy[0][1]:
                buffer_xy[i][1] = xy[0][1]

#--------------------------------------------------------------------------
# Outline's F

            buffer_xy[i+1][0] += F1 * (1 - (xy[i+1][0]              ) / xy[0][0])
            buffer_xy[i+1][0] -= F1 * (1 - (xy[0][0]    - xy[i+1][0]) / xy[0][0])
            buffer_xy[i+1][1] += F1 * (1 - (xy[i+1][1]              ) / xy[0][1])
            buffer_xy[i+1][1] -= F1 * (1 - (xy[0][1]    - xy[i+1][1]) / xy[0][1])

#--------------------------------------------------------------------------
# Balls' F

            for o in range(4):

                if o != i :

#--------------------------------------------------------------------------
# kx - y + b = 0

                    if int(xy[o+1][0] - xy[i+1][0]) != 0 and int(xy[o+1][1] - xy[i+1][1]) != 0:

                        k = (
                             (xy[o+1][1] - xy[i+1][1])
                          /  (xy[o+1][0] - xy[i+1][0])
                            )

                        b = xy[i+1][1] - k*xy[i+1][0]

                    else:

                        k = 1
                        b = 0

#--------------------------------------------------------------------------

                    l = (
                         (xy[o+1][0] - xy[i+1][0])**2
                       + (xy[o+1][1] - xy[i+1][1])**2
                        ) ** 0.5

#--------------------------------------------------------------------------

                    if         xy[o+1][0] <  xy[i+1][0]:

                        buffer_xy[i+1][0] += F2 * (1 - (l/k)/xy[0][0])

                    elif       xy[o+1][0] >  xy[i+1][0]:

                        buffer_xy[i+1][0] -= F2 * (1 - (l/k)/xy[0][0])

#--------------------------------------------------------------------------

                    if         xy[o+1][1] < xy[i+1][1]:

                        buffer_xy[i+1][1] += F2 * (1 - (l*k)/xy[0][1])

                    elif       xy[o+1][1] > xy[i+1][1]:

                        buffer_xy[i+1][1] -= F2 * (1 - (l*k)/xy[0][1])

#--------------------------------------------------------------------------

#                    l = (
#                            (buffer_xy[o+1][0] - buffer_xy[i+1][0]) ** 2
#                          + (buffer_xy[o+1][1] - buffer_xy[i+1][1]) ** 2
#                        ) ** 0.5

#--------------------------------------------------------------------------
# Move it

            for i in range(4):

                xy[i+1] = buffer_xy[i+1]

#--------------------------------------------------------------------------

        time.sleep(0.1)
        canvas_delete()
        canvas_draw()
        canvas.update()

#==========================================================================

window.title("Canvas Test")
window.overrideredirect(True)
window.geometry('+323+200')

canvas.pack()
canvas.bind('<Button-1>', exit)
canvas_draw()

try:
    _thread.start_new_thread( canvas_move, () )
except:
    print ("Error: thread sratting failed.")

window.mainloop()



'''







'''

/fst/leaves/rain/leaf.py



import socket
import os
import time

host = '192.168.16.102' 
port = 5200
out  = ''


while True:
    out = ''
   
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((host,port))
        out = s.recv(2048)
    except:
        pass
    else:
     
      
        msg = 'Who is that?'
        
        if out.find('This is gop station.') == 0:

            if out.find("Who is that") == 21: 
                msg  = 'This is a leaf.'
                msg += '\n'
                
                msg += '------------'
                msg += '\n'

                msg += (os.popen('uname -n').read())[:-1]
                msg += ',python'
                msg += '\n'
                
                msg += 'TIME:'
                msg += str(time.time())
                msg += '\n'
                
                msg += '------------'
                msg += '\n'
                msg += '\n'
        s.send(msg)
        s.close()
        time.sleep(0.1)



'''







'''

/fst/leaves/rain/fst.py




# TxL.py
# python3

import socket
import math
import time
import threading
import sys
from queue import Queue


class aThread(threading.Thread):
    def __init__(self,threadID,name,counter,q):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
        self.q = q
    def run(self):
        if self.counter == 0 :
            i(self.q)

        if self.counter == 1 :
            seed(self.threadID,self.q)

        if self.counter == 2 :
            Connect(self.threadID,self.q)

        if self.counter == 3:
            loading()
        
        if self.counter == 4:
            buff()
            
        if self.counter == 5:
            listen()
        
def newThread(ID):
    global point_connect
#输入的ID是不是新的
    if ID != len(point_connect):
        th[ID].join()
        th[ID] = aThread(ID , 'connect:' + str(ID) , 2 , Q[ID])
        point_connect[ID] = ['等待','']
    else:
        Q.append(Queue())
        th.append(aThread(ID , 'connect:' + str(ID) , 2 , Q[ID]))
        point_connect.append(['等待',''])
    th[ID].start()


def new_connect():
    global point_connect,th
    # 连接到来，开一个空接口
    L = len(point_connect) - 1  ;  i = 1
    while i <= L:
        if point_connect[i][0] == '断开':
            th[i].join()
            newThread(i)
            i = L
        else:
            if i == L:
                newThread(i+1)
        i += 1



def buff():
    global Me
# 测试
# 测试音频
    while True:
        try:
            import pyaudio
            pa = pyaudio.PyAudio()
            stream = pa.open(format=pyaudio.paInt16, channels=1, rate=44100, input=True, frames_per_buffer=4000)
            if stream.is_active() == False:
                    stream.read(4000)
        except:
            Audio = 'NO A'
        else:
            Audio = 'AUDIO'
# 清理
        try:
            pa.close()
            stream.close()
        except:
            pass
# 测试视频
        try:
            import pygame
        except:
            Vidio = 'NO V'
        else:
            Vidio = 'VIDIO'
# 测试连接
        Net = 'NOPE'
        if point_server == True:
            if point_connect[0][0] == '断开':
                Net = 'SERVER'
        if point_connect[0][0] != '断开':
            if Net == 'SERVER':
                Net += ' & CONNECT'
            else:
                Net = 'CONNECT'

# 总结
        Me = [Audio,Vidio,Net]
        time.sleep(1)












def i(q):
    global host,port,Me
    global point_server
    while True:
        keyIn = input('>>')
       
        if keyIn == ' ':
            print('Me:    ',Me[0][0], ',', Me[0][1],',', Me[0][2], '\n\n\n',Me[1])

        elif keyIn == 'connect':
            host = input('host:')
            try:
                port = int(input('port:'))
            except:
                print('port format wrong')
                host = ''

        else:
            if point_connect[0][0] != '断开':
                q.put(keyIn)





def wrong(s,wrong_msg,ID):
    global point_hands
# 异常处理
    print(ID , ':' , wrong_msg )
    s.close()
    point_connect[ID] = ['断开','']

    if point_hands == ID:
        point_hands = -1
# 如果是敲门进程，需要重新配置
    if ID == 0:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1)
    return s





def send_add_wrong(s,msg,ID):
    try:
        s.send(msg.encode('utf-8'))
    except socket.timeout:
        s = wrong(s,msgIn+'time out ,send false!',ID)
        out = ''
    except:
        print(ID,':send false')
        s = wrong(s,sys.exc_info()[0],ID)
        out = ''
    else:
        point_wrong = 0

    return s




def recv_with_wrong(s,ID,size):
    try:
        out = s.recv(size)
        out = out.decode('utf-8')
    except:
        s = wrong(s,'recive Failled.',ID)
    return (s,out)





def seed(ID,q):
    global host,port,Me
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1)

    while True:
        if point_connect[ID][0] == '断开':
            while host == '' or port == 0:
                time.sleep(1)
            try:
                s.connect((host, port))
            except:
                pass    
            else:
                that = recv_with_wrong(s,ID,256)
                s = that[0] ; out = that[1]
                print(':', out)
                if out == 'welcome':
                    point_connect[ID][0] = '连接'
        elif point_connect[ID][0] != '断开':
            try:
                that = recv_with_wrong(s,ID,10240)
                s = that[0] ; out = that[1]
                if q.empty() == False: 
                    msg = q.get()
                wanna = msg_contro(ID,out,msg) 
                send_with_wrong(wanna,ID)
            except:
                sleep(0)


def Connect(ID,q):
    global point_hands
    global point_audio
    global point_connect
    global th,Q

    while point_connect[ID][0] == '等待':
        clientsocket, addr = s.accept()
        clientsocket.settimeout(1)
        point_connect[ID] = ['连接', addr]
        print(ID, 'Connect by', addr)

        out = 'welcome'
        send_with_wrong(clientsocket,out,ID)
        new_connect()
        while point_connect[ID][0] == '连接':
            if q.empty() == False:
                msgIn = q.get()
            else:
                msgIn = ''
            msg = msg_contro(ID,out,msgIn)
            send_with_wrong(clientsocket,msg,ID)
            that = recv_with_wrong(clientsocket,ID,10240)
            out = that[1]
            time.sleep(0.1)

      



def msg_control(ID,out,msg):
    global point_connect

    if ID == 0:
        if point_connect[0][0] == 'HANDS':

            if out[0:6] == 'Crows:':
                        point_connect[ID][1] = out[6:]
                        #############

                        if msg == 'crow':
                            point_connect[ID] = [host,'']
                        else:
                            if msg == '':
                                msg = 'recv'
                        what = 0

                    else:
                        print(out)
                        what += 1
                        if what == 5:
                            wrong(s,'?',ID)
                        else:
                            if msg != '':
                                q.put(msg)
                                msg = ''
                    s = send_add_wrong(s,msg)






#普通权限
                else:
                    if point_connect[ID][0] == host:

                        if out == '?':
 
                            if msg == 'hands':
                                point_connect[ID][0] = 'HANDS?'
                                what = 0

                        elif out == 'audio':
                            if Me[0] == 'YEAH':
                                global point_audio ; point_audio = True
                                thread_audio = aThread(ID,'Audio',4)
                                thread_audio.start()
                                if msg != '':
                                    try:
                                        q.put(msg)
                                    except:
                                        pass
                                    msg = 'Audio is ready'
                        else:
                            print(out)
                            what += 1
                            if what == 5:
                                wrong(s,'?',ID)
                                if msg != '':
                                    q.put(msgIn)







#hands请求权限
                elif point_connect[ID][0] == 'HANDS?':
                    if out == 'hands':
                        print('Hands')
                        point_connect[ID][0] = 'HANDS'
                        msgIn = ''
                    else:
                        print('?',out)
                        point_connect[ID][0] = host
                    #
                    if msgIn != '':
                        q.put(msgIn)



####################################################################################
  

            else:
                if point_connect[ID][0] == addr:
                    if point_connect[ID][1] == 'hands':
                        msg = 'Crows:Name:crow'+'\nNet:'+'\n\nDevice'+'\nOut Device:'
                    else:
                        msg = '?'





          if point_connect[ID][1] == 'hands':
                    if point_hands != -1:
                        Return = ''
        # 调度hands
                        point_hands = out.find(' ')
            # 调度hands标志分隔符空格
                        if point_hands != -1:
                            num_hands = out[0:point_hands]
                            out_hands = out[point_hands+1:]
                            try:
                                num_hands = int(num_hands)
                                print('hands:', num_hands, ',', out_hands)
                                if num_hands != ID:
                                    if num_hands < len(point_connect):
                                        buff_connect = point_connect[num_hands][0]
                                        if (buff_connect != '等待') and (buff_connect != '断开'):
                                            if Q[num_hands].empty() == True:
                # 确认调度消息
                                                while Return != '':
                                                    time.sleep(0.05)
                                                    if Q[num_hands].empty() == True:
                                                        Q[num_hands].put(out_hands)
                                                        Return = 'it is going'
                                            else:
                                                Return = str(num_hands) + ':recive is failled'
                                        else:
                                            Return = str(num_hands) + ' is not connectted'
                                    else:
                                        Return = str(num_hands) + ' :no this connect'
                                else:
                                    Return = str(num_hands) + ':……to yourself?'
                            except:
                                Return = 'wrong aim ID'
        # 基本hands
                        else:
                            if out == 'crow':
                                if point_connect[0][0] != '断开':
                                    Q[0].put('crow')
                                print(ID,' crow')
                                point_connect[ID][1] = ''
                                point_hands = -1

                            elif out == '':
                                wrong(clientsocket, 'out', ID)
                            else:
                                if out != 'recv':
                                    what += 1
                                    if what == 10:
                                        wrong(clientsocket, out + '?', ID)
                                else:
                                    what = 0
        # 整理回应
                        while Return != '':
                                if q.empty() == True:
                                    q.put(Return)
                                    Return = ''
# BUG
                else:
    # 基本连接命令
                    Return = ''
                    if out == 'hands':
                        if point_hands != -1:
                            Return = 'hands full,hands:' + str(ID)

                        else:
                            if point_connect[0][0] != '断开':
                                Q[0].put('hands')
                            point_connect[ID][1] = 'hands' ; point_hands = ID
                            print(ID , 'hands')
                            Return = 'hands'

                    elif out == '':
                        what += 1
                        if what == 10:
                            wrong(clientsocket, 'wrong send',ID)

                    else:
                        if out[0:7] == 'Client:':
                            out = out[7:]
                            point_connect[ID][1] = out

                    if Return != '':
                            if q.empty() == True:
                                q.put(Return)
                                Return = ''










def listen():
    import pyaudio
    import np
            
    global point_audio , res_audio
            
    pa = pyaudio.PyAudio()
    stream = pa.open(format=pyaudio.paInt16, 
                                  channels=1, 
                                  rate=44100, 
                                  input=True,
                                  frames_per_buffer=4000)
    while True:
        if point_audio == False:
            if stream.is_active() == False:
                stream.stop_stream()
        else:
            if stream.is_active() == False:
                stream.start_stream()
            
            string_audio_data = stream.read(4000)
            res_audio = str(np.fromstring(string_audio_data, dtype=np.short))

def loading():
    global sinAOcos
    global point_loading

    w = 0;t = 0
    while w <= 1000:
        sinAOcos.append([])
        t = 0
        while t <= 4000:
            sinAOcos[int(w)].append([])
            sinAOcos[int(w)][int(t)].append(math.sin(t * w * 44100))
            t += 1
        w += 1
    point_loading = True


def dft(fCtD, w0, max_w, dirta_w):
    global sinAOcos
    res_dft = []
    max_t = len(fCtD) ; w = w0
    dirta_t = 100

    while w <= max_w:
        t = 0
        n = 0 ; ni = 0
        #num_w = int(w / dirta_w)

        while t < max_t:
            #num_t = int(t / dirta_t)
            n += int(fCtD[t] * math.cos(t * w * 44100))
            ni += int(fCtD[t] * math.sin(t * w * 44100))
            t += dirta_t

        mo = round((n ** 2 + ni ** 2) ** 0.5 / (max_t / 2 * dirta_t))
        res_w = mo ; w += dirta_w
        res_dft.append(res_w)

    return res_dft


global Me
global th
global Q

global host, port

global point_loading
global point_connect
global point_server
global point_hands
global point_audio

global sinAOcos

global res_dft
global res_audio


Me = ['','','']

point_audio = False
Q = []
th = []

host = '' ; port = 0
point_connect = []
point_hands = -1
point_loading = False
point_server = False
point_audio = False

sinAOcos = []
res_dft = []
res_audio = []


point_connect.append(['断开', ''])
Q.append(Queue())

me = aThread(-2 , 'Me' , 4 , Q[0])
me.start()

keyin = aThread(-1 , 'keyin' , 0 , Q[0])
keyin.start()

th.append(aThread(0, 'client', 1, Q[0]))
th[0].start()



while point_server == False:
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.bind(('192.168.124.6', 5200))
        s.listen(5)
    except:
        time.sleep(1)
    else:
        point_server = True
        newThread(1)


'''







'''

/fst/leaves/rain/rain.c



































































/*

 This is stm32 vga program
  use onenet kylin mini board
  connectted to gop could
  proved the vga display output

  of cause, this is plan,,



 use fsst/things to use on other board

*/













/*

 here are the head files

*/











/*

 # include "../startup_stm32f10x_hd.s"

*/





/*

 # include "../things/Kylin_mini_v1.2.h"


 # include "../things/library_stm32.h"

*/


 # include "../../things/stm/seed/dream.c"


/*

 ��� ��../../things/stm/seed/dream.c��

*/




















/*

 the control function


 main door

*/


/*

 int main( void )

 {

*/


 void  *  main  (  void *  )

  {


/*

 �o�� ���� �� �o�� ��

 ��

*/





























/*
		
 init the led

*/


/*

    init_gpio_group( group_led );

*/


 sleep_branch_basket   (   dream_saw  (  "apples_branch_basket_light"  )   );


/*

 ����֦ �� ���� �� ������֦̖���� ��Ҳ

*/












/*

  and the pin

*/


/*

    init_gpio_pin(

                   mode_gpio_out,
                   group_led,
                   pin_led_1 | pin_led_2 | pin_led_3 | pin_led_4
                   speed_gpio

                 );

*/


 sleep_branch (



// the main loop

    while (1) {

        load_gpio( group_gpio, 6, mode_gpio_on  );

        sleep(1);

        load_gpio( group_gpio, 6, mode_gpio_off );

        sleep(1);}}

*/

  }




'''







'''

/fst/leaves/rain/seed.c




















/*

 this is what it is


 moved to thing/c/that/that.c

*/


/*

 pthread_t  thread  [ 4 ];

*/



















 int main ( int argc, char * argv [] )


  {








/*

 make the dream

*/

/*
    if ( here () )

    pthread_create (
                              & thread [ 0 ],
                                NULL,
                                dream,
                     ( void * ) gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]
                   );
*/
















/*

 Sometimes other thread will use the args.

*/


 that . hope . number_hope = argc;

 that . hope . hope = argv;










/*

 If command, turn gopi to a deamon

*/


// init_deamon ();














// output_print ( "string", "\n" );




// that . hope . thread  =  malloc (  3  *  sizeof ( pthread_t )  );


// pthread_create (  & thread [ 1 ], NULL,  gop_dog,  NULL  );

// pthread_create (  & thread [ 2 ], NULL,  gop_connectted,  NULL  );

// pthread_create (  & thread [ 3 ], NULL,  gop_connector,  NULL  );





/*

 plug in


 maybe

*/


/*

 pthread_create (  & thread [ 4 ], NULL,  gop_corde,  NULL  );

*/
























// char note_command [ 128 ]  =  "";



/*

 wait the dog run a circle

*/

// while (  ! gop_about . flag . start  )

//  {

// gop_wait ( 0.1 );

//  }








/*

 keyboard input got blank always in deamon.

*/

// if (

//         gop_about . flag . main

// &&  ( ! gop_about . flag . deamon )

//    )

//  {



// output_print ( "string", "\n we met somewhere \n\n" );



//  }

















// note_save ( "command", "command start", "now" );














// while ( gop_about . flag . main )

//  {





/*

 When it is deamon process,
 that goes   wrong.

*/

// if ( gop_about . flag . deamon )

//  {


// gop_wait ( 0.1 );


//  }





// else

//  {



/*

 Get the command



 128 charactors could be enough

*/


// fgets ( note_command, 128,  stdin );












/*

 Sometimes its goes wrong,
     just  return blank chars.


 if just key in enter it could return \n

*/


// if (

//      strcmp ( note_command, "" )  == 0

//    )

//  {


// gop_wait ( 0.1 );


//  }












/*

 Read the command

*/


// else

//  {



/*

 The end of the command
    will be a '\n'

*/

// note_command [  strlen ( note_command ) - 1  ]   =   '.';



/*

 we don't need to do that with this

 :)

*/


/*

 strcat ( buffer_command, "." );

*/



/*

 Print a '\n'

*/

// output_print ( "string", "\n" );






/*

 Judge for the command typed

*/


// judge_message_command (
//                         -1,
//                         note_command,
//                         note_command
//                       );



/*

 Clear the buffer

*/


// strcpy ( note_command, "" );







/*

 this round for if keyboard in

*/


//  }




/*

 this round for if not in deamon

*/

//  }






/*

 this round for flag of main

*/

//  }









/*

 The end of this program

*/



// note_save ( "command", "command close", "now" );



  }






'''







'''

/fst/leaves/dream/about/saw.c





int load_about (

                   gopi_about    that_about,

                   char *     pointer_words

               ) {






/*

 the first loop set

 pointer_words note where we've read

 pointer_next  note the  enter of this line

 maybe blank pointer



 when we read address, we read lines after this line

 change words we have read

 and read the address


 and return it after address



 maybe let it note the address & its name

 but the enter may be clear

 and the symbol of blank pointer may be lost


 loop may can't quit


 and we could put it after read name & address

*/





/*

 first loop set



 start at first line



 move it to network/message/judge/information.h

 top than here

 so here recive the whole content

*/


//    pointer_words   =  strchr ( pointer_words, '\n' ) + 1;





/*

 to the one next of this line


 maybe we should put it at first of loop


 fresh it every loop



 loop check pointer, so it start without blank

 if there isn't a line of message

 it read as a blank line

*/


//    char * pointer_next = strchr ( pointer_words, '\n' ) ;


    char * pointer_next  =  pointer_words;














/*

 start to set about



 first we clean it

 this come soon



 clean it to blank could cause blank about it for a while

 and we could let it wait

 make a symbol



 if it isn't reading, we clean the symbol

 if it isn't reading, we put the about



 move it to top


 and we don't and it is continuedd


 and we will clean their mates

 then move it to top

*/



/*

    strcpy ( that_about . symbol, "reading" );

    clean_about (  that_about  );

*/







/*

 we've recived the message

 so it is running


 maybe we add it to clean


 ok but not

 sometimes we clean it and that haven't a connection


 the main flag set is here



 and we could let it read symbol

 'read' then this is running

 but we don't clean its mate



 but we will

*/

    that_about . flag . main   =  1;









/*

 loop it line by line


 next line of words could not be enter

 we use pointer_next to note


 to miss null

*/


    while (  pointer_next  !=  NULL  ) {






/*

 start at this line


 fresh before and last line of this loop

 ...












 to the next line

 we move it here




 we have set it before the first loop

 after this we set it every loop



 and we could set it here make it simple :d



 this could be last line of words

 then we read to this


*/

        pointer_next  =  strchr ( pointer_words, '\n' );







/*

 if this isn't the end

 we read this, to the pointer of next

 and return it soon


 if it is, we read to that

*/


        if  (  pointer_next != NULL  ) {

          * pointer_next  =  '\0';}









/*

 load here

 and things about it







 went over the blank lines

 there're blank lines let it easy to be saw

*/

        if  (  0  ==  strcmp ( pointer_words, "" )  ) {

            ;}






// read the name of that

        else if (  pointer_words  ==  strstr ( pointer_words, "Name             : " )  ) {


// it always start with a ':'

            strcpy (

                      that_about . system . name,

                      strstr ( pointer_words, " :" ) + 3

                   );}




// read system name

        else if (  pointer_words  ==  strstr ( pointer_words, "System           : " )  ) {


            strcpy (
                      that_about . system . system,

                      strstr ( pointer_words, " :" ) + 3

                   );}




// read user name

        else if (  pointer_words  ==  strstr ( pointer_words, "User             : " ) ) {


            strcpy (

                     that_about . system . user,

                     strstr ( pointer_words, " :" ) + 3

                   );}













        else if (  pointer_words  ==  strstr ( pointer_words, "IP               : " ) ) {


/*

 why

 network address alway start with a number of them


 we used it to check address


 and may not to use it

 and make it clear

*/

            that_about . network . number

            =  atoi (  strstr ( pointer_words, " :"  ) + 3  );








// prepare





/*

 return the last one

 we will read next lines

 change the words we've read


 to the last one of address

*/

          * pointer_next  =  '\n';










// start with next line


            pointer_words  =  strchr ( pointer_words, '\n'  ) + 1;




/*

 to the last one of address



   address  :  2
       name : address
       name : address

   ...


 there're two blank enter



 and it will read over the blank lines anyway

*/

             pointer_next  =  strstr ( pointer_next, "\n\n" );

           * pointer_next  =  '\0';







/*

 prepare to read them


 the number of the address we've read


 maybe we use it to realloc it anyway


 maybe we realloc it and don't use it

*/

            int  number_ip  =  1;








/*

 this is to note the line we will read

 may null happened

 the pointer may lost


 pointer of network will be used to let it not happen


 they has name and address one line

 and use this to find the path


 if use pointer of next to do this

 and return

 that could cause mess

 if we use a single arduino with esp8266 to connect this

 and the there's not a enter after address

*/

            char * pointer_network;









/*

 we read them line by line

 to the blank line


 it is last one

*/


            for (

                     pointer_network    =           pointer_words;

                     pointer_network   !=  NULL ;

/*

 if it is null

 we read it once

 and quit the loop

 next circle

*/
                     pointer_network    =  strchr ( pointer_words, '\n' )

                ) {





/*

 symbol


 one    loop  for function

 two    loop  for read about

 three  loop  for start to adress

 four   loop  for read address

*/






/*

 the pointer of network  we use it to  miss the null happened


 we fresh it first  at beginning of the loop


 after first put, we fresh the pointer of network

 in the loop


 but pointer we've read we've used haven't


 if not, it isn't first line

 we fresh it

*/


                if  (  pointer_words  !=  pointer_network  ) {



/*

 pointer of network read to the enter after first loop

 read over the enter



 if it is null it is the last one

 then we won't let it start




 we saw it before and this is not blank line

 fresh the pointer we've read


 and this could be blank line if this don't have a address

 and if there's not a address, we don't use socket

 maybe like bit coins


 and this circle won't start

*/




/*

 before this we use this pointer to read

 then we plus it every time

 now we plus pointer of words

*/


/*

                    if  (  pointer_network  !=  NULL  ) {


                    pointer_network  =  pointer_network + 1;

*/






                    pointer_words  =  pointer_network + 1;}











/*

// prepare to note them










 start here


 we should read over the charactors


         name : address
    name-long : address

*/


                while (  * pointer_words  ==  ' '  ) {

                    pointer_words ++;}






/*

 to here


 name finish at ':'

 and address start at it

*/

                pointer_network = strstr (  pointer_words, " : " );

                pointer_network =  '\0';






// note name

                strcpy (

                         that_about . network . ip [ number_ip ] [ 1 ],

                         pointer_words

                       );

// return it

              * pointer_network  =  ' ';









/*

 the address start here



 the pointer of network  point  where ' : ' is

 and return it before

 start after that

*/
                pointer_words  =  pointer_network + 3 );








/*

 to here


 the last one of this line

*/

                pointer_network  =  strchr ( pointer_words, '\n' );

              * pointer_network  =  '\0';





// note address

                strcpy(

                        that_about . networks . ip [ number_ip ] [ 2 ],

                        pointer_words

                      );



// return it

              * pointer_network  =  '\n';








/*

 don't needto plus it here


 because we have fresh it

 when we had read to the address' beginning

*/

//                pointer_words = pointer_words + 1;





/*

 plus this count



 soon we won't use it

 we read to the blank box


 or we use it

 and we could realloc the pointer of address

*/


                number_ip ++;}








/*

 read address finished

 clean it within blank


 we clean them in  watchdog/information/build/clean.h  soon



 read address and their number finished

*/

            }









// about cpu

        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU cores        : " )  ) {

            that_about . cpu . cores  =  atoi (  strstr ( pointer_words, " :" )  + 3  );}





        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU frequency    : " )  ) {

            that_about . cpu . frequency  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU temperature  : " )  ) {

            that_about . cpu . temperature  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU rate         : " )  ) {

/*

 maybe there's a little %

 and we could see


 we read to it

 and jump over after this

*/

                if  (  strchr ( pointer_words, '%' )  !=  NULL  ) {

                  * strchr ( pointer_words, '%' ) = '\0';}




                that_about . cpu . rate  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Memory total     : " )  ) {


                that_about . memory . total  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Memory used rate : " )  ) {



              * strchr ( pointer_words, '%' ) = '\0';

/*

 it goes wrong when rate send before the total



 and we use a buffer to note it soon

*/

                that_about . memory . free

              = that_about . memory . total

              *     (  100 -   atoi (  strstr ( pointer_words, " :" ) + 3  )  )     / 100;}









            else if  (  pointer_words  ==  strstr ( pointer_words, "Disk size        : " )  ) {


                that_about . disk . size  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Disk user rate   : " )  ) {


              * strchr ( pointer_words, '%' )  = '\0';


/*

 it went wrong when a message dosen't bring a disk size 

 and we note this rate

*/

                that_about . disk . available

              = that_about . disk . size

              *   atoi (  strstr ( pointer_words, " :" ) + 3  )   / 100;}




            else if  (  pointer_words  ==  strstr ( pointer_words, "Sound control    : " )  ) {

                that_about . sound . number_control  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





/*

 sound device

 it is a little comlex

*/


            else if  (  pointer_words  ==  strstr ( pointer_words, "Sound capture    : " )  ) {

                that_about . sound . number_capture  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Sound playback   : " )  ) {

                that_about . sound . number_playback  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Status           : " )  ) {




// prepare

                pointer_words  =  strstr ( pointer_words, " :" ) + 3;





/*

 dog,
 server,
 client,
 sound,
 daemon

*/

                if      (  * pointer_words  ==  'o'  ) {

                    that_about . flag . dog  =  1;}


                else if (  * pointer_words  ==  ' '  ) {

                    that_about . flag . dog  =  0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words  ==  'o'  ) {

                    that_about . flag . connectted  =  1;}


                else if (  * pointer_words  ==  ' '  ) {

                    that_about . flag . connectted  =  0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words  ==  'o'  ) {

                    that_about . flag . connector  =  1;}


                else if (  * pointer_words  ==  ' '  ) {

                    that_about . flag . connector  =  0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words  ==  'o'  ) {

                    that_about . flag . sound  =  1;}


                else if (  * pointer_words  ==  ' '  ) {

                    that_about . flag . sound  =  0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words  ==  'o'  ) {

                    that_about . flag . deamon  =  1;}


                else if (  * pointer_words  ==  ' '  ) {

                    that_about . flag . deamon  =  0;}}



/*

 prepare for next loop


 return it


 this could be NULL

 that means we read to this

*/


        if  (  pointer_next  !=  NULL  ) {




          * pointer_next = '\n';




// start at next line


            pointer_words = pointer_next + 1;





/*

 loop restart at next line

 we move it to the first of loop



 make it clear

*/

//             pointer_next = strchr ( pointer_words, '\n' );



            }}




/*

 loop finished



 read finished

 move topper

*/


//    strcpy ( that_about, "waitting" );




    return 1;}



'''







'''

/fst/leaves/dream/about/dream.c








 struct that_about


  {






/*

 sometimes we wanna put it out

 and it may be loading

 we set a symbol to sigh



 and sub-about could have a symbol too

 use for loading about

*/



/*

 char symbol [ 16 ];

*/

 void * symbol;









/*

 what should we do



 moved to hope of dog

 maybe as a about to add


 but dog don't have a symbol



 god what does it mean...
 
*/




/*

 struct  gopi_flag  flag;

*/


/*

 struct  hope_dog  dog;

*/










/*

 we use this about to just save about it

 not for the configuration, network or what


 we touch a file to save configurations
 
 
 save in trees
 
 
 
 save in river

*/


/*

 struct gopi_configurations;

*/








 void *  sister;

 void *  heart;

 void *  memory;

 void *  shadow;

 void *  net;

 void *  voice;




/*

 gop could have lots of mates

*/


/*

 short  number_mate;

*/


 void * number_mate;
 
 
 void * * mate;




  };




















/*

 this struct is huge, i must use a function to clean it,,


 give a value of its structure and that could clean many where



 and could set a clean loop

*/









 int clean_about   (  void *  that_about  )




/*

 int clean_about  (  struct  gopi_about  that_about  )

*/

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

/*

          strcmp ( that . about . symbol, "writting" )  ==  0

*/

          strcmp ( that . about . symbol, "waitting" )  != 0

     &&   strcmp ( that . about . symbol, "" ) != 0;

        )


  {







/*

    it is 0.1  seconds for a connector

 so it is 0.1- seconds for a about load


 actualy them couldn't meet cause we don't clean it after first load



 maybe clear after dream
 
*/


 that_wait ( 0.01 );

  }





/*

 strcpy ( that_about . symbol, "waitting" );

*/

 strcpy  (  that . about . symbol, "writting"  );











/*

 strcpy ( that_about . flag . symbol, "cleanning" );

*/


/*

 strcpy  (  that . about . sister . symbol, "cleanning"  );

 strcpy  (  that . about . heart . symbol, "cleanning"  );

 strcpy  (  that . about . memory . symbol, "cleanning"  );

 strcpy  (  that . about . shadow . symbol. "cleanning"  );

 strcpy  (  that . about . spider . symbol. "cleanning"  );

 strcpy  (  that . about . voice . symbol. "cleanning"  );

*/











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

 strcpy  (  that . about . sister . symbol,  "writting"  );




/*

 clean_about_system ( that . about . system );
 
*/

 clean_about_sister ( that . about . sister );




/*

 strcpy ( that_about . system . symbol, "waitting" );

*/

 strcpy (  that . about . sister . symbol,  "waitting"  );














 strcpy  (  that . about . heart . symbol,  "writting"  );




/*

 clean_about_cpu ( that . about . cpu );

*/

 clean_about_heart ( that . about . heart );




/*

 strcpy ( that_about . cpu . symbol, "waitting" );

*/

 strcpy  (  that . about . heart . symbol,  "waitting"  );













 strcpy (  that . about . memory . symbol,  "writting"  );



 clean_about_memory ( that . about . memory );



/*

 strcpy ( that_about . memory . symbol, "waitting" );

*/

 strcpy  (  that . about . memory . symbol,  "waitting"  );










 strcpy (  that . about . shadow . symbol,  "writting"  );




/*

 clean_about_disk ( that . about . disk );

*/

 clean_about_shadow ( that . about . shadow );
 
 
 

/*

 strcpy ( that_about . disk . symbol, "waitting" );

*/

 strcpy  (  that . about . shadow . symbol,  "waitting"  );











 strcpy  (  that . about . spider . symbol,  "writting"  );


/*

 clean_about_network ( that . about . network );

*/

 clean_about_spider  (  that . about . spider  );



/*

 strcpy ( that_about . network . symbol, "waitting" );

*/

 strcpy  (  that . about . spider . symbol,  "waitting"  );











 strcpy  (  that . about .voice . symbol,  "writting"  );



/*

 clean_about_sound ( that . about . sound );

*/

 clean_about_voice  (  that . about . voice  );
 
 
 
 
/*

 strcpy ( that_about . sound . symbol, "waitting" );

*/

 strcpy  (  that . about . voice . symbol,  "waitting"  );













/*

 clean_about_mate ( that . about );

*/

 clean_about_mate  (
                       that . about . number_mate,
					   that . about . mate
				   );



/*

 strcpy ( that_about . symbol, "waitting" );

*/
















/*

 strcpy ( that . about . system . symbol, "waitting" );

 strcpy ( that . about . cpu . symbol, "waitting" );

 strcpy ( that . about . memory . symbol, "waitting" );

 strcpy ( that . about . disk . symbol, "waitting" );

 strcpy ( that . about . network . symbol, "waitting" );

 strcpy ( that . about . sound . symbol, "waitting" );

 strcpy ( that . about . symbol, "waitting" );

*/





 return 0;


  }


















/*

 then it could clean mates of this


 doesnt't have it anymore
 
 
 
 need it when hope reload
 
 maybe doesn't when dream
 
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

/*

 that_flag . main  =  1;

*/







/*

 it is not get from hope


 mates usually open it

*/


/*

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



'''







'''

/fst/leaves/dream/about/forget.c




 int put_about

  (

             char *       that_message,

    struct   gopi_about   gop_about

  )

  {









/*

 wait it finish


 if some program is reading, wrong may happened

*/


 while  (  strcmp ( gop_about . symbol, "read" )  )

  {

 usleep ( 10000 );
 
  }











 strcpy ( that_message, "" );



//|==============================================================================================================================================================================================================================================================================================================================================================|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   char buffer_message [ 32 ];                                                                                                                                                                                                                                                                                                                            //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  strcmp ( that . about . system . name,   "" )    == 0  ) {  strcat ( that_message, "Name             : " );      strcat ( that_message, that . about . sister . name   );                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  strcmp ( that . about . system . system, "" )    == 0  ) {  strcat ( that_message, "System           : " );      strcat ( that_message, that . about . sister . sister );                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
//|*/   if (  strcmp ( that . about . system . user,   "" )    == 0  ) {  strcat ( that_message, "User             : " );      strcat ( that_message, that . about . sister . brother   );                                                                                                                                   strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|                                                                                                                                                                                                                                                                              //|
/*|*/                                                                     strcat ( that_message, "Time             : " );                                                                 snprintf ( buffer_message, 32, "%ld",  time ( NULL )  );                                                                                                             //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );    //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (           that . about . spider . number          != 0  ) {  strcat ( that_message, "IP               : " );                                                                 snprintf ( buffer_message, 32, "%d",   that . about . spider . number );                                                                                             //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n");     //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/       int i, ii ;                                                                                                                                                                                                                                                                                                                                        //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/       for (   i  = 1;   i  <=               that . about . spider . number;             i  ++      )   {                                                                                                                                                                                                                                                 //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/       for (   ii = 1;   ii <= 16 - strlen ( that . about . spider . ip [ i ] [ 1 ] );   ii ++      )   {                                                                                                                                                                                                                                                 //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   //  name  :  address                                                                                                                                                                                                                                                                                                                                   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/           strcat ( that_message, " " );}                                                                                                                                                                                                                                                                                                                 //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/           strcat ( that_message, that . about . spider . ip [ i ] [ 1 ] );                                                                                                                                                                                                                                                                               //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/           strcat ( that_message, " : ");                                                                                                                                                                                                                                                                                                                 //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/           strcat ( that_message, that . about . spider . ip [ i ] [ 2 ] );                                                                                                                                                                                                                                                                               //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/           strcat ( that_message, "\n" );}                                                                                                                                                                                                                                                                                                                //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . heart . cores             >  0  ) {  strcat ( that_message, "heart cores        : " );                                                               snprintf (  buffer_message,  32,  "%d",   that . about . heart . cores  );                                                                                           //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . heart . frequency         >  0  ) {  strcat ( that_message, "heart frequency    : " );                                                               snprintf (  buffer_message,  32,  "%d",   that . about . heart . frequency  );                                                                                       //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . heart . temperature       >  0  ) {  strcat ( that_message, "heart temperature  : " );                                                               snprintf (  buffer_message,  32,  "%d",   that . about . heart . temperature  );                                                                                     //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . heart . rate              >  0  ) {  strcat ( that_message, "heart rate         : " );                                                               snprintf (  buffer_message,  32,  "%d",   that . about . heart . rate  );                                                                                            //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "%"  );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . memory . total            >  0  ) {  strcat ( that_message, "memory total     : " );                                                                 snprintf (  buffer_message,  32,  "%lu",                that . about . memory . total );                                                                             //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . memory . free             >  0  ) {  strcat ( that_message, "memory used rate : " );                                                                 snprintf (  buffer_message,  32,  "%lu",  100 - ( 100 * that . about . memory . free ) / gop_about . memory . total  );                                              //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "%"  );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . shadow . size             >  0  ) {  strcat ( that_message, "shadow size        : " );                                                               snprintf (  buffer_message,  32,  "%lu",                that . about . shadow . size  );                                                                             //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . shadow . available        >  0  ) {  strcat ( that_message, "shadow user rate   : " );                                                               snprintf (  buffer_message,  32,  "%lu",  100 - ( 100 * that . about . shadow . available )   /   gop_about . shadow . size  );                                      //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "%"  );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . voice . number_control    >  0  ) {  strcat ( that_message, "voice control    : " );                                                                 snprintf (  buffer_message,  32,  "%d",                 that . about . voice . number_control  );                                                                    //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . voice . number_capture    >  0  ) {  strcat ( that_message, "voice capture    : " );                                                                 snprintf (  buffer_message,  32,  "%d",                 that . about . voice . number_capture  );                                                                    //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (          that . about . voice . number_playback   >  0  ) {  strcat ( that_message, "voice playback   : " );                                                                 snprintf (  buffer_message,  32,  "%d",                 that . about . voice . number_playback  );                                                                   //|
/*|*/                                                                                                                          strcat ( that_message, buffer_message );                                                                                                                                                      strcat ( that_message, "\n" );    //|
/*|*/                                                                                                                                                                                                                                                                                                                        strcat ( that_message, "\n" );}   //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                     strcat ( that_message, "i am             : " );                                                                                                                                                                                                                                      //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  that . hope . dog . dog            ) {  strcat ( that_message, "o" ); }  else {  strcat ( that_message, " " ); }    strcat ( that_message, " " );                                                                                                                                                                                                //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  that . hope . dog . spider_female  ) {  strcat ( that_message, "o" ); }  else {  strcat ( that_message, " " ); }    strcat ( that_message, " " );                                                                                                                                                                                                //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  that . hope . dog . spider_male    ) {  strcat ( that_message, "o" ); }  else {  strcat ( that_message, " " ); }    strcat ( that_message, " " );                                                                                                                                                                                                //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  that . hope . dog . voice          ) {  strcat ( that_message, "o" ); }  else {  strcat ( that_message, " " ); }    strcat ( that_message, " " );                                                                                                                                                              strcat ( that_message, "\n" );    //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/   if (  that . hope . dog . deamon         ) {  strcat ( that_message, "o" ); }  else {  strcat ( that_message, " " ); }                                                                                                                                                                                                                                 //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
/*|*/                                                                                                                                                                                                                                                                                                                                                          //|
//|==============================================================================================================================================================================================================================================================================================================================================================|




 return 1;
 
 
   }



'''







'''

/fst/leaves/dream/dream.c
































/*

 maybe use dream * * straightly

*/


/*

 struct that

  {

*/


/*

 struct dream

  {

*/

  
/*


 void  *  dream_about  (  void  * *  dream  )

  {


*/


/*

 �o�� ��֮ �� ���V 녉� ��

 ��

*/


 void  *  fall_sleep  (  void  * *  dream  )

  {


/*

 �o�� ���� �� ���V ��

 ��

*/















  
  
/*

 make it blank and clean

*/


/*

 gopi_about about;

 gopi_hope hope;

*/


/*

 void * about;

 void * hope;

*/


/*

 �o�� �P�� Ҳ

 �o�� ��Ը Ҳ

*/


/*

 it taste if use  tree's branch dream

*/


/*

 dream_about  (  "about",  "void *"  );

 dream_about  (  "hope",  "void *"  );

*/







 
 
 
 
 


 


/*

 use instatic memory to save it

 
 
 maybe put it to about
 
 and put about to things
 
*/


/*

 void * thread;

*/


/*

 �o�� · Ҳ

*/


/*

 dream_about  (  "thread",  "void *"  );

*/


/*

 ��֮ �� ���L·�� �����V�� ��Ҳ

*/














/*

 dream could be one part of it

 녉��ɞ���һ

 ��Ϊ���Љ�Ҳ

*/


/*

 void  * *  dream;

*/


/*

 ���V 녉��� Ҳ

*/


/*

 dream_about  (  "dream",  "void *"  );

*/


/*

 ��֮ �� ��녉��ɡ� �����V�� Ҳ

*/




















/*

 dream_about  (  "apples_dream",  "unsigned short"  );

*/


 dream_about  (  "apples . dream",  "unsigned short"  );


/*

 ��֮ �� ��녉���ַ֮�����o�˶̔��� ��Ҳ

*/













/*

  };

*/


  }


/*

 ��Ҳ

*/





























































'''







'''

/fst/leaves/dream/light.c



















































/*

 the configuration

 used here and everywhere

 maybe then we should put them every where

 let it go



 it a door of all light

 could be forgetten

 �T�Ҳ ������

*/





/*

 struct that_hope


  {

*/


 void  *  light_sleep  (  void  * *  dream  )

  {


/*

 �o�� ���� �� ���V 녉��� ��

 ��

*/



















/*

 about the hope open the program


 about the hope when run


 about light when sleep

 �ߕr����

*/


/*

 int     number_hope;

 void *  hope;

*/


/*

 it could figure out

 we don't need to think about it

 ����Ҳ

*/


/*

 dream_about  (  "apples . light . dream",  "unsigned short"  );

*/


/*

 ��֮ �� ��녉�֮����ַ֮�� ���o�˶̔��� ��Ҳ

*/






















/*

 about the file-system

 moved to dream
 
*/


/*

 void *  dream


 void *  dog;

*/


/*

 dream_about  (  "there . light . dream",  "unsigned short"  );

 dream_about  (  ��there . light . dog",  "unsigned short"  );

*/


/*

 ��֮ �� ��녉�֮����֮�ڡ� ���o�˶̔��� Ҳ

 ��֮ �� ��Ȯ֮����֮�ڡ� ���o�˶̔��� Ҳ

*/























/*

 void *  spider;


 void *  voice;

*/


/*

 dream_about  (  "there . light . spider",  "unsigned short"  );

 dream_about  (  "there . light . voice",  "unsigned short"  );

*/


/*

 ��֮ �� ����֮����֮�ڡ� ���o�˶̔��� ��Ҳ

 ��֮ �� ��֮����֮�ڡ� ���o�˶̔��� ��Ҳ

*/










































 };


/*

 ��Ҳ

*/










































'''







'''

/fst/leaves/apples/give/apples-bananas.c










/*

 something goes wrong with it

 maybe data format wrong

*/






int translate_number_word (

                              double  that_number,

                              int     that_round,

                              char *  that_word

                          )


  {








/*

 if it is less than zero

 could set it first


 should not change value of the number
 
*/



 if ( that_number < 0 )


  {


 strcpy ( that_word, "-" );

 that_number = 0 - that_number;


  }




 else


  {


/*

 if not copy it to zero

*/

 strcpy ( that_word, "" );


  }













 int  note_number  =  ( int ) that_number;

 double  note_number_point  =  that_number - note_number;

 int  note_number_this  =  0;

 char  buffer_word[128]  =  "";




    printf("%d %f %d %s\n", buffer_number, buffer_number_point, buffer_number_this, buffer_word);

// The section before point.

    if ( buffer_number == 0 ) {

        strcat(buffer_word, "0");}

    else {

        while ( buffer_number != 0 ) {

            buffer_number_this   = buffer_number * 10 ;
            buffer_number_this   = buffer_number_this   % 100;
            buffer_number        = buffer_number / 10;

printf("%d %s\n", buffer_number_this, buffer_word);

            if ( buffer_number_this == 0  ) {

                if ( buffer_number != 0 ) {

                    strcat(buffer_word, "0");}}

            if ( buffer_number_this == 10 ) {

                strcat(buffer_word, "1");}

            if ( buffer_number_this == 20 ) {

                strcat(buffer_word, "2");}

            if ( buffer_number_this == 30 ) {

                strcat(buffer_word, "3");}

            if ( buffer_number_this == 40 ) {

                strcat(buffer_word, "4");}

            if ( buffer_number_this == 50 ) {

                strcat(buffer_word, "5");}

            if ( buffer_number_this == 60 ) {

                strcat(buffer_word, "6");}

            if ( buffer_number_this == 70 ) {

                strcat(buffer_word, "7");}

            if ( buffer_number_this == 80 ) {

                strcat(buffer_word, "8");}

            if ( buffer_number_this == 90 ) {

                strcat(buffer_word, "9");}

            else {

                break;}}}

printf("%s\n", buffer_word);

    for (
            buffer_number_this =  strlen(buffer_word);
            buffer_number_this >= 2                  ;
            buffer_number_this --
        ) {

        buffer_word[buffer_number_this-1] = '\0';

//        printf("%s\n", buffer_word+(buffer_number_this-2));
//        strcat( that_word, buffer_word + (buffer_number_this - 2) );
}


// The section after  point.

    buffer_number = 0;

    while ( that_round > 0 ) {

        that_round --;

        buffer_number        =                                       buffer_number       * 10  ;
        buffer_number       +=                                (int)( buffer_number_point * 10 );
        buffer_number_point  = ( buffer_number_point * 10 ) - (int)( buffer_number_point * 10 ); }

    if ( buffer_number != 0 ) {

        translate_number_word(buffer_number, that_round, buffer_word);

        strcat(that_word, ".");

        strcat(that_word, buffer_word);}

    return 1;}



'''







'''

/fst/leaves/apples/secret/leave_blank.c







// doing with message



 int secret_drop_blank (
                         char * that_message,
                       )

  {




// clean words







 char *  note_message  =   strstr ( that_message, "\n\n" );





 while ( note_message != NULL )

  {

 strcpy ( note_message, note_message + 1 );

 note_message = strstr ( that_message, "\n\n" );

  }











// clean blank type at last




 if (
      * that_message [ strlen ( that_message ) ] == '\n'
    )



  {

 * that_message [ strlen ( that_message ) ] = '\0';

  }













// here



 return 0;


  }



'''







'''

/fst/leaves/apples/secret/add.c






int secret_sum
               (

                 char * that_message

               )

  {





 
/*

 prepare it

*/

 
 int number_length  =  strlen ( that_message );

 int number_sum     = 0;













/*

 sum them 

*/


 int i;

 for (
       i  = 0;
       i <= number_length;
       i ++ 
     )

  {



 number_sum  +=  ( int ) that_message [ i ];


  }











 snprintf (

            that_message,



/*

            sizeof ( that_message )  /  sizeof ( char )  -  1,

*/


/*

 got a path so can't get how bit the words are 

*/


            128,
            "%d", 
            number_sum

          );






 return 0;


  }



'''







'''

/fst/leaves/apples/secret/say.c






'''







'''

/fst/leaves/apples/secret/dream.c





 int secret,say (
                    char *  that_message,
              const char *  that_type
            )

  {





/*

 doesn't need it

 let it go

*/


/*

 if  (  strcmp ( that_type, "blank" )  ==  0  )

  {

 return 0;

  }

*/

 if  (
       strcmp ( that_type, "sum" ) == 0
     )

  {

 secret_sum ( that_message );

 return 0;

  }



 else if (
           strcmp ( that_type, "drop_note" ) == 0
         )

  {

 secret_drop_note ( that_message );

 return 0;

  }



 else if (
           strcmp ( that_type, "drop_blank" ) == 0
         )

  {

 secret_drop_blank ( that_message );

 return 0;

  }




/*

 doesn't match anyone of it

*/


 return -1;

  }








/*

 they're one thing

*/


/*

 int secret_encode (
                             char * that_message,
                       const char * that_type
                   )

  {






 else if ( strcmp(that_type, "blank") == 0 )

  {

 return 0;

  }



 return -1;

  }

*/



'''







'''

/fst/leaves/apples/secret/leave_note.c










 int secret_drop_note (
                        char * that_message,
                      )

  {






/*

 drop note in message

 use to read note



 warnning :

 this could just drop note in a string words

 so we just drop things just like ~/seed/seed.note

 but we have ways to finish this problem


 first we found a nearest word

 then found word before it

 then found " to be clearif that is a note

 if not we drop it





 the main things

*/






/*

 this is for big search

*/


 char * note_message;

/*

 int    number_word;

*/




/*

 this is for search to find if it is a note

*/



 char * note_pointer;

/*

 int    note_number;

*/










/*

 this is to save word

*/

 char note_flag [ 2 ] [ 1 ] [ 4 ];


 strcpy ( note_flag [ 0 ] [ 0 ], "/" );
 strcat ( note_flag [ 0 ] [ 0 ], "/" );

 strcpy ( note_flag [ 0 ] [ 1 ], "\n" );



 strcpy ( note_flag [ 1 ] [ 0 ], "#"  );
 strcpy ( note_flag [ 1 ] [ 1 ], "\n" );



 strcpy ( note_flag [ 2 ] [ 0 ], "/" );
 strcat ( note_flag [ 2 ] [ 0 ], "*" );

 strcpy ( note_flag [ 2 ] [ 1 ], "*" );
 strcat ( note_flag [ 2 ] [ 1 ], "/" )
















 int i = 0;

 for (  i = 0;  i < 3;  i ++  )

  {








/*

 this is for clear a word at once

*/




 do

  {


 note_message  =  strstr ( that_message, note_flag [i] [0] );












/*

 found it

 go to judge and drop

*/




 if (
      note_message != NULL
    )

  {











/*

 found a word could be note

*/


/*

 if (

      strstr ( that_message, note_flag [ i ] [ 0 ] ) != NULL

    )

  {

*/





/*

 this is to find if it had srearch before

*/


/*

 if ( * note_message == '\n' )

  {

 * note_message = note_flag [ number_word ] [ 0 ] [ 0 ];

  }

*/



/*

 change flag

*/

/*

 number_word = i;

 note_message = strstr ( that_message, note_flag [ i ] [ 0 ] );

*/




/*

 it could be a note we found

 so find " before it judge by number of it

*/


/*

 * note_message = '\n';

*/




/*

 this is to find if it is in note


 this could be done at first

*/


/*

 do

  {

 note_pointer  =  strstr ( that_message, "\"" );

 if ( note_pointer != NULL )

  {

 note_number ++;

  }

  }  while  ( note_pointer != NULL )

*/







/*

 this is to drop

*/

 if (

      NULL == strstr ( note_message, note_flag [ i ] [ 1 ] )

    )


  {

 strcpy (
          note_message,
          note_message + strlen ( note_flag [ i ] [ 0 ] )
        );

  }




 else

  {

 strcpy (

          note_message,

          strstr ( note_message, note_flag [ i ] [ 1 ] ) + strlen ( note_flag [ i ] [ 1 ] )

        )

  }









/*

 this is for return

*/


/*

 * note_message = note_flag [i] [0] [0];

*/





/*

 this is for if

*/

  }





  }  while  (  note_message != NULL  )






/*

 loop for word "for"

*/

  }







 return 0;

  }





'''







'''

/fst/leaves/apples/secret/keep.c






'''







'''

/fst/leaves/lights/dream.c


































 void  *  dream_about_light  (  char * words_name  )

  {


/*

 �o�� ���� �x ���� ���� ��

 ��

*/ 
















 dream_about  (  "pin_group_led",  "unsigned short"  );




/*

 녉� �� ���ƽM̖�� ���o�˶����� ��Ҳ

*/
















 return  0;


/*

 �ؑ� �� Ҳ

*/


/*

 �ؑ� ˳ Ҳ

*/


/*

 �؏� Ȼ Ҳ

*/


















  }


/*

 ��Ҳ

*/























'''







'''

/fst/leaves/sister/trees/trees/see.c






/*

 don't know how long it is

 use malloc

*/

 void file_get (
                 const char * that_path,
                       char * that_result
             )

  {



 FILE * note_file  = NULL;

 char note_buffer [ 128 ];









 strcpy ( that_result, "" );








 if (
      is_file ( that_path)
    )

  {







 note_file = fopen ( that_path, "r" );








 while (

         fgets ( note_buffer, 128,  ( FILE * ) note_file ) != NULL

       )

  {

/*

 if (

      sizeof ( that_result ) - strlen ( that_result )  >=  128

    )

  {

 break;

  }


 else

  {

*/

 strcat ( that_result, note_buffer );

  }

/*

}

*/










 fclose ( note_file);


  }




  }


















/*

 c++

*/


/*

 string file_get ( string path_file )

  {

 ifstream    file;

 string      that;

 char        that_one;



 file . open ( path_file . c_str() );


 while ( ! file . eof () )

  {

 file . read ( & that_one, 1 );

        that += that_one;

  }


 file . close ();


 that = that . substr ( 0, that . length () - 1 );

 return that;

  }

*/



'''







'''

/fst/leaves/sister/trees/trees/water.c







 void file_append (

                     const char * that_path,

                     const char * that_words,

//                     const char * that_type

                  )


  {



/*

 this is for cound how many dirent it is

 may use pointer

*/

 int  note_count  =  1;







/*

 they are for find and make new dirent

*/

 char   note_path [ 64 ];



 char * pointer_path;











/*

 Build a range to find '/',

  to check does the dirent exist.

*/


 while  (  note_count  !=  0  )


  {





/*

 prepare to make dirent

*/


 strcpy ( note_path, note_path );



 pointer_path = note_path;







/*

 read the symbol

 find the dirent we count

*/


 int i;

 for  (  i = 0;  i < note_count;  i ++  )


  {







/*

 find next symbol

 we've count

*/


 pointer_path  =  strstr ( pointer_path + 1, "/" );







/*

 to here


 if we've read all of it

 we could stop

*/


 if  (  pointer_path  ==  NULL  )


  {



 note_count = 0;





/*

 we've read all of it

 maybe a dirent

*/

 if  (  is_dirent ( note_path )  )

  {

 return -1;

  }




  }





/*

 this range for loop of symbol found

*/


  }








/*

 we find a dirent

 check it


 if we've read all of it

 check it too

 so we could know if it is a dirent

*/


 if ( note_count != 0 )


  {




/*

 we find next dirent next loop

*/

 note_count ++;





/*

 to next symbol we've found

 then return it soons

*/

 * pointer_path = '\0';







/*

 maybe creat it

*/

 if  (  ! is_dirent ( note_path )  )


  {


 mkdir  (  note_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH  );


  }





/*

 it is for to check

*/

  }




/*

 this loop for check

*/

  }












/*

 append file



 could add a title



 maybe not

 it use too more base function

 like a high level function

*/



/*

 if (  strcmp ( that_type, "blank" )  ==  0  )

  {

*/







 FILE *  note_file  =  fopen ( that_path, "a" );


 fprintf  (  note_file,  "%s",  that_words  );


 fclose ( note_file );



 return 0;

  }









/*

 c++ code

*/



/*

 ofstream that_file;

 that_file.open(file_name, ios::app );

 that_file << words;

 that_file.close();


  }

*/



'''







'''

/fst/leaves/sister/trees/trees/find.c










 int is_file ( const char * that_path )


  {


 struct stat note_status;


 if (

 lstat ( that_path, & note_status ) == 0

    )

  {

 return 0;

  }


 else

  {

 return -1;

  }



  }



'''







'''

/fst/leaves/sister/trees/trees/seed.c




void file_save(
                  const char* that_path,
                  const char* that_words
              ) {


    FILE* buffer_file;
    int   buffer_count         = 1;
    char  buffer_path[1024];
    char* pointer_path;




    while ( buffer_count != 0 ) {

        strcpy(buffer_path, that_path);
        pointer_path = buffer_path;


        int i;
        for ( i = 0; i < buffer_count; i++ ) {

            pointer_path = strstr(pointer_path + 1, "/");

            if ( pointer_path == NULL ) {
                buffer_count = 0;}}

        if ( buffer_count != 0 ) {
            buffer_count++;
           *pointer_path = '\0';

          if ( !is_dirent(buffer_path) ) {
              mkdir(buffer_path, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);}}}




    buffer_file = fopen( that_path, "w" );

    fprintf( buffer_file, "%s", that_words );

    fclose( buffer_file );}




/*
// The way of c++ stream
    ofstream fout(that_path.c_str());

    fout << words;

    fout.close();}
*/



'''







'''

/fst/leaves/sister/trees/forest/forest.bananas





/*




 # include  < dirent.h > 


 DIR * opendir ( const char * dirname ); 

 struct dirent * readdir ( DIR * dirp );
 
 int closedir ( DIR *dirp );



 struct dirent

  {


#ifndef __USE_FILE_OFFSET64

 __ino_t d_ino;
 __off_t d_off;


#else

 __ino64_t d_ino;
 __off64_t d_off;


#endif

 unsigned short int d_reclen;

 unsigned char d_type;

 char d_name [ 256 ];

  };

enum
{
    DT_UNKNOWN = 0,     //未知类型
# define DT_UNKNOWN DT_UNKNOWN
    DT_FIFO = 1,        //管道
# define DT_FIFO DT_FIFO
    DT_CHR = 2,         //字符设备文件
# define DT_CHR  DT_CHR
    DT_DIR = 4,         //目录
# define DT_DIR  DT_DIR
    DT_BLK = 6,         //块设备文件
# define DT_BLK  DT_BLK
    DT_REG = 8,         //普通文件
# define DT_REG  DT_REG
    DT_LNK = 10,        //连接文件
# define DT_LNK  DT_LNK
    DT_SOCK = 12,       //套接字类型
# define DT_SOCK DT_SOCK
    DT_WHT = 14         //
# define DT_WHT  DT_WHT
};
*/
















'''







'''

/fst/leaves/sister/trees/forest/find.c










 int is_dirent ( const char * that_path )

  {



 struct  stat   note_status;



/*

 success to get status

*/

 if (
      lstat  (  that_path, & note_status  )  ==  0
    )

  {



/*

 judge

*/

 return  S_ISDIR ( note_status . st_mode )  !=  0;

  }




/*

 read status fail

*/

 return -1;

  }








/*

 maybe we could use it in update

*/

 int is_special_dir ( const char * that_path )

  {

    return  strcmp ( that_path, "." ) == 0  ||  strcmp ( that_path, ".." ) == 0;}



'''







'''

/fst/leaves/sister/thread/out.c




/*

 maybe we could use things on terminal



         __
        /  \
        \__/

                                                __
                                               /  \
                             ____              \__/
                            /    \
                           /      \
                           \      /
                            \____/


                                        __
                                       /  \
                 __                    \__/
                /  \
                \__/




*/






/*


              _
             |_|



              __              ___
             /  \            /   \
             \__/            |   |
                             \___/


              ___
             /   \
             \___/



              ___
             /   \
            |     |
             \___/



              ____
             /    \
            /      \
            \      /
             \____/


*/









 int output_print (

                    const char * that_type,

                    const char * that_words

                  )

  {



/*


 maybe we could output to note and display them


*/



 if  (  ! gop_about . flag . deamon  )


  {













 if  (  strcmp ( that_type, "string" )  ==  0  )


  {



 printf ( "%s", that_words );



  }






 if  (  strcmp ( that_type, "int" )  ==  0  )


  {


 printf  (  "%d",  * ( int * ) that_words );


  }







 if  (  strcmp ( that_type, "long" )  ==  0  )

  {

 printf  (  "%ld",  * ( long * ) that_words );

  }






 if  (  strcmp ( that_type, "float" )  ==  0  )


  {

 int buffer_number;

 printf  (  "%f",  * ( float * ) that_words );

  }






 if  (  strcmp ( that_type, "double" )  ==  0  )


  {

 printf  (  "%lf",  * ( double * ) that_words  );


  }




  }









/*

 save to note 

 if we run background

*/


 else if  (  gop_about . flag . deamon  )


  {



 FILE *  buffer_file  =  fopen ( "/opt/TxL_deamon.note", "a" );




 if  (  strcmp ( that_type, "string" )  ==  0  )

  {

 fprintf  (  buffer_file,  "%s",  that_words );

  }




 if  (  strcmp ( that_type, "int" )  ==  0  )

  {

 fprintf  (  buffer_file,  "%d",  * ( int * ) that_words  );

  }



 if  (  strcmp ( that_type, "long" )  ==  0  )


  {

 fprintf  (  buffer_file,  "%ld",  * ( long * ) that_words  );

  }



 if  (  strcmp ( that_type, "float" )  ==  0  )

  {

  fprintf  (  buffer_file,  "%f",  * ( float * ) that_words  );

  }


 if  (  strcmp ( that_type, "double" )  ==  0  )

  {

 fprintf  (  buffer_file,  "%f",  * ( double * ) that_words  );

  }




 fclose( buffer_file );


  }





  }



'''







'''

/fst/leaves/sister/thread/deamon.c








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






'''







'''

/fst/leaves/sister/thread/init.c







int SystemInit() {

	// ok i wander what's going on with this and :D

    return 1;}



'''







'''

/fst/leaves/sister/thread/line.c





/*

 int commandline_get (
                         const char * that_commands,
                               char * that_result
                     )


  {

*/


 int line_get (
 
                void * that_line,
				
                void * that_fruit
					  
              )


  {







/*


 FILE  * note_commandline;
 
*/


 void * that_file_line;















/*

 maybe use pointer

*/


/*

 char    note_lines [ 1024 ];

*/

 void  that_note_line;











/*

 clean this



 maybe use pointer


 use pointer
 
*/

/*

 that_result [ 0 ]   =  '\0';

*/














/*

 run it

*/


/*

 note_commandline  =  popen ( that_commands, "r" );

*/


 that_file_line  =  malloc  (  sizeof ( FILE )  );


 that_file_line  =  popen  (  that_line,  "r"  );

/*

 ( FILE * ) that_file_line  =  popen  (  that_line,  "r"  );

*/















/*

 sometimes it goes failed

*/

/*

 if ( file_commandline == NULL )

  {

 return -1;

  }
  
*/
 
 
 if  (  that_file_line  ==  NULL  )


  {

 return 1;

  }








 else

  {








/*

 run success

 read it

*/

 while (

         fgets (
                 note_lines,
                 1024,
                 note_commandline
               )

         != NULL

       )

  {


/*

 maybe realloc here

*/

 strcat ( that_result, note_lines );


  }





/*

 read over

*/

 pclose ( note_commandline );
 
 free ( that_file_line );



 return 0;


  }



/*

 pclose ( note_commandline );

*/


  }



'''







'''

/fst/leaves/sister/wait.c







/*

 use different include file

  to let seed can be run on stm32 maybe

*/



 int gop_wait (  double that_time  )


  {



/*

 maybe use timer alarm

 could use in stm32, arduino

 diy circle

*/


 usleep ( that_time * 1000000 );


  }


'''







'''

/fst/spider/leg/male.c









 void * gop_connector ( void * what )

  {






/*

 Standart preparing.






 it will be said

*/

/*

 struct sockaddr_in    note_address;

*/




/*

 could use network.connection straightly

 maybe for other ways

*/

/*

 int note_return;

*/

 char note_recive [ 10240 ];

 char note_send [ 10240 ];










/*

 Wait the dog start on.

*/

 while (  ! gop_about . flag . start  )


  {


/*

 maybe all the way i use will be in library after this

*/


 gop_wait ( gop_hope . step_connection );


  }










/*

 Prepare the information of start.


 dog will load this when dog had started


 and other thing should do this at a lowest time

  so we load it here first time



 maybe we should put them all in one dirent with dog

 and named load



 when connection break dog reset it

*/


 strcpy (
          gop_connection . address_ip [ 0 ],
          gop_hope       . address_to
        );


          gop_connection . port [ 0 ]
       =  gop_hope       . port_to;




/*

 prepare the status of network

 maybe i should movethis to ~/network/build.h

*/


/*

 strcpy ( gop_connection.how [ 0 ], "Wait" );

*/

 clean_connection ( 0, "all" );






/*

 this usually is 0 at first, and sop don't clear it, if dog check this, dog can shut it


 then it couldn't be stack


 descriptor for socket

 connection for connection


 let it be -1 is ok

 make it simple

*/

 gop_connection . description [ 0 ] = -1;

 gop_connection . connection [ 0 ] = -1;












/*

 Sometimes when the server close

                the client will be closed.


 then use this

*/

 signal ( SIGPIPE, SIG_IGN );


















/*

 start

*/


 while ( gop_about . flag . main )

  {









/*

 Sleep sometimes when

 the client closed

 & and the main program is running

*/

 if ( ! gop_about . flag . connector )

  {


 gop_wait ( 0.1 );


  }









/*

 start

*/


 else {








/*

 This box is for note saving

*/

 note_save ( "connector", "connector start", "now" );















/*

 go

*/


 while ( gop_about . flag . connector )

  {


/*

 This round for connection

*/








/*

 If there isn't a available ip,
 do       not continue,
 will  be complicated

 connector will be stack here

 and don't move for long time

 :(

*/


 if (  gop_about . network . number  <=  1  )


  {

 gop_wait (  gop_about . hope . step_connection );

 goto leave;

  }








/*

 Can not connect myself



 check one by one

*/

 int i;

 for (

       i  =  1;

       i <=  gop_about . network . number;

       i ++

     )

  {



 if (

      strcmp (

               gop_connection . address_ip [ 0 ],

               gop_about . network . ip [ i ] [ 2 ]

              )
      == 0

/*

 what's this ??

*/

/*

 &&   gop_about . flag . sound

*/
    )

  {



 gop_wait ( gop_about . hope . step_connection );


 goto leave;



/*

 this is for if

*/

  }





/*

 this is for for

*/

  }













/*


 start



------------------------------------------------------------------------------------
 Prepare the buffer

*/

 struct  sockaddr_in  note_address;


 note_address . sin_family         =  AF_INET;

 note_address . sin_port           =  htons     ( gop_connection . port [ 0 ] );

 note_address . sin_addr . s_addr  =  inet_addr ( gop_connection . address_ip [ 0 ] );






/*

 Creat the socket

 before that we set the description to -1, if we lock there, the dog ckecked this

 just to connection


 maybe it won't lock here, conybe lock at connection

*/

 gop_connection . descriptor [ 0 ] = socket (
                                              AF_INET,
                                              SOCK_STREAM,
                                              0
                                            );







/*

 If something goes wrong, & it could not creat
  a socket, turn it off,
 we could turn it up again from outside

*/

 if (  gop_connection . descriptor [ 0 ]  == -1  )

  {

 gop_about . flag . connector = 0;



/*

 turn out

*/

/*

 goto leave;

*/

 continue;

  }








/*

 Connect to the target

*/

 gop_connection . connection [ 0 ]  =  connect (

                                                 gop_connection.descriptor [ 0 ],

                         ( struct sockaddr * ) & note_address,

                                        sizeof ( note_address )

                                               );





/*

 No result wait few secends

*/

 if (  gop_connection . connection [ 0 ]  ==  -1  )

  {

 gop_wait ( 0.1 );




/*

 it doesn't matter if i don't let it goto leave

 but it changes

 we could let it fewer won't let bug come out

*/

 goto leave;

  }








/*

 If got a connection

*/

 else if ( gop_connection . connection  >=  0  )

  {






/*

 fresh the description of connection


 that is it

*/

/*

 gop_connection . connection [ 0 ]  =  number_return;

*/






/*

 Fresh the time pointer

 time pointer is more complicate with connectted

*/

 gop_connection . time [ 0 ]  =  time ( NULL );








/*

 if this is a new connection, we should set it

*/

 if (

      strcmp ( gop_connection . how [ 0 ], "Wait" )  ==  0

    )

  {





 char note_message [ 128 ];


/*

 New connection, print it


 maybe we could make a type for it then it could display on its little box

 like put print to note and display note

*/


 strcpy ( note_message, "connectting to    " );

 strcat ( note_message, gop_connection . address_ip [ 0 ] );


/*

 save note

*/

 note_save ( "connector", note_message, "now" );



/*

 print it out

*/

 strcat ( note_message, "\n" );


 output_print ( "string", note_message );









/*

 prepare the note

 move it on this

*/

/*

 char bufer_note [ 32 ];

*/


/*

 strcpy ( note_message, "connectting to " );

 strcat ( note_message,  gop_connection . address_ip [ 0 ] );

*/



/*

 save the note

 move it upsite

*/

/*

 note_save ( "connector", note_message, "now" );

*/








/*

 set how

*/

 strcpy ( gop_connection . how [ 0 ], "Connectting" );




/*

 donee

*/

  }







/*

 it is ( or it is now )

 Old connection, continue talking..



 recive from master first

*/

 recv (

        gop_connection . descriptor [ 0 ],

        note_recive,

        10240,

        0

      );



/*

 The secret code


 when it could

 maybe add to network/message

*/

/*

 secret_decode ( note_recv, "blank" );

*/







/*

 handle this message

*/

 control_message (
                   0,
                   note_recive,
                   note_send
                 );








/*

 resolve the secret

*/

/*

 secret_encode ( note_send, "blank" );

*/





/*

 ok send it

*/

 send (

        gop_connection . descriptor [ 0 ],

        note_send,

        10240,

        0

      );








/*

 If clients sleep instead of master,

 It could be more balance.

*/

 gop_wait ( gop_hope . step_connection );







/*

 Close the socket

       and prepare for next

           connection


 and we should clear the description of connection first

  or it could couse a mess


 connection maybe closed by connectted

*/


 close ( gop_connection . connection [ 0 ] );



 gop_connection . connection [ 0 ] = -1;







/*

 if connection couldn't be build

 could not close it




 this range is for if it connect success

*/



  }










/*

 this connection has a result

 now close it

*/

 close ( gop_connection . descriptor [ 0 ] );








/*

 If something wrong with the target,

 it's here the program jump to

 over the connectting

*/

 leave:

 sleep ( 0 );






/*

 this range is for falg

 1/3 main range

*/

  }










/*

 The round of connection is
 over, it is time to save note

*/

 note_save ( "connector", "client close", "now" );



/*

 this range is for flag range

 2\3 note saver

*/

  }





/*

 range 3\3

 round of main

*/

  }







/*

 if main thing close

 exit it

*/

 pthread_exit ( NULL );


  }



'''







'''

/fst/spider/leg/female.c











 void * gop_connectted ( void * what )


  {







/*

 Declare these variable.





 maybe we shouldn't take it because we have two note buffer named connection and descriptor

*/

/*

 int number_return;

*/


 char note_buffer [ 10240 ];

 char note_address [ 32 ];



 char note_recive [ 4 ] [ 10240 ]

 char note_send [ 10240 ]









/*

 this is for note things of connector


 this for bind

*/


 struct sockaddr_in note_address_in;





/*

 this for accept

*/

 struct sockaddr_in note_address_by;

        socklen_t   note_lenth;
















/*

 clear it ( maybe i should use a single one function to do this )


 and yes

*/

/*

 strcpy ( gop_connection . how [ 1 ], "Wait" );

 strcpy ( gop_connection . how [ 2 ], "Wait" );

 strcpy ( gop_connection . how [ 3 ], "Wait" );


*/


/*

 after this, clean by dog

*/

 clean_network ( 1, "all" );

 clean_network ( 2, "all" );

 clean_network ( 3, "all" );












/*

 Wait for the information getting done.

*/

 while (  ! gop_about . flag . start )

  {

 gop_wait ( 0.1 );

  }













/*

 This line is for the wrong
 when a connection is closed
 &
 it could be useful in networking
 somewhere

*/

 signal ( SIGPIPE, SIG_IGN );

















/*

 Parpering finished,
  then the round could start.

*/

 while (  gop_about . flag . main  )

  {









/*

 this round is for wait it go

*/


 if (  ! gop_about . flag . connectted  )

  {


/*

 sleep some time evrey range

*/

 gop_wait ( 0.1 );


  }











/*

 this round is for get noted when it go

 and get prepare

*/

 else if (  gop_about . flag . connectted  )

  {











/*

 Note this startting.

*/


 note_save ( "connectted", "server start", "now" );











/*

 start



 This round is for
 preparing.







 Create socket

 we do this every time connectted start

 then we don't need dog to load this

 and could restart every time


 but sometimes the socket won't close

*/

 gop_connection . port[1]  =  port_this;

 gop_connection . descriptor[1]  =  socket (
                                             AF_INET,
                                             SOCK_STREAM,
                                             0
                                           );
/*

 if socket creat failled ?

*/






/*

 Setting the
 socket attribution

*/

 note_address_in . sin_family         =  AF_INET;

 note_address_in . sin_port           =  htons ( gop_connection . port [ 1 ] );


/*

 this is for bindind any address for connect in

*/

 note_address_in . sin_addr . s_addr  =  htonl ( INADDR_ANY );


 note_lenth = sizeof ( note_address_by );






/*

 If failled, close it

*/

 if ( gop_connection.descriptor[1] == -1 )

  {






 output_print ( "string", "got wrong to create at connectted\n" );




/*

 socket create failed don't need to close it

*/


 gop_about . flag . connectted = 0;



/*

 turn out

 socket create failed doesn't neet to close it

*/

 continue;



  }









/*

 When a server closed
 something ran &the
 ip address
 will be not avalable for
 minutes
 use this is OK

*/

 int note_set = 1;

 if (

      setsockopt (
                   gop_connection . descriptor [ 1 ],
                   SOL_SOCKET,
                   SO_REUSEADDR,
                 & note_set,
          sizeof ( note_set )

                )
      == -1
    )

  {




/*

 maybe the socket should be closed

*/

 close ( gop_connection . descriptor [ 1 ] );


 output_print ( "string", "got wrong to set at connectted\n" );


 gop_about . flag . connectted = 0;


 continue;



  }










/*

 P.S.
     the networking is
        another program &
     when this is shutting down
          that would be still running.

-----------------------------------------------------------------------------------
 Starting this program binding.

*/


 if (

      bind (

                                     gop_connection . descriptor [ 1 ],

             ( struct sockaddr * ) & note_address_in,

                            sizeof ( note_address_in )

           )

      == -1

    )

  {


 output_print ( "string", "got wrong to bind at connectted\n" );


 close ( gop_connection . descriptor [ 1 ] );


 gop_about . flag . connectted = 0;


 continue;

  }




/*

-----------------------------------------------------------------------------------

*/


 if (

      listen (

               gop_connection . descriptor [ 1 ],

               3

             )
      == -1

    )

  {

 output_print ( "string" "got wrong to listen at connectted\n" );


 close ( gop_connection . descriptor [ 1 ] );


 gop_about . flag . connectted = 0;


 continue;

  }












/*

 prepare is finished












 prepare finish

 then we just accept and connect ?






 Loop start.

*/

 while (  gop_about . flag . connectted  )

  {














/*

 Accept connection.

*/

 gop_connection . connection [ 4 ] = accept (

                                              gop_connection . descriptor [ 1 ],

                      ( struct sockaddr * ) & note_address_by,

                                            & note_lenth

                                            );





/*

 start value is 0

 if it is 0 or -1

 it means connection have not start

*/

 if ( gop_connection . connection [ 4 ] == -1 )

  {


/*

 When the mode of no-wait
   is opening.
   do not print
 accepting error message

 maybe any problom

*/

/*

 perror ("");

*/



 output_print ( "string", "got wrong to accept at connectted\n" );


 gop_wait ( 0.1 );


 continue;


  }






/*

 successed


 fresh the time [ 4 ] first

 it's used to note the all of the connection latest time

 smile connection need this

 smile connection is where number 4

*/

 gop_connection . time [ 4 ] = time ( NULL );











/*

 fresh the description of connection

 u could be stack when smiled

 because we havn't give it a site  we use 5

 cause the connector's connection descriptor is network descriptor

 and set another next time

*/

/*

 gop_connection.connection [ 4 ] = number_return;

*/






/*

 Note the ip

*/

 strcpy (

          note_address,

          inet_ntoa ( address_by . sin_addr )

        );






/*

 Connection message is already here.
 Find the site for this.
 Find is there it's site
      or a free     site.

*/

 int note_free = 0;
 int note_site = 0;





/*

 find free site.

*/

 int i;

 for     (  i = 1; i <= 3; i ++  )

  {


 if (

      strcmp ( gop_connection . address_ip [ i ], "" ) == 0

    )

  {

 note_free = i;

 break;

  }


  }






/*

 Find it's site.

*/

 for (  i = 1;  i <= 3;  i ++ )

  {


 if  (

       strcmp ( gop_connection . address_ip [ i ], note_address ) == 0

     )

  {

 note_site = i;

 break;

  }


  }






/*

 If it's a new site.
    set a site for it.

 If sites' full,
    smile to it.


 else if it is already have a site connect to it

*/

 if (  note_free != 0   &&   note_site == 0  )

  {

 note_site = note_free;

  }











 else if (  note_site == 0   &&   note_free == 0  )

  {



/*

 Note this smile.


 copy it for once

*/

/*

 output_print ( "string", "Smile to           "              );
 output_print ( "string",  inet_ntoa ( address_by.sin_addr ) );
 output_print ( "string", "\n"                               );

*/

 strcpy ( note_buffer, "Smile to " );

 strcat ( note_buffer, inet_ntoa ( note_address_by . sin_addr ) );


 note_save ( "connectted", note_buffer, "now" );



 strcat ( note_buffer, "\n" );


 output_print ( "string", note_buffer );


 strcpy ( note_buffer, "" );







/*

 Preparing for this smile.

*/

 strcpy ( note_send, "This is gop station." );

 strcat ( note_send, "\n"     );

 strcat ( note_send, "Smile." );

 strcat ( note_send, "\n"     );




/*

 Find the connectting device
      who can be connectted

*/

 int note_smile = -1;

 srand ( time ( NULL ) );

 note_smile =  1 + 4 * (  rand()  /  ( RAND_MAX + 1.0 )  );



/*

 maybe we should find the connectors who is not Arduino or stm32 couldn't be connnector




 Add it's ip to smile message.

*/

 strcat (
          note_send,
          gop_connection . address_ip [ note_smile ]
        );







/*

 Send it
 and
 Recive the returned message.


 make a secret

*/


/*

 secret_encode ( buffer_send, "blank" );

*/


 send (
        gop_connection . connection [ 4 ],
        note_send,
        10240,
        0
      );

 recv (
        gop_connection . connection [ 4 ],
        note_recive [ 0 ],
        10240,
        0
      );


 gop_wait ( step_connection );












/*

 close this one

*/

 close ( gop_connection . connection [ 4 ] )






/*

 clean the description of connection

*/

 gop_connection . connection [ 4 ] = 0;





/*

 next listen

*/
 continue;


  }








/*

 After findind site
       for this connection,
 preparing  for connection.



 if it not smile

 the value won't be 0

*/

 if ( number_site != 0 )


  {











/*

 we have a site

 we could fresh the connection descriptor


 even if it is a old site

 it has been close last time

*/

 gop_connection . connection [ number_site ]  =  gop_connection . connection [ 4 ];


 gop_connection . connection [ 4 ]  =  0;








/*

 Update the time pointer,
 and the connecttion ip

*/

 gop_connection . time [ number_site ]  =  time ( NULL );



/*

 ip address

*/

 strcpy ( gop_connection . address_ip [ number_site ], note_address );














/*

 If is's new ,
  notice and
  note  this connection.

*/

 if (

      strcmp ( gop_connection . how [ number_site ], "Wait" ) == 0

    )

  {




/*

 print and note for once

*/


/*

 output_print ( "string", "connectted  by    "  );
 output_print ( "string",  gop_connection . address_ip [ number_site ] );
 output_print ( "string", "\n" );

*/


 strcpy ( note_buffer, "connectted by "  );

 strcat ( note_buffer, gop_connection . address_ip [ number_site ] );


 note_save ( "connectted", note_buffer, "now" );



 strcat ( note_buffer, "\n" );


 putput_print ( "string", note_buffer );







 strcpy ( note_recv [ number_site ], "" );

 strcpy ( gop_connection . how [ number_site ], "Connectted" );


  }







/*

 make the secret maybe


 for last conversation

*/

/*

 secret_decode   ( note_recv [ number_site ], "blank" );

*/




/*

 control the secret

*/

 control_message ( note_site, note_recv [ note_site ], note__send );







/*

 resolve this secret

*/

/*

 secret_encode ( note_send, "blank" );

*/






/*

 Execute it.

*/

 send (
        gop_network . connection [ number_site ],
        note_send,
        10240,
        0
      );


 recv (
        gop_network . connection [ number_site ],
        note_recv [ number_site ],
        10240,
        0
      );







/*

 Do note wait,
 or get clients connectting
 no banance


*/

/*

 gop_wait ( step_connection );

*/









/*

 close it

*/

 close ( gop_connection . connection [ number_site ] );




/*

 clear the connection description

*/

 gop_connection . connection [ number_site ] = 0;




/*

 close it

*/

/*

 close ( number_return );

*/







/*

 this is for accept and if we have a site

*/

  }





/*

 this is for round of accept

*/

  }








/*

 if the connectted closed

 save this note

*/

 note_save ( "connectted", "server close", "now" );





/*

 close the network

*/

 close ( gop_connection . descriptor [ 1 ] );










/*

 this is for if flag of it is open

*/

  }



/*

 this is for if main flag is open

*/

  }








 pthread_exit ( NULL );


  }



'''







'''

/fst/spider/net/knot/who.c




int judge_message_who(

                         int   that_site,
                         char* pointer_recv,
                         char* buffer_send

                     ) {

// This is gop station
// Who is that now?

// This is gop station
// ------
// ...
// ------
// Here





    if (
           strstr(pointer_recv, "This is gop station.")
           ==    pointer_recv
    ||    strstr(pointer_recv, "This is a leaf.")
           ==     pointer_recv
       ) {

// This is fine...
// omg..

        return 1;}


    else {


        output_print( "string",         "Network "                 );
        output_print( "int"   ,  (char*)&that_site                 );
        output_print( "string",         " with unknown person: \n" );

        output_print( "string",         "\\*"                      );
        output_print( "string",          pointer_recv              );
        output_print( "string",         "\n"                       );
        output_print( "string",         "*\\"                      );


        strcat(buffer_send,    "Who is that?");

        return 0;}}



'''







'''

/fst/spider/net/knot/hello.c




int judge_message_hello(

                           int   that_site,
                           char* pointer_recv,
                           char* buffer_send

                       ) {

// This is gop station
// Who is that now?

// This is gop station
// ------
// ...
// ------
// Here




    if (

              strstr(pointer_recv, "This is ") == pointer_recv
           && strstr(pointer_recv, "\n")       != NULL

       ) {

// This is fine...
// omg...

        return 1;}




    else {

        if (

               strstr ( pointer_recv, " GET  " ) == pointer_recv
        ||     strstr ( pointer_recv, " HTTP " ) == pointer_recv 

           ) {

            char buffer_path [ 32 ];

            strcpy ( buffer_path, path_the  );
            strcat ( buffer_path, "/"       );
            strcat ( buffer_path, name_data );
            strcat ( buffer_path, "/0/http.note" );

            file_save ( buffer_path, pointer_recv );


            output_print ( "string", " got a http message" );





// this is wait to test

// and we should use a function to do this

/*

/*

// let it send https message

// moved it to the judge of hello


<start>

80 HTTP/1.1
Host:www.soso.com
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*//*;q=0.8
User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36
Accept-Language:zh-CN,zh;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2

<end>

*/




        strcpy ( pointer_recv, "<start>\n\n" );

        strcat ( pointer_recv, "GET "                                                            );
        strcat ( pointer_recv, "520 HTTP/1.1\n"                                                  );
        strcat ( pointer_recv, "host:gop\n"                                                      );
        strcat ( pointer_recv, "Accept: text/html\n"                                             );
        strcat ( pointer_recv, "User-Agent:gop\n"                                                );
        strcat ( pointer_recv, "User-Language:zh-CN,zh;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2\n" );

        strcat ( pointer_recv, "\n<end>\n\n" );





        strcat ( pointer_recv, "<html>\n" );

        strcat ( pointer_recv, "<head><title>gop</title></head>\n" );

        strcat ( pointer_recv, "body bgcolor=\"white\">\n" );
        strcat ( pointer_recv, "<center><h1>"              );

        strcat ( pointer_recv, information_system.name     );
        strcat ( pointer_recv, "</h1></center>\n"          );

        strcat ( pointer_recv, "</body>\n" );
        strcat ( pointer_recv, "</html>\n" );


        return 1;

        }

*/
            }



        else {

            output_print( "string",        "Network with no smile " );
            output_print( "int"   , (char*)&that_site               );
            output_print( "string",        ": \n"                   );

            output_print( "string",        "\\*"                    );
            output_print( "string",         pointer_recv            );
            output_print( "string",        "\n"                     );
            output_print( "string",        "*\\"                    );

            strcat(buffer_send,    "Who is that?");

            return 0;}}}




'''







'''

/fst/spider/net/knot/information.c





int judge_message_information (

                                  int       that_site,
                                  char * pointer_recv,
                                  char *  buffer_send

                              ) {




/*

 PS. the varitable 'pointer_recv' was selected before

        so there is one piece of command there.

*/













// when there is not a command, we send this hello


    if (

           strstr ( pointer_recv, "Here."   )  ==  pointer_recv

    ||     strstr ( pointer_recv, "Recive." )  ==  pointer_recv

       ) {


/*

 if u don't want to do anythong,

  & so do anothers

 just keep this relationship

*/



/*

 and we don't need to add the ask, we ask if we don't thought out

 but it's not sames

*/



        if (  strcmp ( gop_connection.command [ that_site ], "" )  ==  0 ) {

            strcat ( buffer_send, "Who is that now?" );}




// so we do nothing..:D

        return 1;}












// this is to send information i used

    else if  (  strstr ( pointer_recv, "About me." )  ==  pointer_recv   ) {


/*

 we use 'information of it' & 'information of mate' next big change


 ok i have good idea



 and we move it to it's mother site

*/





/*

 moved from watchdog/information/load.h

 so we can send a complete content

*/


        pointer_recv   =  strchr ( pointer_recv, '\n' ) + 1;




// load it, anyway 

        load_about (  gop_network . about [ that_site ],  pointer_recv  );




        return 1;}






    else if  (  strstr ( pointer_recv, "About my mate." )  ==  pointer_recv  ) {




        pointer_recv   =  strchr ( pointer_recv, '\n' ) + 1;






/*

 we use malloc to do this soon

 then we can know about every mates


 use 'mate' to note its ship



 free space in cleanning





 add a mate

*/



        if  (  gop_network . about [ that_site ] . number_mates  ==  0  )  {


            gop_network . about [ that_site ] . mates   =   malloc  (  gop_network . about [ that_site ] . number_mates   *   sizeof ( void * )  );



        else {


            gop_network . about [ that_site ] . mates   =   reallac (  gop_network . about [ that_site ] . mates,  that_about . number_mate + 1   *   sizeof ( void * )  );




        gop_network . about [ that_site ] .  number_mate ++;








        load_about (
                     gop_network . about [ that_site ]
                                                       . mates [ gop_network . about [ that_site ] . number_mates ],
                     pointer_recv
                   );





        return 1;}













    else if  (  strstr (  pointer_recv,  "Sopi."  )  ==  pointer_recv  ) {


/*

 we could use a space to show output one line

*/

        output_print ( "string", "Got Sopi\n" );





/*

 i am gopi

*/

        int i;

        for  (  i = 0;  i <= 3;  i ++  ) {

            if (

                   strcmp  (  gop_connection . how [ i ],  "Connectted"  )  ==  0

            ||     strcmp  (  gop_connection . how [ i ],  "Sopi"  )  == 0

               ) {

                strcpy  (  gop_connection . command [ i ], "Sopi."  );}}




        clean_connection ( that_site,   "sopi"  );



        strcat ( buffer_send, "Sopi." );



        return 1;}











/*

 we used the update next  when sop get message

 this can be sleep

*/

    else if  (  strstr(  pointer_recv,  "Update lost."  )  ==  pointer_recv  ) {


        if (
             strcmp  (  strchr ( pointer_recv, '\n' ),  "\n"  )  ==  0
           ) {


            strcpy  (  gop_connection . update [ that_site ],  path_the  );
            strcat  (  gop_connection . update [ that_site ],  "/"       );
            strcat  (  gop_connection . update [ that_site ],  name_the  );

                       gop_connection . step_update [ that_site ]  =  0;}



        else {

              strcpy  ( gop_connection . update      [ that_site ],  strchr ( pointer_recv, '\n' )  +  1  );
                        gop_connection . step_update [ that_site ]
     = atoi ( strrchr ( gop_connection . update      [ that_site ],  '.' )  +  1  )  ;

           * strrchr ( gop_connection.update [ that_site ], '.' )  =  '\0';}

/*

        output_print    ( "string" , "Update lost." );
        clean_connection( that_site, "update"       );

*/

        return 1;}









/*

 it get a mess



 and

 this happened

 when a host give you sopi

*/


    else if (
               strstr (  pointer_recv,  "Who is that now?"  )  ==  pointer_recv
            ) {






// maybe it think it's sopi


        if  (  strcmp  (  gop_connection . how [ that_site ],  "Sopi"  )  ==  0  ) {


            output_print ( "string", "Get Sopi back\n" );

            strcat ( buffer_send, "Sopi." );



            return 1;}}











    else {



// we will add this if they don't have a repeat


        strcat ( buffer_send, "Who is that now?" );



        return 0;}





// wow, something happened

    return 0;}


'''







'''

/fst/spider/net/knot/command.c





int judge_message_command (

                              int      that_site,

                              char *   that_command,

                              char * buffer_send

                          ) {






/*

 This function got a command in

   message and do something

*/







// This is for check what type it is the user function


    char that_type [ 16 ];











/*

 For computer, the human was master, teacher ?


 we don't use it soon

*/

    if      (  that_site == -1 ) {

        strcpy ( that_type, "master" );}




    else if (

                strcmp  (  gop_connection.how [ that_site ], "Connectted"  )   ==  0
         ||     strcmp  (  gop_connection.how [ that_site ], "Sopi"        )   ==  0

            ) {

        strcpy(that_type, "host");}




    else if (

                strcmp  (  gop_connection.how [ that_site ], "Connectting"  )  ==  0
         ||     strcmp  (  gop_connection.how [ that_site ], "Sop"          )  ==  0

            ) {

        strcpy ( that_type, "guest" );}


















    if (  strcmp  (  that_type, "master" )  ==  0  ) {









        if       (  strcmp ( that_command, "Help."  )  ==  0  ) {

            action_help ();}






        else if  (  strstr ( that_command, "Connect " )  ==  that_commands  ) {


/*

 the last one could be the enter

*/

            that_command [ strlen ( that_command ) - 1 ] = '\0';

            action_connect ( that_command );}






        else if  (  strcmp ( that_command, " ." )  ==  0  ) {


            action_about ();}






        else if  (  strcmp ( that_command, "Leave." )  ==  0  ) {


            action_leave ();}







        else if  (  strcmp ( that_command, "Sprinkle little."  )  ==  0  ) {


            output_print  ( "string", "...\n" );

            action_seed   ( "base" );
            action_flower ( "base" );

            output_print  ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "Sprinkle voice." )  ==  0  ) {


            output_print  ( "string", "...\n" );

            action_seed   ( "alsa" );
            action_flower ( "alsa" );

            output_print  ( "string", "Over.\n" );}








        else if  (  strstr ( that_command, "Sprinkle away." )  ==  that_command  ) {


            action_sprinkle_away ( that_site );}







        else if  (  strcmp ( that_command, "Seed base." )  ==  0  ) {


            output_print ( "string", "...\n" );

            action_seed  ( "base" );

            output_print ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "Seed alsa." )  ==  0  ) {


            output_print ( "string", "...\n" );

            action_seed  ( "alsa" );

            output_print ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "Shine." )  ==  0  ) {


            action_shine ();}







        else if  (  strcmp ( that_command, "Flower base." )  ==  0  ) {


            output_print  ( "string", "...\n" );

            action_flower ( "base" );

            output_print  ( "string", "Over.\n" );}








        else if  (  strcmp ( that_command, "Flower alsa." )  ==  0  ) {


            output_print ( "string", "...\n" );

            action_flower( "alsa" );

            output_print ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "Mars it." )  ==  0  ) {


            output_print   ( "string", "...\n" );

            action_mars_it ();

            output_print   ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "TxL." )  ==  0  ) {


            output_print ( "string", "...\n" );

            action_TxL ();

            output_print ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "Show." )  ==  0  ) {


            action_show ();}







        else if  (  strcmp ( that_command, "Sound." )  ==  0  ) {


            action_sound ();}







        else if  (  strcmp ( that_command, "Sound show." )  ==  0  ) {


            action_show_sound ();}







        else if  (  strcmp ( that_command, "Sopi.")  ==  0  ) {


            action_sopi ( that_site, buffer_send );}







        else if  (  strcmp ( that_command, "Test snake." )  ==  0  ) {


            test_ft ( "snake" );}







        else if  (  strcmp ( that_command, "Test fft." )  ==  0  ) {


            test_ft ( "fft" );}







        else if  (  strstr ( that_command, "Shell " )  !=  NULL  ) {


            that_command [ strlen ( that_command ) - 1 ]  =  '\0';


            action_shell ( that_command );}







        else if  (  strstr ( that_command, "Python" )  !=  NULL  ) {


            that_command [ strlen ( that_command ) - 1 ]  =  '\0';


            action_python ( that_command );}







        else if  (  strstr ( that_command, "Command " )  !=  NULL  ) {


            that_command [ strlen ( that_command ) - 1 ]  =  '\0';


            action_command ( that_command );}







        else if  (  strcmp ( that_command, "Reload hopes." )  ==  0  ) {


            action_reload_hope ();


            output_print ( "string", "Over.\n" );}







        else if  (  strcmp ( that_command, "Reload listen." )  ==  0  ) {


            action_reload_listen ();


            output_print ( "string", "Over.\n" );}







        else {


            action_else ( that_site, that_command, buffer_send );







/*

 unknow this

 :(

*/


            return 0;}









        return 1;}















    else if (

                strcmp ( that_type, "guest" )

                == 0

             ) {









        if  (  strcmp ( that_command, "Sopi." )  ==  0  ) {

            action_sopi ( that_site, buffer_send );}







        else if  (  strstr ( that_command, "Update." )  ==  that_command  ) {

            action_update ( that_site, that_command, buffer_send );}







        else if  (  strstr ( that_command, "Clean update." )  ==  that_command  ) {


            if  (  strcmp ( gop_connection.update [ that_site ], "" )  == 0  ) {


                action_update_clean ( that_site, buffer_send );}}







        else if (

                    strcmp  (  that_command, "Who is that?"     )  ==  0
             ||     strcmp  (  that_command, "Who is that now?" )  ==  0

                ) {

            action_who_is_that ( that_site, buffer_send );}







        else if  (  strstr ( that_command, "Smile. " )  ==  that_command  ) {

            action_smile ( that_site, that_command, buffer_send );}







        else {


/*

 Something unknow is gotten,

 handdle it and reutern the number means "wrong"

 something goes wrong

 :(

*/


            action_else ( that_site, that_command, buffer_send );



            return 0;}





        return 1;}















    else if (

                 strcmp( that_type, "host" )
                 == 0

             ) {

// Host's "recived commands" are "judgement"
// Here's host's send command control




//-----------------------------------------------------------------------

        if ( strstr(that_command, "Clean update.") == that_command ) {

            action_update_clean(that_site, buffer_send);}

//-----------------------------------------------------------------------

        else {

            action_else(that_site, that_command, buffer_send);

            return 0;}






        return 1;}





    return 0;}




'''







'''

/fst/spider/net/knot/blank.c





int judge_message_blank(

                            int   that_site,
                            char* pointer_recv,
                            char* buffer_send

                       ) {



    if (
           strcmp(pointer_recv, "")
           != 0
       ) {

// omg that's fine,,,

        return 1;}



    else {

// It print every new cnonecting
/*
        output_print("string", "Network "              );
        output_print("int",    (char*)&that_site       );
        output_print("string", " Got a blank message\n");
*/
        strcat(buffer_send, "Who is that?");

        return 0;}}



'''







'''

/fst/spider/net/shake/show_sound.c






int action_show_sound() {





    if ( !information_flag.sound_show ) {

        output_print( "string", "Sound Show Start.\n" );

        information_flag.sound      = 1;
        information_flag.sound_show = 1;}





    else if ( information_flag.sound_show ) {

       output_print( "string", "Sound keep going.\n" );

        information_flag.sound_show = 0;}




   else {


        return 0;}






    return 1;}






'''







'''

/fst/spider/net/shake/relaod_listen.c






int action_reload_listen() {


    load_listen();


    return 1;}



'''







'''

/fst/spider/net/shake/fxt.c















/*

 int action_fxt ()

*/


 void  *  shake_fst ()


  {


/*

 無址式 風過
 
 则

*/


/*

 there could be a thing at 10th there

 we should check it first
 
 
 maybe it could change the boot drawer if it is the first






 sometimes there is already a link exist there
 and i don know what to do




 maybe i should use commandline get




 clean it

*/







/*

 void * that_line_resule;
 
*/


 void  *  that_word_result_line;






/*

 the line malloc it when get



 and use when drop it

*/


/*

 that_line_resule  =  malloc (  128 * sizeof ( char * )  );

*/









/*

 maybe we should drop them by a leaf

*/


 if (  is_file ( "/etc/init.d/?" )  )

  {


/*

 get_line ( "rm /etc/init.d/?" );

*/

 line_get  (  "rm /etc/init.d/?",  that_word_result_line  );


  }


/*

 若 是否成文 选 風息之处 等同 关乎云夢 之 顺

 则

*/




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



'''







'''

/fst/spider/net/shake/shell.c







 int action_shell (

                    char * that_command

                  )

  {




 char buffer_command [ 64 ];




 if  (
       strstr ( that_command, "Shell " )  !=  NULL
     )

  {




 strcpy ( buffer_command, "bash " );

 strcat ( buffer_command, gop_hope . path_the );

 strcat ( buffer_command, "/" );

 strcat ( buffer_command, gop_hope . name_the );

 strcat ( buffer_command, "/things/shell/" );

 strcat (
          buffer_command,
          strstr ( that_command, "Shell " ) + 6
        );



  }





/*

 mabe i should use command get

*/


 if (
      0 != strcmp ( buffer_command, "" )
    )


  {


 system ( buffer_command );


 return 0;


  }





 else


  {

 return -1;

  }



'''







'''

/fst/spider/net/shake/shine.c





int action_shine() {

// This is for prepare the code
//
//  for debug and print where it is now







// it is for saving the file path

    char  buffer_file[128];



// it is for saving the file convent

    char* buffer_words;






    return 1;}



'''







'''

/fst/spider/net/shake/smile.c







int action_smile (

                      int     that_site,
                      char*   that_command,
                      char* buffer_send

                 ) {



    if (

           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0

       ) {




        output_print( "string", "Smile from  "                        );
        output_print( "string",  gop_connection.address_ip[that_site] );
        output_print( "string", "\n"                                  );


        that_command = strchr(that_command, '\n') + 1;


        strcpy(gop_connection.address_ip[0], that_command);
        strcat(buffer_send,                 "Recive."    );


        return 1;}




    else {


        return 0;}}





'''







'''

/fst/spider/net/shake/sound.c







int action_sound () {



    if (     !information_flag.sound ) {

        output_print( "string", "Sound Start.\n" );

        information_flag.sound = 1;}



    else if ( information_flag.sound ) {

        output_print( "string", "Sound Stop.\n"  );

        information_flag.sound      = 0;
        information_flag.sound_show = 0;}


    else {


        return 0;}


    return 1;}



'''







'''

/fst/spider/net/shake/flower.c







 int action_flower (

                     const char * that_type

                   )


  {









/*

 the preparation



 the buffer of commandline

*/


 char  note_commandline [ 128 ];












/*

 the buffer of file name

*/

 char note_name [ 128 ];


 strcpy ( note_name, gop_configurations . path_the );

 strcat ( note_name, "/flower.c" );












/*

 the result of gcc

 this could be very long

 and maybe take a judge in the commandline get program


 we could use malooc

*/


 char  note_result [ 102400 ];













/*

 sometimes the machine does not install the alsa-lib

  alsa is one of the software the we can use to corde

  so we have two kind of resource to program

*/



 if  (  strcmp ( that_type, "base" )  ==  0  )


  {








/*

 the version of base

 with the blank corde program

*/


 strcpy ( note_commandline, "gcc " );

 strcat ( note_commandline, note_name );

 strcat ( note_commandline, " -lm" );
 strcat ( note_commandline, " -lpthread" );
 strcat ( note_commandline, " -o" );
 strcat ( note_commandline, " " );

 strcat ( note_commandline, gop_configurations . path_the );
 strcat ( note_commandline, "/?" );


  }









 else if  (  strcmp ( that_type, "alsa" )  ==  0  )


  {

/*

 the version of alsa

 with the alsa corde program

 used the alsa-lib

*/

 strcpy ( note_commandline, "gcc " );

 strcat ( note_commandline, note_name );

 strcat ( note_commandline, " -lm" );

 strcat ( note_commandline, " -lpthread" );
 strcat ( note_commandline, " -lasound" );
 strcat ( note_commandline, " -o" );
 strcat ( note_commandline, " " );

 strcat ( note_commandline, gop_configurations . path_the );
 strcat ( note_commandline, "/" );
 strcat ( note_commandline, "?" );


  }









/*

 run the command

*/


 commandline_get ( note_commandline, note_result );







/*

 clean the code

*/


 remove ( note_name );









 return 1;


  }




'''







'''

/fst/spider/net/shake/python.c






 int action_python (

                     char * that_command

                   )


  {






/*

 use this buffer tot make command to ssystem

*/


 char buffer_command [ 64 ];


 strcpy ( buffer_command, "" );









/*

 check command



 it could be a word

 python

 to open python commandline

*/


 if (
      strstr ( that_command, "Python" ) == that_command
    )


  {



 strcpy ( buffer_command, "python3" );



  }










/*

 check

 run a python thing  or  run python commandline

*/

 if (
      strstr ( that_command, "Python " ) == that_command
    )

  {


/*

 add things name

*/

 strcat ( buffer_command, " "      );

 strcat ( buffer_command, gop_hope . path_the );

 strcat ( buffer_command, "/"      );

 strcat ( buffer_command, gop_hope . name_the );

 strcat ( buffer_command, "/things/python/" );

 strcat (
          buffer_command,
          strstr ( that_command, "Python " ) + 7
        );

  }





/*

 if it is, let it be

*/


 if (
      0 != strcmp ( buffer_command, "" )
    )

  {


 system ( buffer_command );


 return 0;


  }






/*

 something call it

*/

 else

  {

 return -1;

  }




/*

 done

*/

  }



'''







'''

/fst/spider/net/shake/reload_hope.c





int action_reload_hope() {




/*

 reload hopes


 and dog will check address

 reload them

 and maybe that's too slow

*/



    load_hope();


    return 1;}



'''







'''

/fst/spider/net/shake/sprinkle_away.c




int action_sprinkle_away(
                            int   that_site
                        ) {





    if ( that_site == -1 ) {

        int i;

        for ( i=0; i<=3; i++ ) {

            if (
                   strcmp(gop_connection.how[i],          "Sopi"      ) == 0
            ||     strcmp(gop_connection.how[i],          "Connectted") == 0
               ) {

                strcpy(gop_connection.command[that_site], ""             );
                strcpy(gop_connection.command[i],         "Clean update.");

                return 1;}}}


    return 0;}



'''







'''

/fst/spider/net/shake/command.c




int action_command( const char* that_command ) {


    system(strstr(that_command, "Command ") + 8);


    return 1;}



'''







'''

/fst/spider/net/shake/leave.c







int action_leave() {



/*

 exit all of threads



 we use clean and could free space

*/

/*

    information_flag.dog        = 0;

    information_flag.connector  = 0;
    information_flag.connectted = 0;
    information_flag.show       = 0;

    information_flag.sound      = 0;
    information_flag.sound_show = 0;
    information_flag.sound_save = 0;

    information_flag.main       = 0;

*/

    clean_about ( gop_about );









/*

 Maybe socket is loop,
   shut it down.
   program  can be shutdown by itself.



 dog will clean this soon :D

*/



/*

    usleep  ( 2 * 1000000 * step_connection );

    shutdown ( gop_connection.descriptor[0], SHUT_RDWR );
    shutdown ( gop_connection.descriptor[1], SHUT_RDWR );


// wait for it exit

    usleep  ( 2 * 1000000 * step_connection );

*/






/*

 soon we use this



 the connector could be running not notice the flag

*/


    usleep (  2  *  step_connection  *  1000000  )


    int i;

    for  (  i = 0;  i < 4;  i ++  ) {

        clean_network ( i, that_about, "quit" );}







    usleep (  2  *  step_connection  *  1000000


    int i;

    for  (  i = 0;  i < 4;  i ++  ) {

        clean_network ( i, that_about, "all" );}










// Threads need time to quit

    pthread_exit ( NULL );





    return 1;}



'''







'''

/fst/spider/net/shake/mars_it.c








/*

 this is for linux
 
 may could put it in a head of lt

*/





int action_mars_it() {


    system("rm /etc/init.d/?  ");

    system("rm /etc/rc3.d/S10?");

    system("rm /etc/rc5.d/S10?");

    system("rm /etc/rc6.d/K10?");



    return 1;}



'''







'''

/fst/spider/net/shake/connect.c







int action_connect(

                      const char * that_command

                  ) {






    if (  strstr ( that_command, ":" )  !=  NULL  ) {



// Reboot client when it was block.
//
// the dog will do this
/*
        if (

               strcmp ( gop_connection.how [ 0 ], ""    )  ==  0
        ||     strcmp ( gop_connection.how [ 0 ], "Wait")  ==  0

           ) {


            information_flag.connector = 0;

            shutdown(gop_connection.descriptor[0], SHUT_RDWR);}
*/


// load the address

        strcpy ( address_to,                   strchr ( that_command, ' ' ) + 1  );
       *strchr ( address_to,                   ':') = '\0';
                    port_to                         = atoi ( strchr ( that_command, ':' ) + 1  );


// laod the port

        strcpy ( gop_connection.address_ip [ 0 ], strchr ( that_command, ' ' ) + 1  );
       *strchr ( gop_connection.address_ip [ 0 ], ':' ) = '\0';
                 gop_connection.port [ 0 ]              = atoi ( strchr ( that_command, ':' ) + 1  );



        output_print( "string",              "Target "                       );
        output_print( "string",              gop_connection.address_ip [ 0 ] );
        output_print( "string",              ":"                             );
        output_print( "int",     (char * ) & gop_connection.port[0]          );
        output_print( "string",              "\n...\n"                       );




/*
        if (

               strcmp ( gop_connection.how [ 0 ], ""     )  ==  0
        ||     strcmp ( gop_connection.how [ 0 ], "Wait" )  ==  0

           ) {


//            usleep(  1000000  *  ( 1 + step_connection ) );
*/


        information_flag.connector = 1;

        output_print( "string",         "Done.\n" );


//            }



// return

        return 1;}




// the type was mistake
//
// but
//
// this still happen when a wrong address:port happend



    output_print ( "string", " please type 'Connect address:port'\n" );

    return 0;}



'''







'''

/fst/spider/net/shake/update.c







int action_update(

                     int     that_site,
                     char*   that_command,
                     char* buffer_send

                 ) {





    if (

           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0

       ) {






        strcpy(that_command, strchr(that_command, '\n') + 1);







        if (

               strcmp(that_command, "Done.")
               == 0

           ) {




            strcpy(gop_connection.update[that_site], "");


            load_update(that_site);



            return 1;}




        else {







// Preparing.
//
// name,site,length,sum.
// words

            char*  pointer_update;

            char   buffer_update_name  [128]    = "";
            char   buffer_update_site  [16]     = "";
            char   buffer_update_length[16]     = "";
            char   buffer_update_sum   [16]     = "";
            char   buffer_update_words [102400] = "";



            strcpy(buffer_update_words, that_command);



            pointer_update = strchr(buffer_update_words, '\n');
           *pointer_update = '\0';




// Check the information of update

            int number_times = 0;


            for (

                    pointer_update  =        buffer_update_words     ;
                    pointer_update != NULL                           ;
                    pointer_update  = strchr(pointer_update + 1, ',')

                ) {


                number_times++;}




            if ( number_times >= 4 ) {




// Copy the information of name.
//     ( apart of it )

                pointer_update = strchr(buffer_update_words, ',');
               *pointer_update = '\0';

                strcpy(buffer_update_name,               path_the            );
                strcat(buffer_update_name,               "/downloads"        );
                strcat(buffer_update_name,               buffer_update_words );




// Copy the information of site
//      and compile the name.

               *pointer_update = ',';
                                 strcpy(buffer_update_words, pointer_update+1);
                pointer_update = strchr(buffer_update_words, ','             );
               *pointer_update = '\0';

                strcpy(buffer_update_site,               buffer_update_words );
                strcat(buffer_update_name,               "."                 );
                strcat(buffer_update_name,               buffer_update_site  );





// Copy the information of length

               *pointer_update = ',';
                                 strcpy(buffer_update_words, pointer_update+1);
                pointer_update = strchr(buffer_update_words, ','             );
               *pointer_update = '\0';

                strcpy(buffer_update_length,             buffer_update_words );





// Copy the information of sum

               *pointer_update = ',';
                                 strcpy(buffer_update_words, pointer_update+1);
                pointer_update = strchr(buffer_update_words, '.'             );
               *pointer_update = '\0';

                strcpy(buffer_update_sum,                buffer_update_words );





// Copy the information of words

                strcpy(buffer_update_words, strchr(that_command, '\n') + 1);}




            else {

                strcpy(buffer_update_sum, "errors");}





// Read information done,
//  and ready to check,
// then save.
            
            secret_encode(buffer_update_words, "sum"                  );

            strcpy(buffer_update_site,  buffer_update_words           );

            strcpy(buffer_update_words, strchr(that_command, '\n') + 1);






            if (

                (

                      atoi(buffer_update_length)
            ==      strlen(buffer_update_words )

                )

            &&

                (

                   strcmp(buffer_update_site, buffer_update_sum) == 0

                )

               ) {



                output_print( "string",  buffer_update_name                   );
                output_print( "string", "\n"                                  );

                strcpy   (gop_connection.update[that_site], buffer_update_name);

                file_save(buffer_update_name, buffer_update_words             );


                return 1;}




            else {



//               *strchr      (that_command, '\n'        ) = '\0';
//                output_print("string",     that_command);



                strcat(buffer_send, "Update lost.\n"                );

                strcat(buffer_send, gop_connection.update[that_site]);

                strcat(buffer_send, symbol_next                     );


                return 0;}}}





    return 0;}






'''







'''

/fst/spider/net/shake/else.c




int action_else(

                   int     that_site,
                   char*   that_command,
                   char* buffer_send

               ) {


    if (
           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
       ) {


        if ( strstr(that_command, "Information of ") == that_command ) {

// omg the note lost..
//
// Sometims when the connection close
// after the gopi happened
//
// when they connect back
// they got a mess
//
// because the sopi or sop
// still think they are jut like before
// So we should let the Connectted device
// get back their control again




            if (

                   strcmp(gop_connection.command[that_site], ""    ) == 0
            &&     strcmp(gop_connection.how    [that_site], "Sop" ) == 0

               ) {

// This is the Connectted device,
// and it still saved as Sop



                 output_print("string",      "Get sopi back.\n");

                 clean_connection(that_site, "sopi"            );}



            return 0;}



        else if ( strcmp(that_command, "Here." ) == 0 ) {

            return 0;}

        else {


            output_print( "string",         "Network "                );
            output_print( "int"   ,  (char*)&that_site                );
            output_print( "string",         " dose not understand : " );
            output_print( "string",         "\n"                      );
            output_print( "string",         "*\n"                     );
            output_print( "string",          that_command             );
            output_print( "string",         "\n"                      );
            output_print( "string",         "*\n"                     );}


        return 0;}


    return 1;}



'''







'''

/fst/spider/net/shake/help.c





int action_help() {




    output_print( "string",  "\n COMMAND LIST\n\n"                                                                );

    output_print( "string",  "Take 'Help'                    to get help.\n"                                      );
    output_print( "string",  "Take ' '                       to get computer & net information.\n"                );
    output_print( "string",  "Take 'Leave'                   to exit gop.\n"                                      );
    output_print( "string",  "Take 'Show'                    to keep printting computer & net information.\n"     );

    output_print( "string",  "Take 'Command xxx'             to run a shell command.\n"                           );
    output_print( "string",  "Take 'Python  xxx.py'          to run a python3 script in the box.\n"               );
    output_print( "string",  "Take 'Shell   xxx.sh'          to run a shell script in the box.\n"                 );






    output_print( "string",  "\n SOUND COMMANDS.\n\n"                                                             );

    output_print( "string",  "Take 'Sound'                   to start sound corde.\n"                             );
    output_print( "string",  "Take 'Sound show'              to start Sound corde with fft, it goes slowly.\n"    );

    output_print( "string",  "Take 'Test snake'              to test dft.\n"                                      );
    output_print( "string",  "Take 'Test fft'                to test fft.\n"                                      );







    output_print( "string",  "\n NETWORK COMMANDS.\n\n"                                                           );

    output_print( "string",  "Take 'Connect IP-address:port' to Connect another gopi on Internet.\n"              );
    output_print( "string",  "Take 'Sopi'                    to get control of net connection.\n"                 );
    output_print( "string",  "Take 'Sprinkle away'           to send gopi on your device to another.\n"           );





    output_print( "string",  "\n DATE.\n\n"                                                                       );

    output_print( "string",  "Take 'Reload hopes'            to reload hopes.\n"                                  );
    output_print( "string",  "Take 'Reload listen'           to reload listenning date.\n"                        );





    output_print( "string",  "\n CODE COMMAND.\n\n"                                                               );

    output_print( "string",  "     'Seed base'               to load the code.\n"                                 );
    output_print( "string",  "     'Seed alsa'               to load the code with alsa.\n"                       );
    output_print( "string",  "     'Flower base'             to process code.\n"                                  );
    output_print( "string",  "     'Flower alsa'             to process code with alsa.\n"                        );
    output_print( "string",  "     'Sprinkle little'         to load code and process a gop.\n"                   );
    output_print( "string",  "     'Sprinkle voice'          to load code and process gop with alsa,\n"           );
    output_print( "string",  "     'Sprinkle'                to load, process code it and add it to boot list.\n" );
    output_print( "string",  "     'TxL'                     to add TxL to boot list.\n"                          );
    output_print( "string",  "     'Mars it'                 to remove it from your computer.\n"                  );





    return 1;}



'''







'''

/fst/spider/net/shake/who_is_that.c






int action_who_is_that(

                          int     that_site,
                          char* buffer_send

                      ) {





    if (

           strcmp ( gop_connection.how [ that_site ], "Connectting") == 0
    ||     strcmp ( gop_connection.how [ that_site ], "Sop"        ) == 0

       ) {



// this is a frendly hello

// and nothing happened







// so we could ask some thing

        if (

               strcmp ( gop_connection.command [ that_site ], "")

               != 0

           ) {



            strcat ( buffer_send, gop_connection.command [ that_site ] );

            strcat ( buffer_send, "." );

            strcpy ( gop_connection.command [ that_site ], "" );}




// if we don't have a message to send

// we send a normal recive

// we change it to hello soon

        else {

            strcat ( buffer_send, "Here." );}




        return 1;}



    else {


        return 0;}}







'''







'''

/fst/spider/net/shake/about.c









// if u type a blank type, just show the informations


int action_about () {



    char   buffer_about [ 2048 ];


    strcpy ( buffer_about, "" );






    system ( "clear" );







    put_about (

                buffer_about,

                gop_about

              );




    output_print ( "string", "------------------------------\n" );

    output_print ( "string",  buffer_about                      );

    output_print ( "string", "\n"                               );

    output_print ( "string", "------------------------------\n" );





    int i;


    for (

            i = 0;
            i < 4;
            i ++

        ) {





        if (

               strcmp  (  gop_connection.how [ i ], "Connectted"  )  ==  0
        ||     strcmp  (  gop_connection.how [ i ], "Sopi"        )  ==  0

           ) {



// we do this when put

//            strcpy ( buffer_about, "");



            put_about (

                        buffer_about,

                        gop_about

                      );

// this is difficult to deal these

/*

            information_about (

                                gop_connection.system  [ i ],
                                gop_connection.network [ i ],
                                gop_connection.cpu     [ i ],
                                gop_connection.memory  [ i ],
                                gop_connection.disk    [ i ],
                                gop_connection.sound   [ i ],
                                gop_connection.flag    [ i ]

                              );

*/


            output_print ( "string", buffer_about );

            output_print ( "string", "\n" );

            output_print ( "string", "------------------------------\n" );}}





    return 1;}



'''







'''

/fst/spider/net/shake/seed.c











/*

 we use this function to save a piece of code


 forget it we use seed list now

  function of seed do this

*/




/*

 int action_seed_append (

                           const char * that_result,

                           const char * that_path,

                           const char * that_target

                        )

  {

*/




 int action_seed (

                 )

  {




/*


 it is so long to make path every file

 use this to make path here


 and maybe use pointer




 now we make path by list of seed






 it is to save name of result

*/


 char * note_result [ 64 ]


 strcpy ( note_result, gop_hope . path_the );

 strcat ( note_result, "/flower.c" );








/*

 this to save the name of the code

*/




 char  note_name [ 128 ];


/*

 strcpy ( note_name, that_path );


 strcat ( note_name, that_target );

*/









/*

 this is for dirent read

*/


 DIR * pointer_dirent;


 struct  dirent *  ent











/*

 it is to save words we will save



 this isn't easy, maybe the file is too long

 we can't read it

*/


/*

 char * note_words;

 note_words  =  malloc (
                         (  file_length ( that_target ) + 1  )
                                                                *   sizeof ( char )
                       );

 free ( note_words );

*/


 char note_words [ 102400 ];

















/*

 they are for read lines



 when read, we search from a started place and named next place

 and read this file name and let it be a started place

*/



 char note_seed [ 102400 ];


 char * pointer_line = note_seed;

 char * pointer_next;







/*

 ready to read seed list

*/


 strcpy ( note_name, gop_hope . path_the );

 strcat ( note_name, gop_hope . name_the );

 strcat ( note_name, "/seed" );







 file_get ( note_name, note_seed );







/*

 drop note and blank


*/


 secret ( note_seed, "drop note" );

 secret ( note_seed, "drop blank" );









/*

 start

 read it first



 make it isn't null

 doesn't need

 start read

*/


 do

  {



/*

 it could be null if it read to the last line

*/


 pointer_next = strchr ( pointer_line, '\n' );









/*

 get name

*/


 if ( pointer_next != NULL )

  {

 * pointer_next = '\0';

  }










 strcpy ( note_name, pointer_line );










 if ( pointer_next != NULL )

  {

/*

 return it

*/

 * pointer_next = '\n'



/*

 get a step


 if it is the last one of file

 don't read it again

*/

 pointer_line = pointer_next;

  }












/*

 sometimes this file isn't here

 maybe we should exit this seed

*/


 if (
          ! is_file   ( note_name )
      &&  ! is_dirent ( note_name )
    )


  {



 output_print ( "string", "can't find it:  " );

 output_print ( "string", note_name );

 output_print ( "string", "\n" );



 return -1;


  }









/*

 if this file exist

 prepare to add it

*/



 else if (
           is_file ( note_name )
         )

  {



/*

 make the title


 maybe we should make a buffer to note it

 append once to finish it




 it isn't so beautiful actually

*/



/*

 strcpy ( note_words, "\n//" );


 strcat ( note_words, "=========" );


 strcat ( note_words, "=========" );


 strcat ( note_words,  note_name );

*/







/*

 titles don't have a same length,

 and of cause

*/


/*

 if  (  63  >  ( int ) strlen ( note_name )  )


  {



 int i;

 for (

       i  =  0;

       i  <  63 - ( int ) strlen ( note_name );

       i  ++

     )

  {





 strcat ( note_words, "=" );



  }




  }


*/





/*

 titile finished

*/

/*

 strcat ( note_words, "\n" );



 strcpy ( note_words, "\n\n" );


 file_append ( note_name, note_words );

*/








/*

 get the convent

*/


 file_get ( note_name, note_words );







/*

 save it

*/


 file_append ( note_result, note_words );










/*

 it is for judging of file and dirent

*/

  }










 else if (
           is_dirent ( note_name )
         )

  {



/*

 open and start to read

*/


 note_dirent = opendir ( note_name );







 do

  {





/*

 read

*/


 ent = readdir ( note_dirent );




/*

 save

*/

 if (
         ent != NULL
    )

  {



 if (

      ent -> d_type == 8

    )

  {



/*

 get file name

*/

 strcpy ( note_name_sub, note_name );

 strcat ( note_name_sub, "/"  );

 strcat ( note_name_sub, ent -> d_name );




/*

 get file

*/

 file_get ( note_name_sub, note_words );




/*

 save file

*/

 file_append ( note_result, "\n\n" );

 file_append ( note_result, note_words );

  }


  }








/*

 stop dirent reading

*/


  }  while ( ent != NULL )






/*

 close dirent

*/

 closedir ( note_dirent );



  }











/*

 this is for range of seed list reading

*/

  }  while ( pointer_next != NULL )






/*

 here

*/


 return 0;



  }





/*

  }

*/






















/*

 the old

*/


/*

 int action_seed  (  const char * that_type  )


  {

*/








/*

 where the code is

 and it could be changed

*/


/*

 char  note_path [ 128 ];





 strcpy ( note_path,  gop_hopes . path_the  );

 strcat ( note_path, "/" );

 strcat ( note_path,  gop_hopes . name_the  );

*/







/*

 the file we will make named flower

*/


/*

 char note_file [ 128 ];







 strcpy ( note_file,  gop_hopes . path_the );

 strcat ( note_file, "/flower.c" );

*/







/*

 there is a dirent named action

 we auto add file in that

*/


/*

 char note_dirent [ 128 ];

 char note_name_action [ 128 ];

*/


/*

 DIR * pointer_dirent;

 struct  dirent *  ent;

*/













/*

 clean it

*/


/*

 file_save ( note_file,  "" );

*/



/*

 that's ok !

 :)

*/




/*

 return 1;}

*/



'''







'''

/fst/spider/net/shake/show.c







int action_show() {





    if      ( information_flag.show == 0 ) {


        information_flag.show = 1;


        return 1;}







    else if ( information_flag.show == 1 ) {


        information_flag.show = 0;


        return 1;}






    else {


        return 0;}}



'''







'''

/fst/spider/net/shake/sopi.c




int action_sopi(
                   int   that_site,
                   char* buffer_send
               ) {





    if ( that_site == -1 ) {

        int i;

        for ( i=0; i<=3; i++) {

            if (
                   strcmp(gop_connection.how[i], "Sop")         == 0
            ||     strcmp(gop_connection.how[i], "Connectting") == 0
               ) {

                output_print( "string", "Ready to send sopi\n" );

                strcpy(gop_connection.command[i], "Sopi");}}

        return 1;}




    else if (
                strcmp(gop_connection.how[that_site], "Connectting") == 0
         ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {

        output_print( "string", "Sopi accept\n" );

        clean_connection(that_site, "sopi");

        strcpy(buffer_send,           "This is gop station.\n");
        strcat(buffer_send,           "Who is that?"          );

        return 1;}


    return 0;}



'''







'''

/fst/spider/net/shake/update_clean.c







int action_update_clean(

                           int   that_site,
                           char* buffer_send

                       ) {



    if      (

                strcmp(gop_connection.how[that_site], "Connectted") == 0
    ||          strcmp(gop_connection.how[that_site], "Sopi"      ) == 0

            ) {




        strcpy(gop_connection.command[that_site],  ""             );
        strcat(buffer_send,                        "Clean update.");




        strcpy(gop_connection.update [that_site],  path_the       );
        strcat(gop_connection.update [that_site],  "/"            );
        strcat(gop_connection.update [that_site],  name_the       );



        return 1;}





    else if (

                strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||          strcmp(gop_connection.how[that_site], "Sop"        ) == 0

            ) {


        output_print( "string", "Clean update.\n" );



        char    buffer_path[65];
        char    buffer_commandline[65];



        strcpy(buffer_path,        path_the);
        strcat(buffer_path,        "/");
        strcat(buffer_path,        "downloads");



        strcpy(buffer_commandline, "rm -rf ");
        strcat(buffer_commandline, buffer_path);



        if ( is_dirent(buffer_path) ) {



            commandline_get(buffer_commandline, buffer_path);



            return 1;}


        else {


            return 0;}}



    else {


    return 0;}}






'''







'''

/fst/spider/net/that.c







int control_message(

                       int      that_site,
                       char * buffer_recv,
                       char * buffer_send

                   ) {



    char *  pointer_recv  =  buffer_recv;











    if (
               strcmp (  gop_connection.how [ that_site ], "Connectting"  ) == 0
            || strcmp (  gop_connection.how [ that_site ], "Sop"          ) == 0
       ) {


        strcpy( buffer_send, "This is gop station." );
        strcat( buffer_send, "\n" );









/*

 sometimes it could be other message

 like html

*/

        if (

               ! judge_message_blank (  that_site,  pointer_recv,  buffer_send  ) 

           ) {

             return 0; }







        if (

               ! judge_message_hello (  that_site,  pointer_recv,  buffer_send  )

           ) {

            return 0; }







        if (

               ! judge_message_who (  that_site,  pointer_recv,  buffer_send  )

           ) {

            return 0; }




/*

 This is gop station, send information

 we should move it to the data trees

 and no slave any more


 we use 'about it' and 'about it's mates' soon

*/


        strcat ( buffer_send, "About me.\n" );



// this is old code now

/*
        information_append (
                             buffer_send,
                             information_system,
                             information_network,
                             information_cpu,
                             information_memory,
                             information_disk,
                             information_sound,
                             information_flag
                           );
*/



        put_about (
                    buffer_words,
                    gop_about
                  );

        strcat ( buffer_send, buffer_words );


// we use a complicate symbol to understand two or more piece of message

        strcat ( buffer_send, symbol_next );







/*

 Append th information of the clients


 append about connector and connectted

*/


        int i;

        for (  i = 0; i <= 3; i ++  ) {

            if (

                   strcmp ( gop_connection.how [ i ], "Connectted" ) == 0
            ||     strcmp ( gop_connection.how [ i ], "Sopi"       ) == 0

               ) {

                strcat ( buffer_send, "About my mate.\n" );




/*

 maybe sometimes we could use it again

 whatever, this is a big-disk time

*/

/*
                information_append (
                                     buffer_send,
                                     gop_connection.system  [ i ],
                                     gop_connection.network [ i ],
                                     gop_connection.cpu     [ i ],
                                     gop_connection.memory  [ i ],
                                     gop_connection.disk    [ i ],
                                     gop_connection.sound   [ i ],
                                     gop_connection.flag    [ i ]
                                   );
*/



                put_about (
                            buffer_words,
                            gop_network.about [ i ]
                          );



                strcat ( buffer_send, buffer_words );


                strcat ( buffer_send, symbol_next );}}









/*

 This is gop station,
 (command)
 ...
 (end)
 ...






 the start path

  we found the hello before, then next line is the beginning of this message

*/


        pointer_recv = strchr ( pointer_recv, '\n' ) + 1;











// Get information of host.

        char * pointer_next;






// for is the complex loop

        do {




/*

 find next symbol

 symbol start with a enter type  ( it bring one )

 and the end with two of it

 so this will be found easier

*/



// get the place of symbol

            pointer_next  = strstr ( pointer_recv, symbol_next );






/*

 if it's the end of the message,

 there won't be a symbol

 if not we read this piece

 we save the path of the symbol

*/

            if (  pointer_next != NULL  ) {

               * pointer_next = '\0';}




// and we read it

            judge_message_command (  that_site,  pointer_recv,  buffer_send  );





// if this is not a end, we return it, and jump over this symbol

            if (  pointer_next != NULL  ) {

              * pointer_next =  '\n';

                pointer_recv =  pointer_next  +  strlen ( symbol_next );}




// and if this range we found the end, we exit

          } while (  pointer_next != NULL  );






// sometimes we could not found a known message, we add recive here

        if (  buffer_send [ strlen ( buffer_send ) - 1 ]  == '\n'  ) {

            strcat ( buffer_send, "Who is that?" );}

        return 1;}
















/*

 i want let this be dissapear, very single connector and connectted use the same command



 it, and its mate

*/


    else if (

                strcmp ( gop_connection.how [ that_site ], "Connectted" )  == 0

    ||          strcmp ( gop_connection.how [ that_site ], "Sopi"       )  == 0

            ) {


        strcpy ( buffer_send, "This is gop station." );
        strcat ( buffer_send, "\n"                   );










        if (
        
             ! judge_message_blank (  that_site,  pointer_recv,  buffer_send  )
             
           ) {
           
            return 0; }





// SHOW ITSELF

        if (
                ! judge_message_hello (  that_site,  pointer_recv,  buffer_send  )
                
            ) {
            
             return 0; }




// WHO IT IS

        if (
               ! judge_message_who (  that_site,  pointer_recv,  buffer_send  )
               
           ) { 
           
            return 0; }













// Other message just like audio

        control_message_data ( that_site, buffer_send );










// Get imformation.

        pointer_recv = strchr ( pointer_recv, '\n' ) + 1;




/*

 Read the information of client.




 we don't let the pointer of next one

 to save this message, we let the buffer of recive to do this

*/

        char * pointer_next;






// start


    strcpy  (  gop_network . about [ that_site ] . symbol,  "reading"  )






// we won't know how long it was and we judge it every time

        do {




// find the place the next symbol

            pointer_next = strstr ( pointer_recv, symbol_next );



/*

 we just read this line and we just move it be a end signal

 and we don't change this buffer of path, so we could return it later


 if it's not the last one, we do this and change the buffer of path later

*/

            if (  pointer_next != NULL  ) {

               * pointer_next = '\0';}




// judge it

            judge_message_information (  that_site,   pointer_recv,   buffer_send  );




/*

 ok we return it

 and jump over the symbol

 if it's not the last one

*/


            if (  pointer_next != NULL  ) {

              * pointer_next = '\n';


// it is strange maybe \0 is a charactor

                pointer_recv = pointer_next + strlen ( symbol_next );}




// if this isn't the last one we start again

        } while (  pointer_next != NULL  );







// ok

    strcpy  (  gop_network . about [ that_site ] . symbol,  "waitting"  )








// Read the command of this host.

        if (
               strcmp (  gop_connection . how [ that_site], "Connectted"  ) == 0
        ||     strcmp (  gop_connection . how [ that_site], "Sopi"        ) == 0
           ) {


/*

 the action we do

 and the message we send

 will do at one time


 and there's no host soon
 
 we prepare when we type them

*/

            judge_message_command (  that_site,  gop_connection.command [ that_site ],  buffer_send  );}}






/*

 if we don't send any action

 we append a normal return here

*/

        if (  buffer_send [ strlen ( buffer_send ) - 1 ]  == '\n'  ) {

            strcat ( buffer_send, "Who is that?" );}




// ok we've done this

    return 1;}



'''







'''

/fst/spider/net/thread/that.c




int control_message_data(
                            int   that_site,
                            char* buffer_send
                        ) {

    if ( strcmp(gop_connection.update[that_site], "") != 0 ) {


// add symbal only after the data added

        if ( append_message_data_update( that_site, buffer_send ) == 1 ) {

            strcat(buffer_send, symbol_next);

            return 1;}}


    return 0;}



'''







'''

/fst/spider/net/thread/update/backup.c




int count_backup () {



// This is for count the number
//
// the 0 dirent usually to save the special things

    int number_count = 1;





// it's for saving the name of dirent

    char buffer_dirent[128];








// it's for saving the dirent

            DIR*    pointer_dirent = NULL;
    struct  dirent* ent            = NULL;






// prepare the dirent path

    strcpy(buffer_dirent, path_the   );
    strcat(buffer_dirent, "/"        );
    strcat(buffer_dirent, name_backup);







// open the dirent

    pointer_dirent = opendir(buffer_dirent);



// may be it's not exist

    if ( NULL != pointer_dirent ) {

// start the loop of read

        do {


// read the dirent

            ent = readdir( pointer_dirent );



// may be it's not exist

            if ( NULL != ent ) {

// Somtimes the point of the version will be at the last of the name of the dirent
// so we save it

                strcpy( buffer_dirent, ent->d_name );


                if ( NULL != strchr(buffer_dirent, '_') ) {

// it is usually very short
//  and the computers are usually very fast
// do not need to prepare a new pointer to save it

                    *strchr(buffer_dirent, '_') = '\0';}


// compare them and find the big one

                    if ( atoi(buffer_dirent) > number_count ) {

                    number_count = atoi(buffer_dirent);}}


          } while ( ent != NULL );
          }





// don't forget close it

    closedir(pointer_dirent);


    return number_count;}





'''







'''

/fst/spider/net/thread/update/append.c





int append_message_data_update(
                                  int   that_site,
                                  char* buffer_send
                              ) {





    if (

           strcmp(gop_connection.how[that_site], "Connectted"  ) != 0
    &&     strcmp(gop_connection.how[that_site], "Sopi"        ) != 0

       ) {

// ?
//   others should not come here

        return 0;}









    else {

// enter the program




        if ( gop_connection.flag_update[that_site] <= 9 ) {

// count_update means times between tow update message
//
// this is not update time
//
//  and we don need to use it
//
//  and if the client have not return
//
//   we don't read, and keep this
//
// time is here and we just send the same update package last time
//
//  and if sop recived the update message,
//
//   we send load update file and send the file right that now


            gop_connection.flag_update[that_site] ++;

            return 0;}









        else {

// it's time to send update
// clean the buffer

            gop_connection.flag_update[that_site] = 0;







// connect the send buffer

            strcat ( buffer_send, "Update." );
            strcat ( buffer_send, "\n"      );




// Prepare

            char buffer_file          [102400];
            char buffer_file_length   [16];
            char buffer_sum           [16];
            char buffer_step          [16];




// get the start path

            char   buffer_path_start  [32];

            strcpy(buffer_path_start, path_the);
            strcat(buffer_path_start, "/"     );
            strcat(buffer_path_start, name_the);





/* if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {// the loop program returned wrong flag//// if this is just like started just before//// there're two kind of possibility//// it is a beginning, something goes wrong// or it's end////// but we read the returned before//// so if it's like a beginning now//// it must be a beginning//// because we we will clean the buffer when the if ( control_message_update(gop_connection.update[that_site]) == 0 ) {// so we just loop it first//// if it returned a special value that means something really goes wrong//// it is done, we should never send a update message and we can fix it output_print( "string", "There is no TxL source.\n" );// clean it. strcpy(gop_connection.update[that_site], "" );// clean buffer of send *strstr(buffer_send, "Update.") = '\0';// this is a wrong,,, return 0;}}// ok we had loop it before in the judging's value//// now we get the files file_get( gop_connection.update[that_site], buffer_file );// and get the length of the file snprintf( buffer_file_length, sizeof(buffer_file_length) / sizeof(char) - 1, "%d", strlen(buffer_file) );// some file is very long, we can't send it once//// even if we can't read it unless used the changed buffer size//// and i still can't use that :c if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {// the value named 'step_update' means how many times we have send it//// and if this is over the last time of send this file already,//// we should loop it again//// for next append// loop it again if ( control_message_update(gop_connection.update[that_site]) != 0 ) {// this is the last step, but not the last file//// and be ready to send next file; gop_connection.step_update[that_site] = 0;} else {// if it is normal before//// and returned wrong now//// it means there is no another one file now// clean it and send message strcpy(gop_connection.update [that_site], "" ); gop_connection.step_update[that_site] = 0;















// start
//
// the update range next file load what is moving
//  to another place
// where the gop recived a recived message
//
// where named judge/infrmation
//
// :)


// start the update sending


// the information format of update
//
// File name:   ...
// File step:   ...
// File length: ...
// File sum:    ...




// get the numer of sums;
//
//
// first should get the file convent
//
// it seems like already got the file convent before
//
// but that was check


            file_get     (gop_connection.update[that_site], buffer_file);

// prepare
//
// if the length < path
//
// don't worry,
// path end flag will be where after the end flag there

            strcpy       (buffer_file, buffer_file + gop_connection.step_update[that_site] * size_update);

                          buffer_file[size_update] = '\0';

// get the value of sum

            secret_encode(buffer_file, "sum");

// get that

            strcpy       (buffer_sum, buffer_file);





// reget the file convent

            file_get(gop_connection.update[that_site], buffer_file);





// get the length we've send

            if (

                   ( (gop_connection.step_update[that_site] + 1) * size_update )

                   >  strlen(buffer_file)

               ) {

// if this is the last file
//
// the size is the left

                snprintf(

                          buffer_file_length,
                          sizeof(buffer_file_length) / sizeof(char) - 1,
                          "%d",
                          strlen(buffer_file) - gop_connection.step_update[that_site] * size_update

                        );}

            else {

// if this is not the last file
//
// the size is as the plan

                snprintf(
                          buffer_file_length,
                          sizeof(buffer_file_length) / sizeof(char) - 1,
                          "%d",
                          size_update
                        );}



// go to turn the step

            snprintf(buffer_step, sizeof(buffer_step) / sizeof(char) - 1, "%d", gop_connection.step_update[that_site]);















// make the update information

            strcat(
                    buffer_send,
                    strstr(gop_connection.update[that_site], name_the) + strlen(name_the)
                  );


            strcat(buffer_send, ",");
            strcat(buffer_send, buffer_step);
            strcat(buffer_send, ",");
            strcat(buffer_send, buffer_file_length);
            strcat(buffer_send, ","       );
            strcat(buffer_send, buffer_sum);
            strcat(buffer_send, "."       );
            strcat(buffer_send, "\n"      );




// this is the main convent
//
// prepare the convent of file

            strcpy(
                    buffer_file,
                    buffer_file + gop_connection.step_update[that_site] * size_update
                  );

                   buffer_file[size_update] = '\0';



// cat the convent of file

            strcat(buffer_send, buffer_file);




// plus the step of update
//
//   we don't need to do this now
//
//   we fresh the step when sop return






// show file name if it have not begin

// print the file name
//
// i think something could change
// to have a beautiful interface
//
// and these output message have a type different

            if ( gop_connection.step_update[that_site] == 1 ) {


                output_print( "string", gop_connection.update[that_site] );
                output_print( "string", " send size : "                  );
                output_print( "string", buffer_file_length               );
                output_print( "string", "\n"                             );}}




// appending done, return it

        return 1;}}



'''







'''

/fst/spider/net/thread/update/load.c






int  load_update(

                    int that_site

                ) {



// This is for saving the id
//   of each file

    int    number_file   = 0;


// This is for saving the name of the file

    char   buffer_file  [128];


// This is for saving the convent of the file

    char   buffer_words [10240];



// This is for saving the path of the download file

    char   buffer_update[128];







// This is for saving the mixing number of the file

    char   buffer_mix   [128];










// Check where the river saved


// this is for the id of backup

    snprintf(

              buffer_file,
              sizeof(buffer_file) / sizeof(char),
              "%d",
              count_backup() + 1
            );






// This is for the command of moving file

    char   buffer_commandline_save  [128];
    char   buffer_commandline_remove[128];
    char   buffer_commandline_load  [128];




// there are tree importent dirent
//
//    source   dirent : path/name
//    backup   dirent : path/backup
//    download dirent : path/downloads


// mv path/name path/backup

    strcpy(buffer_commandline_save,   "mv "            );
    strcat(buffer_commandline_save,   path_the         );
    strcat(buffer_commandline_save,   "/"              );
    strcat(buffer_commandline_save,   name_the         );
    strcat(buffer_commandline_save,   " "              );
    strcat(buffer_commandline_save,   path_the         );
    strcat(buffer_commandline_save,   "/"              );
    strcat(buffer_commandline_save,   name_backup      );
    strcat(buffer_commandline_save,   "/"              );
    strcat(buffer_commandline_save,   buffer_file      );


// rm -rf path/name

    strcpy(buffer_commandline_remove, "rm -rf "        );
    strcat(buffer_commandline_remove, path_the         );
    strcat(buffer_commandline_remove, "/"              );
    strcat(buffer_commandline_remove, name_the         );


// mv path/downloads path/name

    strcpy(buffer_commandline_load,   "mv "            );
    strcat(buffer_commandline_load,   path_the         );
    strcat(buffer_commandline_load,   "/downloads"     );
    strcat(buffer_commandline_load,   " "              );
    strcat(buffer_commandline_load,   path_the         );
    strcat(buffer_commandline_load,   "/"              );
    strcat(buffer_commandline_load,   name_the         );



// clear the update buffer

    strcpy(gop_connection.update[that_site],         "");



// start it

    output_print( "string", "Load update...\n" );









// save code to backup

    commandline_get(buffer_commandline_save, buffer_words);


// load the  downloads

    commandline_get(buffer_commandline_load, buffer_words);





// readyto loop the files

    strcpy( gop_connection.update[that_site], path_the );
    strcat( gop_connection.update[that_site], "/"      );
    strcat( gop_connection.update[that_site], name_the );





// the main looop

    while ( control_message_update(gop_connection.update[that_site]) != 0 ) {




// the result is
//
// path/name/.../file.h.x

        strcpy (buffer_update, gop_connection.update[that_site]);
       *strrchr(buffer_update, '.'                             ) = '\0';




// now we creat the complete files in the path/downloads
//
// prepare

        strcpy( buffer_mix,    path_the);
        strcat( buffer_mix,   "/downloads/");
        strcat( buffer_mix,    strstr(buffer_update, name_the) + strlen(name_the) + 1);




// we may loop many of these name with a '.x'
//
//    but we should as the range
//
//     so we do that at first time to loop it
//
//     so if we'd creat that, does not need to creat again

        if ( !is_file(buffer_mix) ) {

// if we had not loop and creat the '.x' files before
//
// preare loop the file name downloads before

                   number_file  = 0;

            strcpy(buffer_file, buffer_update);
            strcat(buffer_file, ".0"         );



// ok let mix the downloads '.x' files

            while ( is_file(buffer_file) ) {

// we found the file named '.x' in this loop



//  get the convent of the file

                file_get (buffer_file,   buffer_words);



// save the convent of the file

                if ( number_file == 0 ) {

// if this is the first found, creat it

                    file_save  (buffer_mix, buffer_words);}

                else {

// if this is not first found, append to it
//
// called mix
                    file_append(buffer_mix, buffer_words);}




// try to found next file

                number_file++;


// prepare the next file

                strcpy(buffer_file, buffer_update);
                strcat(buffer_file, "."          );


// we havnt to declear another buffer to save the number of this loop file's '.x'
//
// we just use the buffer for saving the file convent before :l

                snprintf(buffer_words, sizeof(buffer_words) / sizeof(char) - 1, "%d", number_file);

                strcat(buffer_file, buffer_words );}



// we've creat a complete file form downloads files
//
// print out  it, and start the next downloads file loop

            output_print( "string",  buffer_mix );
            output_print( "string", "\n"        );}}




// we've done for loop the whole downloads files
//
//    remove, and load it

    strcpy(gop_connection.update[that_site],   path_the    );

    commandline_get(buffer_commandline_remove, buffer_words);
    commandline_get(buffer_commandline_load,   buffer_words);


// we've done

    output_print( "string", "Done.\n" );





// this is a whole update
//
//  and send message to the next sop

    int i;

    for ( i=0; i<=3; i++ ) {


        if (
               strcmp(gop_connection.how[i], "Sopi"      ) == 0
        ||     strcmp(gop_connection.how[i], "Connectted") == 0
           ) {


// we don't need to update to ourselves

            if (
                   strcmp(
                           gop_connection.address_ip[i],
                           address_to
                         )
                   != 0
               ) {



                strcpy(gop_connection.command[i], "Clean update.");

// we just need to send a update message onece
//
// don't know why
//
// maybe something changed in the file-system

                break;}}}



// return the comlete flag,
//
//    but there's wrong happened maybe
//
//    include the download files broke
//
//    or something else

  return 1;}



'''







'''

/fst/spider/net/thread/update/next.c






 int next_message_data_update () {







// update next we should move it to it's mother site

/*

            if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {


// the loop program returned wrong flag
//
// if this is just like started just before
//
// there're two kind of possibility
//
// it is a beginning, something goes wrong
// or it's end
//
//
// but we read the returned before
//
//  so if it's like a beginning now
//
//  it must be a beginning
s//
//  because we we will clean the buffer when the






                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {


// so we just loop it first
//
// if it returned a special value that means something really goes wrong
//
// it is done, we should never send a update message and we can fix it

                    output_print( "string", "There is no TxL source.\n" );


// clean it.

                    strcpy(gop_connection.update[that_site], "" );


// clean buffer of send

                   *strstr(buffer_send, "Update.") = '\0';


// this is a wrong,,,

                    return 0;}}







// ok we had loop it before in the judging's value
//
//   now we get the files

            file_get( gop_connection.update[that_site], buffer_file );


// and get the length of the file

            snprintf(
                      buffer_file_length,
                      sizeof(buffer_file_length) / sizeof(char) - 1,
                      "%d",
                      strlen(buffer_file)
                    );







// some file is very long, we can't send it once
//
// even if we can't read it unless used the changed buffer size
//
//  and i still can't use that :c


            if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {


// the value named 'step_update' means how many times we have send it
//
// and if this is over the last time of send this file already,
//
//  we should loop it again
//
// for next append






// loop it again

                if ( control_message_update(gop_connection.update[that_site]) != 0 ) {


// this is the last step, but not the last file
//
//  and be ready to send next file;

                    gop_connection.step_update[that_site] = 0;}








                else {

// if it is normal before
//
// and returned wrong now
//
// it means there is no another one file now


// clean it and send message


                    strcpy(gop_connection.update     [that_site], ""        );

                           gop_connection.step_update[that_site] = 0;



// print out and send message

                    output_print( "string",                       "Done.\n" );

                    strcat      (buffer_send,                     "Done."   );





// ready to update to another one
//
// something went worng, can't send update together

                    int i;

                    for (
                            i  = that_site + 1;
                            i <= 3;
                            i ++
                        ) {


                        if (
                               strcmp(gop_connection.how[i],     "Sopi")       == 0
                        ||     strcmp(gop_connection.how[i],     "Connectted") == 0
                           ) {

// it is next sop client
//
// send the update

                            strcpy(gop_connection.command[that_site], ""             );
                            strcpy(gop_connection.command[i],         "Clean update.");


// update one client once

                            break;}}



// this update is done, return it

                    return 1;}}


*/





// something happened

            return 0;


'''







'''

/fst/spider/net/thread/update/that.c






int control_message_update( char* path_update ) {




//  TxL/?
//
//  prepare the start path
//  i think it was good if u can give a target
//  it could be any path
// &i don't know how to do
//
// i can use a box

            char    path_update_start[128];

            strcpy (path_update_start, path_the);
            strcat (path_update_start, "/"     );
            strcat (path_update_start, name_the);





// it's for  the dirent

            DIR*    pointer_dirent = NULL;
    struct  dirent* ent            = NULL;






// for saving what file we are send

            char    that_file[128];
            strcpy (that_file, "");







    if ( strcmp(path_update, path_update_start) != 0 ) {

// if the appending
// is not a beginning
//   full back a name

        strcpy(that_file, strrchr(path_update, '/') + 1);

       *strrchr(path_update, '/') = '\0';}




    if ( strcmp(path_update, "") == 0 ) {

// There's no TxL source.

       return 0;}






// Sometimes it return the dirent u got before.

    pointer_dirent = opendir(path_update);





// Read and return to target path.

    if ( strcmp(that_file, "") != 0 ) {


        ent = readdir( pointer_dirent );


        while ( strcmp(that_file, ent->d_name) != 0 ) {

            ent = readdir( pointer_dirent );}}





    ent = readdir( pointer_dirent );

    while ( ent != NULL ) {

        if (   (int)ent->d_type == 4 ) {

            if ( *ent->d_name == '.') {

                ent = readdir(pointer_dirent);}

            else {

                strcat(path_update, "/");
                strcat(path_update, ent->d_name);

                closedir( pointer_dirent );

                pointer_dirent = opendir(path_update);
                ent  = readdir(pointer_dirent);}}


        else if ( (int)ent->d_type == 8 ) {

            strcat(path_update, "/");
            strcat(path_update, ent->d_name);

            closedir( pointer_dirent );

            return 1;}}



     // A dirent is finished

    if ( strcmp(path_update, path_update_start) != 0 ) {

        closedir( pointer_dirent );

        return control_message_update(path_update);}


    else {

        closedir( pointer_dirent );

        strcpy(path_update, "");

        return 0;}}



'''







'''

/fst/spider/that/that/that.c








/*

 change the name to network soon


 maybe change it to net

*/



 struct gopi_spider


  {





 /*

  could use iic, serial and more

 */







 /*

 char * type;

 */






/*

 it is say what type it runs

*/

 char how [ 4 ] [ 16 ];






/*

 if too long it could be stack

*/

 time_t  time [ 5 ];





/*

 stop it if it stack

 one for connector one for connectted


 descriptor is for socket

 connection is for connection

*/

 int descriptor [ 2 ];

 int connection [ 5 ];









/*

 this is to save address and port

 one for conncetor to bind

 one for connectted to connect


 maybe named address

*/

 char address_ip [ 4 ] [ 128 ];

 int port [ 2 ];






/*

 save command here

*/

 char command [ 4 ] [ 128 ];








/*

 save update here


*/

 char update [ 4 ] [ 10240 ];




/*

 the step of update

 soon we won't use them

 we fresh it after recived

*/

 int step_update [ 4 ];

 int flag_update [ 4 ];










/*

 we're ready to note them :D

 use a big changed space



 ----<-----...43210-----------

*/


/*

 char video [ 4 ] [ 102400 ];
 char audio [ 4 ] [ 102400 ];

*/









/*

 we don't use this we use one include this

 :D

*/

/*
    struct gopi_system  system    [4];
    struct gopi_network network   [4];
    struct gopi_cpu     cpu       [4];
    struct gopi_memory  memory    [4];
    struct gopi_disk    disk      [4];
    struct gopi_sound   sound     [4];
    struct gopi_flag    flag      [4];
*/





 struct  gopi_about  about [ 4 ];






/*

 then we could add lots of mates


 give it to dog

*/

/*

 * gopi_about  about [ 4 ];

*/








/*

 maybe there're strange things like bettery

*/

 char  note [ 4 ] [ 1024 ];







  } gop_connection;













'''







'''

/fst/spider/that/that/check.c







/*

 check connection, connecting, and stack


 get from ckeck

*/


'''







'''

/fst/spider/that/that/clean.c






/*

 maybe we should bring the struct to the function

 but it is one network there

 and maybe not

*/



 int clean_connection (
/*
                         struct gop_network that_network,
*/
                               int          that_site,

                         const char *       that_type

                      )


  {












/*

 sometimes we forget this connection, we restet it all

*/

 if (
      strcmp ( that_type, "all" ) == 0
    )

  {


 strcpy ( gop_connection . how        [ that_site ],  "Wait" );

 strcpy ( gop_connection . command    [ that_site ],  ""     );


 strcpy ( gop_connection . audio      [ that_site ],  ""     );

 strcpy ( gop_connection . video      [ that_site ],  ""     );



/*

 we use this function straightly

 clean the update message

*/

 clean_connection ( that_site, "update" );

/*

 strcpy ( gop_connection . update      [ that_site ],  ""    );

          gop_connection . step_update [ that_site ]   = 0;

          gop_connection . flag_update [ that_site ]   = 0;

*/







/*

 not clean the address for connector

  these will keep to save the address we go to

*/

 if (  that_site != 0  )

  {


 strcpy ( gop_connection . address_ip [ that_site ],  ""    );

          gop_connection . port       [ that_site ] = 0      ;


  }






/*

 now return it

*/



 return 0;






/*

 it is for if

*/

  }


















 else if (  strcmp ( that_type, "sopi" ) == 0  ) {


/*

 the clean for sopi changing

*/

 strcpy ( gop_connection . command [ that_site ],  "" );




/*

 it is coming,,

*/

/*

 strcpy ( gop_connection . audio [ that_site ],  "" );
 strcpy ( gop_connection . video [ that_site ],  "" );

*/



/*

 the update end

*/

 clean_connection ( that_site, "update" );

/*

 strcpy ( gop_connection . update      [ that_site ],  "" );
          gop_connection . step_update [ that_site ] = 0   ;
          gop_connection . flag_update [ that_site ] = 0   ;
*/





/*

 get sopi

 fresh that

*/

 if      (
           strcmp (  gop_connection . how [ that_site ],  "Connectted" )  ==  0
         )

  {

 strcpy ( gop_connection . how [ that_site ], "Sop" );

 return 0;

  }




 else if  (
            strcmp  (  gop_connection . how [ that_site ],  "Sop"  )  ==  0
          )

  {

 strcpy ( gop_connection . how [ that_site ], "Connectted" );

 return 0;

  }




 else if (
           strcmp  (  gop_connection . how [ that_site ],  "Connectting"  )  ==  0
         )

  {

 strcpy ( gop_connection . how [ that_site ], "Sopi" );

 return 0;

  }



 else if (
           strcmp (  gop_connection . how [ that_site ],  "Sopi"  )  ==  0

         )

  {

 strcpy ( gop_connection . how [ that_site ], "Connectting" );

  return 0;

  }




/*

 here

*/



 }














/*

 it's in plan should, sometimes

 somethong went to this and return a zero


 it could be last of it

*/


/*

 return -1;


 }

*/
















 else if  (
            strcmp ( that_type, "update" ) == 0
          )

  {

/*

 we just don't wanna update this time

 just clean all the update things

*/

 strcpy ( gop_connection.update      [ that_site ],  "" );

          gop_connection.step_update [ that_site ] = 0;

          gop_connection.flag_update [ that_site ] = 0;

 return 0;

  }










/*

 let them quit

*/

 else if  (
            strcmp ( that_type, "quit"  )  ==  0
          )

  {





/*

 it could be accepting or sending

 for connectted

 it is two number point it

 and it's complicate


 let the connection quit

*/

 if  (
       gop_connection . connection [ that_site ]  !=  -1
     )

  {

 shutdown ( gop_connection . connection [ that_site ], SHUT_RDWR );

  }




/*

 let the socket quit

*/


 if  (  that_site == 0  )

  {

 shutdown ( gop_connectio n .descriptor [ 0 ], SHUT_RDWR );

  }



 else if ( that_site < 4 )

  {

 shutdown ( gop_connection . descriptor [ 1 ], SHUT_RDWR );

  }




 return 0;

  }









/*

 something get in

*/

 return -1;

  }



'''







'''

/fst/spider/that/about/that.c






















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



'''







'''

/fst/spider/that/about/clean.c





















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



'''







'''

/fst/spider/that/hope.c









/*

 hopes if network

*/



 struct hope_net


  {



/*

 they are for connecttor and connectted

*/

 char   address_to [ 16 ];

 int    port_to;

 int    port_this;




/*

 they are for translate

*/

 char   symbol_next [ 128 ];


 float  step_connection;

 int    size_update;


  };



'''







'''

/fst/things/stm/seed/dream.c













/*

 the mcu of kylin mini board is  stm32f103rct6





 this is the base head file

 and don't know where it come


 and it won't be nessensary
 
*/



/*

 #include "./startup_stm32f10x_hd.s"

*/










/*

 this is a packge of ways and leaves

 use in many source

*/


/*

 #include <stm32f10x.h>

*/












/*

 it is added for things

 nessensary


 and use to add by  "stm32f10x.h"

*/


# include "../sister/sister_init.h"













// this is head files


/*

 # include  "../things/varilables.h"

*/


 # include  "../varilables.h"











// this is files for acrossing stm32 in the future


// #include "../sister/time.h"

// #include "../sister/gpio.h"






'''







'''

/fst/things/stm/seed/kylin-mini_version-1.2.c





































 void  *  dream_about_light  (  void  * *  dream  )

  {


/*

 �o�� ���П� �� ���V 녉� ��

 ��

*/

















/*

 the leds on kylin mini stm32 board version 1.2

*/


/*

int group_led = GPIOB;

int pin_led_1 = GPIO_Pin_6;

int pin_led_2 = GPIO_Pin_7;

int pin_led_3 = GPIO_Pin_8;

int pin_led_4 = GPIO_Pin_9;

*/


/*

 �o�� ����̖ ��


 �oַ ���� ��

 �oַ ���� ��

 �oַ ���� ��

 �oַ ���� ��

*/


/*

 �o�� ���M̖ ��


 �o�� ���� ��

 �o�� ���� ��

 �o�� ���� ��

 �o�� ���� ��

*/


/*

 void  *  pin_group_led;


 void  *  pin_led_one;

 void  *  pin_led_two;

 void  *  pin_led_three;

 void  *  pin_led_four;

*/


 dream_about  (  "apples . branch . basket . light",  "unsigned short"  );


 dream_about  (  "apples . branch . light . one",  "unsigned short"  );

 dream_about  (  "apples . branch . light . two",  "unsigned short"  );

 dream_about  (  "apples . branch . light . three",  "unsigned short"  );

 dream_about  (  "apples . branch . light . four",  ��unsigned short"  );


/*

 ��֮ �� �����M֦̖�� ���o�˶̔��� ��Ҳ


 ��֮ �� ������֦̖�� ���o�˶̔��� ��Ҳ

 ��֮ �� ������֦̖�� ���o�˶̔��� ��Ҳ

 ��֮ �� ������֦̖�� ���o�˶̔��� ��Ҳ

 ��֮ �� ������֦̖�� ���o�˶̔��� ��Ҳ

*/































 dream_saw  (  "apples . branch . basket . light",  GPIOB  );


 dream_saw  (  "apples . branch . light . one",  GPIO_Pin_6  );

 dream_saw  (  "apples . branch . light . two",  GPIO_Pin_7  );

 dream_saw  (  "apples . branch . light . three",  GPIO_Pin_8  );

 dream_saw  (  "apples . branch . light . four",  GPIO_Pin_9  );


/*

 ���� �� �����M̖֮�� GPIOB ��Ҳ


 ���� �� ������֦̖�� GPIO_Pin_6 ��Ҳ

 ���� �� ������֦̖�� GPIO_Pin_7 ��Ҳ

 ���� �� ������֦̖�� GPIO_Pin_8 ��Ҳ

 ���� �� ������֦̖�� GPIO_Pin_9 ��Ҳ

*/



























 return 0;


/*

 �ؑ� Ȼ Ҳ

*/


/*

 return dream;

*/


/*

 �ؑ� 녉� Ҳ

*/





























  }


/*

 ����

*/







































'''







'''

/fst/things/stm/seed/fruit.c






// this is the varilables for stm32

// # include <head/varilables.h>



/*

 int  mode_gpio_out  =  GPIO_Mode_Out_PP;

 int  speed_gpio     =  GPIO_Speed_50MHz;
 
 */




'''







'''

/fst/things/stm/seed/startup_stm32f10x_hd.s



;******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
;* File Name          : startup_stm32f10x_hd.s
;* Author             : MCD Application Team
;* Version            : V3.5.0
;* Date               : 11-March-2011
;* Description        : STM32F10x High Density Devices vector table for MDK-ARM 
;*                      toolchain. 
;*                      This module performs:
;*                      - Set the initial SP
;*                      - Set the initial PC == Reset_Handler
;*                      - Set the vector table entries with the exceptions ISR address
;*                      - Configure the clock system and also configure the external 
;*                        SRAM mounted on STM3210E-EVAL board to be used as data 
;*                        memory (optional, to be enabled by user)
;*                      - Branches to __main in the C library (which eventually
;*                        calls main()).
;*                      After Reset the CortexM3 processor is in Thread mode,
;*                      priority is Privileged, and the Stack is set to Main.
;* <<< Use Configuration Wizard in Context Menu >>>   
;*******************************************************************************
; THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
; WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
; AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
; INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
; CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
; INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
;*******************************************************************************

; Amount of memory (in bytes) allocated for Stack
; Tailor this value to your application needs
; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp
                                                  
; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000200

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit

                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp               ; Top of Stack
                DCD     Reset_Handler              ; Reset Handler
                DCD     NMI_Handler                ; NMI Handler
                DCD     HardFault_Handler          ; Hard Fault Handler
                DCD     MemManage_Handler          ; MPU Fault Handler
                DCD     BusFault_Handler           ; Bus Fault Handler
                DCD     UsageFault_Handler         ; Usage Fault Handler
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     SVC_Handler                ; SVCall Handler
                DCD     DebugMon_Handler           ; Debug Monitor Handler
                DCD     0                          ; Reserved
                DCD     PendSV_Handler             ; PendSV Handler
                DCD     SysTick_Handler            ; SysTick Handler

                ; External Interrupts
                DCD     WWDG_IRQHandler            ; Window Watchdog
                DCD     PVD_IRQHandler             ; PVD through EXTI Line detect
                DCD     TAMPER_IRQHandler          ; Tamper
                DCD     RTC_IRQHandler             ; RTC
                DCD     FLASH_IRQHandler           ; Flash
                DCD     RCC_IRQHandler             ; RCC
                DCD     EXTI0_IRQHandler           ; EXTI Line 0
                DCD     EXTI1_IRQHandler           ; EXTI Line 1
                DCD     EXTI2_IRQHandler           ; EXTI Line 2
                DCD     EXTI3_IRQHandler           ; EXTI Line 3
                DCD     EXTI4_IRQHandler           ; EXTI Line 4
                DCD     DMA1_Channel1_IRQHandler   ; DMA1 Channel 1
                DCD     DMA1_Channel2_IRQHandler   ; DMA1 Channel 2
                DCD     DMA1_Channel3_IRQHandler   ; DMA1 Channel 3
                DCD     DMA1_Channel4_IRQHandler   ; DMA1 Channel 4
                DCD     DMA1_Channel5_IRQHandler   ; DMA1 Channel 5
                DCD     DMA1_Channel6_IRQHandler   ; DMA1 Channel 6
                DCD     DMA1_Channel7_IRQHandler   ; DMA1 Channel 7
                DCD     ADC1_2_IRQHandler          ; ADC1 & ADC2
                DCD     USB_HP_CAN1_TX_IRQHandler  ; USB High Priority or CAN1 TX
                DCD     USB_LP_CAN1_RX0_IRQHandler ; USB Low  Priority or CAN1 RX0
                DCD     CAN1_RX1_IRQHandler        ; CAN1 RX1
                DCD     CAN1_SCE_IRQHandler        ; CAN1 SCE
                DCD     EXTI9_5_IRQHandler         ; EXTI Line 9..5
                DCD     TIM1_BRK_IRQHandler        ; TIM1 Break
                DCD     TIM1_UP_IRQHandler         ; TIM1 Update
                DCD     TIM1_TRG_COM_IRQHandler    ; TIM1 Trigger and Commutation
                DCD     TIM1_CC_IRQHandler         ; TIM1 Capture Compare
                DCD     TIM2_IRQHandler            ; TIM2
                DCD     TIM3_IRQHandler            ; TIM3
                DCD     TIM4_IRQHandler            ; TIM4
                DCD     I2C1_EV_IRQHandler         ; I2C1 Event
                DCD     I2C1_ER_IRQHandler         ; I2C1 Error
                DCD     I2C2_EV_IRQHandler         ; I2C2 Event
                DCD     I2C2_ER_IRQHandler         ; I2C2 Error
                DCD     SPI1_IRQHandler            ; SPI1
                DCD     SPI2_IRQHandler            ; SPI2
                DCD     USART1_IRQHandler          ; USART1
                DCD     USART2_IRQHandler          ; USART2
                DCD     USART3_IRQHandler          ; USART3
                DCD     EXTI15_10_IRQHandler       ; EXTI Line 15..10
                DCD     RTCAlarm_IRQHandler        ; RTC Alarm through EXTI Line
                DCD     USBWakeUp_IRQHandler       ; USB Wakeup from suspend
                DCD     TIM8_BRK_IRQHandler        ; TIM8 Break
                DCD     TIM8_UP_IRQHandler         ; TIM8 Update
                DCD     TIM8_TRG_COM_IRQHandler    ; TIM8 Trigger and Commutation
                DCD     TIM8_CC_IRQHandler         ; TIM8 Capture Compare
                DCD     ADC3_IRQHandler            ; ADC3
                DCD     FSMC_IRQHandler            ; FSMC
                DCD     SDIO_IRQHandler            ; SDIO
                DCD     TIM5_IRQHandler            ; TIM5
                DCD     SPI3_IRQHandler            ; SPI3
                DCD     UART4_IRQHandler           ; UART4
                DCD     UART5_IRQHandler           ; UART5
                DCD     TIM6_IRQHandler            ; TIM6
                DCD     TIM7_IRQHandler            ; TIM7
                DCD     DMA2_Channel1_IRQHandler   ; DMA2 Channel1
                DCD     DMA2_Channel2_IRQHandler   ; DMA2 Channel2
                DCD     DMA2_Channel3_IRQHandler   ; DMA2 Channel3
                DCD     DMA2_Channel4_5_IRQHandler ; DMA2 Channel4 & Channel5
__Vectors_End

__Vectors_Size  EQU  __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY
                
; Reset handler
Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  __main
                IMPORT  SystemInit
                LDR     R0, =SystemInit
                BLX     R0               
                LDR     R0, =__main
                BX      R0
                ENDP
                
; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler                [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler          [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler          [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler           [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler         [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler                [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler           [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler             [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler            [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WWDG_IRQHandler            [WEAK]
                EXPORT  PVD_IRQHandler             [WEAK]
                EXPORT  TAMPER_IRQHandler          [WEAK]
                EXPORT  RTC_IRQHandler             [WEAK]
                EXPORT  FLASH_IRQHandler           [WEAK]
                EXPORT  RCC_IRQHandler             [WEAK]
                EXPORT  EXTI0_IRQHandler           [WEAK]
                EXPORT  EXTI1_IRQHandler           [WEAK]
                EXPORT  EXTI2_IRQHandler           [WEAK]
                EXPORT  EXTI3_IRQHandler           [WEAK]
                EXPORT  EXTI4_IRQHandler           [WEAK]
                EXPORT  DMA1_Channel1_IRQHandler   [WEAK]
                EXPORT  DMA1_Channel2_IRQHandler   [WEAK]
                EXPORT  DMA1_Channel3_IRQHandler   [WEAK]
                EXPORT  DMA1_Channel4_IRQHandler   [WEAK]
                EXPORT  DMA1_Channel5_IRQHandler   [WEAK]
                EXPORT  DMA1_Channel6_IRQHandler   [WEAK]
                EXPORT  DMA1_Channel7_IRQHandler   [WEAK]
                EXPORT  ADC1_2_IRQHandler          [WEAK]
                EXPORT  USB_HP_CAN1_TX_IRQHandler  [WEAK]
                EXPORT  USB_LP_CAN1_RX0_IRQHandler [WEAK]
                EXPORT  CAN1_RX1_IRQHandler        [WEAK]
                EXPORT  CAN1_SCE_IRQHandler        [WEAK]
                EXPORT  EXTI9_5_IRQHandler         [WEAK]
                EXPORT  TIM1_BRK_IRQHandler        [WEAK]
                EXPORT  TIM1_UP_IRQHandler         [WEAK]
                EXPORT  TIM1_TRG_COM_IRQHandler    [WEAK]
                EXPORT  TIM1_CC_IRQHandler         [WEAK]
                EXPORT  TIM2_IRQHandler            [WEAK]
                EXPORT  TIM3_IRQHandler            [WEAK]
                EXPORT  TIM4_IRQHandler            [WEAK]
                EXPORT  I2C1_EV_IRQHandler         [WEAK]
                EXPORT  I2C1_ER_IRQHandler         [WEAK]
                EXPORT  I2C2_EV_IRQHandler         [WEAK]
                EXPORT  I2C2_ER_IRQHandler         [WEAK]
                EXPORT  SPI1_IRQHandler            [WEAK]
                EXPORT  SPI2_IRQHandler            [WEAK]
                EXPORT  USART1_IRQHandler          [WEAK]
                EXPORT  USART2_IRQHandler          [WEAK]
                EXPORT  USART3_IRQHandler          [WEAK]
                EXPORT  EXTI15_10_IRQHandler       [WEAK]
                EXPORT  RTCAlarm_IRQHandler        [WEAK]
                EXPORT  USBWakeUp_IRQHandler       [WEAK]
                EXPORT  TIM8_BRK_IRQHandler        [WEAK]
                EXPORT  TIM8_UP_IRQHandler         [WEAK]
                EXPORT  TIM8_TRG_COM_IRQHandler    [WEAK]
                EXPORT  TIM8_CC_IRQHandler         [WEAK]
                EXPORT  ADC3_IRQHandler            [WEAK]
                EXPORT  FSMC_IRQHandler            [WEAK]
                EXPORT  SDIO_IRQHandler            [WEAK]
                EXPORT  TIM5_IRQHandler            [WEAK]
                EXPORT  SPI3_IRQHandler            [WEAK]
                EXPORT  UART4_IRQHandler           [WEAK]
                EXPORT  UART5_IRQHandler           [WEAK]
                EXPORT  TIM6_IRQHandler            [WEAK]
                EXPORT  TIM7_IRQHandler            [WEAK]
                EXPORT  DMA2_Channel1_IRQHandler   [WEAK]
                EXPORT  DMA2_Channel2_IRQHandler   [WEAK]
                EXPORT  DMA2_Channel3_IRQHandler   [WEAK]
                EXPORT  DMA2_Channel4_5_IRQHandler [WEAK]

WWDG_IRQHandler
PVD_IRQHandler
TAMPER_IRQHandler
RTC_IRQHandler
FLASH_IRQHandler
RCC_IRQHandler
EXTI0_IRQHandler
EXTI1_IRQHandler
EXTI2_IRQHandler
EXTI3_IRQHandler
EXTI4_IRQHandler
DMA1_Channel1_IRQHandler
DMA1_Channel2_IRQHandler
DMA1_Channel3_IRQHandler
DMA1_Channel4_IRQHandler
DMA1_Channel5_IRQHandler
DMA1_Channel6_IRQHandler
DMA1_Channel7_IRQHandler
ADC1_2_IRQHandler
USB_HP_CAN1_TX_IRQHandler
USB_LP_CAN1_RX0_IRQHandler
CAN1_RX1_IRQHandler
CAN1_SCE_IRQHandler
EXTI9_5_IRQHandler
TIM1_BRK_IRQHandler
TIM1_UP_IRQHandler
TIM1_TRG_COM_IRQHandler
TIM1_CC_IRQHandler
TIM2_IRQHandler
TIM3_IRQHandler
TIM4_IRQHandler
I2C1_EV_IRQHandler
I2C1_ER_IRQHandler
I2C2_EV_IRQHandler
I2C2_ER_IRQHandler
SPI1_IRQHandler
SPI2_IRQHandler
USART1_IRQHandler
USART2_IRQHandler
USART3_IRQHandler
EXTI15_10_IRQHandler
RTCAlarm_IRQHandler
USBWakeUp_IRQHandler
TIM8_BRK_IRQHandler
TIM8_UP_IRQHandler
TIM8_TRG_COM_IRQHandler
TIM8_CC_IRQHandler
ADC3_IRQHandler
FSMC_IRQHandler
SDIO_IRQHandler
TIM5_IRQHandler
SPI3_IRQHandler
UART4_IRQHandler
UART5_IRQHandler
TIM6_IRQHandler
TIM7_IRQHandler
DMA2_Channel1_IRQHandler
DMA2_Channel2_IRQHandler
DMA2_Channel3_IRQHandler
DMA2_Channel4_5_IRQHandler
                B       .

                ENDP

                ALIGN

;*******************************************************************************
; User Stack and Heap initialization
;*******************************************************************************
                 IF      :DEF:__MICROLIB
                
                 EXPORT  __initial_sp
                 EXPORT  __heap_base
                 EXPORT  __heap_limit
                
                 ELSE
                
                 IMPORT  __use_two_region_memory
                 EXPORT  __user_initial_stackheap
                 
__user_initial_stackheap

                 LDR     R0, =  Heap_Mem
                 LDR     R1, =(Stack_Mem + Stack_Size)
                 LDR     R2, = (Heap_Mem +  Heap_Size)
                 LDR     R3, = Stack_Mem
                 BX      LR

                 ALIGN

                 ENDIF

                 END

;******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE*****



'''







'''

/fst/things/stm/branch/dream.c



// maybe it's not needed

typedef struct {

    mode_gpio_off=0;

    mode_gpio_on;

    } status_gpio;






// maybe every one of my program will have a led control system
//   and they light just like one
//   :D
//
// andi decided that use this to as gpio dunctions library straightly
//
// maybe i should make a led head too :D







// here is init of the group of the RCC


/*

int init_gpio_group( int buffer_group ) {

*/


 void  *  sleep_branch_basket  (  void  *  apples_branch_basket  )

  {


/*

 �o�� ����֦ �� �o�� ֦�M ��

 ��

*/


/*

 �o�� ֦���� �� �o�� ֦��̖ ��

 ��

*/


// the judging of group

    if ( buffer_group == GPIOB ) {


// what is RCC?

        RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);

// don't know what that return

        return 1;}




// did not find the group in the plan

    return 0;}








// this is init


/*

int init_gpio(

                 int buffer_mode,
                 int buffer_group,
                 int buffer_id,
                 int buffer_speed

             ) {

*/


 void  *  sleep_with_branch
                             (

                                void  *  apples_branch_basket,
                                void  *  apples_branch_look,
                                void  *  apples_branch_name,
                                void  *  apples_branch_shaking

                             )


/*

 �o�� ֦����

 �x

 �o�� ֦��̖ ֮�c

 �o�� ֦�֘� ֮�c

 �o�� ֦���� ֮�c 

 �o�� ֦����

 ��

 ��

*/


// this structure is for note the values to set gpio

    gpio_InitTypeDef structure_gpio_init;






/*

 prepare

 the value of led gpio on onenet Kylin mini board are

 group: GPIOB,
 id   : 6, 7, 8, 9


 ok, i know it's not used for led any more..:D

 don't want to change it



 lights

*/


    structure_gpio_init.mode  = buffer_mode;

    structure_gpio_init.pin   = buffer_id

    structure_gpio_init.Speed = buffer_speed;





// init it

    Init_GPIO(buffer_group, &structure_gpio_init);





// set the gpio off

    GPIO_WriteBit(
                   buffer_group,
                   buffer_id,
                   mode_gpio_off != mode_gpio_on ? Bit_Set : Bit_Reset
                 );





// maybe oneday it will goes wrong

    return 1;}










// This is set the gpio mode

int load_gpio(

                 int         buffer_group,
                 int         buffer_id,
                 status_gpio buffer_status_gpio

             ) {


// set the gpio

    GPIO_WriteBit(
                   buffer_group,
                   buffer_id,
                   buffer_status_gpio != mode_gpio_on : Bit_SET ? Bit_RESET
                 );



//  and it may return a wrong value
// that means something goes wrong

    return 1;}




'''







'''

/fst/things/stm/sister/rest/prepare.c





















/*

 char is meanned charactor in gcc

 but it seems like number there



 maybe move it to hope
 
 
 maybe move to about



 let it changed with weather
 
*/


/*

 unsigned short number_count_sleep

*/


/*

 void * number_count_wait;
 
*/

















/*

 prepare the system tick and the count number

*/



/*

int init_sleep() {

*/


/*

 int prepare_wait ()

*/


 void  *  prepare_rest  ()
 
  {


/*

 �oַ ЪϢ֮�A��

 ��

*/









/*

 this is a specificate

*/


/*

 SysTick->CTRL &= (1 << 2);

*/


 SysTick  ->  CTRL   &=   (  1 << 2  );




















/*

 there's two lines of commands in the delay loop

 .. 72 MHz  /  8   =   1 000 000 Hz

      stm32f103 -- 9
	  
	
	
 maybe
 
 
 maybe it's a time re-computer

*/





/*


 number_count_wait  =  malloc  (  sizeof ( unsigned short )  );
 
*/


 that . about . dream . rest   =   malloc  (  sizeof ( unsigned short )  );







 
 /*
 
 number_count_sleep = 9;
 
 */


/*

  *  (  unsigned short  )  number_count_sleep  =  9;

*/


  *  (  unsigned short  )  that . about . dream . rest   =   9;
 
 
 
 
 
 
 
 
  }


'''







'''

/fst/things/stm/sister/rest/that.c











/*

 i can't understand these two lines

 ! this is used to judge is this head file has been included before

 i don need this because i always have a clearly plan
 
 
 is that good?
 is that good?

*/


/*

#ifndef  _DELAY_H


#define  _DELAY_H

// ...

#endif

*/


/*

 ���� _DELAY_H

 �Aʾ _DELAY_H

 Ҳ

*/










/*

 named it just like on gcc

 maybe someday it can use the seed code straightly



 yes i've been doing it
 
*/


/* 

int gop_sleep( unsigned short number_seconds ) {

*/


/*

 void * wait (  void * that_number_seconds  )
 
  {

*/


/*

 delay  =>  rest / wait

*/

/*

 void  *  that_delay  (
                         void  *  that_number_seconds,
                         void  *  that_number_count_delay
				      )
 
 {

*/

 void  *  that_rest  (
                        void  *  that_number_seconds_rest,
						void  *  that_number_count_rest
					 )
					 
  {








/*

 this is to save the result of 'SysTick->ctrl'

*/


/*

    unsigned int number_result_control;

*/


/*

 void  *  that_number_resule_control;


 that_number_result_control  =  malloc  (  sizeof ( unsigned int )  );

*/


 void  *  that_number_result_tick;
 
 
 that_number_result_tick  =  malloc  (  sizeof ( unsigned int )  );












/*

 ??
 turn it?

*/


/*

    number_seconds &= 0x00FFFFFF;

*/


 *  (  unsigned float *  )  that_number_seconds_rest  &=  0x00FFFFFF;











/*

 prepare


 �A��

*/



 SysTick  ->  LOAD   =
                             (  *  (  unsigned float *  )  that_number_seconds_rest  )

                        *  (  *  (  unsigned int *  )  that_number_count_rest  )

                        *  1000000;


/*

 SysTick ֮�� LOAD ��

 �໯ �o���c��ַ�� ��֮����֮Ϣ��

 ���� �໯ �o����ַ�� ��֮����֮Ϣ��

 ���� Ҽ���f

*/



    SysTick  ->  VAL   =  0;
	
    SysTick  ->  CTRL  =  1;





















/*

 start the loop

*/


/*

    do {

*/


 do
 
  {


/*

 ����

 ��

*/

















/*

 one command
 note this result

*/


/*

        number_result_control = SysTick->CTRL;

*/


/*

 add a format translate
 
 maybe slow it

*/


 *  (  unsigned int *  )  that_number_result_tick   =   SysTick  ->  CTRL;


/*

 �໯ �o����ַ�� ��֮Ӌ�� �� SysTick ֮�� CTRL Ҳ

*/


















/*

 one command
 judge the loop

*/


/*

 ?
 
*/



/*

      } while (

                (  number_result_control &   0x01      )

        &&      ( !number_result_control & ( 1 << 16 ) )

              )

*/


  }  while  (

               (      (   *  ( unsigned int * )  that_number_result_tick   &     0x01        )   )

     &&        (   !  (   *  ( unsigned int * )  that_number_resule_tick   &   ( 1 << 16 )   )   )
           )


/*

 �ஔ

 �໯ �o����ַ�� ��֮Ӌ�� �� 0x01

 �c

 �໯ �o����ַ�� ��֮Ӌ�� ���� Ҽ ���� ʰ½

 ʱ

*/


/*

 �ஔ

 �� �໯ �o����ַ�� ��֮Ӌ�� ֮�� �� 0x01

 �c

 �� �໯ �o����ַ�� ��֮Ӌ�� ֮�� ���� �� Ҽ ���� ʰ½ ֮��

 ʱ

*/















/*

 clear this system tick

*/



/*

    SysTick->CTRL = 0;
    SysTick->VAL  = 0;

*/


 SysTick  ->  CTRL   =   0;

 SysTick  ->  VAL    =   0;


/*

 SysTick ֮�� CTRL �� �� Ҳ

 SyeTick ֮�� VAL �� �� Ҳ

*/











/*

 don't know what will happen when the system tick with a wrong

*/



/*

    return 1;

*/


/*

 return  that . about . dream . yes;

*/


 return  that  ->  about  ->  dream  ->  yes
 

/*

 �ճ� 녉��� ֮ ˳ Ҳ

*/


/*

 �ճ� 녉��� ֮�� ˳ Ҳ

*/







  }


/*

 Ҳ

*/




'''







'''

/fst/things/stm/sister/rest/wait.c






'''







'''

/fst/things/linux/seed.h





#include <stdio.h>




#include <stdlib.h>

#include <unistd.h>





#include <string.h>     // for string ways

#include <math.h>       // for snake

#include <time.h>       // for time ( NULL )


#include <dirent.h>     // for dirent






#include <ifaddrs.h>    // for network socket
#include <fcntl.h>      // for ...





#include <pthread.h>    // for thread






#include <signal.h>     // for check_deamon() ->
                        // for tcp block out.






#include <sys/time.h>   // for note_save() -> gettimeofday()

#include <sys/socket.h> // for network -> socket

#include <sys/stat.h>   // for file system status


#include <sys/types.h>  // for check_deamon() ->
#include <sys/param.h>  // for ...





#include <arpa/inet.h>  // for network




'''







'''

/fst/things/android/seed.java



package com.fxt.rain;

import android.app.*;
import android.os.*;


public class MainActivity extends Activity 
{
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }
}



'''




