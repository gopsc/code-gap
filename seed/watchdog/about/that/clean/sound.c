


 int clean_about_sound ( gopi_sound that_sound )


  {

 that_sound . number_control = 0;

 that_sound . number_capture = 0;

 that_sound . number_playback = 0;


 that_sound . device_playback = 0;

 that_soundn . device_cpature = 0;










 int note_loop;

 int note_number;





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




 if (

      strcmp ( that_sound . device [ note_loop ] [ note_number ], "" )  ==  0

    )

  {

/*

 after break first loop the second loop run again

*/

 break;

  }



 else

  {

 strcpy ( that_sound . device [ note_loop ] [ note_number ], "" );

  }





  }

  }





 return 0;

  }
