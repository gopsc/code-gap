

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
