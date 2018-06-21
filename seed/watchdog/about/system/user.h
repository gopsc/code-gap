



 int get_about_user () {



    char buffer_result [ 128 ];


    commandline_get (  "whoami",  buffer_result  );


  * strchr (  buffer_result,  '\n'  )  =  '\0';

    strcpy (  gop_about_system . user,  buffer_result  );



    return 1;}
