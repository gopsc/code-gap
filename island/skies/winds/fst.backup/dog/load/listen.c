








/*

 won't use it


 we use dream to save it


*/






 int load_listen ()


  {









/*

 it always tell us it doing

 maybe use a interface to do this

*/


 output_print ( "string", "Load listen...\n" );













/*

 the path of the files saved

 it is  trees/*  now

*/

 char note_path [ 128 ];













/*

 It's for saving the name of the dirent

*/


 char note_name [ 128 ];






/*

 it's for saving the name of the files

*/


 char note_file [ 128 ];









/*

 it's for saving the file content

 soon we use realloc

*/

 char note_word [ 10240 ];








/*

 Prepare the path

*/


 strcpy ( note_path, gop_hopes . path_the );

 strcat ( note_path, "/" );

 strcat ( note_path, gop_hopes . name_data );











/*

 it is for counting the files

*/


 int number_step;







/*

 if is for reading the file convent

*/


 char * pointer_word;







/*

 if is for reading the file entre

*/

 char * pointer_enter;











 do


  {





/*

 changed the number of listen 
     and into a buffer

*/


 snprintf  (

             note_word,

             sizeof ( note_word ) / sizeof ( char ) - 1,

             "%d",

             number_listen

           );













/*

 Prepare the path

 TxL/trees/number/w/t.snake

*/


 strcpy ( note_name, note_path );

 strcat ( note_name, "/"         );

 strcat ( note_name, note_word );









/*

 set it one

*/

 number_listen ++;



















/*

 If this dirent is exist
 we read it

*/


 if  (  is_dirent ( note_name )  )


  {









/*

 Print it

*/


 output_print ( "string",  note_name );

 output_print ( "string", "\n"         );












/*

 Take a loop to read note  files

 ...

 Take a loop to read snake files

*/

 int w;

 for  (  w = 1;  w <= N;  w ++  )


  {










/*

 Find a place to transform
  the number of w

*/

 snprintf (
            note_word,
            sizeof ( note_word )  /  sizeof ( char ) - 1,
            "%d",
            w
          );










/*

 Prepare the file name
 TxL/trees/number/w/t.snake
                    .
*/

 strcpy ( note_file, note_name );
 strcat ( note_file, "/"       );
 strcat ( note_file, note_word );
 strcat ( note_file, ".snake"  );












/*

 if the file does not exist

 read next onr

*/

 if  (  ! is_file ( note_file )  )

  {

 continue;

  }









/*

 If it is exist

*/

 else if  (  is_file ( note_file )  )

  {







/*


 read it



 get the file

*/


 file_get ( note_file, note_word );


 number_step = 1;









/*

 Take the loop for
 read the convent
   of the file




 start here

*/

 pointer_enter = note_word;









 do


  {



/*

 set the start path


 start here

*/

 pointer_word = pointer_enter;








/*

 find the next enter

*/

 pointer_enter = strchr (  pointer_enter, '\n'  );












/*

 The last line was no enter
  so we don't need to judge did it get the pointer

*/

 if ( pointer_enter != NULL )

  {

 * pointer_enter = '\0';

  }






/*

 Tranform the convent

*/


 gop_sound . buffer_listen [ number_listen ] [ w ] [ number_step ]  =  atoi ( pointer_word );







/*

 reset it

*/


 if ( pointer_enter != NULL )


  {

 * pointer_enter = '\n';

 pointer_enter ++;

 number_step  ++;

  }






/*

 end this loop when it's no more enter

*/

  } while ( pointer_enter != NULL );




/*

 this range for file exist

*/

  }





/*

 this loop to find dirent

*/

  }






/*

 thiss loop for function

*/

  }



// end this loop when is's no more dirent

  } while ( is_dirent(buffer_name) );




    return 1;}
