



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
