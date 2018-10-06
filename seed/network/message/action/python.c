


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

 strcat ( buffer_command, path_the );

 strcat ( buffer_command, "/"      );

 strcat ( buffer_command, name_the );

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
