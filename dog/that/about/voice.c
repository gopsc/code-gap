















/*

 struct gopi_sound

*/

 
 struct about_voice

  {






/*

 char symbol [ 16 ];

*/

 void * symbol;





/*

 int number_control;

 int number_capture;

 int number_playback;

*/

 void  *  about_voice . number;
 
 void * * about_voice . thing;
 
 
 
 
/*

 for numbers 128 is too long

*/

/*

 char device [ 3 ] [ 32 ] [ 16 ];

 int device_playback;

 int device_capture;

*/


  };
  
  
  
  
  
  
  
  
  
  




















/*

 int clean_about_sound ( gopi_sound that_sound )

*/



 int clean_about_voice  (  void * that_voice  )
 
  {




/*

 that_voice . number_control   =  0;

 that_voice . number_capture   =  0;

 that_voice . number_playback  =  0;

*/


/*

 * ( unsigned short ) about_voice . listen  =  0;

 * ( unsigned short ) about_voice . say  =  0;
 
*/

 * ( unsigned short ) about_voice . number;
 
 
 
/*

 that_sound . device_playback  =  0;

 that_soundn . device_cpature  =  0;

*/







/*

 int note_loop;

 int note_number;

*/

 void * that_number;


 that_number  =  malloc (  sizeof ( unsigned short )  );
 
 
 
 if  (  that_voice . number  !=  -1  )

 {
 
 
 

/*

 for (
       note_loop = 0;
       note_loop < 2;
       note_loop ++
     )

  {



 for (
       note_number  = 0;
       note_number <= 32;
       note_number ++
     )

  {

*/


 for (
 
       that_number   =  0;
	   that_number  <=  about_voice;
	   that_number  ++;
 
     )

  {


/*

 if (

      strcmp ( that_sound . device [ note_loop ] [ note_number ], "" )  ==  0

    )

  {

*/



/*

 after break first loop the second loop run again

*/



/*

 break;

  }



 else

  {

 strcpy ( that_sound . device [ note_loop ] [ note_number ], "" );

  }

*/



 strcpy  (  that_voice . thing [ that_number ],  ""  );

 free  (  that_voice . thing [ that_number ]  );
 
 
 

/*

  }
  
*/

  }







 free ( that_number );
 
 
  }







 return 0;

  }

