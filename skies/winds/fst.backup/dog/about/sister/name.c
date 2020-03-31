



 int about_sister_name ()



  {







 char that_result [ 128 ];







 commandline_get  (  "uname -n",  that_result  );






 * strchr  (  that_result,  '\n'  )   =   '\0';





 strcpy  (  gop_about . sister . name,  that_result  );






 return 1;




  }
