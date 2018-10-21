


 int about_CPU_rate ()

  {




          char note_name   [ 2 ] [ 16 ];
 unsigned int  note_user   [ 2 ] [ 16 ];
 unsigned int  note_nice   [ 2 ] [ 16 ];
 unsigned int  note_system [ 2 ] [ 16 ];
 unsigned int  note_idle   [ 2 ] [ 16 ];



 FILE *  note_file;

 char    note_words [ 1024 ];



//===============================================================
/*
 Get status for cpu here.
      the first time
*/








/*

 open it

*/

 note_file  =  fopen ( "/proc/stat", "r" );






/*

 got a line

*/

 fgets  (  note_words,  sizeof ( note_words ),  note_file  );






/*

 got its convent

*/

 sscanf (
          note_words, "%s %u %u %u %u",
                                           note_name   [ 0 ],
                                         & note_user   [ 0 ],
                                         & note_nice   [ 0 ],
                                         & note_system [ 0 ],
                                         & note_idle   [ 0 ]
           );




/*

 close file

*/

 fclose ( note_file );










/*

 Wait 0.1 second.

*/

 gop_wait ( 0.1 );












/*

 the second time








 open file

*/

 note_file  =  fopen ( "/proc/stat", "r" );





/*

 get first line

*/

 fgets  (  note_words,  sizeof ( note_words ), note_file  );




 sscanf ( note_words, "%s %u %u %u %u",
                                              note_name   [ 1 ],
                                            & note_user   [ 1 ],
                                            & note_nice   [ 1 ],
                                            & note_system [ 1 ],
                                            & note_idle   [ 1 ]


 fclose ( note_file );

//===============================================================

/*

 Calculate.

 don't know what this mean

*/

 unsigned long od, nd;
 unsigned long id, sd;

          int  note_use = 0;


               od  =  ( unsigned long ) ( note_user [ 0 ] + note_nice [ 0 ]  +  note_system [ 0 ]  +  note_ idle [ 0 ] );

               nd  =  ( unsigned long ) ( note_user [ 1 ] + note_nice [ 1 ] + note_system [ 1 ]  + note_idle [ 1 ] );


               id  =  ( unsigned long ) ( note_user [ 1 ]   - note_user [ 0 ]   );

               sd  =  ( unsigned long ) ( note_system [ 1 ] - note_system [ 0 ] );

//===============================================================



 if (  ( nd - od )  !=  0  )

 note_use  =  (  ( sd + id ) * 100  )  /  ( nd - od );

 else

 note_use = 0;





 gop_about . cpu . rate  =  note_use;



 return 0;

  }
