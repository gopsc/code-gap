



 void file_append (

                     const char * that_path,

                     const char * that_words,

//                     const char * that_type

                  )


  {



/*

 this is for cound how many dirent it is

 may use pointer

*/

 int  note_count  =  1;







/*

 they are for find and make new dirent

*/

 char   note_path [ 64 ];



 char * pointer_path;











/*

 Build a range to find '/',

  to check does the dirent exist.

*/


 while  (  note_count  !=  0  )


  {





/*

 prepare to make dirent

*/


 strcpy ( note_path, note_path );



 pointer_path = note_path;







/*

 read the symbol

 find the dirent we count

*/


 int i;

 for  (  i = 0;  i < note_count;  i ++  )


  {







/*

 find next symbol

 we've count

*/


 pointer_path  =  strstr ( pointer_path + 1, "/" );







/*

 to here


 if we've read all of it

 we could stop

*/


 if  (  pointer_path  ==  NULL  )


  {



 note_count = 0;





/*

 we've read all of it

 maybe a dirent

*/

 if  (  is_dirent ( note_path )  )

  {

 return -1;

  }




  }





/*

 this range for loop of symbol found

*/


  }








/*

 we find a dirent

 check it


 if we've read all of it

 check it too

 so we could know if it is a dirent

*/


 if ( note_count != 0 )


  {




/*

 we find next dirent next loop

*/

 note_count ++;





/*

 to next symbol we've found

 then return it soons

*/

 * pointer_path = '\0';







/*

 maybe creat it

*/

 if  (  ! is_dirent ( note_path )  )


  {


 mkdir  (  note_path,  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH  );


  }





/*

 it is for to check

*/

  }




/*

 this loop for check

*/

  }












/*

 append file



 could add a title



 maybe not

 it use too more base function

 like a high level function

*/



/*

 if (  strcmp ( that_type, "blank" )  ==  0  )

  {

*/







 FILE *  note_file  =  fopen ( that_path, "a" );


 fprintf  (  note_file,  "%s",  that_words  );


 fclose ( note_file );



 return 0;

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
