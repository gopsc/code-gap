



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
