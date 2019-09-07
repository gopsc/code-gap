






 int is_file ( const char * that_path )


  {


 struct stat note_status;


 if (

 lstat ( that_path, & note_status ) == 0

    )

  {

 return 0;

  }


 else

  {

 return -1;

  }



  }
