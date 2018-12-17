


void * gop_dog ( void * what ) {


// Load configure from:
// {path}/{name}/configure

    load_configure();


// Prepare the symbal just like 'NEXT'

    load_symbol();


// Listen modle of sound , it need a word libary loading.

    load_listen();


// TxL needs jurisdiction of root.
// and no more

//    check_root();


// When a update was stop, files left.
// Must be after loading.

    check_update();



    output_print( "string", "Done\n"               );







// note this

    note_save   ( "dog",    "WatchDog start", "now");






    while ( information_flag.main ) {


// u can not run this program just for watchdog
// u wanna others, right?

        if      ( ! information_flag.dog ) {

            usleep( 100000 );}



        else if (  information_flag.dog ) {




// run the functions

            information_user_get ();   usleep ( 100000 );

            information_name_get ();   usleep ( 100000 );

            information_system_get (); usleep ( 100000 );


            information_memory_get (); usleep ( 100000 );


// this will take wrong if we used on termux
//
//   so sometimes we don't read it

            information_disk_get ();   usleep ( 100000 );


            information_cpu_get ();    usleep ( 100000 );


            information_ip_get ();     usleep ( 100000 );

            information_sound_get ();  usleep ( 100000 );



            check_network ();          usleep ( 100000 );

            check_power ();            usleep ( 100000 );


            dog_show ();               usleep ( 100000 );




// it means the dog finished one time at least

            information_flag.start = 1;}}




// note this

    note_save ( "dog", "WatchDog close", "now" );



// sirisly i don't know what dose matter is u add this line

    pthread_exit ( NULL );}
