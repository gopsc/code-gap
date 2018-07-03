



 void file_append (
                     const char * that_path,
                     const char * that_words
                  )

  {




 int    buffer_count  =  1;




/*

 they are for find and make new dirent

*/

 char   buffer_path [ 64 ];

 char * pointer_path;











/*

 Build a range to find '/',

  to check does the dirent exist.

*/


 while  (  buffer_count  !=  0  )


  {





/*

 prepare to make dirent

*/


 strcpy ( buffer_path, that_path );



 pointer_path = buffer_path;







/*

 read the symbol

 find the dirent we count

*/


 int i;

 for  (  i = 0;  i < buffer_count;  i++  )


  {







/*

 find next symbol

 we've count

*/


 pointer_path  =  strstr ( pointer_path + 1, "/" );







/*

 to here

*/

 if  (  pointer_path  ==  NULL  )


  {

 buffer_count = 0;


  }





  }








/*

 we find a dirent

 check it

*/


 if ( buffer_count != 0 )


  {




/*

 we find next dirent next loop

*/

 buffer_count ++;





/*

 to next symbol we've found

 then return it soons

*/

 * pointer_path = '\0';







/*

 maybe creat it

*/

 if  (  ! is_dirent ( buffer_path )  )


  {


 mkdir  (  buffer_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH  );


  }




  }




  }





/*

 append file

*/


 FILE *  buffer_file  =  fopen ( that_path, "a" );


 fprintf  (  buffer_file,  "%s",  that_words  );


 fclose ( buffer_file );


  }









/*

 c++ code

*/



/*

 ofstream that_file;

 that_file.open(file_name, ios::app );

 that_file << words;

 that_file.close();


  }

*/
