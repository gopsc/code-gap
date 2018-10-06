







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




 now we make path by list of seed






 it is to save name of result

*/


 char * note_result [ 64 ]


 strcpy ( note_result, gop_hope . path_the );

 strcat ( note_result, "/flower.c" );








/*

 this to save the name of the code

*/




 char  note_name [ 128 ];


/*

 strcpy ( note_name, that_path );


 strcat ( note_name, that_target );

*/









/*

 this is for dirent read

*/


 DIR * pointer_dirent;


 struct  dirent *  ent











/*

 this isn't easy, maybe the file is too long

 we can't read it

*/


/*

 char * note_words;

 note_words  =  malloc (
                         (  file_length ( that_target ) + 1  )
                                                                *   sizeof ( char )
                       );

 free ( note_words );

*/


 char note_words [ 102400 ];

















/*

 they are for read lines



 when read, we search from a started place and named next place

 and read this file name and let it be a started place

*/



 char note_seed [ 102400 ];


 char * pointer_line = note_seed;

 char * pointer_next;







/*

 ready to read seed list

*/


 strcpy ( note_name, gop_hope . path_the );

 strcat ( note_name, gop_hope . name_the );

 strcat ( note_name, "/seed" );







 file_get ( note_name, note_seed );







/*

 drop note and blank


*/


 secret ( note_seed, "drop note" );

 secret ( note_seed, "drop blank" );









/*

 start

 read it first



 make it isn't null

 doesn't need

 start read

*/


 do

  {



/*

 it could be null if it read to the last line

*/


 pointer_next = strchr ( pointer_line, '\n' );









/*

 get name

*/


 if ( pointer_next != NULL )

  {

 * pointer_next = '\0';

  }










 strcpy ( note_name, pointer_line );










 if ( pointer_next != NULL )

  {

/*

 return it

*/

 * pointer_next = '\n'



/*

 get a step

*/

 pointer_line = pointer_next;

  }












/*

 sometimes this file isn't here

 maybe we should exit this seed

*/


 if (
          ! is_file   ( note_name )
      &&  ! is_dirent ( note_name )
    )


  {



 output_print ( "string", "can't find it:  " );

 output_print ( "string", note_name );

 output_print ( "string", "\n" );



 return -1;


  }









/*

 if this file exist

 prepare to add it

*/



 else if (
           is_file ( note_name )
         )

  {



/*

 make the title


 maybe we should make a buffer to note it

 append once to finish it




 it isn't so beautiful actually

*/



/*

 strcpy ( note_words, "\n//" );


 strcat ( note_words, "=========" );


 strcat ( note_words, "=========" );


 strcat ( note_words,  note_name );

*/







/*

 titles don't have a same length,

 and of cause

*/


/*

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


*/





/*

 titile finished

*/

/*

 strcat ( note_words, "\n" );



 strcpy ( note_words, "\n\n" );


 file_append ( note_name, note_words );

*/








/*

 get the convent

*/


 file_get ( note_name, note_words );







/*

 save it

*/


 file_append ( note_result, note_words );










/*

 it is for judging of file and dirent

*/

  }










 else if (
           is_dirent ( note_name )
         )

  {



/*

 open and start to read

*/


 note_dirent = opendir ( note_name );







 do

  {





/*

 read

*/


 ent = readdir ( note_dirent );




/*

 save

*/

 if (

         ent != NULL
      && ent -> d_type == 8

    )

  {


 strcpy ( note_name_sub, note_name );

 strcat ( note_name_sub, ent -> d_name );


 file_get ( note_name_sub, note_words );

 file_append ( note_result, note_words );

  }




  }  while ( ent != NULL )






/*

 close dirent

*/

 closedir ( note_dirent );



  }











/*

 this is for range of seed list reading

*/

  }  while ( pointer_next != NULL )






/*

 here

*/


 return 0;



  }





/*

  }

*/






















/*

 the old

*/


/*

 int action_seed  (  const char * that_type  )


  {

*/








/*

 where the code is

 and it could be changed

*/


/*

 char  note_path [ 128 ];





 strcpy ( note_path,  gop_hopes . path_the  );

 strcat ( note_path, "/" );

 strcat ( note_path,  gop_hopes . name_the  );

*/







/*

 the file we will make named flower

*/


/*

 char note_file [ 128 ];







 strcpy ( note_file,  gop_hopes . path_the );

 strcat ( note_file, "/flower.c" );

*/







/*

 there is a dirent named action

 we auto add file in that

*/


/*

 char note_dirent [ 128 ];

 char note_name_action [ 128 ];

*/


/*

 DIR * pointer_dirent;

 struct  dirent *  ent;

*/













/*

 clean it

*/


/*

 file_save ( note_file,  "" );

*/



/*

 that's ok !

 :)

*/




/*

 return 1;}

*/
