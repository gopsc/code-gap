
int about_CPU_cores () {



/*

 When the loop start,
   it plus one so
 the  lines can be smaller



 if we can't found

 could note it

*/

    int  number_result  =  -1;



/*

 Somehow,
  there should be
 some Enter there

*/

    char  buffer_file  [ 10240 ]  =  "\n\n";




/*

 There's 'processor' in
 the words sometimes

*/

    char  target_name  [ 16 ]  =  "\nprocessor";



/*

 u should put a pointer
  to note where you've read 

*/

    char * pointer_file  =  buffer_file;






/*

 Put the words in the
 Second site



 to it's place

*/
    file_get  (  "/proc/cpuinfo",  buffer_file  +  ( strlen ( buffer_file ) - 1 )  );





// Start the loop

    while ( pointer_file != NULL ) {

        number_result ++; 

        pointer_file  =  strstr ( pointer_file + 1, target_name );}





// Get the data

    gop_about . cpu . cores  =  number_result;





    return 1;}
