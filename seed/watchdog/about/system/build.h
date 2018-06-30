



 int get_about_system () {


/*

 if we use it on arduino or stm32

 we could give it a value straightly

*/



     char buffer_result [ 128 ];


     commandline_get ( "uname -s", buffer_result );





   * strchr ( buffer_result, '\n' )  =  '\0';


     strcpy ( gop_about . system . system, buffer_result );



     return 1;}

