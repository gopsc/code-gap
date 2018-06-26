


void * gop_dog ( void * what ) {





/*

 some values may have a number used by another process

   so we clean it first

*/

    clean_about ( gop_about );




/*

 Load configure from:

 {path} / {name} / configure


 first we load configurations without flag of main

 cause it is empty at first

 and this is the beginning

*/

    load_configure ();






// Prepare the symbal just like 'NEXT'

    load_symbol ();





// Listen modle of sound , it need a word libary loading.

    load_listen ();





/*

 TxL needs jurisdiction of root.
 and no more

*/

//    check_root();






/*

 When a update was stop, files left.
 Must be after loading.

*/

    check_update ();






    output_print ( "string", "Done\n"               );







// note this

    note_save   ( "dog",    "WatchDog start", "now" );











    while (  gop_about . flag . main  ) {


/*

 u can not run this program just for watchdog
 u wanna others, right?



 maybe

*/

        if  (  ! gop_about . flag . dog  ) {

            usleep ( 100000 );}



        else if  (  gop_about . flag . dog  ) {




// run the functions



/*

 then we could wait for it every step

*/


/*

            strcpy ( gop_about . system . symbol, "reading" );

*/


            get_about_user ();   usleep ( 100000 );

            get_about_name ();   usleep ( 100000 );

            get_about_system (); usleep ( 100000 );


            information_memory_get (); usleep ( 100000 );


/*

 this take wrong when we used on termux

   so sometimes we don't read it

*/

            information_disk_get ();   usleep ( 100000 );


            information_cpu_get ();    usleep ( 100000 );


            information_ip_get ();     usleep ( 100000 );

            information_sound_get ();  usleep ( 100000 );



            check_network ();          usleep ( 100000 );

            check_power ();            usleep ( 100000 );


            dog_show ();               usleep ( 100000 );



/*

  it means the dog finished one time at least

  we have load about some like sound


  and we may need to cause we have the symbol

*/
            gop_about . flag . start  =  1;}}




// note this

    note_save ( "dog", "WatchDog close", "now" );



// sirisly i don't know what dose matter is u add this line

    pthread_exit ( NULL );}
