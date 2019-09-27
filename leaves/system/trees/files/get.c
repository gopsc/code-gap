


/*

 don't know how long it is

 use malloc

*/

 void file_get (
                 const char * that_path,
                       char * that_result
             )

  {



 FILE * note_file  = NULL;

 char note_buffer [ 128 ];









 strcpy ( that_result, "" );








 if (
      is_file ( that_path)
    )

  {







 note_file = fopen ( that_path, "r" );








 while (

         fgets ( note_buffer, 128,  ( FILE * ) note_file ) != NULL

       )

  {

/*

 if (

      sizeof ( that_result ) - strlen ( that_result )  >=  128

    )

  {

 break;

  }


 else

  {

*/

 strcat ( that_result, note_buffer );

  }

/*

}

*/










 fclose ( note_file);


  }




  }


















/*

 c++

*/


/*

 string file_get ( string path_file )

  {

 ifstream    file;

 string      that;

 char        that_one;



 file . open ( path_file . c_str() );


 while ( ! file . eof () )

  {

 file . read ( & that_one, 1 );

        that += that_one;

  }


 file . close ();


 that = that . substr ( 0, that . length () - 1 );

 return that;

  }

*/
