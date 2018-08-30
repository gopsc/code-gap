




 int note_clear (

                 const char * that_name,
                 const char * that_type

                )
                
  {


 char note_path [ 128 ];


   
/*

 Prepare the path

*/

 strcpy ( note_path, path_the  );
 strcat ( note_path, "/"       );
 strcat ( note_path, name_data );

 strcat ( note_path, "/0/"     );

 strcat ( note_path, that_name );
  
   
/*
 
 strcat ( note_path, ".note"   );

*/


   
   
   
   
   
   
   
/*

Mmaybe we want more

*/

   
 if  (  strcmp ( that_type, "all" )  ==  0  )
 
  {

   
/*
   
 The save the words of blank

*/
   
   
 file_save ( that_path, "" );

   
   
   
   
 return 1;
 
 
   }



   
   
 else
 
  {

   
/*

 Got a wrong type of it


 we haven't set it yted
 
 maybe i could judge it by dream
 
*/
   
   
 return 0;
 
   
  }
 
 
 
 
  }


