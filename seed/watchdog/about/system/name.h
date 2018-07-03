



 int about_name ()



  {







 char buffer_result [ 128 ];







 commandline_get ( "uname -n", buffer_result );






 * strchr ( buffer_result, '\n' )  =  '\0';





 strcpy ( gop_about . system . name, buffer_result );






 return 1;




  }
