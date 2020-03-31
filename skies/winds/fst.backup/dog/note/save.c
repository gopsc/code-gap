





 int note_save (

                 const char * that_name,
                 const char * that_words,
                 const char * target_time

                )
                
  {


  
   
   
   
/*

 Prepare

*/
   
        char     note_time [ 3 ] [ 128 ];

        char     note_path [ 128 ];
   
 struct timeval  note_time_now;


   
   
   
   
   
   
   
   
   
  
   
   


/*

 judgement the time

 i will note
  
   
   


 save the note
 
 with this time

*/
   
   
 if  (  strcmp ( target_time, "now" )  ==  0  )
 
  {
 
   

/*

 Get the  time
     this time

*/
   
   
   
 gettimeofday ( & note_time_now, NULL );

 snprintf  (  note_time [ 1 ],  sizeof ( note_time [ 1 ] ) / sizeof ( char ) - 1,  "%ld",  note_time_now . tv_sec   );
 snprintf  (  note_time [ 2 ],  sizeof ( note_time [ 2 ] ) / sizeof ( char ) - 1,  "%ld",  note_time_now . tv_usec  );

 strcat ( note_time [ 1 ], "." );
 strcat ( note_time [ 1 ], note_time [ 2 ] );
 
 
 
  }


   
   
   
   
   

 else
 
  {

      
      
/*

 Use the time got

*/
      
 strcpy ( note_time [ 1 ], target_time );
 
 
  }





   
   
   
   
   
   
/*

 Prepare the path


 make this format more beautiful
 
 and i wanna write the code exed way naemd secret
 
 after this




 the path

*/
   
   
 strcpy ( note_path, path_the  );
 strcat ( note_path, "/"       );
 strcat ( note_path, name_data );

 strcat ( note_path, "/0/"     );

   
 
/*
 
 the name
 
*/
   
 strcat ( note_path, that_name );

   
  
   
   
/*

 just name then it could be simple

*/
   
   
/*

 strcat ( note_path, ".note"   );

*/


   
   

   
   
   
   
   
/*

 Append the file

*/
   
   
 file_append ( note_path, "\n\n" );

 file_append ( note_path, note_time [ 1 ] );
 file_append ( note_path, "\n" );

 file_append ( note_path, that_words );



   
   
 return 1;
 
 
  }
