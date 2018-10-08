


 int commandline_get (
                         const char * that_commands,
                               char * that_result
                     )


  {








 FILE  * note_commandline;


/*

 maybe use pointer

*/

 char    note_lines [ 1024 ];













/*

 clean this



 maybe use pointer

*/

 that_result [ 0 ]   =  '\0';















/*

 run it

*/

 note_commandline  =  popen ( that_commands, "r" );








/*

 sometimes it goes failed

*/

 if ( file_commandline == NULL )

  {

 return -1;

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



 return 0;


  }



/*

 pclose ( note_commandline );

*/


  }
