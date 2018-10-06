







/*

 we use this function to save a piece of code


 forget it we use seed list now

  function of seed do this

*/




/*

 int action_seed_append (

                           const char * that_result,

                           const char * that_path,

                           const char * that_target

                        )

  {

*/



 int action_seed (

                 )

  {








/*

 it is so long to make path every file

 use this to make path here


 and maybe use pointer








 this to save the name of the code

*/


/*

 char  note_name [ 128 ];


 strcpy ( note_name, that_path );


 strcat ( note_name, that_target );

*/







/*

 this is not easy, maybe the file is too long

 we can't read it

*/


/*

 char * note_words;

 note_words  =  malloc (   (  file_length ( that_target ) + 1  )   *   sizeof ( char );

 free ( note_words );

*/


 char note_words [ 102400 ];










/*

 sometimes this file isn't here

 maybe we should exit this seed

*/


 if (  ! is_file ( note_name )  )


  {



 output_print ( "string", "This file we can't find it:   " );

 output_print ( "string", note_name );

 output_print ( "string", "\n" );



 return 0;


  }









/*

 if this file exist

 prepare to add it

*/


 else


  {






/*

 make the title


 maybe we should make a buffer to note it

 append once to finish it

*/



 strcpy ( note_words, "\n//" );


 strcat ( note_words, "=========" );


 strcat ( note_words, "=========" );


 strcat ( note_words,  note_name );









/*

 titles don't have a same length,

 and of cause

*/


 if  (  63  >  ( int ) strlen ( note_name )  )


  {



 int i;

 for (

       i  =  0;

       i  <  63 - ( int ) strlen ( note_name );

       i  ++

     )

  {




 strcat ( note_words, "=" );



  }




  }








/*

 titile finished

*/


 strcat ( note_words, "\n" );



 file_append ( note_name, note_words );










/*

 get the convent

*/


 file_get ( note_name, note_words );







/*

 save it

*/


 file_append ( that_result, note_words );







 return 1;



  }





/*

  }

*/















 int action_seed  (  const char * that_type  )


  {









/*

 where the code is

 and it could be changed

*/


 char  note_path [ 128 ];





 strcpy ( note_path,  gop_hopes . path_the  );

 strcat ( note_path, "/" );

 strcat ( note_path,  gop_hopes . name_the  );









/*

 the file we will make named flower

*/


 char note_file [ 128 ];







 strcpy ( note_file,  gop_hopes . path_the );

 strcat ( note_file, "/flower.c" );









/*

 there is a dirent named action

 we auto add file in that

*/


 char note_dirent [ 128 ];

 char note_name_action [ 128 ];




 DIR * pointer_dirent;

 struct  dirent *  ent;















/*

 clean it

*/


 file_save ( note_file,  "" );





/*

 that's ok !

 :)

*/

 return 1;}

