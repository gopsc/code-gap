

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
