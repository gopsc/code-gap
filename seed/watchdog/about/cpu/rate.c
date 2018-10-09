


int about_CPU_rate () {




             char name   [ 2 ] [ 16 ];
    unsigned int  user   [ 2 ] [ 16 ];
    unsigned int  nice   [ 2 ] [ 16 ];
    unsigned int  system [ 2 ] [ 16 ];
    unsigned int  idle   [ 2 ] [ 16 ];



          FILE *  buffer_file;

          char    buffer_words [ 1024 ];



//===============================================================
/*
 Get status for cpu here.
      the first time
*/




    buffer_file  =  fopen ( "/proc/stat", "r" );




    fgets  (  buffer_words,  sizeof ( buffer_words ),  buffer_file  );



    sscanf (
             buffer_words, "%s %u %u %u %u",
                                              buffer_name   [ 0 ],
                                            & buffer_user   [ 0 ],
                                            & buffer_nice   [ 0 ],
                                            & buffer_system [ 0 ],
                                            & buffer_idle   [ 0 ]
           );

    fclose ( buffer_file );










// Wait 0.1 second.

    usleep ( 100000 );









// the second time

    buffer_file  =  fopen ( "/proc/stat", "r" );




// get first line

    fgets  (  buffer_words,  sizeof ( buffer_words ), buffer_file  );




    sscanf ( buffer_words, "%s %u %u %u %u",
                                              buffer_name   [ 1 ],
                                            & buffer_user   [ 1 ],
                                            & buffer_nice   [ 1 ],
                                            & buffer_system [ 1 ],
                                            & buffer_idle   [ 1 ]


    fclose ( buffer_file );

//===============================================================

/*

 Calculate.

 don't know what this mean

*/

    unsigned long od, nd;
    unsigned long id, sd;

             int  that_use = 0;

                  od  =  ( unsigned long ) ( gop_about . cpu . user + gop_about . cpu . nice  +  gop_about . cpu . system  +  gop_about . cpu . idle);
                  nd  =  ( unsigned long ) (      buffer_cpu . user +      buffer_cpu . nice  +       buffer_cpu . system  +       buffer_cpu . idle);

                  id  =  ( unsigned long ) ( buffer_cpu . user   - gop_about . cpu . user   );
                  sd  =  ( unsigned long ) ( buffer_cpu . system - gop_about . cpu . system );

//===============================================================



    if (  ( nd - od )  !=  0  )

        that_use  =  (  ( sd + id ) * 100  )  /  ( nd - od );

    else

        that_use = 0;





    gop_about . cpu . rate  =  that_use;





    return 1;}